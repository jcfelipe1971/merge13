unit UFMBuscar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, FireDAC.Comp.Client, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, Vcl.DBCtrls, UEntorno,UDMMain;

type
  TFMBuscar = class(TForm)
    EBusqueda: TEdit;
    DBGrid: TDBGrid;
    btnAceptar: TButton;
    btnCancelar: TButton;
    TimerBusqueda: TTimer;
    DS: TDataSource;
    FDQueryBuscar: TFDQuery;
    procedure TimerBusquedaTimer(Sender: TObject);
    procedure EBusquedaChange(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EBusquedaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FTabla: string;
    FCampos: TArray<string>;
    FFiltroEntorno: string;
    FSubConsulta: String;
    FValor:Variant;
    FCampoBuscar, FCampoDevolver:string;
    procedure EjecutarBusqueda;
  public
    { Public declarations }
    procedure ConfigurarBusqueda(const DataS: TDataSource; const Tabla, CampoBuscar,CampoDevolver: string; const Campos: TArray<string>;
  const Valor: Variant; FiltroEntorno, SubConsulta: string);
  end;

var
  FMBuscar: TFMBuscar;

implementation

{$R *.dfm}

procedure TFMBuscar.EjecutarBusqueda;
var
  SQL, WhereClause, Campo: string;
begin
  // Construir WHERE clause para todos los campos
  WhereClause := '';
  for Campo in FCampos do
  begin
    if WhereClause <> '' then
      WhereClause := WhereClause + ' OR ';
    WhereClause := WhereClause + Format('UPPER(%s) LIKE UPPER(''%%%s%%'')', [Campo, EBusqueda.Text]);
  end;

  if FFiltroEntorno = '' then
    SQL := Format('SELECT * FROM %s WHERE %s', [FTabla, WhereClause])
  else
    SQL := Format('SELECT * FROM %s WHERE ( %s', [FTabla, WhereClause]) + ')  AND ' + FiltroEntorno(FFiltroEntorno);

  if FSubConsulta <> '' then
    SQL := Format('SELECT * FROM %s WHERE ( %s', [FTabla, WhereClause]) + ')  AND ' + FSubConsulta;

  FDQueryBuscar.SQL.Text := SQL;
  try
    FDQueryBuscar.Open;
  except
    on E: Exception do
      ShowMessage('Error en la búsqueda: ' + E.Message);
  end;
end;

procedure TFMBuscar.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      btnCancelar.Click;
    VK_RETURN:
      btnAceptar.Click;
  end;
end;

procedure TFMBuscar.FormShow(Sender: TObject);
begin
  EBusqueda.SetFocus;
end;

procedure TFMBuscar.EBusquedaChange(Sender: TObject);
begin
  TimerBusqueda.Enabled := False;
  TimerBusqueda.Enabled := True;
end;

procedure TFMBuscar.EBusquedaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key in [VK_RETURN] then
    btnAceptar.Click;
end;

procedure TFMBuscar.TimerBusquedaTimer(Sender: TObject);
begin
  TimerBusqueda.Enabled := False;
  EjecutarBusqueda;
end;

procedure TFMBuscar.btnAceptarClick(Sender: TObject);
begin
  if Assigned(DS.DataSet) then
    if DBGrid.DataSource.DataSet.FindField(FCampoDevolver) <> nil then
    begin
      DS.DataSet.Edit;
      if DS.DataSet.State in [dsEdit, dsInsert] then
        DS.DataSet.FieldByName(FCampoBuscar).Value := DBGrid.DataSource.DataSet.FieldByName(FCampoDevolver).Value;
    end;
  Close;
end;

procedure TFMBuscar.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFMBuscar.ConfigurarBusqueda(const DataS: TDataSource; const Tabla, CampoBuscar,CampoDevolver: string; const Campos: TArray<string>;
  const Valor: Variant; FiltroEntorno, SubConsulta: string);
begin
  FTabla := Tabla;
  FCampoBuscar := CampoBuscar;
  FCampoDevolver := CampoDevolver;
  FCampos := Campos;
  FValor := Valor;
  FFiltroEntorno := FiltroEntorno;
  FSubConsulta := SubConsulta;
  DS := DataS;
  FDQueryBuscar.Connection := Dmmain.DB;;
  EBusqueda.Text := VarToStrDef(FValor,'');
end;


procedure TFMBuscar.DBGridDblClick(Sender: TObject);
begin
  if not FDQueryBuscar.IsEmpty then
    btnAceptar.Click;
end;

end.
