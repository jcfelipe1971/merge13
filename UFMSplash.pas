unit UFMSplash;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.jpeg,
  Vcl.StdCtrls, Vcl.Themes, Vcl.Imaging.pngimage, Vcl.ComCtrls;

type
  TFMSplash = class(TForm)
    Image1: TImage;
    Panel1: TPanel;
    Panel2: TPanel;
    Shape1: TShape;
    LMax: TLabel;
    Shape2: TShape;
    Label2: TLabel;
    LVersionMaxFactu: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    LEmpresa: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Shape3: TShape;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    LinkLabel1: TLinkLabel;
    LinkLabel2: TLinkLabel;
    LinkLabel3: TLinkLabel;
    Label12: TLabel;
    LLicencia: TLabel;
    Progreso: TProgressBar;
    Shape4: TShape;
    Shape5: TShape;
    Label14: TLabel;
    LFicherosCargando: TLabel;
    PNLInformacion: TPanel;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ConfiguraProgreso(MaxPosicion: integer);
    procedure ActualizaProgreso(Texto: string; Posicion: integer);
  end;

var
  FMSplash: TFMSplash;

implementation

uses UEntorno,udmmain;
{$R *.dfm}

procedure TFMSplash.ActualizaProgreso(Texto: string; Posicion: integer);
begin
  Progreso.Position := Posicion;
  LFicherosCargando.Caption := Texto;
  Application.ProcessMessages;
end;

procedure TFMSplash.ConfiguraProgreso(MaxPosicion: integer);
begin
  Progreso.Max := MaxPosicion;
  Progreso.Position := 0;
end;

procedure TFMSplash.FormCreate(Sender: TObject);
begin
  if Entorno.Estilo > '' then
    TStyleManager.SetStyle(Entorno.Estilo);

  LVersionMaxFactu.Caption := Entorno.VersionMaxFactu;
  LEmpresa.Caption :=  LeeDatoIni('Datos', 'TituloEmpresa','');
  Llicencia.Caption :=  LeeDatoIni('Datos', 'Licencia','');


{$IFDEF Debug}
  // Evito que se posiciones sobre mensajes de error al iniciar la aplicacion
  Position := poDefault;
  Top := 0;
  Left := 0;
{$ENDIF}
end;

end.
