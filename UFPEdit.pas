unit UFPEdit;

// Mantenimiento con tabla y ficha (en Merge: TFPEdit). Es la base TFRMMantenimientoSimple de MaxFactu pasada a
// formulario: rejilla con filtros por columna, orden por título, totales, columnas fijas y configuración guardada.

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFPEditSimple, Data.DB, Vcl.DBCtrls, Vcl.ToolWin, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.Menus, UUtiles, System.Threading,
  Vcl.StdCtrls, System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList, System.Generics.Collections,
  Vcl.CheckLst, System.StrUtils,  Vcl.Themes;

type
  // Helper para TDBGrid
  TDBGridHelper = class helper for TDBGrid
  public
    function GetCellRect(ACol, ARow: Longint): TRect;
    function GetFixedCols: Integer;
    function GetRow: Integer;
    procedure SetFixedCols(Value: Integer);
  end;


type
  TFPEdit = class(TFPEditSimple)
    PCMain: TPageControl;
    TSFicha: TTabSheet;
    TSTabla: TTabSheet;
    DBGMain: TDBGrid;
    PMConfigurar: TPopupMenu;
    MICopiarCabecera: TMenuItem;
    N1: TMenuItem;
    MIConfigurarColumnasCabecera: TMenuItem;
    EFiltrar: TEdit;
    TSepFiltro: TToolButton;
    ListaIM: TImageList;
    Filtrar1: TMenuItem;
    MIQuitarFiltro: TMenuItem;
    PTotales: TPanel;
    CBTotales: TComboBox;
    PEdit: TScrollBox;
    PFiltrar: TPanel;
    LCantidadFiltrados: TLabel;
    PMTree: TPopupMenu;

    procedure MICopiarCabeceraClick(Sender: TObject);
    procedure MIConfigurarColumnasCabeceraClick(Sender: TObject);
    procedure DBGMainTitleClick(Column: TColumn);
    procedure EFiltrarKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure PCMainChange(Sender: TObject);
    procedure Filtrar1Click(Sender: TObject);
    procedure MIQuitarFiltroClick(Sender: TObject);
    procedure PMConfigurarPopup(Sender: TObject);
    procedure CBTotalesChange(Sender: TObject);
    procedure SBFichaMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure DBGMainMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure DBGMainMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure DBGMainDblClick(Sender: TObject);
    procedure DBGMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DrawStyledText(Canvas: TCanvas; const R: TRect; const S: string; Flags: Cardinal);
  private
    { Private declarations }

    ColumnFiltered: TDictionary<string, Boolean>;
    OriginalCaptions: TDictionary<string, string>;
    ColumnFilters: TDictionary<string, string>;

    // Filtros de Columnas BEGIN  *****************************
    FPopupForm: TForm;
    FCampoFiltrado: string;
    Col: TColumn;
    fColumnaFijaIndex: Integer;

  protected
    procedure ShowFilterPopup(ADataCol, AGridCol, X, Y: Integer); virtual;
    procedure ClosePopupForm;
    procedure PopupDeactivate(Sender: TObject);
    procedure PopupKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure PopupKeyPress(Sender: TObject; var Key: Char);
    procedure ListBoxCheckClick(Sender: TObject); virtual;
    procedure TodosClick(Sender: TObject); virtual;
    procedure SetColumnFilter(Column: TColumn; const Filter: string);
    function GetColumnFilter(Column: TColumn): string;
    function PopupHasChecks(CheckList: TCheckListBox): Boolean;

    procedure RefreshFilterIcons(Grid: TDBGrid);
    procedure AddRightIconDynamic(Column: TColumn);
    function MeasureTextWidth(const S: string; Font: TFont): Integer;
    function GetOriginalCaption(Column: TColumn): string;
    function GetBaseCaption(Column: TColumn): string;
    procedure RemoveIcon(Column: TColumn);
    procedure ClearColumnFilter(Column: TColumn);
    procedure RebuildGlobalFilter;
    procedure LlenaColumnasFiltrar(Grid: TDBGrid; Campo: string; CL: TCheckListBox);
    function DameTipoColumna(Columna: string): string;
    procedure ComplejosClick(Sender: TObject); virtual;
    procedure RefreshAllColumnIcons;
    procedure FijarColumnaClick(Sender: TObject);
    procedure DesFijarColumnaClick(Sender: TObject);

    // Filtros de Columnas  END  *****************************
  public
    { Public declarations }
    ColumnaSeleccionada: string;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

  published
  end;

const
  SEP = #$2063;
  Icono = '¥';
  Separador = #$2003;
  FlechaAsc = ' ▲'; // Flecha ascendente
  FlechaDesc = ' ▼'; // Flecha descendente

