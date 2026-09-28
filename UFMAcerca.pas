unit UFMAcerca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, frSVGGraphic, Vcl.ComCtrls, Vcl.Grids, System.Skia, Vcl.Skia,
  Vcl.Imaging.jpeg;

type
  TFMAcerca = class(TForm)
    PageControl1: TPageControl;
    TSAcerca: TTabSheet;
    TSDeclaracion: TTabSheet;
    REDeclResponsable: TRichEdit;
    Image3: TImage;
    Button1: TButton;
    GroupBox1: TGroupBox;
    Image2: TImage;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    Label1: TLabel;
    LCorreo: TLabel;
    LLicencia: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    LBLTNombreProducto: TLabel;
    Label5: TLabel;
    LBLTVersionEXE: TLabel;
    Label3: TLabel;
    LBLTEmpresa: TLabel;
    Label6: TLabel;
    LEntrada: TLabel;
    LIP: TLabel;
    Label8: TLabel;
    Label7: TLabel;
    LIPPublica: TLabel;
    LTMACServidor: TLabel;
    Label10: TLabel;
    Label9: TLabel;
    Image5: TImage;
    Label11: TLabel;
    Label12: TLabel;
    SGActualizaciones: TStringGrid;
    Label14: TLabel;
    LVersionBD: TLabel;
    Label15: TLabel;
    LCopyRight: TLabel;
    Image4: TImage;
    Panel1: TPanel;
    Image1: TImage;
    Image6: TImage;
    Label13: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LlenaTexto;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMAcerca: TFMAcerca;
  VersionBaseDeDatos, Empresa, Copyright, NombreProducto:string;

implementation

uses UUtiles, UDMMain,UEntorno;
{$R *.dfm}

procedure TFMAcerca.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TFMAcerca.FormShow(Sender: TObject);
var Correo,Licencia:string;
begin
  DMMain.DameEmailLicencia(Correo,Licencia);
  LCorreo.Caption := Correo;
  LLicencia.Caption := Licencia;
  LlenaTexto;
  LEntrada.Caption := Entorno.Entrada.ToString;
  LIP.Caption := DameIPLocal;
 // LIPPublica.Caption := DameIPPublica;
  LTMACServidor.Caption := DameMACLocal ;//+ ' (' + DMMain.IP_Servidor + ')';
  DMMain.DameActualizaciones(SGActualizaciones);
  DMMain.DatosVersion(VersionBaseDeDatos, Empresa, Copyright, NombreProducto, True);
  LVersionBD.Caption := VersionBaseDeDatos;
  LBLTVersionEXE.Caption := Entorno.VersionMaxFactu + ' ' + Entorno.FechaVersionMaxFactu ;
  LCopyRight.Caption := Copyright;
end;

procedure TFMAcerca.LlenaTexto;
begin
  // Obtengo version y fecha de revision
  try
    with DameQueryRO(nil, DMMain.DB) do
    begin
      try
        SQL.Add(' SELECT DECL_RESPONSABLE, ');
        SQL.Add('        (SELECT FIRST 1 FECHA ');
        SQL.Add('         FROM SYS_REVISIONES ');
        SQL.Add('         ORDER BY FECHA DESC) FECHA ');
        SQL.Add(' FROM SYS_CONSTANTES ');
        Open;
        REDeclResponsable.Lines.Assign(FieldByName('DECL_RESPONSABLE'));
        REDeclResponsable.Lines.Text := StringReplace(REDeclResponsable.Lines.Text, '@fecha',
          FormatDateTime('dd/mm/yyyy', FieldByName('FECHA').AsDateTime), []);
        Close;
      finally
        Free;
      end;
    end;
  except
  end;

  // Reemplazo variables en el texto (si existen)
  REDeclResponsable.Lines.Text := StringReplace(REDeclResponsable.Lines.Text, '@sistema',
    LBLTNombreProducto.Caption, []);
  REDeclResponsable.Lines.Text := StringReplace(REDeclResponsable.Lines.Text, '@identificador', '01', []);
  REDeclResponsable.Lines.Text := StringReplace(REDeclResponsable.Lines.Text, '@version', LBLTVersionEXE.Caption, []);
  REDeclResponsable.Lines.Text := StringReplace(REDeclResponsable.Lines.Text, '@razon_social', LBLTEmpresa.Caption, []);
  REDeclResponsable.Lines.Text := StringReplace(REDeclResponsable.Lines.Text, '@nif', 'B67287797', []);
  REDeclResponsable.Lines.Text := StringReplace(REDeclResponsable.Lines.Text, '@direccion',
    'Diputacion, 211 - 08011 Barcelona', []);
  REDeclResponsable.Lines.Text := StringReplace(REDeclResponsable.Lines.Text, '@lugar', 'Barcelona', []);
  REDeclResponsable.Lines.Text := StringReplace(REDeclResponsable.Lines.Text, '@email', 'info@delfosonline.cat', []);
  REDeclResponsable.Lines.Text := StringReplace(REDeclResponsable.Lines.Text, '@telefono', '+34 66 44 73 102', []);
  REDeclResponsable.Lines.Text := StringReplace(REDeclResponsable.Lines.Text, '@whatsapp', '', []);
  REDeclResponsable.Lines.Text := StringReplace(REDeclResponsable.Lines.Text, '@web', '', []);
end;

end.
