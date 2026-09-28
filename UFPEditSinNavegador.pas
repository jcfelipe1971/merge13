unit UFPEditSinNavegador;

// Base de todas las ventanas de Merge13 (en Merge: TFPEditSinNavegador).
// Estilo MaxFactu: barra superior (TBMain), panel principal (PMain) y barra inferior de acciones (TBActions)
// con un botón por categoría de las acciones de ALMain. Se puede mostrar en ventana o dentro de una pestaña.

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.Generics.Collections,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ToolWin, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Menus, System.Actions, Vcl.ActnList;

type
  TFPEditSinNavegador = class(TForm)
    PMain: TPanel;
    TBMain: TToolBar;
    TBActions: TPanel;
    ALMain: TActionList;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FAccionesCargadas: Boolean;
  protected
    function ExisteBTCategoria(Nombre: string): TButton;
    procedure BTClick(Sender: TObject);
  public
    SalirConEscapeHabilitado: Boolean;
    procedure SalirConEscape(Habilitado: Boolean = True);
    procedure CargaAcciones;
  end;

var
  FPEditSinNavegador: TFPEditSinNavegador;

implementation

{$R *.dfm}

uses UUtilGuardaConfiguracion;

procedure TFPEditSinNavegador.FormCreate(Sender: TObject);
begin
  SalirConEscapeHabilitado := False;
end;

procedure TFPEditSinNavegador.FormShow(Sender: TObject);
begin
  if not FAccionesCargadas then
  begin
    FAccionesCargadas := True;
    CargaAcciones;
    CargaIniFormulario(Self);
  end;
end;

procedure TFPEditSinNavegador.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GuardaFormulario(Self);
  Action := caFree;
end;

procedure TFPEditSinNavegador.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_ESCAPE) and SalirConEscapeHabilitado then
    Close;
end;

procedure TFPEditSinNavegador.SalirConEscape(Habilitado: Boolean);
begin
  SalirConEscapeHabilitado := Habilitado;
end;

function TFPEditSinNavegador.ExisteBTCategoria(Nombre: string): TButton;
begin
  Result := nil;
  for var i := 0 to TBActions.ControlCount - 1 do
    if (TBActions.Controls[i] is TButton) and (TBActions.Controls[i].Name = Nombre) then
      Result := TBActions.Controls[i] as TButton;
end;

procedure TFPEditSinNavegador.BTClick(Sender: TObject);
begin
  (Sender as TButton).PopupMenu.Popup((Sender as TButton).ClientToScreen(Point(0, (Sender as TButton).Height)).X,
    (Sender as TButton).ClientToScreen(Point(0, (Sender as TButton).Height)).Y);
end;

procedure TFPEditSinNavegador.CargaAcciones;
// Igual que MaxFactu: un botón por categoría de acción en la barra inferior, con sus acciones en un menú
var
  BT: TButton;
  CategoryMenu, ListadosPopup: TPopupMenu;
  MenuItem, SubMenuItem: TMenuItem;
  Categoria, NombreBT: string;
  i, j: Integer;
  ListaEditar: TList<TMenuItem>;
begin
  CategoryMenu := nil;
  ListadosPopup := nil;
  ListaEditar := TList<TMenuItem>.Create;
  try
    for i := 0 to ALMain.ActionCount - 1 do
    begin
      Categoria := ALMain.Actions[i].Category;
      if Categoria = '' then
        Continue;
      if Categoria = 'Editar' then
      begin
        SubMenuItem := TMenuItem.Create(Self);
        SubMenuItem.Action := ALMain.Actions[i];
        ListaEditar.Add(SubMenuItem);
        Continue;
      end;
      NombreBT := 'BT';
      for var k := 1 to Length(Categoria) do
        if CharInSet(Categoria[k], ['A'..'Z', 'a'..'z', '0'..'9', '_']) then
          NombreBT := NombreBT + Categoria[k];
      BT := ExisteBTCategoria(NombreBT);
      if BT = nil then
      begin
        CategoryMenu := TPopupMenu.Create(Self);
        if Categoria = 'Listados' then
          ListadosPopup := CategoryMenu;
        MenuItem := TMenuItem.Create(CategoryMenu);
        MenuItem.Action := ALMain.Actions[i];
        CategoryMenu.Items.Add(MenuItem);
        BT := TButton.Create(Self);
        BT.Name := NombreBT;
        BT.Caption := Categoria + '  ' + #$25BC;
        BT.Parent := TBActions;
        BT.Align := alLeft;
        BT.AlignWithMargins := True;
        BT.Width := Canvas.TextWidth(BT.Caption) + 24;
        BT.PopupMenu := CategoryMenu;
        BT.OnClick := BTClick;
      end
      else
      begin
        MenuItem := TMenuItem.Create(BT.PopupMenu);
        MenuItem.Action := ALMain.Actions[i];
        BT.PopupMenu.Items.Add(MenuItem);
      end;
    end;
    if Assigned(ListadosPopup) and (ListaEditar.Count > 0) then
    begin
      MenuItem := TMenuItem.Create(ListadosPopup);
      MenuItem.Caption := 'Editar Listados';
      ListadosPopup.Items.Add(MenuItem);
      for j := 0 to ListaEditar.Count - 1 do
        MenuItem.Add(ListaEditar[j]);
    end;
    TBActions.Visible := TBActions.ControlCount > 0;
  finally
    ListaEditar.Free;
  end;
end;

end.
