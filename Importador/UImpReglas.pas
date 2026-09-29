unit UImpReglas;

// Reglas del importador de Merge: equivalencias de clases, componentes que desaparecen y comprobaciones con RTTI.
// Con RTTI no hacen falta listas de propiedades: se pregunta a la propia clase de Delphi 13 si tiene la propiedad,
// si el valor es válido (enumerados y conjuntos) y cuál es la firma de cada evento.

interface

uses
  System.SysUtils, System.Classes, System.Generics.Collections, System.TypInfo, System.Rtti;

type
  TImpReglas = class
  private
    FClases: TDictionary<string, TPersistentClass>;
    FMapa: TDictionary<string, string>;            // clase Merge -> clase Delphi 13
    FEliminar: TDictionary<string, string>;        // clase Merge -> motivo
    FEventos: TDictionary<string, string>;         // 'CLASE.EVENTO' -> evento destino
    FUnitsFuera: TStringList;                      // units de componentes de Merge que desaparecen de los uses
    FUnitsCortas: TDictionary<string, string>;     // nombre corto Delphi 6 -> nombre con ámbito
    FTipoUnidad: TDictionary<string, string>;      // tipo -> unit que lo declara
    procedure CargaClases;
    procedure CargaMapas;
  public
    constructor Create(const DirProyecto: string);
    destructor Destroy; override;
    function ClaseDestino(const ClaseMerge: string): string;
    function EsEliminada(const ClaseMerge: string; out Motivo: string): Boolean;
    function ClaseVCL(const Nombre: string): TPersistentClass;
    function AdmiteProp(const Clase, Prop: string): Boolean;           // la clase destino la tiene
    function ValorValido(const Clase, Prop, Valor: string): Boolean;   // enumerados / conjuntos válidos
    function EsEvento(const Clase, Prop: string): Boolean;
    function FirmaEvento(const Clase, Evento: string): TArray<string>; // ['|tobject', 'var|word'...]
    function EventoDestino(const ClaseMerge, Evento: string): string;
    function UnitFuera(const U: string): Boolean;
    function UnitCorta(const U: string): string;
    function UnitDeTipo(const T: string): string;
    property Mapa: TDictionary<string, string> read FMapa;
  end;

// "(Sender: TObject; var Key: Word)" -> ['|tobject', 'var|word']
function NormalizaFirma(const Params: string): TArray<string>;
function MismaFirma(const A, B: TArray<string>): Boolean;

const
  EDITFIND: array[0..6] of string = ('TLFDBEditFind2000', 'TDBEditFind2000', 'TLFEditFind2000', 'TLFFibDBEditFind',
    'TFIBDBEditfind', 'TEditFind2000', 'TFIBHYGEditFind');
  DATASETS_RW: array[0..1] of string = ('TFIBTableSet', 'TFIBDataSet');
  DATASETS_RO: array[0..3] of string = ('TFIBDataSetRO', 'TFIBTableSetRO', 'TFIBDataSetRW', 'TFIBInfoSet');
  QUERIES: array[0..1] of string = ('THYFIBQuery', 'TFIBQuery');
  TRANSACCIONES: array[0..1] of string = ('THYTransaction', 'TFIBTransaction');
  HEREDADOS_ELIMINAR: array[0..4] of string = ('EPMain', 'CEMain', 'CEMainPMEdit', 'G2KTableLoc', 'FSMain');

function EnLista(const S: string; const L: array of string): Boolean;

implementation

uses
  System.StrUtils, System.IOUtils,
  Vcl.Controls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.DBGrids, Vcl.DBCGrids, Vcl.Buttons,
  Vcl.Menus, Vcl.ActnList, Vcl.Grids, Vcl.Mask, Vcl.CheckLst, Vcl.ValEdit, Vcl.Forms, Vcl.Samples.Spin, Vcl.Dialogs,
  Vcl.ExtDlgs, Vcl.ImgList, Vcl.OleCtrls, Data.DB, FireDAC.Comp.Client, Vcl.ToolWin;

function EnLista(const S: string; const L: array of string): Boolean;
var
  X: string;
