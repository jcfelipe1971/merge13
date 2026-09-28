unit UFMFiltrar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, Vcl.DBGrids;

type
  TFMFiltrar = class(TForm)
    SBFondo: TScrollBox;
    Button1: TButton;
    Panel2: TPanel;
    BTAplicarFiltro: TButton;
    BTQuitarFiltro: TButton;
    procedure LlenaColumnas(CBc: TComboBox);
    procedure FormActivate(Sender: TObject);
    function DameCondicion(Con: string): string;
    procedure InsertaItem;
    function CreaPanelLPI: TPanel;
    procedure CreaComboCondicion(Padre: TGroupBox);
    function CreaRecItem(Padre: TGroupBox): TPanel;
    function CreaComboCondiciones(Padre: TPanel): TComboBox;
    procedure CreaComboColumnas(Padre: TPanel);
    procedure ColumnasCloseUp(Sender: TObject);
    procedure AgregaEdit(Padre: TPanel; Tipo: String);
    function DameTipoColumna(Columna: string): string;
    procedure CreaBtEliminar(Padre: TPanel);
    procedure EliminaItem(Sender: TObject);
    procedure ReordenaItems(Eliminando: Boolean);
    procedure CreaBtAdicionar(Padre: TPanel);
    procedure InsertaItemBtm(Sender: TObject);
    function CreaGrupo: TGroupBox;
    procedure FormDestroy(Sender: TObject);
    function DameFiltro: string;
    procedure BTAplicarFiltroClick(Sender: TObject);
    procedure BTQuitarFiltroClick(Sender: TObject);
    procedure LimpiarItems;
  private
    { Private declarations }
  public
    { Public declarations }
  Var
    Consulta: string;
    Grid: TDBGrid;
  end;

var
  FMFiltrar: TFMFiltrar;

implementation

uses Vcl.NumberBox, Vcl.ComCtrls;
{$R *.dfm}

procedure TFMFiltrar.FormActivate(Sender: TObject);
begin
  InsertaItem;
end;

procedure TFMFiltrar.FormDestroy(Sender: TObject);
begin
   LimpiarItems;
end;

procedure TFMFiltrar.LimpiarItems;
 begin
 // Elimino todo lo que hay en el scroll
  SBFondo.DisableAlign;
  try
    for var i := SBFondo.ControlCount - 1 downto 0 do
    begin
      SBFondo.Controls[i].FreeInstance;
    end;
  finally
    SBFondo.EnableAlign;
  end;
 end;

// llena las columnas de la tabla en el combo
procedure TFMFiltrar.LlenaColumnas(CBc: TComboBox);
begin
 if Assigned(Grid) then
  begin
    CBc.Items.Clear;

    for var i := 0 to Grid.Columns.Count - 1 do
    begin
      // Lo que ve el usuario
      CBc.Items.AddObject(
        Grid.Columns[i].Title.Caption,          // Texto visible
        TObject(Grid.Columns[i].FieldName)      // Guardamos FieldName
      );
    end;
    CBc.ItemIndex := 0;
  end;
end;


procedure TFMFiltrar.InsertaItem;
begin
  // GroupBox Contiene el Y o y el Panel con la información
  var
  Grupo := CreaGrupo;
  // Condicion  ( Y O )
  CreaComboCondicion(Grupo);
  // Rectangulo del item
  var
  RecI := CreaRecItem(Grupo);
  // CB Condicion
  CreaComboCondiciones(RecI);
  // CB Columnas
  CreaComboColumnas(RecI);
  // Boton eliminar
  CreaBtEliminar(RecI);
  // Boton adicionar
  CreaBtAdicionar(RecI);

  ReordenaItems(False);
end;

// Crea GroupBox del item
function TFMFiltrar.CreaGrupo: TGroupBox;
begin
  result := TGroupBox.Create(SBFondo);
  with result do
  begin
    if SBFondo.ControlCount = 0 then
    begin
      Tag := 0;
      top := 8
    end
    else
    begin
      Tag := SBFondo.ControlCount;
      top := SBFondo.Controls[SBFondo.ControlCount - 1].top + 72;
    end;
    Width := 575;
    Height := 70;
    Left := 9;
    Parent := SBFondo;
    Name := 'GB' + Tag.ToString;
    Caption := '';
  end;

end;

// Boton eliminar
procedure TFMFiltrar.CreaBtEliminar(Padre: TPanel);
begin
  var
  BTMe := TSpeedButton.Create(Padre);
  with BTMe do
  begin
    Parent := Padre;
    Width := 22;
    Height := 22;
    Margins.Bottom := 5;
    Margins.Right := 10;
    Margins.top := 5;
    Align := alRight;
    OnClick := EliminaItem;
    Caption := '-';
  end;