var
  FPEdit: TFPEdit;
  FColumnaOrdenada: string; // FieldName de la columna ordenada
  FOrdenColumnaDesc: Boolean;

implementation

{$R *.dfm}

uses FireDAC.Comp.Client, UFMain, UDMMain;



{ TDBGridHelper }

// helper para exponer CellRect que no es expterno del grid
function TDBGridHelper.GetCellRect(ACol, ARow: Longint): TRect;
begin
  Result := inherited CellRect(ACol, ARow);
end;

// helper para exponer FixedCols que no es externo del grid
function TDBGridHelper.GetFixedCols: Integer;
begin
  Result := inherited FixedCols;
end;

function TDBGridHelper.GetRow: Integer;
begin
  Result := inherited Row;
end;

procedure TDBGridHelper.SetFixedCols(Value: Integer);
begin
  inherited FixedCols := Value;
end;

{ TFPEdit }
constructor TFPEdit.Create(AOwner: TComponent);
begin
  inherited;
  NavMain.Hints.Text := 'Primero' + sLineBreak + 'Anterior' + sLineBreak + 'Sigiente ' + sLineBreak + 'Ultimo ' +
    sLineBreak + 'Insertar' + sLineBreak + 'Eliminar' + sLineBreak + 'Editar' + sLineBreak + 'Guardar' + sLineBreak +
    'Cancelar' + sLineBreak + 'Refrescar' + sLineBreak + 'Aplicar Cambios' + sLineBreak + 'Cancelar Cambios' +
    sLineBreak;

  ColumnFiltered := TDictionary<string, Boolean>.Create;
  OriginalCaptions := TDictionary<string, string>.Create;
  ColumnFilters := TDictionary<string, string>.Create; // ← AÑADIR
  FColumnaOrdenada := '';
  FOrdenColumnaDesc := false;

  // Forzar refresco inicial
  RefreshAllColumnIcons;

  // Usamos FieldName como clave (más seguro y estable)
  for var i := 0 to DBGMain.Columns.count - 1 do
  begin
    ColumnFiltered.AddOrSetValue(DBGMain.Columns[i].FieldName, false);
    OriginalCaptions.Add(DBGMain.Columns[i].FieldName, DBGMain.Columns[i].Title.Caption);
    ColumnFilters.AddOrSetValue(DBGMain.Columns[i].FieldName, ''); // ← AÑADIR
  end;

  fColumnaFijaIndex := -1;

end;

destructor TFPEdit.Destroy;
begin

  FreeAndNil(ColumnFilters);
  FreeAndNil(ColumnFiltered);
  FreeAndNil(OriginalCaptions);
  inherited;
end;



// **********************************************************
// ***********  Inicio de  Agrupacion   ***************************







// **********************************************************
// ***********  Fin Agrupacion   ***************************

procedure TFPEdit.MICopiarCabeceraClick(Sender: TObject);
begin
  inherited;
  TTask.Run(
    procedure
    begin
      TThread.Synchronize(nil,
        procedure
        begin
          CopyDBGridToClipboard(TDBGrid(TPopupMenu(TMenuItem(Sender).GetParentComponent).PopupComponent));
        end);
    end);

end;

procedure TFPEdit.MIQuitarFiltroClick(Sender: TObject);
var
  FieldName: string;
  SavedSortedCol: string;
  SavedSortDir: Boolean;
begin
  if Assigned(DBGMain.DataSource.DataSet) then
  begin
    // GUARDAR estado de ordenación antes de limpiar filtros
    SavedSortedCol := FColumnaOrdenada;
    SavedSortDir := FOrdenColumnaDesc;

    // === Limpiar TODOS los filtros de columnas ===
    for FieldName in ColumnFilters.Keys do
    begin
      ColumnFilters[FieldName] := '';
      ColumnFiltered[FieldName] := false;
    end;

    // === Reconstruir filtro global ===
    RebuildGlobalFilter;

    // === RESTAURAR estado de ordenación ===
    FColumnaOrdenada := SavedSortedCol;
    FOrdenColumnaDesc := SavedSortDir;

    // === Actualizar iconos (filtros + ordenación) ===
    RefreshFilterIcons(DBGMain);

    if ColumnaSeleccionada <> '' then
      LlenaComboTotales(DBGMain.DataSource.DataSet, ColumnaSeleccionada, CBTotales);
  end;
end;

procedure TFPEdit.PCMainChange(Sender: TObject);
begin
  inherited;
  PFiltrar.Visible := (PCMain.TabIndex = 0) and (ColumnaSeleccionada <> '');
end;

procedure TFPEdit.PMConfigurarPopup(Sender: TObject);
var
  P: TPoint;
  HeaderHeight: Integer;