begin
  for X in L do
    if SameText(X, S) then
      Exit(True);
  Result := False;
end;

{ TImpReglas }

constructor TImpReglas.Create(const DirProyecto: string);
var
  F: string;
begin
  FClases := TDictionary<string, TPersistentClass>.Create;
  FMapa := TDictionary<string, string>.Create;
  FEliminar := TDictionary<string, string>.Create;
  FEventos := TDictionary<string, string>.Create;
  FUnitsCortas := TDictionary<string, string>.Create;
  FTipoUnidad := TDictionary<string, string>.Create;
  FUnitsFuera := TStringList.Create;
  FUnitsFuera.Sorted := True;
  FUnitsFuera.Duplicates := dupIgnore;
  FUnitsFuera.CaseSensitive := False;
  F := TPath.Combine(DirProyecto, 'Importador\units_componentes_merge.txt');
  if FileExists(F) then
    FUnitsFuera.LoadFromFile(F);
  CargaClases;
  CargaMapas;
end;

destructor TImpReglas.Destroy;
begin
  FClases.Free;
  FMapa.Free;
  FEliminar.Free;
  FEventos.Free;
  FUnitsFuera.Free;
  FUnitsCortas.Free;
  FTipoUnidad.Free;
  inherited;
end;

procedure TImpReglas.CargaClases;
// Clases de destino que el importador puede escribir en un DFM (la RTTI se consulta sobre ellas)
const
  CLASES: array[0..52] of TPersistentClass = (TLabel, TEdit, TDBEdit, TMemo, TDBMemo, TCheckBox, TDBCheckBox,
    TComboBox, TDBComboBox, TDBLookupComboBox, TPanel, TScrollBox, TGroupBox, TRadioGroup, TDBRadioGroup,
    TPageControl, TTabSheet, TToolBar, TToolButton, TDBNavigator, TDBGrid, TDBCtrlGrid, TDateTimePicker,
    TActionList, TAction, TSpeedButton, TBitBtn, TButton, TMenuItem, TPopupMenu, TMainMenu, TTimer, TSplitter,
    TDataSource, TImage, TDBImage, TBevel, TShape, TDBText, TRadioButton, TStringGrid, TDBRichEdit, TTreeView,
    TProgressBar, TListBox, TSpinEdit, TTabControl, TUpDown, TListView, TStatusBar, TFDQuery, TFDTransaction,
    TFDUpdateSQL);
  CAMPOS: array[0..15] of TPersistentClass = (TStringField, TIntegerField, TSmallintField, TFloatField,
    TCurrencyField, TBCDField, TFMTBCDField, TDateTimeField, TDateField, TSQLTimeStampField, TBlobField, TMemoField,
    TLargeintField, TBooleanField, TWideStringField, TTimeField);
var
  C: TPersistentClass;
begin
  for C in CLASES do
    FClases.AddOrSetValue(UpperCase(C.ClassName), C);
  for C in CAMPOS do
    FClases.AddOrSetValue(UpperCase(C.ClassName), C);
  FClases.AddOrSetValue('TMASKEDIT', TMaskEdit);
  FClases.AddOrSetValue('TCHECKLISTBOX', TCheckListBox);
  FClases.AddOrSetValue('TVALUELISTEDITOR', TValueListEditor);
  FClases.AddOrSetValue('TRICHEDIT', TRichEdit);
  FClases.AddOrSetValue('TLABELEDEDIT', TLabeledEdit);
  FClases.AddOrSetValue('TOPENDIALOG', TOpenDialog);
  FClases.AddOrSetValue('TSAVEDIALOG', TSaveDialog);
  FClases.AddOrSetValue('TIMAGELIST', TImageList);
  FClases.AddOrSetValue('TFORM', TForm);
end;

