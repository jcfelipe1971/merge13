unit UEntorno;

interface

uses
  Classes, System.SysUtils, Inifiles, UDMMain;

type

  { TEntorno }
  TaDigCont = array[1..15] of smallint;

  TEntorno = class(TComponent)
  private
    // Entorno de Aplicacion
    FicheroEXE: string;
    RutaEXE: string;
    FNombrePrograma: string;
    FFicheroINI: string;
    FIniFile: TIniFile;

    // Conexion
    FBaseDeDatos: string;
    FUsuarioBD: string;
    FClaveBD: string;
    FRolBD: string;
    FVersionFB: string;

    // Entorno de sesion
    FEntrada: integer;
    FEmpresa: smallint;
    FEjercicio: smallint;
    FCanal: smallint;
    FSerie: string;
    FFechaTrab: TDateTime;
    FMemorizarFechaTrab: boolean;
    FEstilo: string;

    // Entorno de usuario
    FIdPerfil: integer;
    FIdUsuario: integer;

    // servidor correo
    FSMTP_Servidor: string;
    FSMTP_Puerto: integer;
    FSMTP_Usuario: string;
    FSMTP_Password: string;
    FSMTP_PasswordEnc: string;
    FSMTP_Identificacion: boolean;
    FSMTP_AutenticacionTLS: boolean;

    // FNroUsuario: integer;
    FUsuario: string;
    FPassword: string;
    FPais: string;
    FIdioma: string;
    FMoneda: string;

    // Servidor de versiones de aplicacion
    FServidorVersion: string;

    // Servidor de licencias
    FServidorLicencias: string;

    //Version MaxFactu
    FVersionMaxFactu : string;
    FFechaVersionMaxFactu : string;

    // ???
    FVirtualHost: string;

    FTarifaDefecto: string;
    FFamSistema: string;
    FFamDefecto: string;
    FPGC : integer;

    procedure InicializaEntorno;
    procedure SetServidorVersion(Valor: string);
    procedure SetServidorLicencias(Valor: string);
    procedure SetVirtualHost(Valor: string);
    function GetFechaTrabSH: TDate;
  published
    property FicheroINI: string Read FFicheroINI Write FFicheroINI;
    property IniFile: TIniFile Read FIniFile Write FIniFile;
    property NombrePrograma: string Read FNombrePrograma Write FNombrePrograma;

    property BaseDeDatos: string Read FBaseDeDatos Write FBaseDeDatos;
    property UsuarioBD: string Read FUsuarioBD Write FUsuarioBD;
    property ClaveBD: string Read FClaveBD Write FClaveBD;
    property RolBD: string Read FRolBD Write FRolBD;
    property VersionFB: string Read FVersionFB Write FVersionFB;

    property Entrada: integer Read FEntrada Write FEntrada;
    property Empresa: smallint Read FEmpresa Write FEmpresa;
    property Ejercicio: smallint Read FEjercicio Write FEjercicio;
    property Canal: smallint Read FCanal Write FCanal;
    property Serie: string Read FSerie Write FSerie;
    property MemorizarFechaTrab: boolean Read FMemorizarFechaTrab Write FMemorizarFechaTrab;
    property FechaTrab: TDateTime Read FFechaTrab Write FFechaTrab;
    property Pais: string Read FPais Write FPais;
    property Idioma: string Read FIdioma Write FIdioma;
    property Estilo: string Read FEstilo Write FEstilo;
    // servidor correo
    property SMTP_Servidor: string Read FSMTP_Servidor Write FSMTP_Servidor;
    property SMTP_Puerto: integer Read FSMTP_Puerto Write FSMTP_Puerto;
    property SMTP_Usuario: string Read FSMTP_Usuario Write FSMTP_Usuario;
    property SMTP_Password: string Read FSMTP_Password Write FSMTP_Password;
    property SMTP_PasswordEnc: string Read FSMTP_PasswordEnc Write FSMTP_PasswordEnc;
    property SMTP_Identificacion: boolean Read FSMTP_Identificacion Write FSMTP_Identificacion;
    property SMTP_AutenticacionTLS: boolean Read FSMTP_AutenticacionTLS Write FSMTP_AutenticacionTLS;

    property IdPerfil: integer Read FIdPerfil Write FIdPerfil;
    property IdUsuario: integer Read FIdUsuario Write FIdUsuario;
    // property NroUsuario: string Read FNroUsuario Write FNroUsuario;
    property Usuario: string Read FUsuario Write FUsuario;
    property Password: string Read FPassword Write FPassword;

    property ServidorVersion: string Read FServidorVersion Write SetServidorVersion;
    property ServidorLicencias: string Read FServidorLicencias Write SetServidorLicencias;
    property VirtualHost: string Read FVirtualHost Write SetVirtualHost;
    property VersionMaxFactu: string Read FVersionMaxFactu Write FVersionMaxFactu;
    property FechaVersionMaxFactu: string Read FFechaVersionMaxFactu Write FFechaVersionMaxFactu;

    property Moneda: string Read FMoneda Write FMoneda;
    property TarifaDefecto: string Read FTarifaDefecto Write FTarifaDefecto;
    // Familia del Sistema
    property FamSistema: string Read FFamSistema Write FFamSistema;
    // Familia Normal
    property FamDefecto: string Read FFamDefecto Write FFamDefecto;
    // Plan Genera Contable de la empresa
    property PGC: integer Read FPGC Write FPGC;

    property FechaTrabSH: TDate Read GetFechaTrabSH;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  public
    Nombre: string[31];
    Clave: string[31];
    MonedaEmpresa: string[03];
    DecimalesVer, DecimalesCalculo: integer;
    Moneda_Sec: string;
    // Seleccion de todos los datos de una empresa
    Tercero: integer; // El Tercero de la Empresa
    NombreEmpresa: string; // Titulo de la Empresa
    NombreEmpCom: string; // Titulo Comercial de la Empresa
    TipoRazon: string; // Tipo de Razón de la Empresa
    CifEmpresa: string; // NIF de la Empresa
    DirEmpresa: string; // Direccion ajustada de la Empresa
    PobEmpresa: string; // Código Postal y población
    ProvEmpresa: string;
    ColoniaEmpresa: string;
    Tel1Empresa: string; // Teléfono 1
    Tel2Empresa: string; // Teléfono 2
    FaxEmpresa: string; // Fax de la Empresa
    EmailEmpresa: string; // E-casa de la empresa
    WebEmpresa: string; // Güeb de la Empresa
    ImagenEmpresa: integer; // Imagen de la Empresa
    ImagenFondo: integer; // Imagen de fondo
    ImpCabEmpresa: integer; // Impresión de cabecera de la empresa en lst
    NombreCaja: string; // Titulo de la caja
     NivelesCont: smallint;
     MascaraCuentas: string;
     MaxNivCont: smallint;
     DigitCont: TaDigCont;
     DigitAcumula: TaDigCont;
    Riesgo: integer;
    Cliente_aut: boolean;
    Proveedor_aut: boolean;
    Acreedor_aut: boolean;
    ListaPedCompra: integer;
    FormatSettings: TFormatSettings;
    RECC: integer; // Registro Especial de Criterio de Caja
    BaseDeDatosImagenes,UsuarioBDImagenes,ClaveBDImagenes,RolBDImagenes: string;
    DigitosSub: smallint;
    AlmacenDefecto :string;
    Memorizar_Fecha: boolean;
    procedure AjustaFormatoFechaHora;

  end;