begin
  if PMConfigurar.PopupComponent is TDBGrid then
  begin
    // Coordenadas del mouse relativas al grid
    P := (PMConfigurar.PopupComponent as TDBGrid).ScreenToClient(Mouse.CursorPos);

    // Altura real de la cabecera (DBGrid no expone TitleHeight)
    HeaderHeight := (PMConfigurar.PopupComponent as TDBGrid).Canvas.TextHeight('Wg') + 6;

    // Si el click está dentro de la cabecera
    if P.Y < HeaderHeight then
    begin
      Abort; // cancela el popup
      Exit;
    end;
  end;

  if Assigned(DBGMain.DataSource.DataSet) then
    MIQuitarFiltro.Enabled := DBGMain.DataSource.DataSet.Filtered
  else
    MIQuitarFiltro.Enabled := false;

end;

procedure TFPEdit.SBFichaMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState;
X, Y: Integer);
var
  Row: Integer;
begin
  if Button = mbRight then
  begin
    Row := DBGMain.MouseCoord(X, Y).Y;
    if Row = 0 then // cabecera
      PMConfigurar.CloseMenu;
  end;

end;

procedure TFPEdit.DBGMainDblClick(Sender: TObject);
begin
  inherited;
  PCMain.ActivePage := TSFicha;
end;


procedure TFPEdit.DBGMainDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
begin
  if gdFixed in State then
  begin
    // ✅ Verificar si hay DataSource y DataSet activo
    if Assigned(DBGMain.DataSource) and
       Assigned(DBGMain.DataSource.DataSet) and
       DBGMain.DataSource.DataSet.Active and
       (DBGMain.DataSource.DataSet.RecNo > 0) then
    begin
      // =============================================
      // COLUMNAS FIJADAS (filas de datos)
      // =============================================
      DBGMain.Canvas.Brush.Color := clInfoBk;
      DBGMain.Canvas.Font.Color  := clBlack;
      DBGMain.Canvas.Font.Style  := [];
      DBGMain.Canvas.FillRect(Rect);

      DBGMain.Canvas.TextRect(Rect,
        Rect.Left + 2,
        Rect.Top + 2,
        Column.Field.DisplayText);
    end
    else
    begin
      // =============================================
      // CABECERA (títulos de columnas)
      // =============================================
      DBGMain.Canvas.Brush.Color := clInfoBk;
      DBGMain.Canvas.Font.Color  := clBlack;
      DBGMain.Canvas.Font.Style  := [fsBold];
      DBGMain.Canvas.FillRect(Rect);

      DBGMain.Canvas.TextRect(Rect,
        Rect.Left + 2,
        Rect.Top + 2,
        Column.Title.Caption);
    end;

    Exit;
  end;

  // Las celdas normales de datos las dibuja el grid automáticamente
end;

procedure TFPEdit.DrawStyledText(Canvas: TCanvas; const R: TRect; const S: string; Flags: Cardinal);
var
  Details: TThemedElementDetails;
  TextRect: TRect;
  LOptions: TStyleTextOptions;
begin
  Details := StyleServices.GetElementDetails(thHeaderItemNormal);
  TextRect := R;

  // Configurar opciones de texto con color
  LOptions.Flags := [stfTextColor];
  LOptions.TextColor := Canvas.Font.Color;

  StyleServices.DrawText(Canvas.Handle, Details, S, TextRect, // ✅ var TRect
  TTextFormat(Flags), // ✅ Convertir Cardinal a TTextFormat
  LOptions // ✅ Usar TStyleTextOptions para el color
    );
end;

procedure TFPEdit.DBGMainMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState;
X, Y: Integer);
var
  GridCol, Row: Integer;
begin
  if Button = mbRight then
  begin
    GridCol := DBGMain.MouseCoord(X, Y).X;
    Row := DBGMain.MouseCoord(X, Y).Y;

    if Row = 0 then // cabecera
    begin
      if GridCol = 0 then
        Exit; // ignorar clic en el indicador

      // ✅ CORREGIDO: siempre es GridCol - 1 (independiente de FixedCols)
      fColumnaFijaIndex := GridCol - 1;

      if (fColumnaFijaIndex >= 0) and (fColumnaFijaIndex < DBGMain.Columns.count) then
        ShowFilterPopup(fColumnaFijaIndex, GridCol, X, Y);
    end;
  end;
end;

procedure TFPEdit.DBGMainMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState;
X, Y: Integer);
begin
  inherited MouseUp(Button, Shift, X, Y); // ← CORREGIDO: solo una llamada a inherited

  if Button = mbLeft then
    RefreshAllColumnIcons;
end;