procedure TImpReglas.CargaMapas;
  procedure M(const A, B: string);
  begin
    FMapa.AddOrSetValue(UpperCase(A), B);
  end;
  procedure E(const A, Motivo: string);
  begin
    FEliminar.AddOrSetValue(UpperCase(A), Motivo);
  end;
  procedure Ev(const Clase, Evento, Destino: string);
  begin
    FEventos.AddOrSetValue(UpperCase(Clase + '.' + Evento), Destino);
  end;
  procedure U(const Corta, Larga: string);
  begin
    FUnitsCortas.AddOrSetValue(UpperCase(Corta), Larga);
  end;
  procedure T(const Tipos, Unidad: string);
  var
    X: string;
  begin
    for X in Tipos.Split([' ']) do
      if X <> '' then
        FTipoUnidad.AddOrSetValue(UpperCase(X), Unidad);
  end;
var
  X: string;
begin
  // --- componentes de Merge (LF, HY, Flat, Rx, EditFind...) -> VCL estándar
  M('TLFLabel', 'TLabel'); M('TLFEdit', 'TEdit'); M('TLFDbedit', 'TDBEdit'); M('TLFDBMemo', 'TDBMemo');
  M('TLFMemo', 'TMemo'); M('TLFDBCheckBox', 'TDBCheckBox'); M('TLFCheckBox', 'TCheckBox'); M('TFlatCheckBox', 'TCheckBox');
  M('TLFComboBox', 'TComboBox'); M('TLFPanel', 'TPanel'); M('TFlatPanel', 'TPanel'); M('TLFPageControl', 'TPageControl');
  M('TLFToolBar', 'TToolBar'); M('TLFDBCtrlGrid', 'TDBCtrlGrid'); M('TNoScrollLFDBCtrlGrid', 'TDBCtrlGrid');
  M('TLFDBDateEdit', 'TDBEdit'); M('TLFDateEdit', 'TDateTimePicker'); M('TDateEdit', 'TDateTimePicker');
  M('THYGRightEdit', 'TEdit'); M('TDBComboBoxValue', 'TDBComboBox'); M('TLFDBComboBoxValue', 'TDBComboBox');
  M('TRxDBComboBox', 'TDBComboBox'); M('TRxDBLookupCombo', 'TDBLookupComboBox');
  for X in EDITFIND do
    if EndsText('EditFind2000', X) and not StartsText('TLFEdit', X) and not SameText(X, 'TEditFind2000') or
      SameText(X, 'TLFFibDBEditFind') or SameText(X, 'TFIBDBEditfind') then
      M(X, 'TDBEdit')
    else
      M(X, 'TEdit');
  M('THYTDBGrid', 'TDBGrid'); M('TDBGridFind2000', 'TDBGrid'); M('TNsDBGrid', 'TDBGrid'); M('TFIBHYGGridFind', 'TDBGrid');
  M('TLFActionList', 'TActionList'); M('TLFCategoryAction', 'TAction'); M('TLFDatasetAction', 'TAction');
  M('TLFNoSaveAction', 'TAction'); M('THYMNavigator', 'TDBNavigator'); M('THYDBEdit', 'TDBEdit'); M('TLFDBEdit', 'TDBEdit');
  M('TDBDateTimePicker', 'TDBEdit'); M('TDBDateEdit', 'TDBEdit'); M('TDBSpinEdit', 'TDBEdit'); M('TCurrencyEdit', 'TEdit');
  M('TRightMaskEdit', 'TEdit'); M('TDirectoryEdit', 'TEdit'); M('TLFHYDBDescription', 'TEdit'); M('THYDBDescripcion', 'TEdit');
  M('TFlatButton', 'TBitBtn'); M('TFlatGroupBox', 'TGroupBox'); M('TLFToolButton', 'TToolButton');
  // --- componentes G2K / FR2 sin equivalente: desaparecen (su función la da Merge13)
  E('TControlEdit', 'navegación por teclado (base de Merge13)'); E('TPopUpTeclas', 'teclas (acciones con ShortCut)');
  E('THYMEditPanel', 'buscar/rango (filtros de la rejilla)'); E('TG2KTBLoc', 'localizador (filtro rápido)');
  E('TLFFibFormStorage', 'configuración guardada (UUtilGuardaConfiguracion)'); E('TFormStorage', 'UUtilGuardaConfiguracion');
  E('TFormPlacement', 'UUtilGuardaConfiguracion'); E('TEntornoFind2000', 'filtro de entorno (TBuscadorCampo)');
  E('TTeclas', 'teclas'); E('TLFManager', 'estilos LF (estilos VCL)'); E('TfrxFIBHYComponents', 'FastReport: TfrxFDComponents');
  for X in ['TfrDBDataSet', 'TfrHYReport', 'TfrUserDataset', 'THYReportSource', 'THYReportMailSource', 'THYReport',
    'THYReportMail', 'TfrReport', 'TfrChartObject'] do
    E(X, 'FastReport 2');
  // --- eventos que cambian de nombre
  Ev('TLFDBCheckBox', 'OnChange', 'OnClick'); Ev('TLFCheckBox', 'OnChange', 'OnClick'); Ev('TFlatCheckBox', 'OnChange', 'OnClick');
  Ev('THYMNavigator', 'OnClickAfterAdjust', 'OnClick'); Ev('TLFDateEdit', 'OnButtonClick', 'OnDropDown');
  // --- nombres de units de Delphi 6 -> Delphi 13
  for X in ['Classes', 'SysUtils', 'DateUtils', 'Variants', 'StrUtils', 'Math', 'IniFiles', 'Types', 'TypInfo', 'Masks',
    'Contnrs', 'SyncObjs', 'ZLib', 'SysConst', 'RTLConsts', 'Character'] do
    U(X, 'System.' + X);
  for X in ['Graphics', 'Controls', 'Forms', 'Dialogs', 'StdCtrls', 'ExtCtrls', 'ComCtrls', 'Menus', 'DBCtrls', 'Grids',
    'DBGrids', 'Buttons', 'ActnList', 'Mask', 'ToolWin', 'ImgList', 'DBActns', 'Clipbrd', 'Printers', 'ExtDlgs', 'FileCtrl',
    'CheckLst', 'Tabs', 'Themes', 'DBCGrids', 'ValEdit', 'AppEvnts', 'StdActns', 'ComStrs', 'Consts', 'ExtActns', 'OleCtrls'] do
    U(X, 'Vcl.' + X);
  U('Windows', 'Winapi.Windows'); U('Messages', 'Winapi.Messages'); U('ShellAPI', 'Winapi.ShellAPI');
  U('ShlObj', 'Winapi.ShlObj'); U('ActiveX', 'Winapi.ActiveX'); U('MMSystem', 'Winapi.MMSystem'); U('WinInet', 'Winapi.WinInet');
  U('CommCtrl', 'Winapi.CommCtrl'); U('DB', 'Data.DB'); U('DBClient', 'Datasnap.DBClient'); U('ADODB', 'Data.Win.ADODB');
  U('ComObj', 'System.Win.ComObj'); U('Registry', 'System.Win.Registry'); U('Jpeg', 'Vcl.Imaging.jpeg');
  U('pngimage', 'Vcl.Imaging.pngimage'); U('GIFImage', 'Vcl.Imaging.GIFImg'); U('XMLDoc', 'Xml.XMLDoc'); U('XMLIntf', 'Xml.XMLIntf');
  U('OleServer', 'Vcl.OleServer'); U('Spin', 'Vcl.Samples.Spin'); U('Gauges', 'Vcl.Samples.Gauges');
  U('Calendar', 'Vcl.Samples.Calendar'); U('Outline', 'Vcl.Outline');
  // --- unidad de cada tipo (para completar el uses de la interfaz)
  T('TDBNavigator TDBEdit TDBCheckBox TDBComboBox TDBMemo TDBText TDBLookupComboBox TDBRadioGroup TDBImage TDBRichEdit TNavigateBtn', 'Vcl.DBCtrls');
  T('TDBGrid TColumn', 'Vcl.DBGrids'); T('TDBCtrlGrid', 'Vcl.DBCGrids');
  T('TLabel TEdit TMemo TCheckBox TComboBox TButton TGroupBox TRadioButton TListBox TStaticText TCustomEdit', 'Vcl.StdCtrls');
  T('TPanel TImage TBevel TShape TRadioGroup TSplitter TTimer TLabeledEdit', 'Vcl.ExtCtrls');
  T('TPageControl TTabSheet TToolBar TToolButton TDateTimePicker TProgressBar TTreeView TListView TStatusBar TUpDown TRichEdit TTabControl', 'Vcl.ComCtrls');
  T('TBitBtn TSpeedButton', 'Vcl.Buttons'); T('TActionList TAction', 'Vcl.ActnList'); T('TPopupMenu TMenuItem TMainMenu', 'Vcl.Menus');
  T('TStringGrid TGridDrawState', 'Vcl.Grids'); T('TSpinEdit', 'Vcl.Samples.Spin'); T('TMaskEdit', 'Vcl.Mask');
  T('TDataSource TDataSet TField TStringField TIntegerField TSmallintField TFloatField TCurrencyField TBCDField TFMTBCDField ' +
    'TDateTimeField TDateField TSQLTimeStampField TBlobField TMemoField TLargeintField TBooleanField TWideStringField', 'Data.DB');
  T('TFDQuery TFDTransaction TFDUpdateSQL TFDConnection TFDMemTable', 'FireDAC.Comp.Client');