end;

procedure TFMFiltrar.EliminaItem(Sender: TObject);
begin
  if SBFondo.ControlCount > 1 then
  begin
    var
    c := (Sender as TSpeedButton).Parent.Parent as TGroupBox;
    if Assigned(c) then
      SBFondo.RemoveControl(c);
    c.FreeInstance;
    ReordenaItems(True);
  end
  else
    ShowMessage('No se pueden eliminar todas las condiciones');
end;

procedure TFMFiltrar.ReordenaItems(Eliminando: Boolean);
var
  Y, i: Integer;
begin
  Y := 8;
  for i := 0 to SBFondo.ControlCount - 1 do
  begin
    SBFondo.Controls[i].Tag := i;
    if Eliminando then
      (SBFondo.Controls[i] as TGroupBox).top := Y;
    Y := Y + 71;
  end;
end;

// combo condiciones like igual etc...
function TFMFiltrar.CreaComboCondiciones(Padre: TPanel): TComboBox;
begin
  result := TComboBox.Create(Padre);
  with result do
  begin
    Tag := Padre.Tag;
    result.Name := 'CBcondicion' + Tag.ToString;
    Parent := Padre;
    ItemIndex := 0;
    Width := 155;
    Margins.Bottom := 5;
    Margins.Left := 10;
    Margins.top := 5;
    Align := alLeft;
    items.Add('Contiene');
    items.Add('No contiene');
    items.Add('Comienza por');
    items.Add('Termina en');
    items.Add('No es exactamente');
    items.Add('Mayor');
    items.Add('Mayor o igual');
    items.Add('Menor');
    items.Add('Menor o igual');
    items.Add('Igual');
    items.Add('Diferente');
    Style := csDropDownList;

  end;
end;

function TFMFiltrar.DameCondicion(Con: string): string;
begin
  result := '';

  if( Con = 'Contiene') or (Con = 'Comienza por') or (Con = 'Termina en') then
    result := ' Like ';

  if Con = 'No contiene' then
    result := 'Not Like ';

  if Con = 'Igual' then
    result := ' = ';

  if Con = 'Mayor' then
    result := ' > ';

  if Con = 'Menor' then
    result := ' < ';

  if Con = 'Mayor o igual' then
    result := ' >= ';

  if Con = 'Menor o igual' then
    result := ' <= ';

  if Con = 'Diferente' then
    result := ' <> ';
end;


// Crea Panel del item
function TFMFiltrar.CreaPanelLPI: TPanel;
begin
  result := TPanel.Create(nil);
  with result do
  begin
    if SBFondo.ControlCount = 0 then
    begin
      Tag := 0;
      top := 9;
    end
    else
    begin
      Tag := SBFondo.ControlCount;
      top := SBFondo.Controls[SBFondo.ControlCount - 1].top + 27;
    end;
    Width := 575;
    Parent := SBFondo;
  end;
end;

// combo condicion and or
procedure TFMFiltrar.CreaComboCondicion(Padre: TGroupBox);
begin
  var
  c := TComboBox.Create(Padre);
  with c do
  begin
    Tag := Padre.Tag;
    top := 5;
    c.Name := 'CBand' + Tag.ToString;
    Parent := Padre;
    items.Add('Y');
    items.Add('O');
    ItemIndex := 0;
    Width := 40;
    Left := 8;
    Style := csDropDownList;
  end;
end;

// rectangulo del item
function TFMFiltrar.CreaRecItem(Padre: TGroupBox): TPanel;
begin
  result := TPanel.Create(Padre);
  with result do
  begin
    Tag := Padre.Tag;
    top := 30;
    result.Name := 'RecItem' + Tag.ToString;
    Parent := Padre;
    Width := 529;
    Height := 32;
    Left := 8;
  end;
end;

// combo columnas de la tabla
procedure TFMFiltrar.CreaComboColumnas(Padre: TPanel);
begin
  var
  CBc := TComboBox.Create(Padre);
  with CBc do
  begin
    Tag := Padre.Tag;
    CBc.Name := 'CBColumnas' + IntToStr(Tag);
    Parent := Padre;
    ItemIndex := 0;
    Width := 145;
    Margins.Bottom := 5;
    Margins.Left := 5;
    Margins.top := 5;
    Align := alLeft;
    LlenaColumnas(CBc);
    OnCloseUp := ColumnasCloseUp;
    Style := csDropDownList;
    Sorted := true;
  end;