procedure TFPEdit.DBGMainTitleClick(Column: TColumn);
var
  SavedScrollPos: Integer;
  IsDescending: Boolean;
begin
  // 1. Bloquear redibujo
  SendMessage(DBGMain.Handle, WM_SETREDRAW, 0, 0);

  try
    // 2. Guardar scroll
    SavedScrollPos := GetScrollPos(DBGMain.Handle, SB_HORZ);

    // 3. Determinar si invertimos el orden (si ya está ordenada esta columna)
    IsDescending := (Column.FieldName = FColumnaOrdenada) and not FOrdenColumnaDesc;

    // 4. Actualizar estado de ordenación
    FColumnaOrdenada := Column.FieldName;
    FOrdenColumnaDesc := IsDescending;

    // 5. Tu lógica existente de selección visual
    ColumnaSeleccionada := Column.FieldName;
    for var i := 0 to DBGMain.Columns.count - 1 do
      DBGMain.Columns[i].Title.Font.Style := [];
    Column.Title.Font.Style := [fsBold];

    // 6. Ordenar (tu función existente ya maneja la inversión)
    OrdenaPorTitulo(DBGMain.DataSource.DataSet, ColumnaSeleccionada);
    LlenaComboTotales(DBGMain.DataSource.DataSet, ColumnaSeleccionada, CBTotales);

    PTotales.Visible := True;
    CBTotales.Visible := True;
    PFiltrar.Visible := (PCMain.TabIndex = 0) and (ColumnaSeleccionada <> '');
    EFiltrar.Text := '';
    LCantidadFiltrados.Caption := '';

    // 7. NUEVO: Actualizar iconos de filtro y ordenación
    RefreshFilterIcons(DBGMain);

    // 8. Restaurar scroll
    SendMessage(DBGMain.Handle, WM_HSCROLL, MakeLong(SB_THUMBPOSITION, SavedScrollPos), 0);

  finally
    // 9. Reactivar redibujo
    SendMessage(DBGMain.Handle, WM_SETREDRAW, 1, 0);
    RedrawWindow(DBGMain.Handle, nil, 0, RDW_INVALIDATE or RDW_FRAME or RDW_ERASE or RDW_ALLCHILDREN);
  end;
end;

procedure TFPEdit.MIConfigurarColumnasCabeceraClick(Sender: TObject);
begin
  inherited;
  if TPopupMenu(TMenuItem(Sender).GetParentComponent).PopupComponent is TDBGrid then
    MuestraColumnas(TPopupMenu(TMenuItem(Sender).GetParentComponent).PopupComponent as TDBGrid);
end;

procedure TFPEdit.EFiltrarKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // if key <> '' then
  Filtrar(DBGMain.DataSource.DataSet, ColumnaSeleccionada, EFiltrar.Text, LCantidadFiltrados);
end;


procedure TFPEdit.Filtrar1Click(Sender: TObject);
begin
  inherited;
  if TPopupMenu(TMenuItem(Sender).GetParentComponent).PopupComponent is TDBGrid then
    MuestraFiltros(TPopupMenu(TMenuItem(Sender).GetParentComponent).PopupComponent as TDBGrid);
end;


procedure TFPEdit.CBTotalesChange(Sender: TObject);
var
  i, MaxWidth, TempWidth: Integer;
begin
  MaxWidth := 0;
  // Calcular el ancho máximo del texto de los items
  for i := 0 to CBTotales.Items.count - 1 do
  begin
    TempWidth := CBTotales.Canvas.TextWidth(CBTotales.Items[i]);
    if TempWidth > MaxWidth then
      MaxWidth := TempWidth;
  end;

  // Ajustar el ancho del ComboBox (añadiendo espacio para el botón desplegable y márgenes)
  CBTotales.Width := MaxWidth + GetSystemMetrics(SM_CXVSCROLL) + 8;
end;






// *************************************************************************
// Filtrar colunas
// *************************************************************************

procedure TFPEdit.TodosClick(Sender: TObject);
var
  CheckList: TCheckListBox;
  i: Integer;
begin
  // Buscar el CheckList en el formulario popup
  if Assigned(FPopupForm) then
  begin
    for i := 0 to FPopupForm.ControlCount - 1 do
    begin
      if FPopupForm.Controls[i] is TCheckListBox then
      begin
        CheckList := TCheckListBox(FPopupForm.Controls[i]);
        // Desmarcar todos los items
        for var j := 0 to CheckList.count - 1 do
          CheckList.Checked[j] := false;
        Break;
      end;
    end;
    // Quitar filtro de ESTA columna
    ColumnFilters.AddOrSetValue(FCampoFiltrado, '');
    ColumnFiltered.AddOrSetValue(FCampoFiltrado, false);

    // Reconstruir filtro global
    RebuildGlobalFilter;

    // Actualizar iconos
    RefreshFilterIcons(DBGMain);

    // Cerrar el popup
    ClosePopupForm;
  end;