end;

function TImpReglas.ClaseDestino(const ClaseMerge: string): string;
begin
  if not FMapa.TryGetValue(UpperCase(ClaseMerge), Result) then
    Result := ClaseMerge;
end;

function TImpReglas.EsEliminada(const ClaseMerge: string; out Motivo: string): Boolean;
begin
  Result := FEliminar.TryGetValue(UpperCase(ClaseMerge), Motivo);
end;

function TImpReglas.ClaseVCL(const Nombre: string): TPersistentClass;
begin
  if not FClases.TryGetValue(UpperCase(Nombre), Result) then
    Result := nil;
end;

function InfoProp(C: TClass; const Prop: string; out PI: PPropInfo): Boolean;
// 'Font.Name' -> Font (clase TFont) -> Name
var
  Partes: TArray<string>;
  i: Integer;
  TD: PTypeData;
begin
  Partes := Prop.Split(['.']);
  PI := nil;
  for i := 0 to High(Partes) do
  begin
    if C = nil then
      Exit(False);
    PI := GetPropInfo(C, Partes[i]);
    if PI = nil then
      // TStrings.Strings / colecciones: se aceptan si la propiedad padre existe
      Exit((i > 0) and ((Partes[i] = 'Strings') or (Partes[i] = 'Data')));
    if i < High(Partes) then
    begin
      if PI^.PropType^.Kind <> tkClass then
        Exit(False);
      TD := GetTypeData(PI^.PropType^);
      C := TD^.ClassType;
    end;
  end;
  Result := True;
