unit UFMAdjuntos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  System.ImageList, Vcl.ImgList, Data.DB, UDMAdjuntos, UDMMain,
  Vcl.ComCtrls;

type
  TFMAdjuntos = class(TForm)
    PPrincipal: TPanel;
    PCabecera: TPanel;
    Imagen: TImage;
    LCabecera: TLabel;
    SBAgregar: TSpeedButton;
    ILIconos: TImageList;
    SBEliminar: TSpeedButton;
    ODAbrir: TOpenDialog;
    BAceptar: TButton;
    LVAdjuntos: TListView;
    ILItems: TImageList;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBAgregarClick(Sender: TObject);
    procedure BAceptarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SBEliminarClick(Sender: TObject);
    procedure LVAdjuntosDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure WMDropFiles(var Msg: TMessage); message WM_DROPFILES;
  public
    { Public declarations }
    procedure MostrarAdjuntos(Indice: integer; Ti, Cabecera: string);
    function DameIcono(Nombre: string): integer;
    procedure EliminaAdjunto;
    procedure AbrirArchivoEnWordDesdeMemoria(MemoryStream: TMemoryStream);

  var
    ID: integer;
    TIPO: string;
  end;

var
  FMAdjuntos: TFMAdjuntos;
  DM: TDMAdjuntos;

implementation

uses UFMain, UEntorno, ShellAPI, CommCtrl, ShlObj, ActiveX, ComObj, UUtiles;
{$R *.dfm}

procedure TFMAdjuntos.FormCreate(Sender: TObject);
begin
  // self.StyleElements := FMain.StyleElements;
  DM := TDMAdjuntos.Create(Self);
  DragAcceptFiles(Handle, True);
end;

procedure TFMAdjuntos.BAceptarClick(Sender: TObject);
begin
  FreeAndNil(DM);
  Close;
end;

procedure TFMAdjuntos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFMAdjuntos.LVAdjuntosDblClick(Sender: TObject);
var
  MemoryStream: TMemoryStream;
  BlobStream: TStream;
  TempFileName: string;
begin

  with DM.Ver_adjuntos do
  begin
    First;
    Locate('ID_ADJUNTO', IntToStr(integer(LVAdjuntos.Items[LVAdjuntos.ItemIndex].Data)), []);

    // FileName := FieldByName('nombre_archivo').AsString;
    MemoryStream := TMemoryStream.Create;
    try
      BlobStream := CreateBlobStream(FieldByName('ARCHIVO'), bmRead);
      try
        MemoryStream.CopyFrom(BlobStream, BlobStream.Size);
        MemoryStream.Position := 0;
      finally
        BlobStream.Free;
      end;
      TempFileName := IncludeTrailingPathDelimiter(GetEnvironmentVariable('TEMP')) +
        FieldByName('TITULO_ADJUNTO').asstring;
      MemoryStream.SaveToFile(TempFileName);
      ShellExecute(Handle, 'open', PWideChar(TempFileName), nil, nil, SW_SHOWNORMAL);
    finally
      MemoryStream.Free;
    end;
  end;
end;

procedure TFMAdjuntos.AbrirArchivoEnWordDesdeMemoria(MemoryStream: TMemoryStream);
var
  WordApp: Variant;
  Doc: Variant;
  TempFileName: string;
begin
  WordApp := CreateOleObject('Word.Application');
  WordApp.Visible := True;

  // Crear un documento temporal en Word
  Doc := WordApp.Documents.Add;

  // Insertar el contenido del MemoryStream en el documento
  TempFileName := IncludeTrailingPathDelimiter(GetEnvironmentVariable('TEMP')) + 'tempfile.docx';
  MemoryStream.SaveToFile(TempFileName);
  Doc.Content.InsertFile(TempFileName);

  // Eliminar el archivo temporal
  DeleteFile(TempFileName);
end;

procedure TFMAdjuntos.SBAgregarClick(Sender: TObject);
var
  UltimoCodigo: integer;