end;

procedure TFPEdit.ComplejosClick(Sender: TObject);
begin
  ClosePopupForm;
  MuestraFiltros(DBGMain);
end;

function TFPEdit.GetOriginalCaption(Column: TColumn): string;
begin
  if OriginalCaptions.ContainsKey(Column.FieldName) then
    Result := OriginalCaptions[Column.FieldName]
  else
    Result := Column.Title.Caption;
end;

// Refresca el Icono de la columna
procedure TFPEdit.RefreshFilterIcons(Grid: TDBGrid);
var
  Col: TColumn;
  i: Integer;
begin
  for i := 0 to Grid.Columns.count - 1 do
  begin
    Col := Grid.Columns[i];
    if OriginalCaptions.ContainsKey(Col.FieldName) then
      Col.Title.Caption := OriginalCaptions[Col.FieldName]
    else
      Col.Title.Caption := Col.FieldName;

    if (ColumnFiltered.ContainsKey(Col.FieldName) and ColumnFiltered[Col.FieldName]) or
      (Col.FieldName = FColumnaOrdenada) then
      AddRightIconDynamic(Col);
  end;

  Grid.Invalidate;
end;

// Obtiene un Device Context global del escritorio (¡no del grid!).
// para no usar DC real donde se dibuja el título del grid.
function TFPEdit.MeasureTextWidth(const S: string; Font: TFont): Integer;
var
  DC: HDC;
  Size: TSize;
  OldFont: HGDIOBJ;
begin
  DC := GetDC(0);
  try
    OldFont := SelectObject(DC, Font.Handle);
    GetTextExtentPoint32W(DC, PWideChar(S), Length(S), Size);
    SelectObject(DC, OldFont);
    Result := Size.cx;
  finally
    ReleaseDC(0, DC);
  end;
end;

// dibuja icono derecha de la columna
// dibuja iconos derecha de la columna (filtro + ordenación)
procedure TFPEdit.AddRightIconDynamic(Column: TColumn);
var
  BaseCaption: string;
  ColWidthPx, TextWidthPx, SuffixWidthPx, Needed: Integer;
  Padding, Suffix: string;
  i: Integer;
  HasFilter, IsSorted: Boolean;
begin
  // 1. Caption LIMPIO (sin iconos anteriores)
  BaseCaption := GetOriginalCaption(Column);

  // 2. Medir ancho real del texto base
  ColWidthPx := Column.Width;
  TextWidthPx := MeasureTextWidth(BaseCaption, Column.Title.Font);

  // 3. Construir sufijo (icono filtro + flecha orden)
  Suffix := '';
  HasFilter := ColumnFiltered.TryGetValue(Column.FieldName, IsSorted) and IsSorted;
  if HasFilter then
    Suffix := Suffix + Icono; // ¥

  IsSorted := (Column.FieldName = FColumnaOrdenada);
  if IsSorted then
  begin
    if Suffix <> '' then
      Suffix := Suffix + ' ';
    if FOrdenColumnaDesc then
      Suffix := Suffix + FlechaDesc
    else
      Suffix := Suffix + FlechaAsc;
  end;

  // 4. Si no hay sufijo → solo ponemos el caption original
  if Suffix = '' then
  begin
    Column.Title.Caption := BaseCaption;
    Exit;
  end;

  // 5. Calcular padding necesario
  SuffixWidthPx := MeasureTextWidth(Suffix, Column.Title.Font);
  Needed := (ColWidthPx - TextWidthPx - SuffixWidthPx - 12) div MeasureTextWidth(Separador, Column.Title.Font);

  if Needed < 1 then
    Needed := 1;

  Padding := '';
  for i := 1 to Needed do
    Padding := Padding + Separador; // #$2003

  Column.Title.Caption := BaseCaption + Padding + Suffix;
end;

// Cierra el form de filtro con escape
procedure TFPEdit.PopupKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    (Sender as TForm).Close;
end;

procedure TFPEdit.ShowFilterPopup(ADataCol, AGridCol, X, Y: Integer);
var
  PopupForm: TForm;
  CheckList: TCheckListBox;
  ColRect: TRect;
  ScreenPoint: TPoint;
  lblTodos: TLabel;