var
  Entorno: TEntorno;
  // Nombre de Merge: REntorno.Empresa, REntorno.Ejercicio... es el mismo objeto
  REntorno: TEntorno absolute Entorno;

  MascaraN: string; // Mascara decimales ver por Empresa, ejercicio, canal
  MascaraNSec: string; // Máscara decimales ver para la moneda secundaria
  MascaraL: string; // Mascara decimales calculo por Empresa, ejercicio, canal
  MascaraE: string; // Mascara decimales ver pero sólo por empresa
  MascaraD: string; // Mascara decimales cálculo sólo por empresa

const
   // Porcentajes
  MascaraP = '##0.00%';
  // Enteros
  MascaraI = ',##0.###';
  MascaraMini = '###0';
  MascaraC = ',##0.00000';
  MascaraKri = ',##0.000000'; {dji lrk kri}
  SemClientes = 3;
  SemProveedores = 4;
  SemAcreedores = 5;
  SemComisionistas = 6;



procedure CrearRegistroEntorno;
procedure DestruirRegistroEntorno;

function LeeDatoIni(const Section, Ident: string; Default: string = ''): string; overload;
function LeeDatoIni(const Section, Ident: string; Default: integer = 0): integer; overload;
function LeeDatoIni(const Section, Ident: string; Default: TDateTime = 0): TDateTime; overload;
function LeeDatoIni(const Section, Ident: string; Default: boolean = True): boolean; overload;
procedure EscribeDatoIni(const Section, Ident, Dato: string); overload;
procedure EscribeDatoIni(const Section, Ident: string; Dato: integer); overload;
procedure EscribeDatoIni(const Section, Ident: string; Dato: TDateTime); overload;
procedure EscribeDatoIni(const Section, Ident: string; Dato: boolean); overload;

