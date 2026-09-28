unit UDMAdjuntos;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, UDMMain;

type
  TDMAdjuntos = class(TDataModule)
    Ver_adjuntos: TFDQuery;
    Emp_adjuntos_relacion: TFDQuery;
    Emp_adjuntos: TFDQuery;
    TLocal: TFDTransaction;
    TUpdate: TFDTransaction;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMAdjuntos: TDMAdjuntos;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

procedure TDMAdjuntos.DataModuleCreate(Sender: TObject);
begin
  Ver_adjuntos.Open;
  Emp_adjuntos_relacion.Open;
  Emp_adjuntos.Open;
end;

procedure TDMAdjuntos.DataModuleDestroy(Sender: TObject);
begin
  Ver_adjuntos.Close;
  Emp_adjuntos_relacion.Close;
  Emp_adjuntos.Close;
end;

end.