end;

procedure TFMFiltrar.BTAplicarFiltroClick(Sender: TObject);
begin
  if Assigned(Grid) and Assigned(Grid.DataSource.DataSet) then
  begin
    with Grid.DataSource.DataSet do
    begin
      filtered := False;
      var
      s := DameFiltro;
      filter := s;
      filtered := True;
    end;
  end;
   Close;
end;

procedure TFMFiltrar.BTQuitarFiltroClick(Sender: TObject);
begin
   if Assigned(Grid) and Assigned(Grid.DataSource.DataSet) then
  begin
    with Grid.DataSource.DataSet do
    begin
      filtered := False;
      LimpiarItems;
      InsertaItem;
    end;
  end;
  Close;
end;

procedure TFMFiltrar.ColumnasCloseUp(Sender: TObject);
var NombreCampo: String;
begin
  NombreCampo := string((Sender as TComboBox).Items.Objects[(Sender as TComboBox).ItemIndex]);
  AgregaEdit((Sender as TComboBox).Parent as TPanel, DameTipoColumna(NombreCampo));

 { AgregaEdit((Sender as TComboBox).Parent as TPanel,
    DameTipoColumna((Sender as TComboBox).items[(Sender as TComboBox).ItemIndex]));  }
end;

function TFMFiltrar.DameTipoColumna(Columna: string): string;
var
  i: Integer;
begin
  result := '';
  If Assigned(Grid) then
  begin
    for i := 0 to Grid.DataSource.DataSet.FieldCount - 1 do
      if Grid.DataSource.DataSet.Fields[i].FieldName = Columna then
      begin
        result := Grid.DataSource.DataSet.Fields[i].ClassName;
        exit
      end;
  end;
end;

procedure TFMFiltrar.AgregaEdit(Padre: TPanel; Tipo: String);
Var
  E: TEdit;
  c, c1: TComponent;
  N: TNumberBox;
  F: TDateTimePicker;

begin
  // Si hay edit  creado lo elimina
  c := Padre.FindComponent('Edit' + Padre.Tag.ToString);
  if Assigned(c) then
    FreeAndNil(c);

  // Busco el combo de condiciones
  c1 := Padre.FindComponent('CBcondicion' + Padre.Tag.ToString);


  // crea el Edit

  // string
  if Tipo = 'TStringField' then
  begin
    if Assigned(c1) then
      (c1 as TComboBox).ItemIndex := 0;
    E := TEdit.Create(Padre);
    with E do
    begin
      E.Name := 'Edit' + Padre.Tag.ToString;
      Parent := Padre;
      Margins.Bottom := 5;
      Margins.Left := 10;
      Margins.Right := 10;
      Margins.top := 5;
      Left := 325;
      Align := alclient;
      Text := '';
    end;
  end;

  // Fecha
  if Tipo = 'TSQLTimeStampField' then
  begin
    if Assigned(c1) then
      (c1 as TComboBox).Text := 'Igual';
    F := TDateTimePicker.Create(Padre);
    with F do
    begin
      F.Name := 'Edit' + Padre.Tag.ToString;
      Parent := Padre;
      Margins.Bottom := 5;
      Margins.Left := 10;
      Margins.Right := 10;
      Margins.top := 5;
      Left := 325;
      Align := alclient;
    end;
  end;

  // Numero Entero
  if (Tipo = 'TSmallintField') or (Tipo = 'TIntegerField')  then
  begin
    if Assigned(c1) then
      (c1 as TComboBox).Text := 'Igual';
    N := TNumberBox.Create(Padre);
    with N do
    begin
      MaxValue := 100000000;
      N.Name := 'Edit' + Padre.Tag.ToString;
      // Padre.TagObject := N; // guardo en el rectangulo del itel el nombre del edit
      Parent := Padre;
      Margins.Bottom := 5;
      Margins.Left := 10;
      Margins.Right := 10;
      Margins.top := 5;
      Left := 325;
      Align := alclient;
      Text := '0';
    end;
  end;
end;

// Boton Adicionar
procedure TFMFiltrar.CreaBtAdicionar(Padre: TPanel);
begin
  var
  BTMm := TSpeedButton.Create(Padre);
  with BTMm do
  begin
    Parent := Padre;
    Width := 22;
    Height := 22;
    Margins.Bottom := 5;
    Margins.Right := 10;
    Margins.top := 5;
    Align := alRight;
    OnClick := InsertaItemBtm;
    Caption := '+';
  end;
end;