begin
  if ODAbrir.Execute then
  begin
    with DM.Emp_adjuntos do
    begin
      Open;
      UltimoCodigo := DMMain.ContadorGen('conta_adjunto');
      Append;
      FieldByName('NOMBRE').asstring := ODAbrir.FileName;
      TBlobField(FieldByName('ARCHIVO')).LoadFromFile(ODAbrir.FileName);
      FieldByName('TITULO').asstring := ExtractFileName(ODAbrir.FileName);
      FieldByName('ID').AsInteger := UltimoCodigo;
      FieldByName('EMPRESA').AsInteger := Entorno.Empresa;
      FieldByName('FECHA').AsDateTime := Now;
      FieldByName('REPOSITORIO').AsInteger := 2;
      FieldByName('WEB').AsInteger := 1;
      Post;
    end;
    with DM.Emp_adjuntos_relacion do
    begin
      Open;
      Append;
      FieldByName('ID').AsInteger := ID;
      FieldByName('TIPO').asstring := TIPO;
      FieldByName('EMPRESA').AsInteger := Entorno.Empresa;
      FieldByName('ID_ADJUNTO').AsInteger := UltimoCodigo;
      FieldByName('TITULO').asstring := ExtractFileName(ODAbrir.FileName);
      Post;
    end;
  end;
  MostrarAdjuntos(ID, TIPO, LCabecera.Caption);
end;

procedure TFMAdjuntos.SBEliminarClick(Sender: TObject);
begin

  if not(LVAdjuntos.SelCount > 0) then
    ShowMessage('Debe seleccionar para eliminar')
  else if MuestraMensaje('Eliminar', ' Eliminar el adjunto : ' + sLineBreak + LVAdjuntos.Selected.Caption, 'Cancelar',
    'Aceptar', 0) = 1 then
    EliminaAdjunto
end;

procedure TFMAdjuntos.EliminaAdjunto;
begin
  with DM.Ver_adjuntos do
  begin
    if Locate('ID_ADJUNTO', integer(LVAdjuntos.Selected.Data).ToString, [lopartialkey]) then
    begin
      Delete;
      ApplyUpdates(0);
    end;
  end;
  ShowMessage('adjunto Eliminado');
  MostrarAdjuntos(ID, TIPO, LCabecera.Caption);
end;

procedure TFMAdjuntos.MostrarAdjuntos(Indice: integer; Ti, Cabecera: string);
var
  ListItem: TListItem;
begin

  ID := Indice;
  TIPO := Ti;
  with DM.Ver_adjuntos do
  begin
    LCabecera.Caption := Cabecera;
    Close;
    ParamByName('TIPO').Value := TIPO;
    ParamByName('ID').Value := ID;
    ParamByName('EMPRESA').Value := Entorno.Empresa;
    Open;
    First;
    LVAdjuntos.Clear;
    while not EOF do
    begin
      ListItem := LVAdjuntos.Items.Add;
      ListItem.Caption := '   ' + FieldByName('TITULO_ADJUNTO').asstring;
      ListItem.Data := TObject(FieldByName('ID_ADJUNTO').AsInteger);
      ListItem.ImageIndex := DameIcono(FieldByName('NOMBRE').asstring);
      Next;
    end;
  end;
end;

// Funcion que extrae el icono de windows asociado al Fichero escogido
function TFMAdjuntos.DameIcono(Nombre: string): integer;
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

procedure TFMAdjuntos.WMDropFiles(var Msg: TMessage);
var
  FileName: array [0 .. MAX_PATH] of Char;
  FileStream: TFileStream;
  UltimoCodigo: integer;
begin
  if DragQueryFile(Msg.WParam, 0, FileName, MAX_PATH) > 0 then
  begin
    // FileStream := TFileStream.Create(FileName, fmOpenRead);
    try
      // Leer el contenido del archivo y agregarlo a la base de datos

      with DM.Emp_adjuntos do
      begin
        Open;
        UltimoCodigo := DMMain.ContadorGen('conta_adjunto');
        Append;
        FieldByName('NOMBRE').asstring := FileName;
        TBlobField(FieldByName('ARCHIVO')).LoadFromFile(FileName);
        FieldByName('TITULO').asstring := ExtractFileName(FileName);
        FieldByName('ID').AsInteger := UltimoCodigo;
        FieldByName('EMPRESA').AsInteger := Entorno.Empresa;
        FieldByName('FECHA').AsDateTime := Now;
        FieldByName('REPOSITORIO').AsInteger := 2;
        FieldByName('WEB').AsInteger := 1;
        Post;
      end;
      with DM.Emp_adjuntos_relacion do
      begin
        Open;
        Append;
        FieldByName('ID').AsInteger := ID;
        FieldByName('TIPO').asstring := TIPO;
        FieldByName('EMPRESA').AsInteger := Entorno.Empresa;
        FieldByName('ID_ADJUNTO').AsInteger := UltimoCodigo;
        FieldByName('TITULO').asstring := ExtractFileName(FileName);
        Post;
      end;

      MostrarAdjuntos(ID, TIPO, LCabecera.Caption);
    finally
      FileStream.Free;
    end;
  end;
  DragFinish(Msg.WParam);
end;

end.
