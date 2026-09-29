unit UImpConversor;

// Importador de módulos de Merge (Delphi 6) a Merge13 (Delphi 13).
// El formulario se queda como formulario (misma unit, clase y base TFPEdit...), los componentes de Merge pasan a VCL,
// el módulo de datos pasa de FIB a FireDAC con los tipos de campo que decide FireDAC con la conexión real,
// y el módulo se registra en el menú. Las units de las que depende y aún no están importadas quedan en Pendientes.

interface

uses
  System.SysUtils, System.Classes, System.Generics.Collections, System.RegularExpressions, System.IOUtils,
  FireDAC.Comp.Client, UImpDfm, UImpReglas, UImpTexto;

type
  TImpLog = reference to procedure(const S: string);

  TBuscador = class
    Control, Tabla, Campo, Devolver, Filtro: string;
    Campos: TArray<string>;
    EsDB: Boolean;
    Props: TStringList;          // Prop=Valor
    Eventos: TStringList;        // Evento=Metodo
    constructor Create;
    destructor Destroy; override;
  end;

  TImportador = class
  private
    FMerge, FProyecto: string;
    FCon: TFDConnection;
    FLog: TImpLog;
    FReglas: TImpReglas;
    FSinTeeChart: Boolean;
    FIndice: TDictionary<string, string>;        // unit (minúsculas) -> ruta .pas en Merge
    FBaseM13: TDictionary<string, string>;       // componente de las bases de Merge13 -> clase
    FBasesMerge: TObjectList<TDfmNodo>;          // DFM de las bases de Merge (para heredados sin equivalente)
    FBaseMerge: TDictionary<string, TDfmNodo>;
    FEquivalencias: TStringList;                 // origen=destino
    FTiposPendientes: TStringList;
    FIdentUnit: TObjectDictionary<string, TStringList>;   // unit de Merge -> identificadores de su interfaz
    FRevisar, FAuto: TStringList;
    // --- contexto del módulo en curso
    FFirmas: TDictionary<string, TArray<string>>;
    FBuscadores: TObjectList<TBuscador>;
    FPuentesDecl, FPuentesImpl, FAsignaciones, FNuevosCampos, FCombosValue, FBloqueos, FUpdates: TStringList;
    FDMNombre, FTituloAdjunto: string;
    procedure Log(const S: string);
    procedure Revisar(const S: string);
    procedure Auto(const S: string);
    procedure LimpiaContexto;
    procedure CargaIndice;
    procedure CargaBases;
    function RutaMerge(const AUnit: string): string;
    function ExisteEnProyecto(const AUnit: string): Boolean;
    function DestinoDe(const AUnit: string): string;
    // --- SQL y tipos
    function ParamsFib(const S: string): string;
    procedure DescribeSQL(const SQL: string; Campos: TDictionary<string, string>; Tamanos: TDictionary<string, Integer>);
    procedure PonParamData(Q: TDfmNodo; const SQL: TArray<string>);
    // --- DFM
    function ConvierteTransaccion(N: TDfmNodo): TDfmNodo;
    function ConvierteDataset(N: TDfmNodo; Updates: TList<TDfmNodo>): TDfmNodo;
    function ConvierteQuery(N: TDfmNodo): TDfmNodo;
    procedure ConvierteCampos(N, Q: TDfmNodo; const SQL: TArray<string>);
    function ConvierteDM(Raiz: TDfmNodo): TDfmNodo;
    function ConvierteForm(Raiz: TDfmNodo): TDfmNodo;
    function ConvierteNodo(N: TDfmNodo; Updates: TList<TDfmNodo>): TDfmNodo;
    procedure ConvierteProps(Origen, Destino: TDfmNodo; const ClaseDestino: string);
    function EnlazaEvento(const Control, ClaseDestino, Evento, Metodo: string): string;
    procedure LeeFirmas(const Src, Clase: string);
    // --- código
    function ConversionesComunes(const Src, Nombre: string): string;
    function ExecQueryNativo(const Src, Nombre: string): string;
    function TransaccionEscritura(const Src: string): string;
    function ReglasUses(const Src, Nombre: string): string;
    function IdentificadoresInterfaz(const AUnit: string): TStringList;
    function QuitaUnitsNoUsadas(const Src: string): string;
    function CompletaUsesInterfaz(const Src: string): string;
    function ConviertePasDM(const Src, Nombre: string; Nuevo: TDfmNodo): string;
    function ConviertePasForm(const Src, Nombre, Clase: string; Eliminados: TStringList; const Registro: string): string;
    function ConviertePasUnit(const Src, Nombre: string): string;
    function InsertaEnFormCreate(const Src, Clase: string; Lineas: TStringList; out Creado: Boolean): string;
    function RegistroDe(const FormCls, FormVar: string): string;
    // --- dependencias
    function GeneraStub(const Src, Nombre: string): string;
    procedure GeneraTiposPendientes;
    procedure GeneraUUtilesMerge;
    procedure ResuelveDependencias(Importadas: TStringList);
    procedure ActualizaDpr;
    procedure CopiaFramework;
  public
    constructor Create(const DirMerge, DirProyecto: string; Conexion: TFDConnection; ALog: TImpLog;
      SinTeeChart: Boolean = True);
    destructor Destroy; override;
    procedure ImportaModulo(const FormUnit: string; const DMUnit: string = '');
    procedure ImportaUnit(const AUnit: string);
    function EsFormularioModulo(const RutaPas: string): Boolean;
    property Revisiones: TStringList read FRevisar;
    property Automaticas: TStringList read FAuto;
  end;

implementation

uses
  System.StrUtils, System.Math, Data.DB, FireDAC.Stan.Param, FireDAC.Comp.DataSet;

type
  TFDQueryAcc = class(TFDQuery);

const
  GNUGETTEXT_USES = '{IDIOMA_CODE} gnugettext {IDIOMA_CODE}';
  USES_DM: array[0..16] of string = ('System.SysUtils', 'System.Classes', 'System.Variants', 'Data.DB', 'Vcl.Forms',
    'Vcl.Controls', 'Vcl.Dialogs', 'Winapi.Windows', 'FireDAC.Stan.Intf', 'FireDAC.Stan.Option', 'FireDAC.Stan.Param',
    'FireDAC.Stan.Error', 'FireDAC.DatS', 'FireDAC.Phys.Intf', 'FireDAC.DApt.Intf', 'FireDAC.DApt',
    'FireDAC.Comp.Client');
  USES_FIREDAC_EXTRA: array[0..2] of string = ('FireDAC.Stan.Async', 'FireDAC.Comp.DataSet', 'gnugettext');

function Grupo(const M: TMatch; N: Integer): string;
// valor de un grupo de la expresión regular, '' si no ha participado (en Delphi leerlo daría excepción)
begin
  Result := '';
  if M.Success and (M.Groups.Count > N) and M.Groups[N].Success then
    Result := M.Groups[N].Value;
end;

function AntesDeAlmohadilla(const L: string): string;
// texto de una línea de configuración sin el comentario (# ...)
begin
  if Pos('#', L) > 0 then
    Result := Trim(Copy(L, 1, Pos('#', L) - 1))
  else
    Result := Trim(L);
end;

{ TBuscador }

constructor TBuscador.Create;
begin
  Props := TStringList.Create;
  Eventos := TStringList.Create;
end;

destructor TBuscador.Destroy;
begin
  Props.Free;
  Eventos.Free;
  inherited;
end;

{ TImportador }

constructor TImportador.Create(const DirMerge, DirProyecto: string; Conexion: TFDConnection; ALog: TImpLog;
  SinTeeChart: Boolean);
var
  F: string;
begin
  FMerge := ExcludeTrailingPathDelimiter(DirMerge);
  FProyecto := ExcludeTrailingPathDelimiter(DirProyecto);
  FCon := Conexion;
  FLog := ALog;
  FSinTeeChart := SinTeeChart;
  FReglas := TImpReglas.Create(FProyecto);
  FIndice := TDictionary<string, string>.Create;
  FBaseM13 := TDictionary<string, string>.Create;
  FBasesMerge := TObjectList<TDfmNodo>.Create(True);
  FBaseMerge := TDictionary<string, TDfmNodo>.Create;
  FEquivalencias := TStringList.Create;
  FTiposPendientes := TStringList.Create;
  FTiposPendientes.Sorted := True;
  FTiposPendientes.Duplicates := dupIgnore;
  FTiposPendientes.CaseSensitive := False;
  FIdentUnit := TObjectDictionary<string, TStringList>.Create([doOwnsValues]);
  FRevisar := TStringList.Create;
  FAuto := TStringList.Create;
  FFirmas := TDictionary<string, TArray<string>>.Create;
  FBuscadores := TObjectList<TBuscador>.Create(True);
  FPuentesDecl := TStringList.Create;
  FPuentesImpl := TStringList.Create;
  FAsignaciones := TStringList.Create;
  FNuevosCampos := TStringList.Create;
  FCombosValue := TStringList.Create;
  FBloqueos := TStringList.Create;
  FUpdates := TStringList.Create;
  F := TPath.Combine(FProyecto, 'Importador\equivalencias.txt');
  if FileExists(F) then
    for var L in TFile.ReadAllLines(F, TEncoding.UTF8) do
    begin
      var X := AntesDeAlmohadilla(L);
      if Pos('=>', X) > 0 then
        FEquivalencias.Add(Trim(Copy(X, 1, Pos('=>', X) - 1)) + '=' + Trim(Copy(X, Pos('=>', X) + 2, MaxInt)));
    end;
  F := TPath.Combine(FProyecto, 'Pendientes\UTiposPendientesMerge.pas');
  if FileExists(F) then
    for var M in TRegEx.Matches(LeeTexto(F), '^\s*(T\w+) = class', [roMultiLine]) do
      FTiposPendientes.Add(M.Groups[1].Value);
  CargaIndice;
  CargaBases;
end;

destructor TImportador.Destroy;
begin
  FReglas.Free;
  FIndice.Free;
  FBaseM13.Free;
  FBaseMerge.Free;
  FBasesMerge.Free;
  FEquivalencias.Free;
  FTiposPendientes.Free;
  FIdentUnit.Free;
  FRevisar.Free;
  FAuto.Free;
  FFirmas.Free;
  FBuscadores.Free;
  FPuentesDecl.Free;
  FPuentesImpl.Free;
  FAsignaciones.Free;
  FNuevosCampos.Free;
  FCombosValue.Free;
  FBloqueos.Free;
  FUpdates.Free;
  inherited;
end;

procedure TImportador.Log(const S: string);
begin
  if Assigned(FLog) then
    FLog(S);
end;

procedure TImportador.Revisar(const S: string);
begin
  FRevisar.Add(S);
end;

procedure TImportador.Auto(const S: string);
begin
  FAuto.Add(S);
end;

procedure TImportador.LimpiaContexto;
begin
  FFirmas.Clear;
  FBuscadores.Clear;
  FPuentesDecl.Clear;
  FPuentesImpl.Clear;
  FAsignaciones.Clear;
  FNuevosCampos.Clear;
  FCombosValue.Clear;
  FBloqueos.Clear;
  FUpdates.Clear;
  FTituloAdjunto := '''''';
end;

procedure TImportador.CargaIndice;
var
  F: string;
begin
  FIndice.Clear;
  for F in TDirectory.GetFiles(FMerge, '*.pas', TSearchOption.soAllDirectories) do
    if not FIndice.ContainsKey(LowerCase(TPath.GetFileNameWithoutExtension(F))) then
      FIndice.Add(LowerCase(TPath.GetFileNameWithoutExtension(F)), F);
end;

procedure TImportador.CargaBases;
var
  U, F: string;
  R: TDfmNodo;
begin
  for U in ['UFPEditSinNavegador', 'UFPEditSimple', 'UFPEdit', 'UFPEditDetalle'] do
  begin
    F := TPath.Combine(FProyecto, U + '.dfm');
    if FileExists(F) then
    begin
      R := CargaDfm(F);
      try
        R.Recorre(
          procedure(N: TDfmNodo)
          begin
            if N <> R then
              FBaseM13.AddOrSetValue(UpperCase(N.Nombre), N.Clase);
          end);
      finally
        R.Free;
      end;
    end;
  end;
  // bases de Merge: propiedades de los componentes heredados que en Merge13 no existen
  for U in ['ufpeditsinnavegador', 'ufpeditsimple', 'ufpedit', 'ufpeditdetalle'] do
    if FIndice.ContainsKey(U) and FileExists(ChangeFileExt(FIndice[U], '.dfm')) then
    begin
      R := CargaDfm(ChangeFileExt(FIndice[U], '.dfm'));
      FBasesMerge.Add(R);
      R.Recorre(
        procedure(N: TDfmNodo)
        begin
          if N <> R then
            FBaseMerge.AddOrSetValue(UpperCase(N.Nombre), N);
        end);
    end;
end;

function TImportador.RutaMerge(const AUnit: string): string;
begin
  if not FIndice.TryGetValue(LowerCase(AUnit), Result) then
    Result := '';
end;

function TImportador.ExisteEnProyecto(const AUnit: string): Boolean;
begin
  Result := Length(TDirectory.GetFiles(FProyecto, AUnit + '.pas', TSearchOption.soAllDirectories)) > 0;
end;

function TImportador.DestinoDe(const AUnit: string): string;
var
  Rel: string;
begin
  Rel := ExtractRelativePath(IncludeTrailingPathDelimiter(FMerge), ExtractFilePath(RutaMerge(AUnit)));
  Result := TPath.Combine(TPath.Combine(FProyecto, 'Merge'), Rel);
  ForceDirectories(Result);
end;

function TImportador.EsFormularioModulo(const RutaPas: string): Boolean;
begin
  Result := FileExists(ChangeFileExt(RutaPas, '.dfm')) and StartsText('UFM', ExtractFileName(RutaPas));