procedure TFMFiltrar.InsertaItemBtm(Sender: TObject);
begin
  InsertaItem;
end;

function TFMFiltrar.DameFiltro: string;
var
  GBItem: TGroupBox;
  RecItem: TPanel;
  CBand, CBCondicion, CBColumnas: TComboBox;
  ObjClase: string;
  Columna, ColumnaMayuscula, Condicion, AndTexto: string;
  EditNumerico: TNumberBox;
  EditTexto: TEdit;
  ValorTexto: string;
  Filtro,NombreCampo: string;
begin
  Filtro := '';

  for var i := 0 to SBFondo.ControlCount - 1 do
  begin
    // GroupBox del Item
    GBItem := SBFondo.Controls[i] as TGroupBox;
    if GBItem = nil then
      Continue;

    // Rectángulo del Item
    RecItem := GBItem.FindChildControl('RecItem' + GBItem.Tag.ToString) as TPanel;
    if RecItem = nil then
      Continue;

    // AND / OR
    CBand := GBItem.FindComponent('CBand' + GBItem.Tag.ToString) as TComboBox;
    if (CBand = nil) or (CBand.ItemIndex < 0) then
      Continue;

    if CBand.ItemIndex = 0 then
      AndTexto := ' AND '
    else
      AndTexto := ' OR ';

    // Columnas
    CBColumnas := RecItem.FindComponent('CBColumnas' + GBItem.Tag.ToString) as TComboBox;
    if (CBColumnas = nil) or (CBColumnas.ItemIndex < 0) then
      Continue;

     NombreCampo := string(CBColumnas.Items.Objects[CBColumnas.ItemIndex]);

     Columna := ' ' + NombreCampo + ' ';
     ColumnaMayuscula := ' UPPER(' + NombreCampo + ') ' ;

   { Columna := ' ' + CBColumnas.Items[CBColumnas.ItemIndex] + ' ';
    ColumnaMayuscula := ' UPPER(' + CBColumnas.Items[CBColumnas.ItemIndex] + ') '; }

    // Condición
    CBCondicion := RecItem.FindComponent('CBCondicion' + GBItem.Tag.ToString) as TComboBox;
    if (CBCondicion = nil) or (CBCondicion.ItemIndex < 0) then
      Continue;

    Condicion := DameCondicion(CBCondicion.Text);

    // Tipo de columna
    ObjClase := DameTipoColumna(Trim(Columna));

    ValorTexto := '';
    if (uppercase(ObjClase) = 'TSMALLINTFIELD') or (uppercase(ObjClase) = 'TINTEGERFIELD')  then
    begin
      EditNumerico := RecItem.FindComponent('Edit' + GBItem.Tag.ToString) as TNumberBox;
      if (EditNumerico = nil) or (EditNumerico.Text = '') then
        Continue;
      ValorTexto := ' ' + EditNumerico.Text + ' ';
     if trim(Condicion) = 'Like'  then
      ValorTexto := ' ' + QuotedStr('%' + Trim(EditNumerico.Text) + '%') + ' ';
    end
    else if ObjClase = 'TStringField' then
    begin
      EditTexto := RecItem.FindComponent('Edit' + GBItem.Tag.ToString) as TEdit;
      if (EditTexto = nil) or (Trim(EditTexto.Text) = '') then
        Continue;

      if Condicion = ' = ' then
        ValorTexto := ' ' + QuotedStr(UpperCase(Trim(EditTexto.Text))) + ' '
      else
      begin
        if CBCondicion.Text = 'Comienza por' then
          ValorTexto := ' ' + QuotedStr(UpperCase(Trim(EditTexto.Text)) + '%') + ' '
        else if CBCondicion.Text = 'Termina en' then
          ValorTexto := ' ' + QuotedStr('%' + UpperCase(Trim(EditTexto.Text))) + ' '
        else
          ValorTexto := ' ' + QuotedStr('%' + UpperCase(Trim(EditTexto.Text)) + '%') + ' ';
      end;
    end
    else
      Continue; // Tipo no soportado



    // Concatenar
    if i <> 0 then
      Filtro := Filtro + AndTexto;



    Filtro := Filtro + ColumnaMayuscula + Condicion + ValorTexto;

    // No liberar aquí; solo limpiar variables si quieres
    GBItem := nil;
    RecItem := nil;
    CBand := nil;
    CBColumnas := nil;
    CBCondicion := nil;
    EditNumerico := nil;
    EditTexto := nil;
    ObjClase := '';
    ValorTexto := '';
    ColumnaMayuscula := '';
  end;

  Result := Filtro;
end;

end.
