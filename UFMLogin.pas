unit UFMLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFMLogin = class(TForm)
    LUsuario: TLabel;
    LClave: TLabel;
    EUsuario: TEdit;
    EClave: TEdit;
    BCancelar: TButton;
    BAceptar: TButton;
    PCabecera: TPanel;
    Shape1: TShape;
    PPrincipal: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BAceptarClick(Sender: TObject);
    procedure EClaveKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMLogin: TFMLogin;

implementation

uses UEntorno, UDMMain, UFMain, UUtiles;
{$R *.dfm}

procedure TFMLogin.BAceptarClick(Sender: TObject);
begin
  Entorno.Usuario := EUsuario.Text;
  Entorno.Password := EClave.Text;
end;

procedure TFMLogin.EClaveKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    BAceptar.Click;
end;

procedure TFMLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFMLogin.FormCreate(Sender: TObject);
begin
  EUsuario.Text := Entorno.Usuario;
  EClave.Text := Entorno.Password;

{$IFDEF Debug}
  EUsuario.Text := 'ADMIN';
  EClave.Text := 'a';
{$ENDIF}
end;

end.