end;

{ ------------------------------------------------------------------------------------------------ SQL y tipos }

function TImportador.ParamsFib(const S: string): string;
begin
  Result := TRegEx.Replace(S, '\?old_(\w+)', ':OLD_$1', [roIgnoreCase]);
  Result := TRegEx.Replace(Result, '(?<![\w?])\?(?=[A-Za-z_])', ':');
end;

procedure TImportador.DescribeSQL(const SQL: string; Campos: TDictionary<string, string>;
  Tamanos: TDictionary<string, Integer>);
// Prepara la consulta con la conexión de Merge13: FireDAC dice qué clase de campo crea para cada columna
var
  Q: TFDQuery;
  i: Integer;
  FD: TFieldDef;
begin
  if (FCon = nil) or not FCon.Connected or (Trim(SQL) = '') then
    Exit;
  Q := TFDQuery.Create(nil);
  try
    try
      Q.Connection := FCon;
      Q.SQL.Text := SQL;
      Q.FieldDefs.Update;
      for i := 0 to Q.FieldDefs.Count - 1 do
      begin
        FD := Q.FieldDefs[i];
        Campos.AddOrSetValue(UpperCase(FD.Name), TFDQueryAcc(Q).GetFieldClass(FD).ClassName);
        Tamanos.AddOrSetValue(UpperCase(FD.Name), FD.Size);
      end;
    except
      on E: Exception do
        Revisar('SQL que la base de datos no acepta: ' + Copy(SQL, 1, 80) + ' -> ' + E.Message);
    end;
  finally
    Q.Free;
  end;
end;

procedure TImportador.PonParamData(Q: TDfmNodo; const SQL: TArray<string>);
// FireDAC no crea los parámetros al cargar el DFM: se guardan (ParamData), como hace el IDE
var
  Texto, N: string;
  Nombres: TStringList;
  L: TStringList;
  i: Integer;
  M: TMatch;