begin
  // Rectángulo correcto de la cabecera (usa el índice del grid)
  ColRect := DBGMain.GetCellRect(AGridCol, 0);
  ScreenPoint := DBGMain.ClientToScreen(Point(ColRect.Right, ColRect.Bottom));
  Col := DBGMain.Columns[ADataCol];
  PopupForm := TForm.Create(Self);
  PopupForm.BorderStyle := bsNone;
  PopupForm.Position := poDesigned;
  PopupForm.Left := ScreenPoint.X - 200;
  PopupForm.Top := ScreenPoint.Y;
  PopupForm.Width := 200;
  PopupForm.Height := 320; // Aumentado para el label "Todos"
  PopupForm.KeyPreview := True;
  PopupForm.OnKeyDown := PopupKeyDown;
  PopupForm.OnDeactivate := PopupDeactivate;

  // Crear Label "Todos" en la parte superior
  lblTodos := TLabel.Create(PopupForm);
  lblTodos.Parent := PopupForm;
  lblTodos.Caption := '  > Mostrar Todos';
  lblTodos.Align := alTop;
  lblTodos.Height := 25;
  lblTodos.AutoSize := false;
  lblTodos.Layout := tlCenter;
  lblTodos.OnClick := TodosClick;
  lblTodos.Cursor := crHandPoint;
  lblTodos.Color := clBtnFace;
  lblTodos.ParentColor := false;

  // Crear Label "Filtros Complejos" en la parte superior
  lblTodos := TLabel.Create(PopupForm);
  lblTodos.Parent := PopupForm;
  lblTodos.Caption := '  > Filtros Complejos';
  lblTodos.Align := alTop;
  lblTodos.Height := 25;
  lblTodos.AutoSize := false;
  lblTodos.Layout := tlCenter;
  lblTodos.OnClick := ComplejosClick;
  lblTodos.Cursor := crHandPoint;
  lblTodos.Color := clBtnFace;
  lblTodos.ParentColor := false;

  // Crear Label "Fijar Columna" en la parte superior
  lblTodos := TLabel.Create(PopupForm);
  lblTodos.Parent := PopupForm;
  if DBGMain.GetFixedCols > 1 then
  begin
    lblTodos.Caption := '  > DesFijar Columna';
    lblTodos.OnClick := DesFijarColumnaClick;
  end
  else
  begin
    lblTodos.Caption := '  > Fijar Columna';
    lblTodos.OnClick := FijarColumnaClick;
  end;
  lblTodos.Align := alTop;
  lblTodos.Height := 25;
  lblTodos.AutoSize := false;
  lblTodos.Layout := tlCenter;
  lblTodos.Cursor := crHandPoint;
  lblTodos.Color := clBtnFace;
  lblTodos.ParentColor := false;

  // Crear CheckList
  CheckList := TCheckListBox.Create(PopupForm);
  CheckList.Parent := PopupForm;
  CheckList.Align := alClient;
  CheckList.OnKeyDown := PopupKeyDown;
  CheckList.OnClickCheck := ListBoxCheckClick;

  // Nombre correcto de la columna
  FCampoFiltrado := DBGMain.Columns[ADataCol].FieldName;

  // Llenar y marcar según filtro actual (todo en un solo recorrido)
  LlenaColumnasFiltrar(DBGMain, FCampoFiltrado, CheckList);

  // Guardar referencia para cierre
  FPopupForm := PopupForm;
  PopupForm.Show;
end;

procedure TFPEdit.FijarColumnaClick(Sender: TObject);
begin
  // if fColumnaFijaIndex >= 0 then
  // begin
  // SendMessage(DBGMain.Handle, WM_SETREDRAW, 0, 0);
  // try
  DBGMain.SetFixedCols(fColumnaFijaIndex + 2);
  DBGMain.DataSource.DataSet.Refresh;
  // finally
  // SendMessage(DBGMain.Handle, WM_SETREDRAW, 1, 0);
  // end;
  DBGMain.Invalidate;
  DBGMain.Repaint;
  // end;
  ClosePopupForm;
end;

procedure TFPEdit.DesFijarColumnaClick(Sender: TObject);
begin
  SendMessage(DBGMain.Handle, WM_SETREDRAW, 0, 0);
  try
    DBGMain.SetFixedCols(1);
  finally
    SendMessage(DBGMain.Handle, WM_SETREDRAW, 1, 0);
  end;

  DBGMain.Invalidate;
  DBGMain.Update;
  ClosePopupForm;
end;

procedure TFPEdit.PopupKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    ClosePopupForm;
end;

procedure TFPEdit.ClosePopupForm;
begin
  if Assigned(FPopupForm) then
  begin
    FPopupForm.Close;
    FPopupForm := nil;
  end;
end;

// Click encima de un Check del ListBox para el filtro de columnas
procedure TFPEdit.ListBoxCheckClick(Sender: TObject);
var
  i: Integer;
  Lista: TStringList;
  FiltroColumna, Tipo: string;
  CheckList: TCheckListBox;