function FiltroEntorno(Filtro: string = '0000'): string;

implementation

uses
  UUtiles, Vcl.Forms, System.IOUtils, System.DateUtils;

{ TEntorno }

constructor TEntorno.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FIniFile := nil;
  InicializaEntorno;
end;

destructor TEntorno.Destroy;
begin
  FIniFile.Free;
  inherited Destroy;
end;

procedure TEntorno.InicializaEntorno;
begin
  // Entorno de Aplicacion
  FicheroEXE := ExtractFileName(ParamStr(0));
  RutaEXE := ExtractFilePath(ParamStr(0));
  NombrePrograma := Copy(FicheroEXE, 1, Length(FicheroEXE) - Length(ExtractFileExt(FicheroEXE)));

  // Primero busco el .INI junto con el fichero exe.
  FicheroINI := ChangeFileExt(RutaEXE + FicheroEXE, '.ini');

  // Si no está, lo busco en lugar por defecto.
  // En Windows (C:\Users\<username>\AppData\Roaming\Merge\<NombrePrograma>.ini)
  // Linux ($HOME/usuario/)
  if not FileExists(FicheroINI) then
  begin
    // TPath.GetHomePath = "C:\Users\<username>\AppData\Roaming"
    FicheroINI := ChangeFileExt(TPath.Combine(TPath.GetHomePath + TPath.DirectorySeparatorChar + 'Delfos',
      FicheroEXE), '.ini');

    // Si no lo encuentro creo la ruta para crear el INI
    if not DirectoryExists(ExtractFilePath(FicheroINI)) then
      CreateDir(ExtractFilePath(FicheroINI)); // GetAppConfigDir(False)
  end;

  // Abro/Creo el fichero INI
  FIniFile := TIniFile.Create(FicheroINI);

  // Conexion
  FBaseDeDatos := '';
  FUsuarioBD := '';
  FClaveBD := '';
  FRolBD := '';
  FVersionFB := '';

  // Entorno de sesion
  FEntrada := 0;
  FEmpresa := 0;
  FEjercicio := 0;
  FCanal := 0;
  FSerie := '';
  FEstilo := '';
  FFechaTrab := Now;
  FMemorizarFechaTrab := False;

  // Entorno de usuario
  FIdPerfil := 0;
  FIdUsuario := 0;
  FUsuario := '';
  FPassword := '';
  FPais := '';
  FIdioma := '';
  DigitosSub := 0;
  NivelesCont := 5;
  MaxNivCont := 7;
  RECC := 0;


  // Servidor de versiones de aplicacion
  FServidorVersion := 'https://versions.delfos.net';

  // Servidor de licencias de aplicacion
  FServidorLicencias := 'http://delfos-online.com';

  FVirtualHost := '';

  TarifaDefecto := 'NOR';

  VersionMaxFactu      := GetFileVersion(ParamStr(0)) ;
  FechaVersionMaxFactu := '2026-05-09';
