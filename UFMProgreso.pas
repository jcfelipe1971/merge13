unit UFMProgreso;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  System.ImageList, Vcl.ImgList, Data.DB, UDMAdjuntos, UDMMain,
  Vcl.ComCtrls;

type
  TFMProgreso = class(TForm)
    PPrincipal: TPanel;
    PCabecera: TPanel;
    Imagen: TImage;
    LCabecera: TLabel;
    ILIconos: TImageList;
    ODAbrir: TOpenDialog;
    ILItems: TImageList;
    PB: TProgressBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function DameIcono(Nombre: string): integer;
    procedure MostrarProgreso(Indice, Total: Integer; const Cabecera: string);

  var
    ID: integer;
    TIPO: string;
  end;

var
  FMProgreso: TFMProgreso;
  DM: TDMAdjuntos;

implementation

uses UFMain, UEntorno, ShellAPI, CommCtrl, ShlObj, ActiveX, ComObj, UUtiles;
{$R *.dfm}

procedure TFMProgreso.FormCreate(Sender: TObject);
begin
  // self.StyleElements := FMain.StyleElements;
  DM := TDMAdjuntos.Create(Self);
  DragAcceptFiles(Handle, True);
end;

procedure TFMProgreso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFMProgreso.MostrarProgreso(Indice, Total: Integer; const Cabecera: string);
begin
  LCabecera.Caption := Cabecera;
  PB.Max := Total;
  PB.Position := Indice;
  Application.ProcessMessages;
end;


// Funcion que extrae el icono de windows asociado al Fichero escogido
function TFMProgreso.DameIcono(Nombre: string): integer;
var
  FileInfo: SHFILEINFO;
  IconIndex: integer;
  Icon: TIcon;
begin
  result := -1;
  // Obtener el icono del fichero
  SHGetFileInfo(PChar(Nombre), 0, FileInfo, SizeOf(FileInfo), SHGFI_ICON or SHGFI_LARGEICON);
  // Crear un TIcon y asignar el HICON
  Icon := TIcon.Create;
  try
    Icon.Handle := FileInfo.hIcon;
    IconIndex := ILItems.AddIcon(Icon);
    result := IconIndex;
  finally
    Icon.Free;
  end;
  // Liberar el HICON
  DestroyIcon(FileInfo.hIcon);
end;



end.