begin
  CheckList := Sender as TCheckListBox;

  // Si se marcó "Todos" (primer item), desmarcar los demás
  if CheckList.count > 0 then
  begin
    // Verificar si el primer item fue marcado (si lo implementas como check)
    // En nuestro caso, "Todos" es un Label, así que esto no aplica
  end;

  Lista := TStringList.Create;
  try
    for i := 0 to CheckList.count - 1 do
      if CheckList.Checked[i] = True then
      begin
        Tipo := DameTipoColumna(FCampoFiltrado);
        if (Tipo = 'TSmallintField') or (Tipo = 'TIntegerField') then
          Lista.Add(Format('(%s = %s)', [FCampoFiltrado, CheckList.Items[i]])) // si es numeroco no va con comillas
        else
          Lista.Add(Format('(%s = %s)', [FCampoFiltrado, QuotedStr(CheckList.Items[i])]));
      end;

    if Lista.count = 0 then
    begin
      // Quitar filtro de ESTA columna solamente
      ColumnFilters.AddOrSetValue(FCampoFiltrado, '');
      ColumnFiltered.AddOrSetValue(FCampoFiltrado, false);
    end
    else
    begin
      FiltroColumna := '(' + String.Join(' OR ', Lista.ToStringArray) + ')';
      ColumnFilters.AddOrSetValue(FCampoFiltrado, FiltroColumna);
      ColumnFiltered.AddOrSetValue(FCampoFiltrado, True);
    end;

    RebuildGlobalFilter;
    RefreshFilterIcons(DBGMain);
    if ColumnaSeleccionada <> '' then
      LlenaComboTotales(DBGMain.DataSource.DataSet, ColumnaSeleccionada, CBTotales);
  finally
    Lista.Free;
  end;
end;

procedure TFPEdit.SetColumnFilter(Column: TColumn; const Filter: string);
begin
  Column.Title.Caption := GetBaseCaption(Column) + SEP + Filter;
end;

function TFPEdit.GetColumnFilter(Column: TColumn): string;
var
  P: Integer;
begin
  P := Pos(SEP, Column.Title.Caption);
  if P > 0 then
    Result := Copy(Column.Title.Caption, P + 1, MaxInt)
  else
    Result := '';
end;

procedure TFPEdit.PopupDeactivate(Sender: TObject);
begin
  if Assigned(FPopupForm) then
  begin
    FPopupForm.Close;
    FPopupForm.Free;
    FPopupForm := nil;
  end;
end;

function TFPEdit.PopupHasChecks(CheckList: TCheckListBox): Boolean;
var
  i: Integer;
begin
  Result := false;
  for i := 0 to CheckList.count - 1 do
    if CheckList.Checked[i] then
      Exit(True);
end;

procedure TFPEdit.RemoveIcon(Column: TColumn);
begin
  Column.Title.Caption := GetBaseCaption(Column);
end;

procedure TFPEdit.ClearColumnFilter(Column: TColumn);
begin
  Column.Title.Caption := GetBaseCaption(Column); // elimina todo lo oculto
end;

function TFPEdit.GetBaseCaption(Column: TColumn): string;
var
  P: Integer;
begin
  P := Pos(Icono, Column.Title.Caption);
  if P > 0 then
    Result := Copy(Column.Title.Caption, 1, P - 1)
  else
    Result := Column.Title.Caption;
end;

procedure TFPEdit.RebuildGlobalFilter;
var
  Parts: TStringList;
  FullFilter: string;
begin
  Parts := TStringList.Create;
  try
    for var Pair in ColumnFilters do
      if Trim(Pair.Value) <> '' then
        Parts.Add(Pair.Value);

    if Parts.count = 0 then
    begin
      DBGMain.DataSource.DataSet.Filtered := false;
      DBGMain.DataSource.DataSet.Filter := '';
    end
    else
    begin
      FullFilter := String.Join(' AND ', Parts.ToStringArray);
      // Solo ponemos paréntesis externos si hay más de un filtro
      if Parts.count > 1 then
        FullFilter := '(' + FullFilter + ')';

      DBGMain.DataSource.DataSet.Filter := FullFilter;
      DBGMain.DataSource.DataSet.Filtered := True;
    end;
  finally
    Parts.Free;
  end;
end;

procedure TFPEdit.LlenaColumnasFiltrar(Grid: TDBGrid; Campo: string; CL: TCheckListBox);
var
  qBase: TDataSet;
  qFDBase: TFDQuery;
  q: TFDQuery;
  Valores: TStringList;
  i: Integer;
  Valor: string;
  BaseSQL, SQLSinOrder: string;
  P, P1, P2: Integer;
  Pattern: string;
