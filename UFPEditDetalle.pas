unit UFPEditDetalle;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFPEdit, Data.DB, Vcl.DBCtrls, Vcl.ToolWin, Vcl.ComCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Menus, Vcl.StdCtrls, System.Actions,
  Vcl.ActnList, Vcl.Buttons, System.ImageList, Vcl.ImgList;

type
  TFPEditDetalle = class(TFPEdit)
    DSDetalle: TDataSource;
    PDetalle: TPanel;
    TBDetalle: TToolBar;
    NavDetalle: TDBNavigator;
    DBGFDetalle: TDBGrid;
    Splitter1: TSplitter;
    PMDetalle: TPopupMenu;
    MIConfigurarColumnasDetalle: TMenuItem;
    MenuItem2: TMenuItem;
    MICopiarDetalle: TMenuItem;
    PTotalesDetalle: TPanel;
    CBTotalesDetalle: TComboBox;

    procedure MIConfigurarColumnasDetalleClick(Sender: TObject);
    procedure MICopiarDetalleClick(Sender: TObject);
    procedure CBTotalesDetalleChange(Sender: TObject);
    procedure DBGDetalleTitleClick(Column: TColumn);
    procedure DBGMainMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

  private
  public
    ColumnaDetalleSeleccionada: string;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

  protected
    // ← ESTO ES LO QUE ARREGLA EL PROBLEMA
    procedure ListBoxCheckClick(Sender: TObject); override;
    procedure TodosClick(Sender: TObject); override;
    procedure ComplejosClick(Sender: TObject); override;
    procedure ShowFilterPopup(ADataCol, AGridCol, X, Y: Integer); override;
  published
  end;

var
  FPEditDetalle: TFPEditDetalle;

implementation

uses UUtiles, System.Threading;
{$R *.dfm}

constructor TFPEditDetalle.Create(AOwner: TComponent);
begin
  inherited;

  NavDetalle.Hints.Text := 'Primero'#13'Anterior'#13'Siguiente'#13'Último'#13 +
    'Insertar'#13'Eliminar'#13'Editar'#13'Guardar'#13'Cancelar'#13 +
    'Refrescar'#13'Aplicar Cambios'#13'Cancelar Cambios';
end;

destructor TFPEditDetalle.Destroy;
begin
  inherited;
end;

procedure TFPEditDetalle.DBGMainMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;   // ← muy importante
end;

procedure TFPEditDetalle.ShowFilterPopup(ADataCol, AGridCol, X, Y: Integer);
begin
  inherited;   // fuerza que use la versión base pero con VMT correcta
end;

procedure TFPEditDetalle.ListBoxCheckClick(Sender: TObject);
begin
  inherited;   // ← ESTA LÍNEA ES CLAVE para que funcione en Facturas
end;

procedure TFPEditDetalle.TodosClick(Sender: TObject);
begin
  inherited;
end;

procedure TFPEditDetalle.ComplejosClick(Sender: TObject);
begin
  inherited;
end;

// Resto de procedimientos (sin cambios)
procedure TFPEditDetalle.CBTotalesDetalleChange(Sender: TObject);
var
  i, MaxWidth, TempWidth: Integer;
begin
  MaxWidth := 0;
  for i := 0 to CBTotalesDetalle.Items.Count - 1 do
  begin
    TempWidth := CBTotalesDetalle.Canvas.TextWidth(CBTotalesDetalle.Items[i]);
    if TempWidth > MaxWidth then MaxWidth := TempWidth;
  end;
  CBTotalesDetalle.Width := MaxWidth + GetSystemMetrics(SM_CXVSCROLL) + 8;
end;

procedure TFPEditDetalle.DBGDetalleTitleClick(Column: TColumn);
begin
  inherited;   // ← buena práctica
  ColumnaDetalleSeleccionada := Column.FieldName;
  // ... resto de tu código igual ...
end;

procedure TFPEditDetalle.MIConfigurarColumnasDetalleClick(Sender: TObject);
begin
  inherited;
  if TPopupMenu(TMenuItem(Sender).GetParentComponent).PopupComponent is TDBGrid then
    MuestraColumnas(TPopupMenu(TMenuItem(Sender).GetParentComponent).PopupComponent as TDBGrid);
end;

procedure TFPEditDetalle.MICopiarDetalleClick(Sender: TObject);
begin
  inherited;
  TTask.Run(procedure
  begin
    TThread.Synchronize(nil, procedure
    begin
      CopyDBGridToClipboard(TDBGrid(TPopupMenu(TMenuItem(Sender).GetParentComponent).PopupComponent));
    end);
  end);
end;

end.