end;

function TImpReglas.AdmiteProp(const Clase, Prop: string): Boolean;
var
  C: TPersistentClass;
  PI: PPropInfo;
begin
  C := ClaseVCL(Clase);
  if C = nil then
    Exit(True);   // clase no catalogada: no se filtra
  Result := InfoProp(C, Prop, PI);
end;

function TImpReglas.ValorValido(const Clase, Prop, Valor: string): Boolean;
var
  C: TPersistentClass;
  PI: PPropInfo;
  V, X: string;
  TD: PTypeData;
begin
  Result := True;
  C := ClaseVCL(Clase);
  if (C = nil) or not InfoProp(C, Prop, PI) or (PI = nil) then
    Exit;
  V := Trim(Valor);
  case PI^.PropType^.Kind of
    tkEnumeration:
      if (V <> '') and CharInSet(V[1], ['a'..'z', 'A'..'Z', '_']) and (PI^.PropType^ <> TypeInfo(Boolean)) then
        Result := GetEnumValue(PI^.PropType^, V) >= 0;
    tkSet:
      if StartsStr('[', V) then
      begin
        TD := GetTypeData(PI^.PropType^);
        for X in Copy(V, 2, Length(V) - 2).Split([',']) do
          if Trim(X) <> '' then
            if GetEnumValue(TD^.CompType^, Trim(X)) < 0 then
              Exit(False);
      end;
  end;