begin
  Texto := TRegEx.Replace(String.Join(#10, SQL), '''(?:[^'']|'''')*''', '''''');
  Nombres := TStringList.Create;
  L := TStringList.Create;
  try
    for M in TRegEx.Matches(Texto, '(?<![\w:]):(\w+)') do
    begin
      N := UpperCase(M.Groups[1].Value);
      if Nombres.IndexOf(N) < 0 then
        Nombres.Add(N);
    end;
    if Nombres.Count = 0 then
      Exit;
    L.Add('<');
    for i := 0 to Nombres.Count - 1 do
    begin
      L.Add('  item');
      L.Add('    Name = ''' + Nombres[i] + '''');
      L.Add('    ParamType = ptInput');
      L.Add('  end' + IfThen(i = Nombres.Count - 1, '>'));
    end;
    Q.PonValor('ParamData', L);
  finally
    Nombres.Free;
    L.Free;
  end;
end;

{ ------------------------------------------------------------------------------------------------ DFM: datos }

function TImportador.ConvierteTransaccion(N: TDfmNodo): TDfmNodo;
var
  Params: string;
begin
  Params := LowerCase(String.Join(' ', N.Cadenas('TRParams.Strings')));
  Result := TDfmNodo.Create(N.Tipo, N.Nombre, 'TFDTransaction');
  Result.PonValor('Options.Isolation', IfThen(Pos('read_commit', Params) > 0, 'xiReadCommitted', 'xiSnapshot'));
  if TRegEx.IsMatch(Params, '\bread\b') then
    Result.PonValor('Options.ReadOnly', 'True');
  Result.PonValor('Connection', 'DMMain.DataBase');
  if N.Prop('Left') <> nil then
    Result.PonValor('Left', N.Valor('Left'));
  if N.Prop('Top') <> nil then
    Result.PonValor('Top', N.Valor('Top'));
end;

procedure TImportador.ConvierteCampos(N, Q: TDfmNodo; const SQL: TArray<string>);
var
  Clases: TDictionary<string, string>;
  Tamanos: TDictionary<string, Integer>;
  H, F: TDfmNodo;
  FN, Cls: string;
  Calc: Boolean;
  P: TDfmProp;
begin
  Clases := TDictionary<string, string>.Create;
  Tamanos := TDictionary<string, Integer>.Create;
  try
    DescribeSQL(String.Join(#13#10, SQL), Clases, Tamanos);
    for H in N.Hijos do
    begin
      if not EndsText('Field', H.Clase) then
        Continue;
      FN := UpperCase(SinComillas(H.Valor('FieldName')));
      Calc := MatchText(H.Valor('FieldKind'), ['fkCalculated', 'fkLookup']) or SameText(H.Valor('Calculated'), 'True');
      if (not Calc) and Clases.TryGetValue(FN, Cls) then
      else
      begin
        Cls := H.Clase;
        if SameText(Cls, 'TFIBStringField') then Cls := 'TStringField'
        else if SameText(Cls, 'TDateTimeField') or SameText(Cls, 'TDateField') then
          Cls := IfThen(Calc, Cls, 'TSQLTimeStampField');
        if (not Calc) and (Clases.Count > 0) then
          Revisar(Format('Campo %s: %s no es una columna de la consulta de %s (¿campo sobrante en Merge?).',
            [H.Nombre, FN, N.Nombre]));
      end;
      F := TDfmNodo.Create(H.Tipo, H.Nombre, Cls);
      for P in H.Props do
        if FReglas.AdmiteProp(Cls, P.Nombre) and FReglas.ValorValido(Cls, P.Nombre, P.Texto) then
          F.PonValor(P.Nombre, P.Lineas);
      if SameText(Cls, 'TStringField') and Tamanos.ContainsKey(FN) and (Tamanos[FN] > 0) then
        F.PonValor('Size', IntToStr(Tamanos[FN]));
      if (not Calc) and (F.Prop('Origin') = nil) then
        F.PonValor('Origin', Comillas(FN));
      Q.AnyadeHijo(F);
    end;
  finally
    Clases.Free;
    Tamanos.Free;
  end;
end;

function TImportador.ConvierteDataset(N: TDfmNodo; Updates: TList<TDfmNodo>): TDfmNodo;
const
  EVENTOS_FDQUERY = ';BeforeOpen;AfterOpen;BeforeClose;AfterClose;BeforeInsert;AfterInsert;BeforeEdit;AfterEdit;' +
    'BeforePost;AfterPost;BeforeCancel;AfterCancel;BeforeDelete;AfterDelete;BeforeScroll;AfterScroll;BeforeRefresh;' +
    'AfterRefresh;OnCalcFields;OnDeleteError;OnEditError;OnNewRecord;OnPostError;OnFilterRecord;OnUpdateRecord;' +
    'OnUpdateError;OnReconcileError;BeforeApplyUpdates;AfterApplyUpdates;BeforeExecute;AfterExecute;';
var
  Q, U: TDfmNodo;
  P: TDfmProp;
  Sel, Ins, Upd, Del, Ref, Claves, Tablas, CamposB: TArray<string>;
  Tabla, Acc: string;
  RW: Boolean;
  i: Integer;
  function SQLDe(const Prop: string): TArray<string>;
  var
    k: Integer;
  begin
    Result := N.Cadenas(Prop);
    for k := 0 to High(Result) do
      Result[k] := ParamsFib(Result[k]);
  end;
begin
  Q := TDfmNodo.Create(N.Tipo, N.Nombre, 'TFDQuery');
  for P in N.Props do
    if Pos(';' + P.Nombre + ';', EVENTOS_FDQUERY) > 0 then
      Q.PonValor(P.Nombre, P.Lineas)
    else if StartsStr('On', P.Nombre) or StartsStr('After', P.Nombre) or StartsStr('Before', P.Nombre) then
      Revisar(Format('%s.%s = %s: evento propio de %s que TFDQuery no tiene; el método queda sin enganchar.',
        [N.Nombre, P.Nombre, P.Texto, N.Clase]));
  Q.PonValor('Connection', 'DMMain.DataBase');
  if N.Prop('Transaction') <> nil then
    Q.PonValor('Transaction', N.Valor('Transaction'));
  if N.Prop('UpdateTransaction') <> nil then
    Q.PonValor('UpdateTransaction', N.Valor('UpdateTransaction'));
  if N.Prop('DataSource') <> nil then
    Q.PonValor('MasterSource', N.Valor('DataSource'));
  Sel := SQLDe('SelectSQL.Strings');
  if Length(Sel) > 0 then
  begin
    Q.PonCadenas('SQL.Strings', Sel);
    PonParamData(Q, Sel);
  end;
  if SameText(N.Valor('CachedUpdates'), 'True') then
    Q.PonValor('CachedUpdates', 'True');
  if SameText(N.Valor('UniDirectional'), 'True') then
    Q.PonValor('FetchOptions.Unidirectional', 'True');
  RW := EnLista(N.Clase, DATASETS_RW);
  if RW then
  begin
    Ins := SQLDe('InsertSQL.Strings');
    Upd := SQLDe('UpdateSQL.Strings');
    Del := SQLDe('DeleteSQL.Strings');
    Ref := SQLDe('RefreshSQL.Strings');
    if (Length(Ins) > 0) or (Length(Upd) > 0) or (Length(Del) > 0) then
    begin
      U := TDfmNodo.Create('object', 'FDU' + N.Nombre, 'TFDUpdateSQL');
      U.PonValor('Connection', 'DMMain.DataBase');
      if Length(Ins) > 0 then U.PonCadenas('InsertSQL.Strings', Ins);
      if Length(Upd) > 0 then U.PonCadenas('ModifySQL.Strings', Upd);
      if Length(Del) > 0 then U.PonCadenas('DeleteSQL.Strings', Del);
      if Length(Ref) > 0 then U.PonCadenas('FetchRowSQL.Strings', Ref);
      U.PonValor('Left', IntToStr(StrToIntDef(N.Valor('Left'), 0) + 90));
      U.PonValor('Top', IfThen(N.Valor('Top') = '', '0', N.Valor('Top')));
      Updates.Add(U);
      FUpdates.Add(U.Nombre);
      Q.PonValor('UpdateObject', U.Nombre);
    end;
    Claves := N.Cadenas('ClavesPrimarias.Strings');
    for i := 0 to High(Claves) do
      Claves[i] := Trim(Claves[i]);
    if Length(Claves) > 0 then
      Q.PonValor('UpdateOptions.KeyFields', Comillas(String.Join(';', Claves)));
    Tabla := Trim(SinComillas(N.Valor('TableName')));
    if Tabla <> '' then
      Q.PonValor('UpdateOptions.UpdateTableName', Comillas(Tabla));
    Acc := N.Valor('AccionesInhibidas');
    if ContainsText(Acc, 'Borrar') then Q.PonValor('UpdateOptions.EnableDelete', 'False');
    if ContainsText(Acc, 'Insertar') then Q.PonValor('UpdateOptions.EnableInsert', 'False');
    if ContainsText(Acc, 'Modificar') then Q.PonValor('UpdateOptions.EnableUpdate', 'False');
    // control de concurrencia de TFIBTableSet
    if SameText(N.Valor('BloqOpt'), 'True') then
    begin
      Tablas := N.Cadenas('TablasBloqueo.Strings');
      CamposB := N.Cadenas('CamposBloqueo.Strings');
      for i := 0 to High(Tablas) do
        if Trim(Tablas[i]) <> '' then
        begin
          Acc := '';
          if i <= High(CamposB) then
            Acc := StringReplace(CamposB[i], ' ', '', [rfReplaceAll]);
          FBloqueos.Add(Format('  TControlConcurrencia.Registra(%s, ''%s'', ''%s'', cmSelectWithLock);',
            [N.Nombre, Trim(Tablas[i]), Acc]));
        end;
    end
    else if (Length(Claves) > 0) and (Tabla <> '') and not ContainsText(N.Valor('Opciones'), 'NoControlarConcurrencia') then
      FBloqueos.Add(Format('  TControlConcurrencia.Registra(%s, ''%s'', ''%s'', cmUpdate);',
        [N.Nombre, Tabla, String.Join(',', Claves)]));
  end
  else
    Q.PonValor('UpdateOptions.ReadOnly', 'True');
  Q.PonValor('Left', IfThen(N.Valor('Left') = '', '0', N.Valor('Left')));
  Q.PonValor('Top', IfThen(N.Valor('Top') = '', '0', N.Valor('Top')));
  ConvierteCampos(N, Q, Sel);
  Result := Q;
end;

function TImportador.ConvierteQuery(N: TDfmNodo): TDfmNodo;
var
  S: TArray<string>;
  i: Integer;
begin
  Result := TDfmNodo.Create(N.Tipo, N.Nombre, 'TFDQuery');
  Result.PonValor('Connection', 'DMMain.DataBase');
  if N.Prop('Transaction') <> nil then
    Result.PonValor('Transaction', N.Valor('Transaction'));
  S := N.Cadenas('SQL.Strings');
  for i := 0 to High(S) do
    S[i] := ParamsFib(S[i]);
  if Length(S) > 0 then
  begin
    Result.PonCadenas('SQL.Strings', S);
    PonParamData(Result, S);
  end;
  Result.PonValor('Left', IfThen(N.Valor('Left') = '', '0', N.Valor('Left')));
  Result.PonValor('Top', IfThen(N.Valor('Top') = '', '0', N.Valor('Top')));
end;

function TImportador.ConvierteDM(Raiz: TDfmNodo): TDfmNodo;
var
  H, X: TDfmNodo;
  P: TDfmProp;
  Updates: TList<TDfmNodo>;
  Motivo: string;
begin
  Result := TDfmNodo.Create(Raiz.Tipo, Raiz.Nombre, Raiz.Clase);
  for P in Raiz.Props do
    if MatchText(P.Nombre, ['OnCreate', 'OnDestroy', 'Height', 'Width']) then
      Result.PonValor(P.Nombre, P.Lineas);
  Updates := TList<TDfmNodo>.Create;
  try
    for H in Raiz.Hijos do
    begin
      if EnLista(H.Clase, TRANSACCIONES) then
        Result.AnyadeHijo(ConvierteTransaccion(H))
      else if EnLista(H.Clase, DATASETS_RW) or EnLista(H.Clase, DATASETS_RO) then
        Result.AnyadeHijo(ConvierteDataset(H, Updates))
      else if EnLista(H.Clase, QUERIES) then
        Result.AnyadeHijo(ConvierteQuery(H))
      else if FReglas.EsEliminada(H.Clase, Motivo) then
        Revisar(Format('%s (%s): %s, pendiente.', [H.Nombre, H.Clase, Motivo]))
      else
      begin
        X := LeeDfm(EscribeDfm(H));   // copia tal cual (TDataSource...)
        Result.AnyadeHijo(X);
      end;
    end;
    for X in Updates do
      Result.AnyadeHijo(X);
  finally
    Updates.Free;
  end;
end;

{ ------------------------------------------------------------------------------------------------ DFM: formulario }

procedure TImportador.LeeFirmas(const Src, Clase: string);
var
  M, MM: TMatch;
begin
  FFirmas.Clear;
  M := TRegEx.Match(QuitaComentarios(Src), '\b' + Clase + '\s*=\s*class\b(.*?)\n\s*end\s*;', [roIgnoreCase, roSingleLine]);
  if not M.Success then
    Exit;
  for MM in TRegEx.Matches(M.Groups[1].Value, '\bprocedure\s+(\w+)\s*(\([^)]*\))?\s*;', [roIgnoreCase]) do
    FFirmas.AddOrSetValue(LowerCase(MM.Groups[1].Value),
      NormalizaFirma(IfThen(Grupo(MM, 2) <> '', Grupo(MM, 2), '()')));
end;

function TImportador.EnlazaEvento(const Control, ClaseDestino, Evento, Metodo: string): string;
// Devuelve el método a enlazar o '' si la firma no encaja con la del evento de Delphi 13
var
  Real, Esperada: TArray<string>;
begin
  Result := '';
  if not FFirmas.TryGetValue(LowerCase(Metodo), Real) then
  begin
    Revisar(Format('%s.%s = %s: el método no está declarado en el formulario; no se enlaza.', [Control, Evento, Metodo]));
    Exit;
  end;
  Esperada := FReglas.FirmaEvento(ClaseDestino, Evento);
  if (Esperada = nil) or MismaFirma(Esperada, Real) then
    Result := Metodo
  else
    Revisar(Format('%s.%s = %s: la firma no coincide con la del evento de %s; no se enlaza.',
      [Control, Evento, Metodo, ClaseDestino]));
end;

procedure TImportador.ConvierteProps(Origen, Destino: TDfmNodo; const ClaseDestino: string);
var
  P: TDfmProp;
  Ev, Metodo, DS: string;
  Esperada: TArray<string>;
  B: TBuscador;
  Puentes: TStringList;
begin
  Puentes := TStringList.Create;
  try
    for P in Origen.Props do
    begin
      if FReglas.EsEvento(Origen.Clase, P.Nombre) or StartsStr('On', P.Nombre) or SameText(P.Nombre, 'BeforeAction') then
      begin
        Metodo := P.Texto;
        Ev := FReglas.EventoDestino(Origen.Clase, P.Nombre);
        // eventos de EditFind -> TBuscadorCampo
        if EnLista(Origen.Clase, EDITFIND) and MatchText(P.Nombre, ['OnVerificacion', 'OnBusqueda', 'OnExiste', 'OnNoExiste']) then
        begin
          for B in FBuscadores do
            if B.Control = Origen.Nombre then
              B.Eventos.Add(P.Nombre + '=' + Metodo);
          Continue;
        end;
        // navegador HY: OnClickBefore(...; var Continua) -> BeforeAction con Abort
        if SameText(Origen.Clase, 'THYMNavigator') and SameText(P.Nombre, 'OnClickBefore') then
        begin
          Puentes.Add(Metodo);
          Continue;
        end;
        if SameText(Origen.Clase, 'THYMNavigator') and SameText(P.Nombre, 'OnChangeState') then
        begin
          DS := Origen.Valor('DataSource');
          if DS <> '' then
            FAsignaciones.Add(Format('%s.OnStateChange := %s;  // antes %s.OnChangeState', [DS, Metodo, Origen.Nombre]));
          Continue;
        end;
        if not FReglas.EsEvento(ClaseDestino, Ev) then
        begin
          Revisar(Format('%s.%s = %s: %s no tiene ese evento en Delphi 13; el método queda sin enganchar.',
            [Origen.Nombre, P.Nombre, Metodo, ClaseDestino]));
          Continue;
        end;
        Metodo := EnlazaEvento(Origen.Nombre, ClaseDestino, Ev, Metodo);
        if Metodo <> '' then
          Destino.PonValor(Ev, Metodo);
        Continue;
      end;
      if FReglas.AdmiteProp(ClaseDestino, P.Nombre) and FReglas.ValorValido(ClaseDestino, P.Nombre, P.Texto) then
        Destino.PonValor(P.Nombre, P.Lineas);
    end;
    // puente para OnClickBefore
    if Puentes.Count > 0 then
    begin
      Esperada := FReglas.FirmaEvento('TDBNavigator', 'BeforeAction');
      FPuentesDecl.Add(Format('    procedure %sBeforeActionPuente(Sender: TObject; Button: TNavigateBtn);', [Origen.Nombre]));
      FPuentesImpl.Add(Format('procedure %%CLASE%%.%sBeforeActionPuente(Sender: TObject; Button: TNavigateBtn);', [Origen.Nombre]));
      FPuentesImpl.Add('var');
      FPuentesImpl.Add('  Continua: Boolean;');
      FPuentesImpl.Add('begin');
      FPuentesImpl.Add('  // navegador HY de Merge: OnClickBefore(...; var Continua)');
      FPuentesImpl.Add('  Continua := True;');
      FPuentesImpl.Add(Format('  %s(Sender, Button, Continua);', [Puentes[0]]));
      FPuentesImpl.Add('  if not Continua then');
      FPuentesImpl.Add('    Abort;');
      FPuentesImpl.Add('end;');
      FPuentesImpl.Add('');
      Destino.PonValor('BeforeAction', Origen.Nombre + 'BeforeActionPuente');
    end;
  finally
    Puentes.Free;
  end;
end;

function TImportador.ConvierteNodo(N: TDfmNodo; Updates: TList<TDfmNodo>): TDfmNodo;
var
  Motivo, Dest, Filtros: string;
  H, R, Base: TDfmNodo;
  B: TBuscador;
  F: array[0..3] of Char;
  X: string;
  P: TDfmProp;
begin
  Result := nil;
  if FReglas.EsEliminada(N.Clase, Motivo) then
    Exit;
  if FSinTeeChart and EndsText('Series', N.Clase) then
    Exit;
  if FSinTeeChart and MatchText(N.Clase, ['TDBChart', 'TChart']) then
  begin
    Result := TDfmNodo.Create('object', N.Nombre, 'TPanel');
    for X in ['Left', 'Top', 'Width', 'Height', 'Align', 'Anchors', 'TabOrder', 'Visible'] do
      if N.Prop(X) <> nil then
        Result.PonValor(X, N.Valor(X));
    Result.PonValor('Caption', Comillas('Gráfico pendiente (TeeChart)'));
    FNuevosCampos.Add(N.Nombre + '=TPanel');
    Revisar(N.Nombre + ': gráfico TeeChart sustituido por un TPanel.');
    Exit;
  end;
  if EnLista(N.Clase, TRANSACCIONES) then
    Exit(ConvierteTransaccion(N));
  if EnLista(N.Clase, DATASETS_RW) or EnLista(N.Clase, DATASETS_RO) then
    Exit(ConvierteDataset(N, Updates));
  if EnLista(N.Clase, QUERIES) then
    Exit(ConvierteQuery(N));
  if SameText(N.Tipo, 'inherited') then
  begin
    if EnLista(N.Nombre, HEREDADOS_ELIMINAR) then
      Exit;
    if FBaseM13.TryGetValue(UpperCase(N.Nombre), Dest) then
    begin
      Result := TDfmNodo.Create('inherited', N.Nombre, Dest);
      Result.Orden := N.Orden;
      ConvierteProps(N, Result, Dest);
      if not SameText(N.Nombre, 'TBActions') then   // los botones de acciones los crea Merge13 por categoría
        for H in N.Hijos do
        begin
          R := ConvierteNodo(H, Updates);
          if R <> nil then
            Result.AnyadeHijo(R);
        end;
      Exit;
    end;
    // heredado de una base de Merge que Merge13 no tiene: pasa a componente propio
    if FBaseMerge.TryGetValue(UpperCase(N.Nombre), Base) then
      for P in Base.Props do
        if N.Prop(P.Nombre) = nil then
          N.PonValor(P.Nombre, P.Lineas);
    N.Tipo := 'object';
    if (Base <> nil) and (N.Clase = '') then
      N.Clase := Base.Clase;
    FNuevosCampos.Add(N.Nombre + '=' + FReglas.ClaseDestino(N.Clase));
  end;
  Dest := FReglas.ClaseDestino(N.Clase);
  Result := TDfmNodo.Create(N.Tipo, N.Nombre, Dest);
  Result.Orden := N.Orden;
  // EditFind -> TDBEdit/TEdit + buscador (se crea en FormCreate)
  if EnLista(N.Clase, EDITFIND) then
  begin
    B := TBuscador.Create;
    B.Control := N.Nombre;
    B.Tabla := Trim(SinComillas(N.Valor('Tabla_a_buscar')));
    B.Campo := SinComillas(N.Valor('DataField'));
    B.Devolver := SinComillas(IfThen(N.Valor('CampoADevolver') <> '', N.Valor('CampoADevolver'), N.Valor('CampoNum')));
    B.Campos := N.Cadenas('Campos_Desplegar.Strings');
    if Length(B.Campos) = 0 then
      B.Campos := [SinComillas(N.Valor('CampoNum')), SinComillas(N.Valor('CampoStr'))];
    Filtros := N.Valor('Filtros');
    F[0] := IfThen(ContainsText(Filtros, 'obEmpresa'), '1', '0')[1];
    F[1] := IfThen(ContainsText(Filtros, 'obEjercicio'), '1', '0')[1];
    F[2] := IfThen(ContainsText(Filtros, 'obCanal'), '1', '0')[1];
    F[3] := IfThen(ContainsText(Filtros, 'obSerie'), '1', '0')[1];
    B.Filtro := F[0] + F[1] + F[2] + F[3];
    B.EsDB := SameText(Dest, 'TDBEdit');
    for X in ['SalirSiNoExiste', 'AutoCambiarFoco'] do
      if N.Prop(X) <> nil then
        B.Props.Add(X + '=' + N.Valor(X));
    FBuscadores.Add(B);
  end;
  ConvierteProps(N, Result, Dest);
  if SameText(N.Clase, 'THYGRightEdit') or SameText(N.Clase, 'TCurrencyEdit') then
    Result.PonValor('Alignment', 'taRightJustify');
  if MatchText(N.Clase, ['TLFHYDBDescription', 'THYDBDescripcion']) then
  begin
    Result.PonValor('ReadOnly', 'True');
    Result.PonValor('TabStop', 'False');
  end;
  if MatchText(N.Clase, ['TLFDBComboBoxValue', 'TRxDBComboBox', 'TDBComboBoxValue']) then
    FCombosValue.Add(N.Nombre);
  if SameText(Dest, N.Clase) and (FReglas.ClaseVCL(Dest) = nil) and
    TRegEx.IsMatch(N.Clase, '^T(LF|HY|FIB|Rx|Flat|G2K|Ns|CVB|Code|Year|IOF)', [roIgnoreCase]) then
    Revisar(Format('%s: clase %s sin regla de conversión (componente propio a portar).', [N.Nombre, N.Clase]));
  for H in N.Hijos do
  begin
    R := ConvierteNodo(H, Updates);
    if R <> nil then
      Result.AnyadeHijo(R);
  end;
end;

function TImportador.ConvierteForm(Raiz: TDfmNodo): TDfmNodo;
var
  H, R: TDfmNodo;
  P: TDfmProp;
  Updates: TList<TDfmNodo>;
  Metodo: string;
begin
  Result := TDfmNodo.Create(IfThen(SameText(Raiz.Tipo, 'inherited'), 'inherited', 'object'), Raiz.Nombre, Raiz.Clase);
  for P in Raiz.Props do
    if StartsStr('On', P.Nombre) then
    begin
      Metodo := EnlazaEvento(Raiz.Nombre, 'TForm', P.Nombre, P.Texto);
      if Metodo <> '' then
        Result.PonValor(P.Nombre, Metodo);
    end
    else if FReglas.AdmiteProp('TForm', P.Nombre) and FReglas.ValorValido('TForm', P.Nombre, P.Texto) then
      Result.PonValor(P.Nombre, P.Lineas);
  Updates := TList<TDfmNodo>.Create;
  try
    for H in Raiz.Hijos do
    begin
      R := ConvierteNodo(H, Updates);
      if R <> nil then
        Result.AnyadeHijo(R);
    end;
    for R in Updates do
      Result.AnyadeHijo(R);
  finally
    Updates.Free;
  end;
end;

{ ------------------------------------------------------------------------------------------------ código }

function TImportador.ExecQueryNativo(const Src, Nombre: string): string;
// ExecQuery (FreeIB) -> Open si la sentencia devuelve filas (SELECT o se leen campos después) o ExecSQL
var
  Masc, Antes, Despues, Tramo, SQL, Verbo: string;
  Pos_: TList<Integer>;
  M: TMatch;
  i, Ini, Fin, Ult: Integer;
  S: TStringBuilder;
  C: TMatch;
begin
  Masc := QuitaComentarios(Src);
  Masc := ReemplazaFn(Masc, '''(?:[^'']|'''')*''',
    function(MM: TMatch): string
    begin
      Result := '''' + StringOfChar('x', MM.Length - 2) + '''';
    end, []);
  Pos_ := TList<Integer>.Create;
  S := TStringBuilder.Create;
  try
    for M in TRegEx.Matches(Masc, '(?<![\w])ExecQuery\b', [roIgnoreCase]) do
      Pos_.Add(M.Index);
    if Pos_.Count = 0 then
      Exit(Src);
    Ult := 1;
    for i := 0 to Pos_.Count - 1 do
    begin
      if i > 0 then
        Ini := Max(Pos_[i - 1] + 9, Pos_[i] - 3000)
      else
        Ini := Max(1, Pos_[i] - 3000);
      Antes := Copy(Src, Ini, Pos_[i] - Ini);
      C := TRegEx.Match(Antes, '^\s*(?:procedure|function)\b(?!.*^\s*(?:procedure|function)\b)', [roIgnoreCase, roMultiLine, roSingleLine]);
      if C.Success then
        Antes := Copy(Antes, C.Index, MaxInt);
      if i < Pos_.Count - 1 then
        Fin := Pos_[i + 1]
      else
        Fin := Min(Length(Src), Pos_[i] + 3000);
      Despues := Copy(Masc, Pos_[i] + 9, Fin - Pos_[i] - 9);
      C := TRegEx.Match(Despues, '\bFreeHandle\b|\bFree\s*;|\bClose\s*;|^\s*(?:procedure|function)\b', [roIgnoreCase, roMultiLine]);
      if C.Success then
        Tramo := Copy(Despues, 1, C.Index - 1)
      else
        Tramo := Copy(Despues, 1, 1500);
      SQL := '';
      for C in TRegEx.Matches(Antes, '''((?:[^'']|'''')*)''') do
        if TRegEx.IsMatch(Trim(C.Groups[1].Value), '^(SELECT|WITH|INSERT|UPDATE|DELETE|MERGE|EXECUTE|ALTER|CREATE|DROP|GRANT|SET|RECREATE)\b', [roIgnoreCase]) then
        begin
          SQL := UpperCase(Trim(C.Groups[1].Value));
          Break;
        end;
      if TRegEx.IsMatch(SQL, '^(SELECT|WITH)\b') then
        Verbo := 'Open'
      else if TRegEx.IsMatch(SQL, '^(INSERT|UPDATE|DELETE|MERGE|ALTER|CREATE|DROP|GRANT|SET|RECREATE)\b') then
        Verbo := 'ExecSQL'
      else if TRegEx.IsMatch(Tramo, '\b(Fields\s*\[|FieldByName\s*[(\[]|Eof\b|HayDatos\b|RecordCount\b|FN\s*\(|IsEmpty\b|Next\b)', [roIgnoreCase]) then
        Verbo := 'Open'
      else
      begin
        Verbo := 'ExecSQL';
        if not StartsText('EXECUTE', SQL) then
          Revisar(Format('%s: ExecQuery -> ExecSQL (no se ve la SQL ni se leen campos después; si devuelve filas, cambiar a Open)', [Nombre]));
      end;
      S.Append(Copy(Src, Ult, Pos_[i] - Ult + 1 - 1));
      S.Append(Verbo);
      Ult := Pos_[i] + Length('ExecQuery');
    end;
    S.Append(Copy(Src, Ult, MaxInt));
    Result := S.ToString;
    Result := EnCodigo(Result, '\bFreeHandle\b', 'Close');
    Result := EnCodigo(Result, '\b([\w.]+)\.HayDatos\b', '(not $1.IsEmpty)');
    Result := EnCodigo(Result, '(?<![\w.])HayDatos\b', '(not IsEmpty)');
  finally
    Pos_.Free;
    S.Free;
  end;
end;

function TImportador.TransaccionEscritura(const Src: string): string;
// FreeIB AutoTrans: las consultas creadas en código que escriben confirmaban solas.
// En Merge13 la transacción por defecto es de solo lectura (TLocal): se les asigna DMMain.TUpdate.
var
  L: TStringList;
  i, j: Integer;
  M: TMatch;
  Bloque: string;
begin
  L := TStringList.Create;
  try
    L.Text := Src;
    i := 0;
    while i < L.Count do
    begin
      M := TRegEx.Match(L[i], '^(\s*)((?:\w+\.)?)Connection\s*:=\s*DMMain\.(?:DataBase|DB)\s*;', [roIgnoreCase]);
      if M.Success then
      begin
        Bloque := '';
        for j := i + 1 to Min(i + 60, L.Count - 1) do
        begin
          Bloque := Bloque + L[j] + #10;
          if TRegEx.IsMatch(L[j], '\bFree\s*;|\bFreeAndNil\b|^\s*end\s*;\s*$', [roIgnoreCase]) then
            Break;
        end;
        Bloque := QuitaComentarios(Bloque);
        if TRegEx.IsMatch(Bloque, '\bExecSQL\b', [roIgnoreCase]) and not TRegEx.IsMatch(Bloque, '\bTransaction\s*:=', [roIgnoreCase]) then
          L.Insert(i + 1, M.Groups[1].Value + M.Groups[2].Value + 'Transaction := DMMain.TUpdate;  // FreeIB AutoTrans: escribe y confirma sola');
      end;
      Inc(i);
    end;
    Result := L.Text;
  finally
    L.Free;
  end;
end;

function TImportador.ReglasUses(const Src, Nombre: string): string;
// Units de componentes de Merge/FreeIB/FR2 fuera; nombres de Delphi 6 con su ámbito; convertidos por su nombre nuevo
begin
  Result := ReescribeUses(Src,
    function(U: string): string
    var
      Corta: string;
    begin
      Result := U;
      if FReglas.UnitFuera(U) or TRegEx.IsMatch(U, '^(HYFIBQuery|FIBQuery|FIBDataSet|FIBDatabase|FIBTableDataSet\w*|' +
        'FIBDataSet\w*|UFIBModificados|ibase|ib_externals|FIB|FIBMisc|FIBSQLMonitor|ScriptQuery|FR_\w+|DBTables|' +
        'UFIBDBEditFind|FIBUtiles|UFormGestAux)$', [roIgnoreCase]) then
        Exit('');
      if FSinTeeChart and TRegEx.IsMatch(U, '^(VclTee\.\w+|Chart|Series|TeEngine|TeeProcs|DbChart|TeeShape)$', [roIgnoreCase]) then
        Exit('');
      Corta := FReglas.UnitCorta(U);
      if Corta <> '' then
        Exit(Corta);
      // criterio de Delfos: gnugettext siempre marcado para el proceso de idiomas
      if SameText(U, 'gnugettext') then
        Exit(GNUGETTEXT_USES);
    end);
end;

function TImportador.IdentificadoresInterfaz(const AUnit: string): TStringList;
// Tipos, rutinas, variables y constantes públicas de una unit de Merge (para saber si se usa algo de ella)
var
  Iface: string;
  M: TMatch;
begin
  if FIdentUnit.TryGetValue(LowerCase(AUnit), Result) then
    Exit;
  Result := TStringList.Create;
  Result.Sorted := True;
  Result.Duplicates := dupIgnore;
  Result.CaseSensitive := False;
  FIdentUnit.Add(LowerCase(AUnit), Result);
  if RutaMerge(AUnit) = '' then
    Exit;
  Iface := QuitaComentarios(TRegEx.Split(LeeTexto(RutaMerge(AUnit)), '\bimplementation\b', [roIgnoreCase])[0]);
  for M in TRegEx.Matches(Iface, '^\s*(?:function|procedure)\s+(\w+)', [roIgnoreCase, roMultiLine]) do
    Result.Add(M.Groups[1].Value);
  for M in TRegEx.Matches(Iface, '^\s*(\w+)\s*=', [roMultiLine]) do
    Result.Add(M.Groups[1].Value);
  for M in TRegEx.Matches(Iface, '^\s*(\w+)\s*:\s*[\w.]+\s*;', [roMultiLine]) do
    Result.Add(M.Groups[1].Value);
  if Result.IndexOf('end') >= 0 then
    Result.Delete(Result.IndexOf('end'));
end;

function TImportador.QuitaUnitsNoUsadas(const Src: string): string;
// Quita de los uses las units de Merge que no están en Merge13 y de las que el fichero no usa nada
var
  Palabras: TStringList;
  M: TMatch;
begin
  Palabras := TStringList.Create;
  try
    Palabras.Sorted := True;
    Palabras.Duplicates := dupIgnore;
    Palabras.CaseSensitive := False;
    for M in TRegEx.Matches(TRegEx.Replace(QuitaComentarios(Src), '\buses\b(?:[^;{]|\{[^}]*\})*;', ' ', [roIgnoreCase]), '\b\w+\b') do
      Palabras.Add(M.Value);
    Result := ReescribeUses(Src,
      function(U: string): string
      var
        Ids: TStringList;
      begin
        Result := U;
        if (RutaMerge(U) = '') or ExisteEnProyecto(U) then
          Exit;
        Ids := IdentificadoresInterfaz(U);
        for var Id in Ids do
          if Palabras.IndexOf(Id) >= 0 then
            Exit;
        Auto('uses ' + U + ' eliminada (no se usa nada de ella)');
        Result := '';
      end);
  finally
    Palabras.Free;
  end;
end;

function TImportador.CompletaUsesInterfaz(const Src: string): string;
// Añade al uses de la interfaz las units que declaran los tipos usados en ella
var
  Corte: TMatch;
  Iface, U: string;
  Faltan: TStringList;
  M: TMatch;
begin
  Result := Src;
  Corte := TRegEx.Match(Src, '\bimplementation\b', [roIgnoreCase]);
  if not Corte.Success then
    Exit;
  Iface := QuitaComentarios(Copy(Src, 1, Corte.Index - 1));
  Faltan := TStringList.Create;
  try
    Faltan.Duplicates := dupIgnore;
    Faltan.Sorted := False;
    for M in TRegEx.Matches(Iface, '\bT\w+\b') do
    begin
      U := FReglas.UnitDeTipo(M.Value);
      if (U <> '') and (Faltan.IndexOf(U) < 0) then
        Faltan.Add(U);
    end;
    if Faltan.IndexOf('FireDAC.Comp.Client') >= 0 then
      for U in USES_DM do
        if StartsText('FireDAC', U) and (Faltan.IndexOf(U) < 0) then
          Faltan.Add(U);
    if TRegEx.IsMatch(Iface, '\b(' + String.Join('|', FTiposPendientes.ToStringArray) + ')\b', [roIgnoreCase]) and
      (FTiposPendientes.Count > 0) then
      Faltan.Add('UTiposPendientesMerge');
    Result := AnyadeUses(Src, 'interface', Faltan.ToStringArray);
  finally
    Faltan.Free;
  end;
end;

function TImportador.ConversionesComunes(const Src, Nombre: string): string;
const
  TIPOS: array[0..12] of array[0..1] of string = (('THYDatabase', 'TFDConnection'), ('TFIBDatabase', 'TFDConnection'),('TFIBTableSet', 'TFDQuery'), ('TFIBDataSet', 'TFDQuery'),
    ('TFIBDataSetRO', 'TFDQuery'), ('TFIBTableSetRO', 'TFDQuery'), ('TFIBDataSetRW', 'TFDQuery'),
    ('TFIBInfoSet', 'TFDQuery'), ('THYFIBQuery', 'TFDQuery'), ('TFIBQuery', 'TFDQuery'),
    ('THYTransaction', 'TFDTransaction'), ('TFIBTransaction', 'TFDTransaction'), ('TFIBStringField', 'TStringField'));
var
  S, Eq, Orig, Dest: string;
  i: Integer;
  Par: TPair<string, string>;
begin
  S := Src;
  // tipos de datos FIB -> FireDAC y componentes de Merge -> VCL
  for i := 0 to High(TIPOS) do
    S := EnCodigo(S, '\b' + TIPOS[i][0] + '\b', TIPOS[i][1]);
  for Par in FReglas.Mapa do
    S := EnCodigo(S, '\b' + Par.Key + '\b', Par.Value);
  // acceso a datos FreeIB -> FireDAC
  S := SinComentarios(S, '\.Params\.ByName\s*\[([^\]\[;]+)\]', '.ParamByName($1)');
  S := SinComentarios(S, '(?<![\w.])Params\.ByName\s*\[([^\]\[;]+)\]', 'ParamByName($1)');
  S := SinComentarios(S, '\bFieldByName\s*\[([^\]\[;]+)\]', 'FieldByName($1)');
  S := EnCodigo(S, '\.Params\.ByName\s*\(', '.ParamByName(');
  S := EnCodigo(S, '(?<![\w.])Params\.ByName\s*\(', 'ParamByName(');
  S := EnCodigo(S, '\bDataBase\s*:=', 'Connection :=');
  S := EnCodigo(S, '\.SelectSQL\b', '.SQL');
  S := EnCodigo(S, '(?<![\w.])SelectSQL\b', 'SQL');
  S := EnCodigo(S, '\.AsDouble\b', '.AsFloat');
  S := EnCodigo(S, '\.AsLong\b', '.AsInteger');
  S := EnCodigo(S, '(?<![\w.])(DecimalSeparator|ThousandSeparator|ShortDateFormat|LongDateFormat|DateSeparator|' +
    'TimeSeparator|CurrencyString|ShortTimeFormat|LongTimeFormat)\b', 'FormatSettings.$1');
  S := EnCodigo(S, 'FormatSettings\.FormatSettings\.', 'FormatSettings.');
  S := EnCodigo(S, '(?<![\w.])(SysUtils|Classes|Windows|Forms|Dialogs|Math|StrUtils|DateUtils|Variants|Graphics|Controls)\.(?=[A-Za-z_])',
    function(M: TMatch): string
    begin
      Result := FReglas.UnitCorta(M.Groups[1].Value) + '.';
    end);
  S := EnCodigo(S, '(?<![\w.])ComObj\.(?=[A-Za-z_])', 'System.Win.ComObj.');
  // parámetros ?X de FIB dentro de SQL escrita en código
  S := EnLiterales(S,
    function(T: string): string
    begin
      Result := T;
      if TRegEx.IsMatch(T, '\b(SELECT|INSERT|UPDATE|DELETE|WHERE|FROM|SET|AND|OR|VALUES|EXECUTE|LIKE|IN)\b|(^|[\s=<>(,!])\?[A-Za-z_]', [roIgnoreCase]) then
        Result := ParamsFib(T);
    end);
  // propiedades FreeIB sin equivalente
  S := TRegEx.Replace(S, '^([ \t]*)((?:[\w.]+\.)?(?:AutoTrans|BufferChunks|UsaNulls|ParamCheck|GoToFirstRecordOnExecute)\s*:=[^;\n]*;)',
    '$1// $2  // FreeIB: sin equivalente en FireDAC', [roIgnoreCase, roMultiLine]);
  // SQL de actualización FIB asignada en código: FireDAC la genera
  S := TRegEx.Replace(S, '^([ \t]*)((?:[\w.]+\.)?(?:InsertSQL|UpdateSQL|DeleteSQL|RefreshSQL)\.(?:Text\s*:=|Add\s*\(|Clear\b)[^;\n]*;)',
    '$1// $2  // FireDAC genera esta SQL (UpdateOptions)', [roIgnoreCase, roMultiLine]);
  S := EnCodigo(S, '(?<![\w])((?![\w.]*(?:DataBase|Connection|DB)\b)[\w.]*Transaction\w*|TLocal\w*|TUpdate\w*)\.InTransaction\b', '$1.Active');
  // Delphi 6 admitía un parámetro vacío al final: F(a, )
  S := EnCodigo(S, ',\s*\)', ')');
  // equivalencias configurables (Importador\equivalencias.txt)
  S := EnCodigo(S, '\bREntorno\.', 'Entorno.');
  for Eq in FEquivalencias do
  begin
    Orig := FEquivalencias.Names[FEquivalencias.IndexOf(Eq)];
    Dest := FEquivalencias.ValueFromIndex[FEquivalencias.IndexOf(Eq)];
    S := EnCodigo(S, '(?<![\w])' + TRegEx.Escape(Orig) + '(?!\w)', Dest);
  end;
  // funciones de Merge que en Merge13 están en UAuxMerge
  S := SinComentarios(S, '\bDMMain\.(TituloEstado|TituloSituacionProduccion)\s*\[([^\]\[]+)\]', '$1($2)');
  S := EnCodigo(S, '\bDMMain\.(TituloEstado|TituloSituacionProduccion|TituloUnidadMedida|TituloPeriodoFacturacion|' +
    'FiltraRO|FiltraSQL|MinTercero|AbrirArchivo|DameDirectorioComunicaciones|DameDirectorioCodCliPro)\b', '$1');
  S := EnCodigo(S, '\bEntorno\.(Empresa|Ejercicio|Canal|Entrada)Str\b', 'IntToStr(Entorno.$1)');
  S := SinComentarios(S, '\b([\w.]+)\.Ordenar\s*\(', 'Ordenar($1, ');
  S := EnCodigo(S, '\b([\w.]+)\.OrdenadoPor\b', 'OrdenadoPor($1)');
  S := SinComentarios(S, '\b([\w.]+)\.DameFiltroSelect\s*\(', 'DameFiltroSelect($1, ');
  // ExecQuery / FreeHandle / HayDatos y transacción de escritura
  S := ExecQueryNativo(S, Nombre);
  S := TransaccionEscritura(S);
  // navegador HY: control que recibe el foco al editar/insertar
  S := EnCodigo(S, '\b\w+\.(?:EditaControl|InsertaControl)\s*:=\s*([\w.]+)', 'EnfocaControl($1)');
  // base G2K de Merge sin equivalente
  S := TRegEx.Replace(S, '^([ \t]*)([^/\n]*(?<![\w.])(?:Campo|ControlEdit)\s*:=[^\n]*;)', '$1// $2  // [G2K]', [roIgnoreCase, roMultiLine]);
  S := TRegEx.Replace(S, '^([ \t]*)([^/\n]*\.(?:Insercion|UsaDicG2K|AutoCambiarColumna|AutoPostEnCheckBox|AutoStartDrag|' +
    'CampoNum|CampoStr|Campos_Desplegar)\s*:=[^\n]*;)', '$1// $2  // [propiedad de EditFind/GridFind]', [roIgnoreCase, roMultiLine]);
  S := ReglasUses(S, Nombre);
  S := QuitaUnitsNoUsadas(S);
  // quien traduce (TranslateComponent / _()) necesita gnugettext en la interfaz
  if TRegEx.IsMatch(QuitaComentarios(S), '\bTranslateComponent\s*\(|(?<![\w.])_\s*\(', [roIgnoreCase]) and
    not TRegEx.IsMatch(QuitaComentarios(S), '\buses\b[^;]*\bgnugettext\b', [roIgnoreCase]) then
    S := AnyadeUses(S, 'interface', ['gnugettext']);
  S := ReglasUses(S, Nombre);   // vuelve a escribir los uses con el formato de gnugettext
  // las rutinas de UUtiles de Merge que Merge13 no tiene están en UUtilesMerge
  if not SameText(Nombre, 'UUtilesMerge.pas') and TRegEx.IsMatch(QuitaComentarios(S), '\buses\b[^;]*\bUUtiles\b', [roIgnoreCase]) then
    S := AnyadeUses(S, IfThen(TRegEx.IsMatch(QuitaComentarios(TRegEx.Split(S, '\bimplementation\b', [roIgnoreCase])[0]),
      '\buses\b[^;]*\bUUtiles\b', [roIgnoreCase]), 'interface', 'implementation'), ['UUtilesMerge']);
  Result := S;
end;

function TImportador.ConviertePasUnit(const Src, Nombre: string): string;
begin
  Result := ConversionesComunes(Src, Nombre);
  Result := AnyadeUses(Result, 'implementation', ['Data.DB', 'FireDAC.Stan.Intf', 'FireDAC.Stan.Param',
    'FireDAC.Comp.Client', 'FireDAC.DApt', 'UAuxMerge']);
  Result := CompletaUsesInterfaz(Result);
  Result := MarcaIdioma(QuitaDuplicadosUses(Result));
end;

function TImportador.ConviertePasDM(const Src, Nombre: string; Nuevo: TDfmNodo): string;
var
  S, Decl, Bloque: string;
  M: TMatch;
begin
  S := ConversionesComunes(Src, Nombre);
  // tipos de los campos persistentes según el DFM nuevo
  Nuevo.Recorre(
    procedure(N: TDfmNodo)
    begin
      if EndsText('Field', N.Clase) then
        S := TRegEx.Replace(S, '(\b' + N.Nombre + '\s*:\s*)T\w*Field\b', '${1}' + N.Clase);
    end);
  // TFDUpdateSQL generados
  Decl := '';
  for var U in FUpdates do
    Decl := Decl + '    ' + U + ': TFDUpdateSQL;' + #13#10;
  S := TRegEx.Replace(S, '(class\(TDataModule\)\s*\r?\n)', '$1' + Decl, [roIgnoreCase]);
  // control de concurrencia (antes BloqOpt / UPDATE ficticio de TFIBTableSet)
  if FBloqueos.Count > 0 then
  begin
    Bloque := #13#10 + '  // Control de concurrencia (antes BloqOpt/UPDATE ficticio de TFIBTableSet)' + #13#10 + FBloqueos.Text;
    M := TRegEx.Match(S, 'procedure\s+T\w+\.\w*Create\s*\(\s*Sender\s*:\s*TObject\s*\)\s*;.*?\bbegin\b', [roIgnoreCase, roSingleLine]);
    if M.Success then
      S := Copy(S, 1, M.Index + M.Length - 1) + Bloque + Copy(S, M.Index + M.Length, MaxInt);
    S := AnyadeUses(S, 'implementation', ['UControlConcurrencia']);
  end;
  S := AnyadeUses(S, 'interface', TArray<string>.Create('System.SysUtils', 'System.Classes', 'System.Variants', 'Data.DB',
    'Vcl.Forms', 'Vcl.Controls', 'Vcl.Dialogs', 'Winapi.Windows', 'FireDAC.Stan.Intf', 'FireDAC.Stan.Option',
    'FireDAC.Stan.Param', 'FireDAC.Stan.Error', 'FireDAC.DatS', 'FireDAC.Phys.Intf', 'FireDAC.DApt.Intf', 'FireDAC.DApt',
    'FireDAC.Comp.Client'));
  S := AnyadeUses(S, 'implementation', ['UAuxMerge']);
  S := CompletaUsesInterfaz(S);
  Result := MarcaIdioma(QuitaDuplicadosUses(S));
end;

function TImportador.InsertaEnFormCreate(const Src, Clase: string; Lineas: TStringList; out Creado: Boolean): string;
// Inserta la inicialización al principio de FormCreate (detrás de AbreData si lo crea ahí). Si no hay FormCreate, lo crea.
var
  M, Ab, FinM: TMatch;
  Bloque, Resto, Cuerpo: string;
  Corte: Integer;
begin
  Creado := False;
  Result := Src;
  if Lineas.Count = 0 then
    Exit;
  Bloque := '  // --- importador: inicialización de componentes sustituidos ---' + #13#10;
  for var L in Lineas do
    Bloque := Bloque + '  ' + Trim(L) + #13#10;
  M := TRegEx.Match(Src, 'procedure\s+' + Clase + '\.FormCreate\s*\(\s*Sender\s*:\s*TObject\s*\)\s*;.*?\bbegin\b', [roIgnoreCase, roSingleLine]);
  if M.Success then
  begin
    Corte := M.Index + M.Length;
    Resto := Copy(Src, Corte, MaxInt);
    FinM := TRegEx.Match(Resto, '\n\s*end\s*;');
    Cuerpo := IfThen(FinM.Success, Copy(Resto, 1, FinM.Index), Resto);
    Ab := TRegEx.Match(Cuerpo, '\bAbreData(?:Varias)?\s*\([^;]*\)\s*;[^\n]*\n(?![\s\S]*\bAbreData(?:Varias)?\s*\()', [roIgnoreCase]);
    if Ab.Success then
      Corte := Corte + Ab.Index + Ab.Length - 1
    else
    begin
      Ab := TRegEx.Match(Resto, '^\s*inherited\s*;', [roIgnoreCase]);
      if Ab.Success then
        Corte := Corte + Ab.Index + Ab.Length - 1;
      Bloque := #13#10 + Bloque;
    end;
    Result := Copy(Src, 1, Corte - 1) + Bloque + Copy(Src, Corte, MaxInt);
    Exit;
  end;
  Creado := True;
  Result := TRegEx.Replace(Src, '(\{\$R \*\.(?:dfm|DFM)\})', '$1' + #13#10#13#10 + 'procedure ' + Clase +
    '.FormCreate(Sender: TObject);' + #13#10 + 'begin' + #13#10 + '  inherited;' + #13#10 + Bloque + 'end;' + #13#10, [roIgnoreCase]);
  Result := TRegEx.Replace(Result, '(' + Clase + '\s*=\s*class\([^)]*\)\s*\r?\n)', '$1    procedure FormCreate(Sender: TObject);' + #13#10);
end;

function TImportador.RegistroDe(const FormCls, FormVar: string): string;
// En Merge, qué acción de FMain abría el formulario y con qué método se le pasaba el filtro
var
  Src: string;
  M, F: TMatch;
begin
  Result := '';
  Src := LeeTexto(RutaMerge('UFMain'));
  M := TRegEx.Match(Src, 'procedure TFMain\.(\w+)Execute\(Sender: TObject\);(?:(?!\nend;).)*?AbreForm\(\s*' + FormCls +
    '\s*,\s*' + FormVar + '\b(.*?)\nend;', [roIgnoreCase, roSingleLine]);
  if not M.Success then
    Exit;
  F := TRegEx.Match(M.Groups[2].Value, FormVar + '\.(\w+)\(\s*FiltroAccion\s*\)', [roIgnoreCase]);
  Result := Format('RegistraModulo(''%s'', %s, @%s%s);', [M.Groups[1].Value, FormCls, FormVar,
    IfThen(Grupo(F, 1) <> '', ', ''' + Grupo(F, 1) + '''', '')]);
end;

function TImportador.ConviertePasForm(const Src, Nombre, Clase: string; Eliminados: TStringList; const Registro: string): string;
var
  S, Elim, Decl, L, Campos: string;
  Ini: TStringList;
  B: TBuscador;
  Creado: Boolean;
  M: TMatch;
  Lin: TStringList;
  i: Integer;
begin
  S := ConversionesComunes(Src, Nombre);
  // componentes eliminados: fuera sus campos; las sentencias que los usan se comentan
  for var C in Eliminados do
    S := TRegEx.Replace(S, '^\s*' + C + '\s*:\s*\w+\s*;[^\n]*\n', '', [roIgnoreCase, roMultiLine]);
  Elim := String.Join('|', Eliminados.ToStringArray);
  Elim := IfThen(Elim <> '', Elim + '|', '') + 'CEMain|EPMain|G2KTableLoc|FSMain|CEMainPMEdit';
  S := TRegEx.Replace(S, '^([ \t]*)([^/\n]*\b(' + Elim + ')\b[^\n]*;[ \t]*)(\r?)$', '$1// [G2K eliminado] $2$4',
    [roIgnoreCase, roMultiLine]);
  // asignar campos solo en edición (TDBEdit.OnChange salta también al navegar)
  Lin := TStringList.Create;
  try
    Lin.Text := S;
    for i := 0 to Lin.Count - 1 do
    begin
      M := TRegEx.Match(Lin[i], '^(\s*)(\w+)\.Field\.(Value|As\w+)\s*:=\s*(.*;)\s*$');
      if M.Success and ((i = Lin.Count - 1) or not TRegEx.IsMatch(Lin[i + 1], '^\s*else\b', [roIgnoreCase])) then
        Lin[i] := Format('%sif %s.Field.DataSet.State in dsEditModes then %s.Field.%s := %s',
          [M.Groups[1].Value, M.Groups[2].Value, M.Groups[2].Value, M.Groups[3].Value, M.Groups[4].Value]);
    end;
    S := Lin.Text;
  finally
    Lin.Free;
  end;
  // EditFind: propiedades y métodos -> TBuscadorCampo
  for B in FBuscadores do
  begin
    S := EnCodigo(S, '\b' + B.Control + '\.(SetBufferText|ClearBufferText|Accion|CondicionBusqueda|SalirSiNoExiste|AutoCambiarFoco)\b',
      'B' + B.Control + '.$1');
    S := EnCodigo(S, '\b' + B.Control + '\.Tabla_a_buscar\b', 'B' + B.Control + '.Tabla');
    S := EnCodigo(S, '\b' + B.Control + '\.CampoADevolver\b', 'B' + B.Control + '.CampoDevolver');
  end;
  for var C in FCombosValue do
    S := EnCodigo(S, '\b' + C + '\.Value\b', C + '.Text');
  // declaraciones nuevas
  Decl := '';
  for i := 0 to FNuevosCampos.Count - 1 do
    if not TRegEx.IsMatch(S, '^\s*' + FNuevosCampos.Names[i] + '\s*:', [roMultiLine, roIgnoreCase]) then
      Decl := Decl + '    ' + FNuevosCampos.Names[i] + ': ' + FNuevosCampos.ValueFromIndex[i] + ';' + #13#10;
  S := TRegEx.Replace(S, '(' + Clase + '\s*=\s*class\([^)]*\)\s*\r?\n)', '$1' + Decl, [roIgnoreCase]);
  // los métodos puente van al final de la sección publicada (en Delphi los campos van antes que los métodos)
  if FPuentesDecl.Count > 0 then
  begin
    M := TRegEx.Match(S, Clase + '\s*=\s*class\(.*?\n([ \t]*(?:private|protected|public)\b|[ \t]*end\s*;)', [roIgnoreCase, roSingleLine]);
    if M.Success then
      S := Copy(S, 1, M.Groups[1].Index - 1) + FPuentesDecl.Text + Copy(S, M.Groups[1].Index, MaxInt);
  end;
  Decl := '';
  for B in FBuscadores do
    Decl := Decl + '    B' + B.Control + ': TBuscadorCampo;' + #13#10;
  if Decl <> '' then
  begin
    M := TRegEx.Match(S, Clase + '\s*=\s*class\(.*?\n(\s*private\b[^\r\n]*\r?\n)', [roIgnoreCase, roSingleLine]);
    if M.Success then
      S := Copy(S, 1, M.Groups[1].Index + M.Groups[1].Length - 1) + Decl + Copy(S, M.Groups[1].Index + M.Groups[1].Length, MaxInt)
    else
    begin
      M := TRegEx.Match(S, Clase + '\s*=\s*class\(.*?\r?\n(\s*(?:public|protected)\b|\s*end\s*;)', [roIgnoreCase, roSingleLine]);
      if M.Success then
        S := Copy(S, 1, M.Groups[1].Index - 1) + #13#10 + '  private' + #13#10 + Decl + Copy(S, M.Groups[1].Index, MaxInt);
    end;
  end;
  // inicialización en FormCreate: buscadores y eventos que antes tenía el componente
  Ini := TStringList.Create;
  try
    for B in FBuscadores do
    begin
      Campos := '';
      for var C in B.Campos do
        if C <> '' then
          Campos := Campos + IfThen(Campos <> '', ', ') + '''' + C + '''';
      if B.EsDB then
        Ini.Add(Format('B%s := TBuscadorCampo.Crea(Self, %s, ''%s'', ''%s'', ''%s'', [%s], ''%s'');',
          [B.Control, B.Control, B.Tabla, B.Campo, IfThen(B.Devolver <> '', B.Devolver, B.Campo), Campos, B.Filtro]))
      else
        Ini.Add(Format('B%s := TBuscadorCampo.CreaLibre(Self, %s, ''%s'', ''%s'', [%s], ''%s'');',
          [B.Control, B.Control, B.Tabla, B.Devolver, Campos, B.Filtro]));
      for i := 0 to B.Props.Count - 1 do
        Ini.Add(Format('B%s.%s := %s;', [B.Control, B.Props.Names[i], B.Props.ValueFromIndex[i]]));
      for i := 0 to B.Eventos.Count - 1 do
        if FFirmas.ContainsKey(LowerCase(B.Eventos.ValueFromIndex[i])) and
          MismaFirma(FFirmas[LowerCase(B.Eventos.ValueFromIndex[i])], NormalizaFirma('(Sender: TObject)')) then
          Ini.Add(Format('B%s.%s := %s;', [B.Control, B.Eventos.Names[i], B.Eventos.ValueFromIndex[i]]));
    end;
    Ini.AddStrings(FAsignaciones);
    S := InsertaEnFormCreate(S, Clase, Ini, Creado);
    if Creado then
      Auto(Nombre + ': creado FormCreate para inicializar los componentes sustituidos');
  finally
    Ini.Free;
  end;
  // métodos puente
  if FPuentesImpl.Count > 0 then
    S := TRegEx.Replace(S, '(\{\$R \*\.(?:dfm|DFM)\})', '$1' + #13#10#13#10 +
      StringReplace(FPuentesImpl.Text, '%CLASE%', Clase, [rfReplaceAll]), [roIgnoreCase]);
  // registro del módulo en el menú (idempotente)
  S := TRegEx.Replace(S, '\r?\n?\s*// merge2m13-registro.*?// merge2m13-fin\r?\n', #13#10, [roSingleLine]);
  if Registro <> '' then
  begin
    L := '  // merge2m13-registro (la acción de FMain abre este módulo)' + #13#10 + '  ' + Registro + #13#10 +
      '  // merge2m13-fin' + #13#10;
    if TRegEx.IsMatch(S, '^initialization\b', [roMultiLine, roIgnoreCase]) then
      S := TRegEx.Replace(S, '(^initialization\b[^\n]*\n)', '$1' + L, [roMultiLine, roIgnoreCase])
    else
      S := TRegEx.Replace(TrimRight(S), '\bend\.\s*$', 'initialization' + #13#10 + L + #13#10 + 'end.' + #13#10);
    S := AnyadeUses(S, 'implementation', ['UModulos']);
  end;
  S := AnyadeUses(S, 'interface', ['UBuscadorCampo', 'UAuxMerge']);
  S := AnyadeUses(S, 'implementation', ['UFormGest']);
  S := CompletaUsesInterfaz(S);
  Result := MarcaIdioma(QuitaDuplicadosUses(S));
end;

{ ------------------------------------------------------------------------------------------------ dependencias }

const
  TIPOS_PENDIENTES_RE = '\b(Tfr(?!x)[A-Z]\w*|TfrxHY\w*|THYReport\w*|TControlEdit|TPopUpTeclas|THYMEditPanel|TG2KTBLoc|' +
    'TLFFibFormStorage|TFormStorage|TFormPlacement|TEntornoFind2000|TTeclas|TLFManager|TCodeBar|TYearPlanner|TIOFFind|' +
    'TLetra|TGantt|TRxClock|TCVBNorma\w*|TConfirming|THYPrinterOptions|TRxMemoryData|THYIBBackup|TFRTallas_\w+)\b';
  TIPOS_TEECHART_RE = '\b(TDBChart|TChart|T\w+Series)\b';
  DIRECTIVAS_RE = '(?:\s*(?:virtual|override|dynamic|abstract|reintroduce|overload|static|inline|message\s+\w+|stdcall|' +
    'cdecl|register|safecall|final)\s*;)*';

function QuitaSobrecargasDuplicadas(const Texto: string): string;
// Al pasar tipos distintos de Merge al mismo tipo de Delphi 13 (TFIBDataSetRO y TFIBTableSet -> TFDQuery)
// dos sobrecargas quedan iguales: se deja la primera (declaración y cuerpo)
var
  Corte: TMatch;
  Iface, Impl, Clave, Linea: string;
  Vistos: TStringList;
  L: TStringList;
  Bloques: TMatchCollection;
  S: TStringBuilder;
  i, Ini, Fin: Integer;
  function Norm(const H: string): string;
  begin
    Result := LowerCase(TRegEx.Replace(TRegEx.Replace(H, DIRECTIVAS_RE, '', [roIgnoreCase]), '\s+', ''));
  end;
begin
  Result := Texto;
  Corte := TRegEx.Match(Texto, '\bimplementation\b', [roIgnoreCase]);
  if not Corte.Success then
    Exit;
  Iface := Copy(Texto, 1, Corte.Index - 1);
  Impl := Copy(Texto, Corte.Index, MaxInt);
  Vistos := TStringList.Create;
  L := TStringList.Create;
  S := TStringBuilder.Create;
  try
    L.Text := Iface;
    for i := L.Count - 1 downto 0 do
    begin
      Linea := L[i];
      if TRegEx.IsMatch(Linea, '^(procedure|function)\s+\w+.*;', [roIgnoreCase]) then
      begin
        Clave := Norm(Linea);
        if Vistos.IndexOf(Clave) >= 0 then
          Continue;
      end;
    end;
    Vistos.Clear;
    for i := 0 to L.Count - 1 do
      if TRegEx.IsMatch(L[i], '^(procedure|function)\s+\w+.*;', [roIgnoreCase]) then
      begin
        Clave := Norm(L[i]);
        if Vistos.IndexOf(Clave) >= 0 then
          L[i] := '// (sobrecarga duplicada al convertir tipos) ' + L[i]
        else
          Vistos.Add(Clave);
      end;
    Iface := L.Text;
    // implementación: bloques de rutinas sueltas en columna 0
    Vistos.Clear;
    Bloques := TRegEx.Matches(Impl, '^(?:procedure|function)\s+\w+\s*(?:\([^)]*\))?\s*(?::\s*[\w.<>]+)?\s*;', [roIgnoreCase, roMultiLine]);
    Ini := 1;
    for i := 0 to Bloques.Count - 1 do
    begin
      if i < Bloques.Count - 1 then
        Fin := Bloques[i + 1].Index
      else
      begin
        Fin := Length(Impl) + 1;
        var FE := TRegEx.Match(Copy(Impl, Bloques[i].Index, MaxInt), '^(?:initialization|finalization)\b|^end\.', [roIgnoreCase, roMultiLine]);
        if FE.Success then
          Fin := Bloques[i].Index + FE.Index - 1;
      end;
      S.Append(Copy(Impl, Ini, Bloques[i].Index - Ini));
      Clave := Norm(Bloques[i].Value);
      if Vistos.IndexOf(Clave) < 0 then
      begin
        Vistos.Add(Clave);
        S.Append(Copy(Impl, Bloques[i].Index, Fin - Bloques[i].Index));
      end;
      Ini := Fin;
    end;
    S.Append(Copy(Impl, Ini, MaxInt));
    Result := Iface + S.ToString;
  finally
    Vistos.Free;
    L.Free;
    S.Free;
  end;
end;

function Cuerpo(const Cabecera, Clase: string): string;
var
  Cab, Tipo, Resto: string;
  M, R: TMatch;
begin
  Cab := Trim(TRegEx.Replace(Cabecera, DIRECTIVAS_RE, '', [roIgnoreCase]));
  Cab := TRegEx.Replace(Cab, '\s*;\s*$', '') + ';';
  M := TRegEx.Match(Cab, '^(class\s+)?(procedure|function|constructor|destructor)\s+(\w+)(.*)$', [roIgnoreCase, roSingleLine]);
  if not M.Success then
    Exit('');
  Tipo := LowerCase(Grupo(M, 2));
  Resto := Grupo(M, 4);
  Result := Grupo(M, 1) + Grupo(M, 2) + ' ' +
    IfThen(Clase <> '', Clase + '.') + Grupo(M, 3) + Resto + #13#10 + 'begin' + #13#10;
  if Tipo = 'function' then
  begin
    R := TRegEx.Match(Resto, ':\s*([\w.<>]+)\s*;\s*$');
    if R.Success then
      Result := Result + '  Result := Default(' + R.Groups[1].Value + ');' + #13#10;
  end
  else if (Tipo = 'destructor') or ((Tipo = 'constructor') and ContainsText(Resto, 'AOwner')) then
    Result := Result + '  inherited;' + #13#10
  else
    Result := Result + '  // PENDIENTE de importar' + #13#10;
  Result := Result + 'end;' + #13#10#13#10;
end;

function TImportador.GeneraStub(const Src, Nombre: string): string;
// Interfaz real de Merge convertida y cuerpos vacíos: compila hasta que se importe esa unit
var
  S, Iface, Limpio, SinClases: string;
  Impl: TStringBuilder;
  M, MM: TMatch;
  Tipos: string;
begin
  S := ConversionesComunes(Src, Nombre);
  Iface := TRegEx.Split(S, '\bimplementation\b', [roIgnoreCase])[0];
  for var A in ['TG2KForm', 'THYForm', 'TFormG2K', 'TLFForm'] do
    Iface := TRegEx.Replace(Iface, 'class\s*\(\s*' + A + '\s*\)', 'class(TForm)', [roIgnoreCase]);
  // tipos de Merge sin equivalente todavía: se declaran vacíos en UTiposPendientesMerge
  Tipos := TIPOS_PENDIENTES_RE;
  for M in TRegEx.Matches(Iface, Tipos, [roIgnoreCase]) do
    FTiposPendientes.Add(M.Value);
  if FSinTeeChart then
    for M in TRegEx.Matches(Iface, TIPOS_TEECHART_RE) do
      FTiposPendientes.Add(M.Value);
  Limpio := QuitaComentarios(Iface);
  Impl := TStringBuilder.Create;
  try
    Impl.Append('implementation' + #13#10#13#10 + '// ==== PENDIENTE: interfaz real de Merge; el código se importará más adelante ====' + #13#10#13#10);
    // métodos de las clases
    for M in TRegEx.Matches(Limpio, '\b(T\w+)\s*=\s*class\b(?!\s*(?:of|;))(.*?)\n\s*end(?:\s+\w+)?\s*;', [roIgnoreCase, roSingleLine]) do
      for MM in TRegEx.Matches(M.Groups[2].Value, '^\s*((?:class\s+)?(?:procedure|function|constructor|destructor)\s+\w+\s*' +
        '(?:\([^)]*\))?\s*(?::\s*[\w.<>]+)?\s*;' + DIRECTIVAS_RE + ')', [roIgnoreCase, roMultiLine]) do
        if not TRegEx.IsMatch(MM.Groups[1].Value, '\babstract\s*;', [roIgnoreCase]) then
          Impl.Append(Cuerpo(MM.Groups[1].Value, M.Groups[1].Value));
    // rutinas sueltas
    SinClases := TRegEx.Replace(Limpio, '\b(T\w+)\s*=\s*class\b(?!\s*(?:of|;)).*?\n\s*end(?:\s+\w+)?\s*;', '', [roIgnoreCase, roSingleLine]);
    SinClases := TRegEx.Replace(SinClases, '\b\w+\s*=\s*(?:procedure|function)\b[^;]*(?:\([^)]*\))?[^;]*;(\s*of\s+object\s*;)?', '', [roIgnoreCase]);
    for MM in TRegEx.Matches(SinClases, '^\s*((?:procedure|function)\s+\w+\s*(?:\([^)]*\))?\s*(?::\s*[\w.<>]+)?\s*;' +
      DIRECTIVAS_RE + ')', [roIgnoreCase, roMultiLine]) do
      Impl.Append(Cuerpo(MM.Groups[1].Value, ''));
    Impl.Append('end.' + #13#10);
    S := TrimRight(Iface) + #13#10#13#10 + Impl.ToString;
  finally
    Impl.Free;
  end;
  if FTiposPendientes.Count > 0 then
    S := AnyadeUses(S, 'interface', ['UTiposPendientesMerge']);
  S := CompletaUsesInterfaz(S);
  Result := MarcaIdioma(QuitaSobrecargasDuplicadas(S));
end;

procedure TImportador.GeneraTiposPendientes;
var
  L: TStringList;
  T: string;
begin
  if FTiposPendientes.Count = 0 then
    Exit;
  L := TStringList.Create;
  try
    L.Add('unit UTiposPendientesMerge;');
    L.Add('');
    L.Add('// Tipos de Merge sin equivalente todavía en Delphi 13 (FastReport 2, componentes propios...).');
    L.Add('// Son clases vacías para que el código importado compile; cada una se sustituirá por su equivalente real.');
    L.Add('');
    L.Add('interface');
    L.Add('');
    L.Add('uses System.Classes;');
    L.Add('');
    L.Add('type');
    for T in FTiposPendientes do
      if MatchText(T, ['TfrView', 'TfrObject', 'TfrMemoView', 'TfrBandView', 'TfrPictureView', 'TfrPage', 'TfrBand']) then
        L.Add('  ' + T + ' = class(TObject) end;  // PENDIENTE')
      else
        L.Add('  ' + T + ' = class(TComponent) end;  // PENDIENTE');
    L.Add('');
    L.Add('implementation');
    L.Add('');
    L.Add('end.');
    GuardaTexto(TPath.Combine(FProyecto, 'Pendientes\UTiposPendientesMerge.pas'), L.Text);
  finally
    L.Free;
  end;
end;

procedure TImportador.GeneraUUtilesMerge;
// Rutinas de UUtiles de Merge que Merge13 no tiene y que usa lo importado (con su código real y dependencias)
var
  SrcMerge, IfaceMerge, ImplMerge, F, Texto, Nombre, Cab: string;
  EnM13, Usadas, Palabras, Pend: TStringList;
  Decl, Bloques: TDictionary<string, TList<string>>;
  M: TMatch;
  Partes: TArray<string>;
  Pos_: TList<Integer>;
  i, FinB: Integer;
  Iface, Impl: TStringBuilder;
  UsesIface, UsesImpl: string;
  Orden: TStringList;
begin
  F := RutaMerge('UUtiles');
  if F = '' then
    Exit;
  SrcMerge := LeeTexto(F);
  Partes := TRegEx.Split(SrcMerge, '\bimplementation\b', [roIgnoreCase]);
  IfaceMerge := Partes[0];
  ImplMerge := Copy(SrcMerge, Length(IfaceMerge) + 1 + Length('implementation'), MaxInt);
  EnM13 := TStringList.Create;
  EnM13.Sorted := True;
  EnM13.Duplicates := dupIgnore;
  Usadas := TStringList.Create;
  Palabras := TStringList.Create;
  Palabras.Sorted := True;
  Palabras.Duplicates := dupIgnore;
  Pend := TStringList.Create;
  Orden := TStringList.Create;
  Decl := TObjectDictionary<string, TList<string>>.Create([doOwnsValues]);
  Bloques := TObjectDictionary<string, TList<string>>.Create([doOwnsValues]);
  Pos_ := TList<Integer>.Create;
  Iface := TStringBuilder.Create;
  Impl := TStringBuilder.Create;
  try
    // rutinas que ya existen en Merge13 (interfaces de sus units, fuera de clases)
    for F in TDirectory.GetFiles(FProyecto, '*.pas', TSearchOption.soAllDirectories) do
    begin
      if ContainsText(F, '_dcu') or SameText(TPath.GetFileName(F), 'UUtilesMerge.pas') then
        Continue;
      Texto := QuitaComentarios(TRegEx.Split(LeeTexto(F), '\bimplementation\b', [roIgnoreCase])[0]);
      Texto := TRegEx.Replace(Texto, '\bclass\b.*?\n\s*end\s*;', '', [roIgnoreCase, roSingleLine]);
      for M in TRegEx.Matches(Texto, '^\s*(?:function|procedure)\s+(\w+)', [roIgnoreCase, roMultiLine]) do
        EnM13.Add(LowerCase(M.Groups[1].Value));
    end;
    // declaraciones de la interfaz de UUtiles de Merge
    for M in TRegEx.Matches(QuitaComentarios(IfaceMerge), '^\s*((?:function|procedure)\s+(\w+)\s*(?:\([^)]*\))?\s*(?::\s*[\w.<>]+)?\s*;' +
      DIRECTIVAS_RE + ')', [roIgnoreCase, roMultiLine]) do
    begin
      Nombre := LowerCase(M.Groups[2].Value);
      if not Decl.ContainsKey(Nombre) then
        Decl.Add(Nombre, TList<string>.Create);
      Decl[Nombre].Add(Trim(M.Groups[1].Value));
    end;
    // bloques de rutinas de la implementación (cabecera en columna 0)
    for M in TRegEx.Matches(ImplMerge, '^(?:procedure|function)\s+(\w+)(?!\s*\.)', [roIgnoreCase, roMultiLine]) do
      Pos_.Add(M.Index);
    M := TRegEx.Match(ImplMerge, '^(?:initialization|finalization)\b|^end\.', [roIgnoreCase, roMultiLine]);
    for i := 0 to Pos_.Count - 1 do
    begin
      if i < Pos_.Count - 1 then
        FinB := Pos_[i + 1]
      else if M.Success then
        FinB := M.Index
      else
        FinB := Length(ImplMerge) + 1;
      Texto := Copy(ImplMerge, Pos_[i], FinB - Pos_[i]);
      Nombre := LowerCase(TRegEx.Match(Texto, '^(?:procedure|function)\s+(\w+)', [roIgnoreCase]).Groups[1].Value);
      if Pos('.', Copy(Texto, 1, Pos('(', Texto + '(') - 1)) > 0 then
        Continue;
      if not Bloques.ContainsKey(Nombre) then
      begin
        Bloques.Add(Nombre, TList<string>.Create);
        Orden.Add(Nombre);
      end;
      Bloques[Nombre].Add(TrimRight(Texto) + #13#10#13#10);
    end;
    // palabras usadas por lo importado
    for F in TDirectory.GetFiles(TPath.Combine(FProyecto, 'Merge'), '*.pas', TSearchOption.soAllDirectories) do
      for M in TRegEx.Matches(QuitaComentarios(LeeTexto(F)), '\b\w+\b') do
        Palabras.Add(LowerCase(M.Value));
    if DirectoryExists(TPath.Combine(FProyecto, 'Pendientes')) then
      for F in TDirectory.GetFiles(TPath.Combine(FProyecto, 'Pendientes'), '*.pas') do
        for M in TRegEx.Matches(QuitaComentarios(LeeTexto(F)), '\b\w+\b') do
          Palabras.Add(LowerCase(M.Value));
    for Nombre in Decl.Keys do
      if (Palabras.IndexOf(Nombre) >= 0) and (EnM13.IndexOf(Nombre) < 0) then
        Pend.Add(Nombre);
    // cierre: también las rutinas de UUtiles que usan las elegidas
    while Pend.Count > 0 do
    begin
      Nombre := Pend[Pend.Count - 1];
      Pend.Delete(Pend.Count - 1);
      if (Usadas.IndexOf(Nombre) >= 0) or (EnM13.IndexOf(Nombre) >= 0) or not Bloques.ContainsKey(Nombre) then
        Continue;
      Usadas.Add(Nombre);
      for Texto in Bloques[Nombre] do
        for M in TRegEx.Matches(QuitaComentarios(Texto), '\b\w+\b') do
          if Bloques.ContainsKey(LowerCase(M.Value)) and (Usadas.IndexOf(LowerCase(M.Value)) < 0) and
            (EnM13.IndexOf(LowerCase(M.Value)) < 0) then
            Pend.Add(LowerCase(M.Value));
    end;
    M := TRegEx.Match(IfaceMerge, '^\s*uses\b.*?;', [roIgnoreCase, roSingleLine, roMultiLine]);
    UsesIface := IfThen(M.Success, Trim(M.Value), '');
    M := TRegEx.Match(ImplMerge, '^\s*uses\b(.*?);', [roIgnoreCase, roSingleLine, roMultiLine]);
    UsesImpl := 'uses' + IfThen(Grupo(M, 1) <> '', Grupo(M, 1) + ',', '') + ' UUtiles, UEntorno, UDMMain;';
    Iface.Append('unit UUtilesMerge;' + #13#10#13#10 +
      '// Rutinas de UUtiles de Merge que Merge13 no tiene (código original importado).' + #13#10 +
      '// Las genera el importador: solo las que usa lo importado y sus dependencias.' + #13#10#13#10 +
      'interface' + #13#10#13#10 + UsesIface + #13#10#13#10);
    for Nombre in Orden do
      if Usadas.IndexOf(Nombre) >= 0 then
      begin
        if Decl.ContainsKey(Nombre) then
          for Cab in Decl[Nombre] do
            Iface.Append(Cab + #13#10)
        else
          for Texto in Bloques[Nombre] do
          begin
            M := TRegEx.Match(Texto, '^((?:procedure|function)\s+\w+\s*(?:\([^)]*\))?\s*(?::\s*[\w.<>]+)?\s*;)', [roIgnoreCase]);
            if M.Success then
              Iface.Append(M.Value + IfThen(Bloques[Nombre].Count > 1, ' overload;') + #13#10);
          end;
        for Texto in Bloques[Nombre] do
          Impl.Append(Texto);
      end;
    Texto := Iface.ToString + #13#10 + 'implementation' + #13#10#13#10 + UsesImpl + #13#10#13#10 + Impl.ToString + 'end.' + #13#10;
    Texto := ConviertePasUnit(Texto, 'UUtilesMerge.pas');
    Texto := QuitaSobrecargasDuplicadas(Texto);
    ForceDirectories(TPath.Combine(FProyecto, 'Conversion'));
    GuardaTexto(TPath.Combine(FProyecto, 'Conversion\UUtilesMerge.pas'), Texto);
    Log(Format('UUtilesMerge: %d rutinas de UUtiles de Merge', [Usadas.Count]));
  finally
    EnM13.Free;
    Usadas.Free;
    Palabras.Free;
    Pend.Free;
    Orden.Free;
    Decl.Free;
    Bloques.Free;
    Pos_.Free;
    Iface.Free;
    Impl.Free;
  end;
end;

procedure TImportador.ResuelveDependencias(Importadas: TStringList);
const
  BASE = ';ufmain;uformgest;uentorno;udmmain;uutiles;';
var
  Cola, Faltan, Forzados, Vistos: TStringList;
  U, K, Ruta, F, Nombre: string;
  Reales: TStringList;
  function EsStub(const X: string): Boolean;
  begin
    Result := FileExists(ChangeFileExt(RutaMerge(X), '.dfm')) or (Forzados.IndexOf(LowerCase(X)) >= 0);
  end;
begin
  Cola := TStringList.Create;
  Faltan := TStringList.Create;
  Forzados := TStringList.Create;
  Vistos := TStringList.Create;
  Reales := TStringList.Create;
  try
    F := TPath.Combine(FProyecto, 'Importador\m13_pendientes.txt');
    if FileExists(F) then
      for var L in TFile.ReadAllLines(F, TEncoding.UTF8) do
        if AntesDeAlmohadilla(L) <> '' then
          Forzados.Add(LowerCase(AntesDeAlmohadilla(L)));
    for U in Importadas do
      for F in TDirectory.GetFiles(TPath.Combine(FProyecto, 'Merge'), U + '.pas', TSearchOption.soAllDirectories) do
        Cola.AddStrings(UnitsDeUses(LeeTexto(F)));
    while Cola.Count > 0 do
    begin
      U := Cola[Cola.Count - 1];
      Cola.Delete(Cola.Count - 1);
      K := LowerCase(U);
      if (Vistos.IndexOf(K) >= 0) or (Pos(';' + K + ';', BASE) > 0) or (RutaMerge(U) = '') then
        Continue;
      Vistos.Add(K);
      Nombre := TPath.GetFileNameWithoutExtension(RutaMerge(U));
      // ya importada de verdad
      if Length(TDirectory.GetFiles(TPath.Combine(FProyecto, 'Merge'), Nombre + '.pas', TSearchOption.soAllDirectories)) > 0 then
        Continue;
      if (not DirectoryExists(TPath.Combine(FProyecto, 'Pendientes')) or
        not FileExists(TPath.Combine(FProyecto, 'Pendientes\' + Nombre + '.pas'))) and ExisteEnProyecto(Nombre) then
        Continue;
      Faltan.Add(Nombre);
      Ruta := RutaMerge(U);
      if EsStub(U) then
        Cola.AddStrings(UnitsDeUses(TRegEx.Split(LeeTexto(Ruta), '\bimplementation\b', [roIgnoreCase])[0]))
      else
        Cola.AddStrings(UnitsDeUses(LeeTexto(Ruta)));
    end;
    ForceDirectories(TPath.Combine(FProyecto, 'Pendientes'));
    for Nombre in Faltan do
    begin
      Ruta := RutaMerge(Nombre);
      if EsStub(Nombre) then
        GuardaTexto(TPath.Combine(FProyecto, 'Pendientes\' + Nombre + '.pas'), GeneraStub(LeeTexto(Ruta), Nombre + '.pas'))
      else
      begin
        GuardaTexto(TPath.Combine(DestinoDe(Nombre), Nombre + '.pas'), ConviertePasUnit(LeeTexto(Ruta), Nombre + '.pas'));
        Reales.Add(Nombre);
        if FileExists(TPath.Combine(FProyecto, 'Pendientes\' + Nombre + '.pas')) then
          TFile.Delete(TPath.Combine(FProyecto, 'Pendientes\' + Nombre + '.pas'));
      end;
    end;
    // un pendiente que ya se ha importado de verdad sobra
    for U in Importadas do
      if FileExists(TPath.Combine(FProyecto, 'Pendientes\' + U + '.pas')) then
        TFile.Delete(TPath.Combine(FProyecto, 'Pendientes\' + U + '.pas'));
    GeneraTiposPendientes;
    if Reales.Count > 0 then
      Log('Importadas también (sin formulario): ' + String.Join(', ', Reales.ToStringArray));
    Faltan.Text := '';
    for Nombre in Vistos do
      if FileExists(TPath.Combine(FProyecto, 'Pendientes\' + TPath.GetFileNameWithoutExtension(RutaMerge(Nombre)) + '.pas')) then
        Faltan.Add(TPath.GetFileNameWithoutExtension(RutaMerge(Nombre)));
    if Faltan.Count > 0 then
      Log('Pendientes (interfaz sin código): ' + String.Join(', ', Faltan.ToStringArray));
  finally
    Cola.Free;
    Faltan.Free;
    Forzados.Free;
    Vistos.Free;
    Reales.Free;
  end;
end;

procedure TImportador.ActualizaDpr;
var
  Ruta, Texto, Rel, Nombre, Comp: string;
  Lineas: TStringList;
  F: string;
  R: TDfmNodo;
begin
  Ruta := TPath.Combine(FProyecto, 'Merge13.dpr');
  Texto := LeeTexto(Ruta);
  Texto := TRegEx.Replace(Texto, '\s*\{MERGE2M13-INICIO\}.*?\{MERGE2M13-FIN\}', '', [roSingleLine]);
  Lineas := TStringList.Create;
  try
    for var Sub in ['Conversion', 'Pendientes', 'Merge'] do
      if DirectoryExists(TPath.Combine(FProyecto, Sub)) then
        for F in TDirectory.GetFiles(TPath.Combine(FProyecto, Sub), '*.pas', TSearchOption.soAllDirectories) do
        begin
          Rel := ExtractRelativePath(IncludeTrailingPathDelimiter(FProyecto), F);
          Nombre := TPath.GetFileNameWithoutExtension(F);
          Comp := '';
          if FileExists(ChangeFileExt(F, '.dfm')) then
          begin
            R := CargaDfm(ChangeFileExt(F, '.dfm'));
            try
              Comp := ' {' + R.Nombre + IfThen(StartsText('TDM', R.Clase), ': TDataModule') + '}';
            finally
              R.Free;
            end;
          end;
          Lineas.Add(Format('  %s in ''%s''%s,', [Nombre, Rel, Comp]));
        end;
    Texto := TRegEx.Replace(Texto, '(UMensajesDeError in ''UMensajesDeError.pas'',)',
      '$1' + #13#10 + '  {MERGE2M13-INICIO} // units importadas de Merge (las mantiene el importador)' + #13#10 +
      Lineas.Text + '  {MERGE2M13-FIN}');
    // gnugettext en el uses del proyecto y su instancia creada antes de inicializar la aplicación
    if not TRegEx.IsMatch(QuitaComentarios(Texto), '\bgnugettext\b', [roIgnoreCase]) then
      Texto := TRegEx.Replace(Texto, '(\buses\s*\r?\n)', '$1  ' + GNUGETTEXT_USES + ',' + #13#10, [roIgnoreCase])
    else
      Texto := TRegEx.Replace(Texto, '(?<!\{IDIOMA_CODE\} )\bgnugettext\b(?! \{IDIOMA_CODE\})(?=\s*(?:in\s+''[^'']*''\s*)?[,;])',
        GNUGETTEXT_USES, [roIgnoreCase]);
    if not ContainsText(Texto, 'DefaultInstance := TGnuGettextInstance.Create') then
      Texto := TRegEx.Replace(Texto, '(\bbegin\s*\r?\n)(\s*Application\.Initialize)',
        '$1  DefaultInstance := TGnuGettextInstance.Create;' + #13#10 + '$2', [roIgnoreCase]);
    GuardaTexto(Ruta, Texto, False);
  finally
    Lineas.Free;
  end;
end;

procedure TImportador.CopiaFramework;
var
  F, Dest: string;
begin
  Dest := TPath.Combine(FProyecto, 'Conversion');
  ForceDirectories(Dest);
  if DirectoryExists(TPath.Combine(FProyecto, 'Importador\framework')) then
    for F in TDirectory.GetFiles(TPath.Combine(FProyecto, 'Importador\framework'), '*.pas') do
      if not FileExists(TPath.Combine(Dest, TPath.GetFileName(F))) then
        TFile.Copy(F, TPath.Combine(Dest, TPath.GetFileName(F)));
end;

{ ------------------------------------------------------------------------------------------------ importar }

procedure TImportador.ImportaModulo(const FormUnit, DMUnit: string);
var
  DM, Ruta, Src, Registro, Viejo: string;
  Raiz, Nuevo: TDfmNodo;
  Eliminados, Finales, Renombres, Importadas: TStringList;
  Creado: Boolean;
begin
  FRevisar.Clear;
  FAuto.Clear;
  LimpiaContexto;
  CopiaFramework;
  Importadas := TStringList.Create;
  try
    // ---- módulo de datos
    DM := DMUnit;
    if (DM = '') and StartsText('UFM', FormUnit) then
      DM := 'UDM' + Copy(FormUnit, 4, MaxInt);
    if RutaMerge(DM) <> '' then
    begin
      Ruta := RutaMerge(DM);
      Raiz := CargaDfm(ChangeFileExt(Ruta, '.dfm'));
      try
        Nuevo := ConvierteDM(Raiz);
        try
          FDMNombre := Raiz.Nombre;
          GuardaDfm(Nuevo, TPath.Combine(DestinoDe(DM), TPath.GetFileNameWithoutExtension(Ruta) + '.dfm'));
          GuardaTexto(TPath.Combine(DestinoDe(DM), TPath.GetFileName(Ruta)), ConviertePasDM(LeeTexto(Ruta), DM + '.pas', Nuevo));
          Importadas.Add(TPath.GetFileNameWithoutExtension(Ruta));
          Log('Módulo de datos convertido: ' + DM);
        finally
          Nuevo.Free;
        end;
      finally
        Raiz.Free;
      end;
    end;
    FUpdates.Clear;
    FBloqueos.Clear;
    // ---- formulario
    Ruta := RutaMerge(FormUnit);
    if Ruta = '' then
      raise Exception.Create('No encuentro ' + FormUnit + ' en la carpeta de Merge');
    Raiz := CargaDfm(ChangeFileExt(Ruta, '.dfm'));
    Eliminados := TStringList.Create;
    Finales := TStringList.Create;
    Renombres := TStringList.Create;
    try
      Src := LeeTexto(Ruta);
      LeeFirmas(Src, Raiz.Clase);
      Nuevo := ConvierteForm(Raiz);
      try
        // nombres propios que ya existen en las bases de Merge13 -> se renombran
        Nuevo.Recorre(
          procedure(N: TDfmNodo)
          begin
            if (N <> Nuevo) and SameText(N.Tipo, 'object') and FBaseM13.ContainsKey(UpperCase(N.Nombre)) then
            begin
              Renombres.Add(N.Nombre + '=' + N.Nombre + 'Merge');
              N.Nombre := N.Nombre + 'Merge';
            end;
          end);
        for var i := 0 to Renombres.Count - 1 do
        begin
          Viejo := Renombres.Names[i];
          Src := TRegEx.Replace(Src, '\b' + Viejo + '\b', Renombres.ValueFromIndex[i], [roIgnoreCase]);
          Nuevo.Recorre(
            procedure(N: TDfmNodo)
            begin
              for var P in N.Props do
                if not StartsStr('On', P.Nombre) then
                  P.Lineas.Text := TRegEx.Replace(P.Lineas.Text, '\b' + Viejo + '\b', Viejo + 'Merge');
            end);
          Auto(Viejo + ' -> ' + Viejo + 'Merge (el nombre ya existe en la base de Merge13)');
        end;
        Nuevo.Recorre(
          procedure(N: TDfmNodo)
          begin
            Finales.Add(LowerCase(N.Nombre));
          end);
        Raiz.Recorre(
          procedure(N: TDfmNodo)
          begin
            if (N <> Raiz) and (Finales.IndexOf(LowerCase(N.Nombre)) < 0) and (Renombres.IndexOfName(N.Nombre) < 0) then
              Eliminados.Add(N.Nombre);
          end);
        Registro := RegistroDe(Raiz.Clase, Raiz.Nombre);
        if Registro = '' then
          Revisar('No se ha encontrado en FMain de Merge la acción que abre ' + FormUnit + ': registrar a mano.');
        Src := ConviertePasForm(Src, FormUnit + '.pas', Raiz.Clase, Eliminados, Registro);
        Creado := TRegEx.IsMatch(Src, 'procedure\s+' + Raiz.Clase + '\.FormCreate', [roIgnoreCase]) and (Nuevo.Prop('OnCreate') = nil);
        if Creado then
          Nuevo.PonValor('OnCreate', 'FormCreate');
        GuardaDfm(Nuevo, TPath.Combine(DestinoDe(FormUnit), TPath.GetFileNameWithoutExtension(Ruta) + '.dfm'));
        GuardaTexto(TPath.Combine(DestinoDe(FormUnit), TPath.GetFileName(Ruta)), Src);
        Importadas.Add(TPath.GetFileNameWithoutExtension(Ruta));
        Log(Format('Formulario convertido: %s -> Merge\%s  (%s)', [FormUnit,
          ExtractRelativePath(IncludeTrailingPathDelimiter(FMerge), ExtractFilePath(Ruta)),
          IfThen(Registro <> '', Registro, 'sin registro en el menú')]));
      finally
        Nuevo.Free;
      end;
    finally
      Raiz.Free;
      Eliminados.Free;
      Finales.Free;
      Renombres.Free;
    end;
    ResuelveDependencias(Importadas);
    GeneraUUtilesMerge;
    ActualizaDpr;
    ForceDirectories(TPath.Combine(FProyecto, 'Conversion\informes'));
    GuardaTexto(TPath.Combine(FProyecto, 'Conversion\informes\informe_' + FormUnit + '.txt'),
      'PENDIENTES DE REVISAR (' + IntToStr(FRevisar.Count) + ')' + #13#10 + FRevisar.Text + #13#10 +
      'CONVERSIONES AUTOMATICAS' + #13#10 + FAuto.Text);
    Log(Format('Informe: Conversion\informes\informe_%s.txt (%d puntos a revisar)', [FormUnit, FRevisar.Count]));
  finally
    Importadas.Free;
  end;
end;

procedure TImportador.ImportaUnit(const AUnit: string);
var
  Ruta: string;
  L: TStringList;
begin
  Ruta := RutaMerge(AUnit);
  if Ruta = '' then
    raise Exception.Create('No encuentro ' + AUnit);
  CopiaFramework;
  GuardaTexto(TPath.Combine(DestinoDe(AUnit), TPath.GetFileName(Ruta)), ConviertePasUnit(LeeTexto(Ruta), AUnit + '.pas'));
  L := TStringList.Create;
  try
    L.Add(TPath.GetFileNameWithoutExtension(Ruta));
    ResuelveDependencias(L);
  finally
    L.Free;
  end;
  GeneraUUtilesMerge;
  ActualizaDpr;
  Log('Unit importada: ' + AUnit);
end;

end.