begin
  if not Assigned(Grid) or not Assigned(Grid.DataSource) or not Assigned(Grid.DataSource.DataSet) then
    Exit;

  qBase := Grid.DataSource.DataSet;

  // Solo tratamos el caso TFDQuery (que es tu caso en facturas)
  if not(qBase is TFDQuery) then
    Exit;

  qFDBase := TFDQuery(qBase);

  Valores := TStringList.Create;
  Valores.Sorted := True;
  Valores.Duplicates := dupIgnore;

  try
    // ==============================
    // 1. Tomar el SQL original
    // ==============================
    BaseSQL := qFDBase.SQL.Text;

    // Quitar el ORDER BY del SQL original (si lo hay)
    SQLSinOrder := BaseSQL;
    P := Pos('ORDER BY', UpperCase(SQLSinOrder));
    if P > 0 then
      SQLSinOrder := Trim(Copy(SQLSinOrder, 1, P - 1));

    // ==============================
    // 2. Construir la consulta de valores distintos
    // ==============================
    q := TFDQuery.Create(nil);
    try
      q.Connection := DMMain.DB;

      q.SQL.Text := 'SELECT DISTINCT ' + Campo + sLineBreak + 'FROM (' + sLineBreak + SQLSinOrder + sLineBreak + ') T' +
        sLineBreak + 'ORDER BY ' + Campo;

      // Copiar parámetros de la consulta original (muy importante)
      q.Params.Assign(qFDBase.Params);

      q.Open;
      while not q.EOF do
      begin
        Valor := Trim(q.Fields[0].AsString);
        if Valor <> '' then
          Valores.Add(Valor);
        q.Next;
      end;
    finally
      q.Free;
    end;

    // ==============================
    // 3. Llenar el CheckListBox
    // ==============================
    CL.Items.BeginUpdate;
    try
      CL.Clear;
      for i := 0 to Valores.count - 1 do
        CL.Items.Add(Valores[i]);
    finally
      CL.Items.EndUpdate;
    end;

    // ==============================
    // 4. Marcar los ya filtrados (tu lógica actual)
    // ==============================
    if Grid.DataSource.DataSet.Filtered and (Grid.DataSource.DataSet.Filter <> '') then
    begin
      Pattern := '(' + Campo + ' = ';
      P := 1;
      while True do
      begin
        P := PosEx(Pattern, Grid.DataSource.DataSet.Filter, P);
        if P = 0 then
          Break;

        P1 := PosEx('''', Grid.DataSource.DataSet.Filter, P);
        P2 := PosEx('''', Grid.DataSource.DataSet.Filter, P1 + 1);
        if (P1 = 0) or (P2 = 0) then
          Break;

        Valor := Copy(Grid.DataSource.DataSet.Filter, P1 + 1, P2 - P1 - 1);

        for i := 0 to CL.Items.count - 1 do
          if CL.Items[i] = Valor then
          begin
            CL.Checked[i] := True;
            Break;
          end;
        P := P2 + 1;
      end;
    end;;

  finally
    Valores.Free;
  end;
end;

function TFPEdit.DameTipoColumna(Columna: string): string;
var
  i: Integer;
begin
  Result := '';
  If Assigned(DBGMain) then
  begin
    for i := 0 to DBGMain.DataSource.DataSet.FieldCount - 1 do
      if DBGMain.DataSource.DataSet.Fields[i].FieldName = Columna then
      begin
        Result := DBGMain.DataSource.DataSet.Fields[i].ClassName;
        Exit
      end;
  end;
end;

procedure TFPEdit.RefreshAllColumnIcons;
var
  i: Integer;
begin
  if not Assigned(DBGMain) then
    Exit;

  DBGMain.BeginUpdate;
  try
    for i := 0 to DBGMain.Columns.count - 1 do
    begin
      // Restaurar caption original LIMPIO
      if OriginalCaptions.ContainsKey(DBGMain.Columns[i].FieldName) then
        DBGMain.Columns[i].Title.Caption := OriginalCaptions[DBGMain.Columns[i].FieldName]
      else
        DBGMain.Columns[i].Title.Caption := DBGMain.Columns[i].FieldName;

      // Añadir iconos solo si corresponde
      if (ColumnFiltered.ContainsKey(DBGMain.Columns[i].FieldName) and ColumnFiltered[DBGMain.Columns[i].FieldName]) or
        (DBGMain.Columns[i].FieldName = FColumnaOrdenada) then
      begin
        AddRightIconDynamic(DBGMain.Columns[i]);
      end;
    end;
  finally
    DBGMain.EndUpdate;
    DBGMain.Invalidate;
  end;
end;

// *************************************************************************
// Filtrar colunas
// *************************************************************************

end.