end;

function TImpReglas.EsEvento(const Clase, Prop: string): Boolean;
var
  C: TPersistentClass;
  PI: PPropInfo;
begin
  C := ClaseVCL(Clase);
  if C = nil then
    Exit(StartsStr('On', Prop) or StartsStr('Before', Prop) or StartsStr('After', Prop));
  PI := GetPropInfo(C, Prop);
  Result := (PI <> nil) and (PI^.PropType^.Kind = tkMethod);
end;

function TImpReglas.FirmaEvento(const Clase, Evento: string): TArray<string>;
var
  Ctx: TRttiContext;
  T: TRttiType;
  P: TRttiProperty;
  MT: TRttiMethodType;
  Par: TRttiParameter;
  L: TList<string>;
  Pref: string;
  C: TPersistentClass;
begin
  Result := nil;
  C := ClaseVCL(Clase);
  if C = nil then
    Exit;
  T := Ctx.GetType(C);
  P := T.GetProperty(Evento);
  if (P = nil) or not (P.PropertyType is TRttiMethodType) then
    Exit;
  MT := TRttiMethodType(P.PropertyType);
  L := TList<string>.Create;
  try
    for Par in MT.GetParameters do
    begin
      Pref := '';
      if pfVar in Par.Flags then
        Pref := 'var'
      else if pfOut in Par.Flags then
        Pref := 'out'
      else if pfConst in Par.Flags then
        Pref := 'const';
      if Par.ParamType <> nil then
        L.Add(Pref + '|' + LowerCase(Par.ParamType.Name))
      else
        L.Add(Pref + '|');
    end;
    Result := L.ToArray;
  finally
    L.Free;
  end;
end;

function TImpReglas.EventoDestino(const ClaseMerge, Evento: string): string;
begin
  if not FEventos.TryGetValue(UpperCase(ClaseMerge + '.' + Evento), Result) then
    Result := Evento;
end;

function TImpReglas.UnitFuera(const U: string): Boolean;
begin
  Result := FUnitsFuera.IndexOf(U) >= 0;
end;

function TImpReglas.UnitCorta(const U: string): string;
begin
  if not FUnitsCortas.TryGetValue(UpperCase(U), Result) then
    Result := '';
end;

function TImpReglas.UnitDeTipo(const T: string): string;
begin
  if not FTipoUnidad.TryGetValue(UpperCase(T), Result) then
    Result := '';
end;

function NormalizaFirma(const Params: string): TArray<string>;
var
  S, Grupo, Nombres, Tipo, Mod_: string;
  L: TList<string>;
  k: Integer;
  N: string;
begin
  S := Trim(Params);
  if StartsStr('(', S) then
    S := Copy(S, 2, MaxInt);
  if EndsStr(')', S) then
    S := Copy(S, 1, Length(S) - 1);
  L := TList<string>.Create;
  try
    for Grupo in S.Split([';']) do
    begin
      if Pos(':', Grupo) = 0 then
        Continue;
      k := LastDelimiter(':', Grupo);
      Nombres := Trim(Copy(Grupo, 1, k - 1));
      Tipo := LowerCase(Trim(Copy(Grupo, k + 1, MaxInt)).Split(['='])[0].Trim);
      Mod_ := '';
      for N in ['var ', 'const ', 'out '] do
        if StartsText(N, Nombres) then
        begin
          Mod_ := Trim(N);
          Nombres := Trim(Copy(Nombres, Length(N) + 1, MaxInt));
        end;
      for N in Nombres.Split([',']) do
        L.Add(LowerCase(Mod_) + '|' + Tipo);
    end;
    Result := L.ToArray;
  finally
    L.Free;
  end;
end;

function MismaFirma(const A, B: TArray<string>): Boolean;
var
  i: Integer;
begin
  Result := Length(A) = Length(B);
  if Result then
    for i := 0 to High(A) do
      if A[i] <> B[i] then
        Exit(False);
end;

end.