end;

procedure TEntorno.SetVirtualHost(Valor: string);
begin
  FVirtualHost := Valor;
end;

procedure TEntorno.SetServidorVersion(Valor: string);
begin
  FServidorVersion := Valor;
end;

procedure TEntorno.SetServidorLicencias(Valor: string);
begin
  FServidorLicencias := Valor;
end;

procedure CrearRegistroEntorno;
begin
  Entorno := TEntorno.Create(Application);
end;

procedure DestruirRegistroEntorno;
begin
  // Supongo que lo elimina la appliacion automaticamente
  FreeAndNil(Entorno);
end;



function TEntorno.GetFechaTrabSH: TDate;
begin
  Result := DateOf(FFechaTrab);
end;



function LeeDatoIni(const Section, Ident: string; Default: string = ''): string; overload;
begin
  Result := '';
  if Assigned(Entorno) then
    Result := Entorno.IniFile.ReadString(Section, Ident, Default);
end;

function LeeDatoIni(const Section, Ident: string; Default: integer = 0): integer; overload;
begin
  Result := 0;
  if Assigned(Entorno) then
    Result := Entorno.IniFile.ReadInteger(Section, Ident, Default);
end;

function LeeDatoIni(const Section, Ident: string; Default: TDateTime = 0): TDateTime; overload;
begin
  Result := Now;
  if (Default = 0) then
    Default := Now;

  if Assigned(Entorno) then
    Result := Entorno.IniFile.ReadDateTime(Section, Ident, Default);
end;

function LeeDatoIni(const Section, Ident: string; Default: boolean = True): boolean; overload;
begin
  Result := False;
  if Assigned(Entorno) then
    Result := Entorno.IniFile.ReadBool(Section, Ident, Default);
end;

procedure EscribeDatoIni(const Section, Ident, Dato: string); overload;
begin
  if Assigned(Entorno) then
    Entorno.IniFile.WriteString(Section, Ident, Dato);
end;

procedure EscribeDatoIni(const Section, Ident: string; Dato: integer); overload;
begin
  if Assigned(Entorno) then
    Entorno.IniFile.WriteInteger(Section, Ident, Dato);
end;

procedure EscribeDatoIni(const Section, Ident: string; Dato: TDateTime); overload;
begin
  if Assigned(Entorno) then
    Entorno.IniFile.WriteDateTime(Section, Ident, Dato);
end;

procedure EscribeDatoIni(const Section, Ident: string; Dato: boolean); overload;
begin
  if Assigned(Entorno) then
    Entorno.IniFile.WriteBool(Section, Ident, Dato);
end;

function FiltroEntorno(Filtro: string = '0000'): string;
var
  Union: string;
begin
  Result := '';
  Union := '';
  if Filtro[1] = '1' then
  begin
    Result := Result + format('EMPRESA=%d', [Entorno.Empresa]);
    Union := ' AND ';
  end;
  if Filtro[2] = '1' then
  begin
    Result := Result + format('%s EJERCICIO=%d', [Union, Entorno.Ejercicio]);
    Union := ' AND ';
  end;
  if Filtro[3] = '1' then
  begin
    Result := Result + format('%s CANAL=%d', [Union, Entorno.Canal]);
    Union := ' AND ';
  end;
  if Filtro[4] = '1' then
  begin
    Result := Result + format('%s SERIE=''%s''', [Union, Entorno.Serie]);
    Union := ' AND ';
  end;
end;


procedure TEntorno.AjustaFormatoFechaHora;
begin
  FormatSettings := TFormatSettings.Create;
  with FormatSettings do
  begin
    ThousandSeparator := '.';
    DecimalSeparator := ',';
    CurrencyDecimals := 2;
    DateSeparator := '/';
    ShortDateFormat := 'dd/mm/yyyy';
    LongDateFormat := '"Hoy es" dddd d "de" mmmm "de" yyyy';
    TimeSeparator := ':';
    ShortTimeFormat := 'HH:mm';
    LongTimeFormat := 'HH:mm:ss';
  end;
end;

end.
