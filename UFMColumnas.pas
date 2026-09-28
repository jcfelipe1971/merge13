unit UFMColumnas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.DBGrids;

type
  TFMColumnas = class(TForm)
    PPrincipal: TPanel;
    PCabecera: TPanel;
    LCabecera: TLabel;
    BAceptar: TButton;
    LVColumnas: TListView;
    CBSeleccionarTodo: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure LVColumnasMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure CBSeleccionarTodoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  var
    Grid: TDBGrid;
  end;

var
  FMColumnas: TFMColumnas;

implementation

{$R *.dfm}

uses UDMMain;

procedure TFMColumnas.CBSeleccionarTodoClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to LVColumnas.Items.Count - 1 do
  begin
    LVColumnas.Items[i].Checked := CBSeleccionarTodo.Checked;
    Grid.Columns[Integer(LVColumnas.Items[i].data)].Visible := LVColumnas.Items[i].Checked;
  end;
end;

procedure TFMColumnas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFMColumnas.FormShow(Sender: TObject);
var
  ListItem: TListItem;
  Campos: string;
begin
  LVColumnas.Items.Clear;
  if Assigned(Grid) then
    for var i := 0 to Grid.Columns.Count - 1 do
    begin
      Campos := DMMain.DameCampos(Grid);
      if pos(trim(Grid.Columns[i].FieldName), Campos) > 0 then
      begin
        ListItem := LVColumnas.Items.Add;
        ListItem.Checked := Grid.Columns[i].Visible;
        ListItem.Caption := '   ' + Grid.Columns[i].FieldName;
        ListItem.data := Pointer(Grid.Columns[i].Index);
      end;
      Next;
    end;
end;

procedure TFMColumnas.LVColumnasMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Item: TListItem;
  HitTest: THitTests;
begin
  HitTest := LVColumnas.GetHitTestInfoAt(X, Y);
  if htOnStateIcon in HitTest then
  begin
    Item := LVColumnas.GetItemAt(X, Y);
    if Assigned(Item) then
      Grid.Columns[Integer(Item.data)].Visible := Item.Checked;
  end;
end;

end.
