unit UFMDatos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.ImageList, Vcl.ImgList, Vcl.Imaging.pngimage, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBCtrls, Vcl.Mask, UDMMain;

type
  TFMDatos = class(TForm)
    BAceptar: TButton;
    BCancelar: TButton;
    PPrincipal: TPanel;
    PBotones: TPanel;
    PCabecera: TPanel;
    Imagen: TImage;
    LCabecera: TLabel;
    ILIconos: TImageList;
    DBEDatos: TDBEdit;
    DBLCBDatos: TDBLookupComboBox;
    LDato: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BAceptarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    TituloDato,IDDato: string;
    procedure Inicializa(Consulta, MiListField, MiKeyField, ValorDefecto, CampoTitulo: string; Fecha: TDateTime);
  end;

var
  FMDatos: TFMDatos;
  FMensaje: TForm;
  Resultado: TModalResult;
  Q: TFDQuery;
  DS: TDataSource;
  CampoMostrar,CampoBuscar:string;

implementation

uses UFMain;
{$R *.dfm}
{ TODO : Los iconos deben ser de 64x64 }

{ Imagenes de Iconos
  Debería utilizar los tipos TMsgDlgType = (mtWarning, mtError, mtInformation, mtConfirmation, mtCustom);
  -1 : Sin imagen
  0 : Confirmacion
  1 : Atencion       [FALTA IMPLEMENTAR]
  2 : Error          [FALTA IMPLEMENTAR]
  3 : Informacion    [FALTA IMPLEMENTAR]
}

procedure TFMDatos.BAceptarClick(Sender: TObject);
begin
  TituloDato := DBEDatos.Text;
  if not VarIsNull(DBLCBDatos.KeyValue) and not VarIsEmpty(DBLCBDatos.KeyValue) then
    if Assigned(Q) then
     if Q.Locate(CampoBuscar,DBLCBDatos.KeyValue,[]) then
      IDDato := VarAsType(DBLCBDatos.KeyValue, varString);
  ModalResult := mrOk;
end;

procedure TFMDatos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  If Assigned(Q) then
    Q.Free;
  If Assigned(DS) then
    DS.Free;

  Action := caFree;
end;

procedure TFMDatos.FormCreate(Sender: TObject);
begin
  StyleElements := FMain.StyleElements;
end;

procedure TFMDatos.Inicializa(Consulta, MiListField, MiKeyField, ValorDefecto, CampoTitulo: string; Fecha: TDateTime);

begin
  TituloDato := '';
  IDDato := '';
  CampoMostrar := CampoTitulo;
  CampoBuscar := MiKeyField;
  if (Consulta <> '') and (MiListField <> '') and (MiKeyField <> '') then
  begin
    Q := TFDQuery.Create(nil);
    DS := TDataSource.Create(nil);
    DS.DataSet := Q;
    with Q do
    begin
      Connection := DMMain.DB;
      sql.Text := Consulta;
      try
        open;
        DBLCBDatos.ListSource := DS;
        DBLCBDatos.ListField := MiListField;
        DBLCBDatos.KeyField := MiKeyField;

        DBEDatos.DataSource := DS;
        DBEDatos.DataField := CampoTitulo;

        if (ValorDefecto <> '') then
          DBLCBDatos.KeyValue := ValorDefecto;
      finally
        // Free;
      end;
    end;
  end
  else
    Exit;
end;

end.
