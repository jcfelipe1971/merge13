unit UFMEspera;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.ImageList, Vcl.ImgList, Vcl.Imaging.pngimage, Vcl.WinXCtrls,
  Vcl.ComCtrls;

type
  TFMEspera = class(TForm)
    PPrincipal: TPanel;
    ActivityIndicator1: TActivityIndicator;
    BCancelar: TButton;
    LCabecera: TLabel;
    ProgressBarDownload: TProgressBar;
    LabelGlobalSpeed: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMEspera: TFMEspera;
  FMensaje: TForm;
  Resultado: TModalResult;

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

procedure TFMEspera.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFMEspera.FormCreate(Sender: TObject);
begin
  StyleElements := FMain.StyleElements;
end;

end.
