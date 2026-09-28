unit UFMMensajes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.ImageList, Vcl.ImgList, Vcl.Imaging.pngimage;

type
  TFMMensajes = class(TForm)
    BAceptar: TButton;
    BCancelar: TButton;
    PPrincipal: TPanel;
    PBotones: TPanel;
    PCabecera: TPanel;
    Imagen: TImage;
    LCabecera: TLabel;
    LTexto: TLabel;
    ILIconos: TImageList;
    TimerHablar: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TimerHablarTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMMensajes: TFMMensajes;
  FMensaje: TForm;
  Resultado: TModalResult;

implementation

uses UFMain,UUtiles;
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

procedure TFMMensajes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFMMensajes.FormCreate(Sender: TObject);
begin
  StyleElements := FMain.StyleElements;
end;

procedure TFMMensajes.FormShow(Sender: TObject);
begin
   TimerHablar.Enabled := True;
end;

procedure TFMMensajes.TimerHablarTimer(Sender: TObject);
begin
  TimerHablar.Enabled := False; // Solo una vez
 // if fmmai.co then

 // Hablar(LTexto.Caption); esto habla el mensaje
end;

end.
