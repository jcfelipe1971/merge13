unit UDMMain;

interface

uses {IDIOMA_CODE} gnugettext {IDIOMA_CODE} ,
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client, Data.DB, FireDAC.Phys.FBDef, FireDAC.Phys.IBBase,
  FireDAC.Phys.FB, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  vcl.Graphics, frxClass, vcl.DBGrids, System.Generics.Collections, frxDBSet,
{$IFDEF FASTREPORTDESIGNER}
  frCoreClasses,
{$ENDIF}
  REST.Client, System.JSON, REST.Types, UFMEspera,
  FireDAC.Stan.StorageBin, System.Net.HttpClient, System.Types, vcl.Controls,
  System.IOUtils, vcl.Forms, Winapi.ShellAPI, Data.Bind.Components,
  Data.Bind.ObjectScope, REST.Response.Adapter, System.Threading, vcl.ComCtrls, vcl.ExtCtrls,
  frCoreClasses, vcl.OleServer, vcl.StdCtrls, vcl.Grids, System.Net.URLClient;

type
  TCallBack = procedure(JSON: TJSONValue) of object;

  TErrorCallBack = procedure(s: string) of object;

  TMonedaInf = record
    Moneda: string;
    DecimalesVer: integer;
    DescimalesCalculos: integer;
    DecimalesVerStr: string;
    DescimalesCalculosStr: string;
    Signo: string;
  end;

  TMonedaInfList = array of TMonedaInf;

type
  TDMMain = class(TDataModule)
    TLocal: TFDTransaction;
    TUpdate: TFDTransaction;
    DataBase: TFDConnection;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    QDatosEmpresa: TFDQuery;
    QDatosEmpresaIMAGEN: TBlobField;
    QDatosEmpresaEMPRESA: TSmallintField;
    QDatosEmpresaTITULO: TStringField;
    QDatosEmpresaTERCERO: TIntegerField;
    QDatosEmpresaFECHA_ALTA: TSQLTimeStampField;
    QDatosEmpresaAPERTURA: TSQLTimeStampField;
    QDatosEmpresaDURACION: TSmallintField;
    QDatosEmpresaMONEDA: TStringField;
    QDatosEmpresaABIERTA: TSmallintField;
    QDatosEmpresaMODO_IVA: TSmallintField;
    QDatosEmpresaIMPRIME_CABECERA: TSmallintField;
    QDatosEmpresaCLIENTE_AUT: TSmallintField;
    QDatosEmpresaPMP_CERO: TSmallintField;
    QDatosEmpresaFECHA_CONTABILIZACION_COMPRAS: TSmallintField;
    QDatosEmpresaCIERRE_CONTABLE: TSmallintField;
    QDatosEmpresaFECHA_VENTAS: TSmallintField;
    QDatosEmpresaLISTAR_PEDIDOS: TSmallintField;
    QDatosEmpresaSERIE_AUTOFAC: TStringField;
    QDatosEmpresaE_IMAGEN: TIntegerField;
    QDatosEmpresaCIERRA_DOC_CERO: TSmallintField;
    QDatosEmpresaREG_MERCANTIL: TMemoField;
    QDatosEmpresaE_MAIL: TStringField;
    QDatosEmpresaSERIALIZADO_AUTO: TSmallintField;
    QDatosEmpresaMOV_STOCK_ANULA_VENTAS: TSmallintField;
    QDatosEmpresaMOV_STOCK_ANULA_COMPRAS: TSmallintField;
    QDatosEmpresaNO_CONTABILIZAR_FECHA_KRI: TSmallintField;
    QDatosEmpresaFECHA_NO_CONTABILIZACION_KRI: TSQLTimeStampField;
    QDatosEmpresaPORTES_VENTAS: TSmallintField;
    QDatosEmpresaPORTES_COMPRAS: TSmallintField;
    QDatosEmpresaSEPARAR_APUNTES_REMESAS: TSmallintField;
    QDatosEmpresaSEPARAR_PEDIDOS_RECEPCION: TSmallintField;
    QDatosEmpresaCONTROL_STOCK_NEG: TSmallintField;
    QDatosEmpresaCONTROL_ASIENTO_NEG: TSmallintField;
    QDatosEmpresaIMPORTE_MAX_PEP: TFloatField;
    QDatosEmpresaIMPORTE_LETRAS: TSmallintField;
    QDatosEmpresaSEPARAR_DTO_CIAL: TSmallintField;
    QDatosEmpresaRECC: TSmallintField;
    QDatosEmpresaINVENTARIO_PERMANENTE: TSmallintField;
    QDatosEmpresaTEXTO_LOPD: TMemoField;
    QDatosEmpresaTEXTO_LOPD_PIE_DOCUMENTO: TMemoField;
    QDatosEmpresaTAMANYO_EMPRESA: TStringField;
    QDatosEmpresaAGENCIA_TRIBUTARIA: TStringField;
    QDatosEmpresaGS1_COMPANY_PREFIX: TStringField;
    QDatosEmpresaPROVEEDOR_AUT: TSmallintField;
    QDatosEmpresaACREEDOR_AUT: TSmallintField;
    QDatosEmpresaF_IMAGEN: TIntegerField;
    RESTClient: TRESTClient;
    RESTRequest: TRESTRequest;
    RESTResponse: TRESTResponse;
    RESTResponseDataSetAdapter: TRESTResponseDataSetAdapter;
    MTVersion: TFDMemTable;
    MTVersionsuccess: TBooleanField;
    MTVersionEXE: TWideStringField;
    MTVersionVERSION: TIntegerField;
    MTVersionURL: TWideStringField;
    MTVersionFECHA: TWideStringField;
    MTVersionNOTAS: TWideStringField;
    DataBaseImagenes: TFDConnection;
    TLocalImagenes: TFDTransaction;
    TUpdateImagenes: TFDTransaction;
    frxDBQDatosEmpresa: TfrxDBDataset;
    QDatosEmpresaTERCERO_1: TIntegerField;
    QDatosEmpresaNOMBRE_R_SOCIAL: TStringField;
    QDatosEmpresaNOMBRE_COMERCIAL: TStringField;
    QDatosEmpresaTIPO_RAZON: TStringField;
    QDatosEmpresaNIF: TStringField;
    QDatosEmpresaFECHA_ALTA_1: TSQLTimeStampField;
    QDatosEmpresaNOTAS: TMemoField;
    QDatosEmpresaTELEFONO01: TStringField;
    QDatosEmpresaTELEFONO02: TStringField;
    QDatosEmpresaTELEFAX: TStringField;
    QDatosEmpresaEMAIL: TStringField;
    QDatosEmpresaWEB: TStringField;
    QDatosEmpresaCLIENTE_POTENCIAL: TSmallintField;
    QDatosEmpresaIMAGEN_1: TIntegerField;
    QDatosEmpresaCODIGO_EDI: TStringField;
    QDatosEmpresaREGISTRO_MERCANTIL: TStringField;
    QDatosEmpresaCOD_CREDITO_Y_CAUCION: TIntegerField;
    QDatosEmpresaULT_MODIFICACION: TSQLTimeStampField;
    QDatosEmpresaID_REGISTRO: TIntegerField;
    QDatosEmpresaFEC_PROP_CREDITO_Y_CAUCION: TSQLTimeStampField;
    QDatosEmpresaFECHA_NACIMIENTO: TSQLTimeStampField;
    QDatosEmpresaCARNET_APLICADOR: TStringField;
    QDatosEmpresaFECHA_VALIDEZ_CARNET_APLICADOR: TSQLTimeStampField;
    QDatosEmpresaPAIS_TERCERO: TStringField;
    QDatosEmpresaTIPO_DOC_IDENT: TStringField;
    QDatosEmpresaCOMO_NOS_CONOCIERON: TIntegerField;
    xFactorMoneda: TFDQuery;
    spContadores_E: TFDStoredProc;
    procedure DataModuleCreate(Sender: TObject);
    procedure DBError(ASender, AInitiator: TObject; var AException: Exception);

  private
    { Private declarations }
    EstadoKri_Codigo: TStrings;
    EstadoKri_Estado: TStrings;
    MonedaInfList: TMonedaInfList;
    FAsyncResult: IAsyncResult;
    FGlobalStart: Cardinal;
    FDownloadStream: TStream;
    FicheroVersion: string;
    UltimaUnidad: string;
    UltimoDecimales: integer;
  public
    { Public declarations }
    procedure Conectar;
    procedure Desconectar;
    function BDConectada: boolean;
    procedure RegistraEntrada;
    function Login(Usuario, Password: string): boolean;
    function ValidaUsuario(Usuario, Password: string): boolean;
    procedure ActualizaDatosUltimoLogin;
    procedure RegistraSalida;
    function Logout: boolean;
    procedure ModificaEntornoSegunUsuarioEmpesa;
    procedure ValidaFecha(Empresa: integer; Ejercicio: integer; Fecha: TDateTime);
    function RellenaEmpresas(Lista: TStrings; Todos: boolean = True): integer;
    function RellenaEjercicios(Lista: TStrings; Todos: boolean = True): integer;
    function RellenaCanales(Lista: TStrings; Todos: boolean = True): integer;
    function RellenaSeries(Lista: TStrings; Todos: boolean = True): integer;
    function ContadorGen(NomGen: string): integer;
    function InsertaImagen(Consulta: TFDQuery; Nombre, CampoIDImagen: string; im: TBitmap; ImageCode: integer): integer;
    Function EliminarImagen(Codigo: integer): boolean;
    procedure IdiomaFastReport(Idioma: string);
    function DameAlmacenDocumento(Tipo, Serie: string): string;
    function DameTituloEstado(Estado: integer): string;
    procedure SaldoAnticipo(Tipo: string; CodCliPro: integer; Fecha: TDateTime; var Saldo: double; var Moneda: string);
    function EjercicioContableAbierto(Ejercicio: integer): boolean;
    function DameLlaveDosificacion(Tipo, Autorizacion: string): string;
    function DameNumeroDosifiacion(Tipo, Autorizacion: string): integer;
    function DameLineaSiguiente(Tipo: string; IdDoc: integer): integer;
    function EjercicioActivo(Ejercicio: integer; Empresa: integer = 0): boolean;
    function DameEjercicio(Empresa: integer; Fecha: TDateTime): integer;
    function DameIdModeloArticulo(id_a: integer): integer;
    procedure MuestraReporte(Grupo: integer; Titulo: string; LDS: TList<TFDQuery>);
    function CargaReporteFB(Grupo: integer; Titulo: string): TfrxReport;
    procedure EditarReporte(Grupo: integer; Titulo: string);
    function ExisteReporte(Grupo: integer; Titulo: string): boolean;
    procedure EliminaListado(Grupo: integer; Titulo: string);
    procedure GuardaReporteFB(Grupo: integer; Titulo: string; Reporte: TfrxReport);
    procedure CargarReporteDesdeFichero(Grupo: integer; Fichero: string);
    Function DameCampos(aGrid: TDBGrid): String;
    Function DameMarcaPorDefecto: integer;
    procedure CargaSysConstantes;
    function Contador_Gen(DataSet: TDataSet; NomGen, NomCampo: string; Fuerza: boolean = False): integer;
    function DameCodigoArticulo(FormatoCodigo, Familia, SubFamilia: string): string;
    function EstadoKri(id: integer): integer;
    procedure CargaMonedaInfList;
    procedure AjustaMascaraMoneda;
    function MascaraMoneda(Moneda: string; Tipo: smallint): string;
    function Contador_E(Tipo: string; Empresa: integer = 0): integer;
    function DameTitulo(Tabla, CampoMostrar, CampoBuscar, Filtro, Subconsulta: string;
      CampoBuscarValor: Variant): String;
    function VerificaExisteEnTercero(Tercero: integer; Tipo: string): boolean;
    procedure QueEs(Tercero: integer; var Cliente, Proveedor, Acreedor, Agente, Empleado, Potencial, Crm: boolean);
   // procedure CrearCodigoQR(Bitmap: TBitmap; s: string; Factor: integer = 1);
    procedure EnviarReporteEmail(R: TfrxReport; Asunto, Destinatario, Cuerpo, Copia, NombreAdjunto: string);
    function VerificaSmtpUsuario: boolean;
    procedure CambiaTarifaVentas(id_s: integer; Tarifa, Tarifa_old: string);
    function TarifaEsIvaIncluido(Tarifa: string; Empresa: integer = 0): boolean;
    function DameRestriccionAgenteUsuario(Usuario: integer): boolean;
    function DameAgenteUsuario(Usuario: integer): integer;
    procedure ReNumerarOrdenDetalleVenta(id_s: integer);
    function DameGiro(Tipo: string; Empresa: integer; Codigo: integer = 0): integer;
    procedure LlamaVersionNuevaOnError(s: string);
    procedure ComprobarVersion;
    procedure ExecuteInstall;
    procedure ReceiveDataEvent(const Sender: TObject; AContentLength, AReadCount: Int64; var Abort: boolean);
    procedure DoEndDownload(const AsyncResult: IAsyncResult);
    procedure ActualizarVersion;
    procedure RestartApplication;
    function ClienteBloqueado(Cliente: integer; Empresa: integer = 0): boolean;
    procedure MuestraAviso(Tipo: string; id: integer; TipoDocumento: string);
    function Contador_EECS(Serie, Tipo: string; Empresa: integer = 0; Ejercicio: integer = 0;
      Canal: integer = 0): integer;
    function DameIDArticulo(Articulo: string; Empresa: integer = 0): integer;
    procedure CargaImageListGaleria(IdGaleria: integer; Lista: TListView; Alto: integer = 0; Ancho: integer = 0);
    procedure RefrescarImagen(Imagen: TImage; Codigo: integer);
    procedure CargarImagenDeStream(Imagen: TImage; Stream: TStream; Formato: string);
    procedure DesConectaImagenes;
    procedure ConectaImagenes;
    function InsertaImagenNueva: integer;
    function DameTituloEmpleado(Empleado: integer): string;
    function DameTituloFichaTecnica(IdFichaTecnica: integer): string;
    procedure FiltraTabla(Tabla: TFDQuery; Filtro: string = '000000'; Abre: boolean = True);
    function DamePorcentajeIva(Pais: string; Tipo: integer): double;
    function ProveedorBloqueado(Proveedor: integer; Empresa: integer = 0): boolean;
    function DameMinDireccion(Tercero: integer): integer;
    function DameStockArticulo(Empresa, Canal: integer; Articulo, Almacen: string): double;
    function DameStockArticuloFecha(Empresa, Canal: integer; Articulo, Almacen: string; Fecha: TDateTime): double;
    procedure CargaAlmacenDefecto;
    function AcreedorBloqueado(Acreedor: integer; Empresa: integer = 0): boolean;
    procedure ExisteFamilia(Familia: integer; var Des: string);
    procedure ExisteDescripcionFamilia(Des: string; var Familia: integer);
    function BusquedaArticulo(Descripcion, Almacen: string; Cliente: integer = 0; CampoNroSerie: TField = nil): string;
    function ArticuloBloqueado(Articulo: string; TipoDoc: string; Empresa: integer = 0): boolean;
    function DameDecimalesUnidad(Tipo: string): integer;
    function DameTituloIdiomaArticulo(id_a: integer; Idioma: string = ''): string;
    function DameTituloArticulo(id_a: integer): string; overload;
    function DameLoteSimple(Articulo: string; Fecha: TDateTime): string;
    function DameAlmacenDefectoArticulo(Articulo: string): string;
    function DameRiesgoPedido(Cliente: integer): double;
    function DameMargenUtilidad(PrecioVenta, PrecioCoste: double): double;
    function DameTituloDireccion(Direccion, Tercero: integer): string;
    function UtilizaVerifactu: boolean;
    function DameClientePorNIF(NIF: string): integer;
    procedure DameEmailLicencia(var Correo, Licencia: String);
    Procedure DameActualizaciones(SG: TStringGrid);
    procedure DatosVersion(var VersionBaseDeDatos, Empresa, Copyright, NombreProducto: string; Forzar: boolean = False);
    function DameTelefonoTercero(Tercero: integer): string;
    //function DameCertificado(Serie: string): string;
    function DameUrlEndPoint(Tipo: string): string;
    function CreaAdjunto(aTipo: string; aID: integer; Fichero: string; Descripcion: string = '';
      Repositorio: integer = -1): integer;
    function DameTerceroID(Tipo: string; id: integer): integer;
    function DameModoIVACanal: integer;
    function DameMinIRPF: integer;
    function DamePaisC2(Pais: string): string;
    function DameCuentaGestion(Gestion: smallint; TipoTercero: smallint = -1; Empresa: integer = 0): string;
    function DameSemillaCuentaGestion(Gestion: smallint; TipoTercero: smallint): string;
    function DameTituloCuenta(Cuenta: string; Ejercicio: integer = 0): string;
    procedure AjustaNivelesContables;
    procedure ActualizaUsuario;
    function Contador_Libre(Tipo: string; Codigo_Ent: integer): integer;
    procedure RestingeEdicion(DataSet: TDataSet; Estado: integer);
    procedure FDConnection1Error(Sender: TFDConnection; var AException: Exception; var AHandled: boolean);
    procedure Cambios(Origen, Destino: string; Fecha: TDateTime; Importe: double; var Ver, Calculo: double);
    function DameFactor(Origen, Destino: string; Fecha: TDateTime): double;
    procedure Redondeos(var Importe: double; Moneda: string; var Val_Ver, Val_Cal: double;
      var Val_VerSTR, Val_CalSTR: string);
    procedure VerificaDocumentoIdentificacion(Pais, TipoDoc, NumeroDocumento: string; var Valido: boolean;
      var MensajeError: string);
    function DameTituloTipoDocIdentidad(Pais, TipoDocIdent: string): string;
    procedure CreaReferenciaDte(id_s, CODREF, ID_S_REF: integer; FOLIOREF, TPODOCREF, RAZONREF, RUTOTR: string;
      FCHREF: TDateTime);
    function DameStockVirtualArticulo(Empresa, Canal: integer; Articulo, Almacen: string): double;
    function DameStockMontura(Empresa, Canal: integer; Articulo, Almacen: string): double;
    function DameStockRealArticulo(Empresa, Canal: integer; Articulo, Almacen: string): double;
    function DameStockRefBase(Empresa, Canal: integer; Articulo, Almacen: string): double;
  public
    // En Merge la conexión se llama DataBase; DB se mantiene para el código que viene de MaxFactu
    property DB: TFDConnection read DataBase;
  end;

var
  DMMain: TDMMain;
  R: TfrxReport;
  FEspera: TFMEspera;
  TSLNiveles: TStringList;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses vcl.Dialogs, UUtiles, ULog, UEntorno, frxRes, frxDesgn, Variants, {DelphiZXIngQRCode,}
  UFMain, vcl.Imaging.jpeg, vcl.Imaging.GIFImg, vcl.Imaging.pngimage, System.StrUtils, vcl.ExtDlgs,
  UMensajesDeError;

{$R *.dfm}
{ TDMMain }

function TDMMain.BDConectada: boolean;
begin
  Result := DB.Connected;
end;

function TDMMain.DameUrlEndPoint(Tipo: string): string;
begin
  /// EndPoint para transmisiones del sistema SII de España
  /// También se utilizará para envios del SII de Chile
  with DameQueryRW(Self, DB) do
  begin
    try
      SQL.Text := 'SELECT URL FROM SII_URL_ENDPOINT WHERE PAIS = :PAIS AND TIPO = :TIPO';
      ParamByName('PAIS').AsString := Entorno.Pais;
      ParamByName('TIPO').AsString := Tipo;
      open;
      Result := FieldByName('URL').AsString;
    finally
      Free;
    end;
  end;
end;

function TDMMain.DameTerceroID(Tipo: string; id: integer): integer;
begin
  // Si se modifica procedimiento, aplicar tambien a código web

  Result := 0;
  if (Tipo = 'AMO') then
    Result := -1
  else if (Tipo = 'ART') then
    Result := -1
  else if (Tipo = 'ASI') then
    Result := -1
  else if (Tipo = 'CON') then
    Result := id
  else if (Tipo = 'DSP') then
    // Despiece de produccion
    Result := -1
  else if (Tipo = 'ESP') then
    // Escandallo de produccion
    Result := -1
  else if (Tipo = 'FIT') then
    Result := -1
  else if (Tipo = 'IPL') then
    Result := -1
  else if (Tipo = 'INC') then
    Result := -1
  else if (Tipo = 'MED') then
    Result := -1
  else if (Tipo = 'MOD') then
    Result := -1
  else if (Tipo = 'MTC') then
    Result := -1
  else if (Tipo = 'NOM') then
    Result := -1
  else if (Tipo = 'PRY') then
    // to-do
    Result := -1
  else if (Tipo = 'REP') then
    Result := -1
  else if (Tipo = 'SII') then
    Result := -1
  else if (Tipo = 'TER') then
    Result := id
  else if (Tipo = 'PER') then
    Result := -1
  else if (Tipo = 'SIE') then
    Result := -1
  else if (id <> 0) and (Tipo > ' ') then
  begin
    with DameQueryRO(Self, DB) do
    begin
      try
        if (Tipo = 'CLI') then
          SQL.Text := 'SELECT TERCERO FROM EMP_CLIENTES WHERE ID_CLIENTE=' + IntToStr(id);
        if (Tipo = 'PRO') then
          SQL.Text := 'SELECT TERCERO FROM EMP_PROVEEDORES WHERE ID_PROVEEDOR=' + IntToStr(id);
        if (Tipo = 'ACR') then
          SQL.Text := 'SELECT TERCERO FROM EMP_ACREEDORES WHERE ID_ACREEDOR=' + IntToStr(id);
        if (Tipo = 'AGE') then
          SQL.Text := 'SELECT TERCERO FROM EMP_AGENTES WHERE ID_AGENTE=' + IntToStr(id);
        if (Tipo = 'POT') then
          SQL.Text := 'SELECT TERCERO FROM EMP_CLIENTES_POTENCIALES WHERE ID_CLIENTE=' + IntToStr(id);
        if (Tipo = 'OFC') then
          SQL.Text := 'SELECT TERCERO FROM GES_CABECERAS_S WHERE ID_S=' + IntToStr(id);
        if (Tipo = 'PEC') then
          SQL.Text := 'SELECT TERCERO FROM GES_CABECERAS_S WHERE ID_S=' + IntToStr(id);
        if (Tipo = 'ALB') then
          SQL.Text := 'SELECT TERCERO FROM GES_CABECERAS_S WHERE ID_S=' + IntToStr(id);
        if (Tipo = 'FAC') then
          SQL.Text := 'SELECT TERCERO FROM GES_CABECERAS_S WHERE ID_S=' + IntToStr(id);
        if (Tipo = 'PEP') then
          SQL.Text := 'SELECT TERCERO FROM GES_CABECERAS_E_PED WHERE ID_E=' + IntToStr(id);
        if (Tipo = 'ALP') then
          SQL.Text := 'SELECT TERCERO FROM GES_CABECERAS_E_ALB WHERE ID_E=' + IntToStr(id);
        if (Tipo = 'FAP') then
          SQL.Text := 'SELECT TERCERO FROM GES_CABECERAS_E_FAC WHERE ID_E=' + IntToStr(id);
        if (Tipo = 'FCR') then
          SQL.Text := 'SELECT TERCERO FROM GES_CABECERAS_E_FCR WHERE ID_E=' + IntToStr(id);
        if (Tipo = 'CON') then
          SQL.Text := 'SELECT TERCERO FROM CRM_CONTACTOS WHERE ID_CONTACTO=' + IntToStr(id);
        if (Tipo = 'OFP') then
          SQL.Text := 'SELECT TERCERO FROM GES_CABECERAS_E_OFP WHERE ID_E=' + IntToStr(id);
        if (Tipo = 'OCP') then
          SQL.Text := 'SELECT TERCERO FROM GES_CABECERAS_E_OCP WHERE ID_E=' + IntToStr(id);
        if (Tipo = 'OPR') then
          // Orden de produccion
          SQL.Text :=
            'SELECT C.TERCERO FROM PRO_ORD P JOIN EMP_CLIENTES C ON C.EMPRESA = P.EMPRESA AND C.CLIENTE = P.CLIENTE WHERE P.ID_ORDEN ='
            + IntToStr(id);
        if (Tipo = 'CUO') then
          SQL.Text := 'SELECT TERCERO FROM EMP_CLIENTES_CUOTAS WHERE ID_CUOTA =' + IntToStr(id);
        if (Tipo = 'OPE') then
          SQL.Text := 'SELECT TERCERO FROM OPE_EMPLEADO WHERE ID_EMPLEADO =' + IntToStr(id);
        if (Tipo = 'EMP') then
          SQL.Text := 'SELECT TERCERO FROM SYS_EMPRESAS WHERE EMPRESA =' + IntToStr(id);
        if (Tipo = 'NOM') then
          SQL.Text := 'SELECT TERCERO FROM VER_EMP_NOMINAS_CABECERA WHERE ID =' + IntToStr(id);
        if (Tipo = 'INC') then
          SQL.Text := 'SELECT TERCERO FROM EMP_INCIDENCIAS WHERE INCIDENCIA =' + IntToStr(id);
        if (Tipo = 'NCO') then
          SQL.Text := 'SELECT CLI_PRO_INTE AS TERCERO FROM ISO_NO_CONFORMIDAD WHERE RIC =' + IntToStr(id);
        if (Tipo = 'PER') then
          SQL.Text := 'SELECT TERCERO FROM VER_RH_PERSONA WHERE ID_PERSONA =' + IntToStr(id);
        if (Tipo = 'CLP') then
          SQL.Text := 'SELECT TERCERO FROM ISO_CLAS_PROV WHERE ID_PROVEEDOR =' + IntToStr(id);

        open;
        Result := FieldByName('TERCERO').AsInteger;
      finally
        Free;
      end;
    end;
  end;
end;

function TDMMain.CreaAdjunto(aTipo: string; aID: integer; Fichero: string; Descripcion: string = '';
  Repositorio: integer = -1): integer;
var
  StreamDestino, StreamOrigen: TStream;
  Tipo: string;
  id, Tercero: integer;
  q, DS: TFDQuery;
begin
  /// Carga un fichero como adjunto y devuelve su ID
  /// Si hay un error devuelve 0

  // Si se modifica procedimiento, aplicar tambien a código web

  Tipo := aTipo;
  id := aID;

  Tercero := DameTerceroID(Tipo, id);
  if (Descripcion = '') then
    Descripcion := ExtractFileName(Fichero);

  if (Repositorio = -1) then
    Repositorio := StrToIntDef(LeeParametro('ADJUBIC001', ''), 1);

  with DameQueryRW(Self, DB) do
  begin
    SQL.Add(' INSERT INTO VER_ADJUNTOS ');
    SQL.Add(' (EMPRESA, TIPO, ID, ID_ADJUNTO, TITULO_ADJUNTO, ARCHIVO, NOMBRE, REPOSITORIO, WEB) ');
    SQL.Add(' VALUES ');
    SQL.Add(' (:EMPRESA, :TIPO, :ID, :ID_ADJUNTO, :TITULO_ADJUNTO, :ARCHIVO, :NOMBRE, :REPOSITORIO, :WEB) ');

    ParamByName('EMPRESA').AsInteger := Entorno.Empresa;
    ParamByName('TIPO').AsString := Tipo;
    ParamByName('ID').AsInteger := id;
    ParamByName('REPOSITORIO').AsInteger := Repositorio;
    ParamByName('NOMBRE').AsString := Fichero;
    ParamByName('TITULO_ADJUNTO').AsString := Descripcion;
    ParamByName('WEB').AsInteger := StrToIntDef(LeeParametro('ADJCONF001', ''), 1);
    DMMain.Contador_Gen(DS, 'CONTA_ADJUNTO', 'ID_ADJUNTO');
    ExecSQL;
    Transaction.Commit;
  end;
end;

{function TDMMain.DameCertificado(Serie: string): string;
begin
  Result := CryptUIDlgSelectCertificateFromStoreCert(FMain.Handle, PChar('Delfos') + Chr(0),
    PChar('Seleccione un certificado') + Chr(0));

  if (LeeParametro('CERLIMP001', Serie) = 'S') then
  begin
    // Reemplazo caracteres
    Result := StringReplace(Result, ' ', '_', [rfReplaceAll]);
    Result := StringReplace(Result, '(', '_', [rfReplaceAll]);
    Result := StringReplace(Result, ')', '_', [rfReplaceAll]);
  end;
end; }

procedure TDMMain.Conectar;
var
  i: integer;
  s: string;
  CharacterSet: string;
begin
  CharacterSet := 'WIN1252';

  Log('DMMain.Conectar');
  Log(format('Base de Datos: %s', [Entorno.BaseDeDatos]));
  Log(format('Usuario: %s', [Entorno.UsuarioBD]));
  Log(format('Clave: %s', [StringOfChar('*', Length(Entorno.ClaveBD))]));
  Log(format('Rol: %s', [Entorno.RolBD]));
  Log(format('CharacterSet: %s', [CharacterSet]));
  Log(format('Version Firebird: %s', [Entorno.VersionFB]));

  with DB do
  begin
    Connected := False;
    LoginPrompt := False;
    DriverName := 'FB';
    Params.Clear;
    Params.Add(format('DriverID=%s', ['FB']));
    Params.Add(format('SQLDialect=%s', ['1']));
    Params.Add(format('Database=%s', [Entorno.BaseDeDatos]));
    Params.Add(format('User_Name=%s', [Entorno.UsuarioBD]));
    Params.Add(format('Password=%s', [Entorno.ClaveBD]));
    if (Entorno.RolBD > '') then
      Params.Add(format('RoleName=%s', [Entorno.RolBD]));
    Params.Add(format('CharacterSet=%s', [CharacterSet]));

    if (Entorno.VersionFB = '5') then
    begin
      FDPhysFBDriverLink1.Release;
      FDPhysFBDriverLink1.VendorHome := '.\FB50';
      FDPhysFBDriverLink1.VendorLib := 'fbclient.dll';
    end
    else if (Entorno.VersionFB = '4') then
    begin
      FDPhysFBDriverLink1.Release;
      FDPhysFBDriverLink1.VendorHome := '.\FB40';
      FDPhysFBDriverLink1.VendorLib := 'fbclient.dll';
    end
    else if (Entorno.VersionFB = '2.5') then
    begin
      FDPhysFBDriverLink1.Release;
      FDPhysFBDriverLink1.VendorHome := '.\FB25';
      FDPhysFBDriverLink1.VendorLib := 'fbclient.dll';
    end;

    Transaction := TLocal;
    try
      Connected := True
    except
      On E: Exception do
      begin
        ShowMessage('No se ha podido conectar con la Base de Datos ' + sLineBreak + E.ClassName + ' ' + sLineBreak +
          E.Message);
      end;

    end;

    DMMain.DB.StartTransaction;

    // Busco si esta en la lista y lo agrego si no lo encuentro
    i := 1;
    s := LeeDatoIni('Conexion', 'BaseDeDatos' + IntToStr(i), '');
    while ((s <> '') and (s <> Entorno.BaseDeDatos)) do
    begin
      Inc(i);
      s := LeeDatoIni('Conexion', 'BaseDeDatos' + IntToStr(i), '');
    end;

    if (s = '') then
      EscribeDatoIni('Conexion', 'BaseDeDatos' + IntToStr(i), Entorno.BaseDeDatos);

    CargaSysConstantes;
  end;

  { TODO
    if Assigned(FMSesion) then
    FMSesion.ActualizaDatos;
  }

end;

procedure TDMMain.DataModuleCreate(Sender: TObject);
begin
  if DB.Connected then
    DB.Connected := False;

  EstadoKri_Codigo := TStringList.Create;
  EstadoKri_Estado := TStringList.Create;
  UltimaUnidad := '';
  UltimoDecimales := 0;
  TSLNiveles := TStringList.Create;
  // IP_Servidor := Copy(DB.Params.Database, 1, Pos(':', DB.Params.Database) - 1);
end;

procedure TDMMain.Desconectar;
begin
  Log('DMMain.Desonectar');
  DB.Connected := False;
end;

procedure TDMMain.RegistraEntrada;
var
  NombreMaquina, UsuarioWindows, Sistema: string;
begin
  /// Crea una entrada nueva y actualiza su valor en el entorno
  Entorno.Entrada := 0;

  NombreMaquina := DameNombrePC;
  UsuarioWindows := DameUsuarioWindows;
  Sistema := DameVersionWindows;

  with DameQueryRW(Self, DB) do
  begin
    try
      SQL.Text := 'SELECT * FROM LOG_ENTRADAS_ALTA (:MAQUINA, :LOGIN, :OS)';
      ParamByName('MAQUINA').AsString := Trim(Copy(NombreMaquina, 1, 31));
      ParamByName('LOGIN').AsString := Trim(Copy(UsuarioWindows, 1, 31));
      ParamByName('OS').AsString := Sistema;
      open;

      if not EOF then
      begin
        Entorno.Entrada := FieldByName('ENTRADA').AsInteger;
        // Esta fecha es la fecha del servidor Firebird
        Entorno.FechaTrab := FieldByName('FECHA').AsDateTime;
      end;
      Transaction.Commit;
      Close;
    finally
      Free;
    end;
  end;

  Entorno.AjustaFormatoFechaHora;
end;

function TDMMain.BusquedaArticulo(Descripcion, Almacen: string; Cliente: integer = 0;
  CampoNroSerie: TField = nil): string;
begin
  /// Buscamos el codigo en varias tablas y devuelve su codigo y tabla donde se encuentra
  /// Barras -> Nro. Serie -> Cod. Articulo de Cliente -> Cod. Articulo de la empresa

  with DameQueryRW(Self, DB) do
  begin
    try
      SQL.Text := ' EXECUTE PROCEDURE A_ART_BUSQUEDA(:EMPRESA, :EJERCICIO, :CANAL, :DESCRIPCION, :ALMACEN, :CLIENTE) ';
      ParamByName('EMPRESA').AsInteger := Entorno.Empresa;
      ParamByName('EJERCICIO').AsInteger := Entorno.Ejercicio;
      ParamByName('CANAL').AsInteger := Entorno.Canal;
      ParamByName('DESCRIPCION').AsString := Descripcion;
      ParamByName('ALMACEN').AsString := Almacen;
      ParamByName('CLIENTE').AsInteger := Cliente;
      ExecSQL;

      // Si lo encuentra en una tabla
      if (FieldByName('TABLA').AsString <> '') then
      begin
        Result := FieldByName('ARTICULO').AsString;

        // Si se informa el campo para el Nro. de Serie, lo rellenamos
        if ((FieldByName('TABLA').AsString = 'SERIE') and (TField <> nil)) then
          CampoNroSerie.AsString := Descripcion;
      end
      else
        Result := Descripcion;

      Transaction.Commit;
      Close;
    finally
      Free;
    end;
  end;
end;

function TDMMain.ArticuloBloqueado(Articulo: string; TipoDoc: string; Empresa: integer = 0): boolean;
var
  Mensaje, Tipo: string;
  Bloqueo: integer;
begin
  if (Empresa = 0) then
    Empresa := Entorno.Empresa;

  with DameQueryRO(Self, DB) do
  begin
    try
      SQL.Add('SELECT ');
      if ((TipoDoc = 'ALP') or (TipoDoc = 'FAP') or (TipoDoc = 'PEP') or (TipoDoc = 'OFP') or (TipoDoc = 'OCP')) then
        SQL.Add('BLOQUEO_COMPRAS BLOQUEO, MOTIVO_BLOQUEO_COMPRAS MOTIVO_BLOQUEO ')
      else if ((TipoDoc = 'OFC') or (TipoDoc = 'PEC') or (TipoDoc = 'ALB') or (TipoDoc = 'FAC')) then
        SQL.Add('BLOQUEO_VENTAS BLOQUEO, MOTIVO_BLOQUEO_VENTAS MOTIVO_BLOQUEO ');
      SQL.Add(' FROM ART_ARTICULOS WHERE EMPRESA = :EMPRESA AND ARTICULO = :ARTICULO ');

      ParamByName('EMPRESA').AsInteger := Empresa;
      ParamByName('ARTICULO').AsString := Articulo;
      open;

      Bloqueo := FieldByName('BLOQUEO').AsInteger;
      Mensaje := FieldByName('MOTIVO_BLOQUEO').AsString;
    finally
      Free;
    end;

    { 0.- Sin mensaje
      1.- Aviso
      2.- Bloquear }
    Result := (Bloqueo = 2);
    if (Bloqueo > 0) then
    begin
      Mensaje := _('Motivo') + ': ' + Mensaje;

      if (Bloqueo = 1) then
        Tipo := _('Aviso');

      if (Bloqueo = 2) then
        Tipo := _('Bloqueo');

      ShowMessage(Mensaje + ' ' + Tipo);
    end;
  end;
end;

function TDMMain.DameDecimalesUnidad(Tipo: string): integer;
begin
  Result := 0;
  Tipo := Trim(Tipo);
  if (Tipo > '') then
  begin
    if (Tipo = UltimaUnidad) then
      Result := UltimoDecimales
    else
    begin
      with DameQueryRO(Self, DB) do
      begin
        try
          SQL.Text := 'SELECT DECIMALES FROM SYS_UNIDADES_ARTICULOS WHERE TIPO = :TIPO';
          ParamByName('TIPO').AsString := Tipo;
          open;
          Result := FieldByName('DECIMALES').AsInteger;
          UltimaUnidad := Tipo;
          UltimoDecimales := FieldByName('DECIMALES').AsInteger;
        finally
          Free;
        end;
      end;
    end;
  end;
end;

procedure TDMMain.RegistraSalida;
begin
  /// Asigna FECHA_FIN a la entrada para cerrarla

  with DameQueryRW(Self, DB) do
  begin
    try
      SQL.Text := 'EXECUTE PROCEDURE LOG_ENTRADAS_SALIDA (:ENTRADA, :MENU_LEFT, :MENU_TOP)';
      ParamByName('ENTRADA').AsInteger := Entorno.Entrada;
      ParamByName('MENU_LEFT').AsInteger := 0;
      ParamByName('MENU_TOP').AsInteger := 0;
      ExecSQL;

      Close;
      Transaction.Commit;
    finally
      Free;
    end;
  end;

  Entorno.Entrada := 0;
end;

function TDMMain.DameTituloIdiomaArticulo(id_a: integer; Idioma: string = ''): string;
var
  Resultado: string;
begin
  Resultado := '';
  Result := '';

  if (Idioma = '') then
    Idioma := Entorno.Idioma;

  if (id_a > 0) then
  begin
    with DameQueryRO(Self, DB) do
    begin
      try
        SQL.Text := 'SELECT TITULO FROM ART_ARTICULOS_IDIOMAS WHERE ID_A = :ID_A AND IDIOMA = :IDIOMA';
        ParamByName('ID_A').AsInteger := id_a;
        ParamByName('IDIOMA').AsString := Copy(Idioma, 1, 3);
        open;
        Resultado := FieldByName('TITULO').AsString;
      finally
        Free;
      end;
    end;
  end;

  if (Resultado = '') then
    Resultado := DameTituloArticulo(id_a);

  Result := Resultado;
end;

function TDMMain.DameLoteSimple(Articulo: string; Fecha: TDateTime): string;
begin
  with DameQueryRO(Self, DB) do
  begin
    try
      SQL.Add(' SELECT COALESCE((SELECT FIRST 1 LOTE_SIMPLE ');
      SQL.Add('                  FROM ART_LOTE_SIMPLE ');
      SQL.Add('                  WHERE ');
      SQL.Add('                  EMPRESA = A.EMPRESA AND ');
      SQL.Add('                  FAMILIA = A.FAMILIA AND ');
      SQL.Add('                  FECHA_INICIO <= :FECHA ');
      SQL.Add('                  ORDER BY FECHA_INICIO DESC), '''') LOTE_SIMPLE ');
      SQL.Add(' FROM ART_ARTICULOS A ');
      SQL.Add(' WHERE ');
      SQL.Add(' A.EMPRESA = :EMPRESA AND ');
      SQL.Add(' A.ARTICULO = :ARTICULO ');
      ParamByName('EMPRESA').AsInteger := Entorno.Empresa;
      ParamByName('ARTICULO').AsString := Articulo;
      ParamByName('FECHA').AsDateTime := Fecha;
      open;
      Result := FieldByName('LOTE_SIMPLE').AsString;
    finally
      Free;
    end;
  end;
end;

function TDMMain.DameAlmacenDefectoArticulo(Articulo: string): string;
begin
  Result := '';
  if (Trim(Articulo) > '') then
  begin
    with DameQueryRO(Self, DB) do
    begin
      try
        SQL.Add(' SELECT FIRST 1 ALMACEN FROM ART_ARTICULOS_ALMACENES_ART ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' ARTICULO = :ARTICULO AND ');
        SQL.Add(' DEFECTO = 1 ');
        ParamByName('EMPRESA').AsInteger := Entorno.Empresa;
        ParamByName('CANAL').AsInteger := Entorno.Canal;
        ParamByName('ARTICULO').AsString := Articulo;
        open;
        Result := Trim(FieldByName('ALMACEN').AsString);
      finally
        Free;
      end;
    end;
  end;
end;

function TDMMain.DameRiesgoPedido(Cliente: integer): double;
begin
  Result := 0;
  if (Cliente <> 0) then
  begin
    with DameQueryRO(Self, DB) do
    begin
      try
        SQL.Add(' SELECT SUM(D.LIQUIDO / D.UNIDADES * P.U_PENDIENTES) FROM GES_CABECERAS_S C ');
        SQL.Add(' JOIN GES_DETALLES_S D ON ');
        SQL.Add(' C.ID_S = D.ID_S ');
        SQL.Add(' JOIN GES_DETALLES_S_PED P ON ');
        SQL.Add(' D.ID_DETALLES_S=P.ID_DETALLES_S ');
        SQL.Add(' WHERE ');
        SQL.Add(' C.EMPRESA = ' + Entorno.Empresa.ToString + ' AND ');
        SQL.Add(' C.CANAL = ' + Entorno.Canal.ToString + ' AND ');
        SQL.Add(' C.TIPO = ''PEC'' AND ');
        SQL.Add(' C.ESTADO = 0 AND ');
        SQL.Add(' D.UNIDADES <> 0 AND ');
        SQL.Add(' P.U_PENDIENTES <> 0 AND ');
        SQL.Add(' C.CLIENTE = ' + IntToStr(Cliente));
        try
          open;
          Result := FieldByName('SUM').AsFloat;
        except
          Result := 0;
        end;
      finally
        Free;
      end;
    end;
  end;
end;

function TDMMain.DameMargenUtilidad(PrecioVenta, PrecioCoste: double): double;
begin
  if (PrecioVenta <> 0) then
    Result := (1 - (PrecioCoste / PrecioVenta)) * 100
  else
    Result := 0;
end;

function TDMMain.DameTituloArticulo(id_a: integer): string;
begin
  Result := '';
  if (id_a > 0) then
  begin
    with DameQueryRO(Self, DB) do
    begin
      try
        SQL.Text := 'SELECT TITULO_LARGO FROM ART_ARTICULOS WHERE ID_A = ' + IntToStr(id_a);
        open;
        Result := FieldByName('TITULO_LARGO').AsString;
      finally
        Free;
      end;
    end;
  end;
end;

function TDMMain.ValidaUsuario(Usuario, Password: string): boolean;
begin
  /// Valida que el usuario y password sean correctos.
  /// Actualiza el entorno con los datos EECS de ultimo acceso.

  Result := False;
  with DameQueryRW(Self, DB) do
  begin
    try
      try
        SQL.Text := 'SELECT * FROM LOG_ENTRADAS_VALIDA_SA (:NOMBRE, :ENTRADA)';
        ParamByName('NOMBRE').AsString := Trim(Copy(Usuario, 1, 31));
        ParamByName('ENTRADA').AsInteger := Entorno.Entrada;
        open;
        Result := (FieldByName('USUARIO').AsInteger > 0) and (FieldByName('CLAVE').AsString = Password);

        if Result then
        begin
          Entorno.IdUsuario := FieldByName('USUARIO').AsInteger;
          Entorno.Usuario := Usuario;
          Entorno.Password := Password;
          Entorno.Empresa := FieldByName('EMPRESA').AsInteger;
          Entorno.Ejercicio := FieldByName('EJERCICIO').AsInteger;
          Entorno.Canal := FieldByName('CANAL').AsInteger;
          Entorno.MemorizarFechaTrab := (FieldByName('MEMORIZAR').AsInteger = 1);
          Entorno.Moneda := FieldByName('MONEDA').AsString;
          Entorno.Pais := FieldByName('PAIS').AsString;
          Entorno.SMTP_Servidor := Trim(FieldByName('SMTP_SERVIDOR').AsString);
          Entorno.SMTP_Puerto := FieldByName('SMTP_PUERTO').AsInteger;
          Entorno.SMTP_Usuario := Trim(FieldByName('SMTP_USUARIO').AsString);
          Entorno.SMTP_Password := Trim(FieldByName('SMTP_PASSWORD').AsString);
          Entorno.SMTP_Identificacion := (FieldByName('SMTP_AUTENTIFICAR').AsInteger = 1);
          Entorno.SMTP_AutenticacionTLS := (FieldByName('SMTP_TSL').AsInteger = 1);
          Entorno.PGC := FieldByName('PGC').AsInteger;
          Entorno.Memorizar_Fecha := FieldByName('MEMORIZAR').AsInteger = 1;

          if Entorno.Pais <> '' then
            Entorno.Idioma := DameTitulo('SYS_PAISES', 'IDIOMA', 'PAIS', '', '', Entorno.Pais);

          if Entorno.Idioma <> '' then
          begin
            IdiomaFastReport(Entorno.Idioma);
            UseLanguage(Entorno.Idioma);
          end;

          if Entorno.MemorizarFechaTrab then
            Entorno.FechaTrab := FieldByName('FECHA').AsDateTime
          else
            Entorno.FechaTrab := Now;

          CargaAlmacenDefecto;
          with QDatosEmpresa do
          begin
            Close;
            ParamByName('EMPRESA').AsInteger := Entorno.Empresa;
            open;
          end;

        end;

        Close;
        Transaction.Commit;
      except
        on E: Exception do
          ShowMessage('Error al intentar hacer Login.' + #13#10 + E.Message);
      end;
    finally
      Free;
    end;
  end;

  if Result then
  begin
    // Busco los datos de la última entrada a la aplicacion
    with DameQueryRO(Self, DB) do
    begin
      try
        try
          SQL.Add(' SELECT FIRST 1 EMPRESA, EJERCICIO, CANAL, SERIE, MEMORIZAR_FECHA, FECHA_TRABAJO ');
          SQL.Add(' FROM SYS_USUARIOS_ULTIMO_ACCESO ');
          SQL.Add(' WHERE USUARIO = :USUARIO ');
          SQL.Add(' ORDER BY ULT_MODIFICACION DESC ');
          ParamByName('USUARIO').AsInteger := Entorno.IdUsuario;
          open;
          if (FieldByName('EMPRESA').AsInteger <> 0) then
          begin
            Entorno.Empresa := FieldByName('EMPRESA').AsInteger;
            Entorno.Ejercicio := FieldByName('EJERCICIO').AsInteger;
            Entorno.Canal := FieldByName('CANAL').AsInteger;
            Entorno.Serie := FieldByName('SERIE').AsString;
            Entorno.MemorizarFechaTrab := (FieldByName('MEMORIZAR_FECHA').AsInteger = 1);
            if Entorno.MemorizarFechaTrab then
              Entorno.FechaTrab := FieldByName('FECHA_TRABAJO').AsDateTime
            else
              Entorno.FechaTrab := Now;
          end;

          Close;
        except
          on E: Exception do
            ShowMessage('Error al intentar hacer Login.' + #13#10 + E.Message);
        end;
      finally
        Free;
      end;
    end;
  end;
  ActualizaUsuario;
end;

function TDMMain.Login(Usuario, Password: string): boolean;
var
  Correo, Licencia: string;
begin
  Log('DMMain.Login');
  Log(format('Usuario: %s', [Usuario]));
  Log(format('Password: %s', [StringOfChar('*', Length(Password))]));

  // Crea un nuevo numero de entrada
  RegistraEntrada;

  // Esto valida el usuario y actualiza el entorno con EECS de ultimo acceso
  Result := ValidaUsuario(Usuario, Password);

  if Result then
  begin
    // En caso de login correcto
    EscribeDatoIni('Sesion', 'Usuario', Entorno.Usuario);
    EscribeDatoIni('Sesion', 'FechaInicio', Now);
    EscribeDatoIni('Datos', 'TituloEmpresa', DameTitulo('SYS_EMPRESAS', 'TITULO', 'EMPRESA', '', '', Entorno.Empresa));
    DameEmailLicencia(Correo, Licencia);
    EscribeDatoIni('Datos', 'Licencia', Licencia);
    EscribeDatoIni('Datos', 'Correo', Correo);
  end
  else
    // En caso de login incorrecto
    Logout;
end;

function TDMMain.Logout: boolean;
begin
  Log('DMMain.Logout');
  if (Entorno.Entrada <> 0) then
    RegistraSalida;

  // Temporalmente, para poder hacer verificaciones
  // En caso de logout correcto
  Entorno.Entrada := 0;
  Entorno.Empresa := 0;
  Entorno.Ejercicio := 0;
  Entorno.Canal := 0;
  Entorno.Serie := '';
  Entorno.IdUsuario := 0;
  Entorno.Usuario := '';
  // Olvido la ultima clave utilizada
  Entorno.Password := '';

  EscribeDatoIni('Sesion', 'FechaCierre', Now);

  Result := True;
end;

procedure TDMMain.ActualizaDatosUltimoLogin;
begin
  with DameQueryRW(Self, DB) do
  begin
    try
      SQL.Text :=
        'EXECUTE PROCEDURE S_USUARIOS_ACTUALIZA (:EMPRESA, :EJERCICIO, :CANAL, :USUARIO, :FECHA, :MEMORIZAR_FECHA)';
      ParamByName('USUARIO').AsInteger := Entorno.IdUsuario;
      ParamByName('EMPRESA').AsInteger := Entorno.Empresa;
      ParamByName('EJERCICIO').AsInteger := Entorno.Ejercicio;
      ParamByName('CANAL').AsInteger := Entorno.Canal;
      ParamByName('FECHA').AsDateTime := Entorno.FechaTrab;
      ParamByName('MEMORIZAR_FECHA').AsInteger := BoolToInt(Entorno.MemorizarFechaTrab);
      ExecSQL;
      Transaction.Commit;
      Close;
    finally
      Free;
    end;
  end;

  with DameQueryRW(Self, DB) do
  begin
    try
      SQL.Add(' UPDATE OR INSERT INTO SYS_USUARIOS_ULTIMO_ACCESO ( ');
      SQL.Add(' USUARIO, EMPRESA, EJERCICIO, CANAL, SERIE, MEMORIZAR_FECHA, FECHA_TRABAJO) ');
      SQL.Add(' VALUES ( ');
      SQL.Add(' :USUARIO, :EMPRESA, :EJERCICIO, :CANAL, :SERIE, :MEMORIZAR_FECHA, :FECHA_TRABAJO) ');
      SQL.Add(' MATCHING (USUARIO, EMPRESA, EJERCICIO, CANAL) ');
      ParamByName('USUARIO').AsInteger := Entorno.IdUsuario;
      ParamByName('EMPRESA').AsInteger := Entorno.Empresa;
      ParamByName('EJERCICIO').AsInteger := Entorno.Ejercicio;
      ParamByName('CANAL').AsInteger := Entorno.Canal;
      ParamByName('SERIE').AsString := Entorno.Serie;
      ParamByName('FECHA_TRABAJO').AsDateTime := Entorno.FechaTrab;
      ParamByName('MEMORIZAR_FECHA').AsInteger := BoolToInt(Entorno.MemorizarFechaTrab);
      ExecSQL;
      Transaction.Commit;
      Close;
    finally
      Free;
    end;
  end;
end;

function TDMMain.UtilizaVerifactu: boolean;
begin
  with DameQueryRO(Self, DB) do
  begin
    try
      SQL.Text :=
        'SELECT UTILIZA_VERIFACTU FROM EMP_MODELOS_HACIENDA WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL';
      ParamByName('EMPRESA').AsInteger := Entorno.Empresa;
      ParamByName('EJERCICIO').AsInteger := Entorno.Ejercicio;
      ParamByName('CANAL').AsInteger := Entorno.Canal;
      open;
      Result := (FieldByName('UTILIZA_VERIFACTU').AsInteger = 1);
    finally
      Free;
    end;
  end;
end;

function TDMMain.RellenaEmpresas(Lista: TStrings; Todos: boolean = True): integer;
var
  Empresa: integer;
begin
  /// Rellena la lista de empresas de la base de datos.
  /// En el objeto asociado al item asigna al numero de empresa.
  /// Devuelve el ItemIndex asociado al entorno.

  Result := -1;
  Lista.Clear;
  if Todos then
    Lista.AddObject('Todas las Empresas', TObject(0));

  with DameQueryRO(Self, DB) do
  begin
    try
      SQL.Add(' SELECT EMPRESA, TITULO FROM SYS_EMPRESAS ');
      SQL.Add(' WHERE ABIERTA = 1');
      SQL.Add(' ORDER BY EMPRESA');
      open;

      while not EOF do
      begin
        Empresa := FieldByName('EMPRESA').AsInteger;
        Lista.AddObject(FieldByName('TITULO').AsString, TObject(Pointer(Empresa)));

        if (Empresa = Entorno.Empresa) then
          Result := Lista.Count - 1;

        Next;
      end;
      Close;
    finally
      Free;
    end;
  end;
end;

function TDMMain.RellenaEjercicios(Lista: TStrings; Todos: boolean = True): integer;
var
  Ejercicio: integer;
begin
  /// Rellena la lista de ejercicios de la empresa del entorno.
  /// En el objeto asociado al item asigna al numero de ejercicio.
  /// Devuelve el ItemIndex asociado al entorno.

  Result := -1;
  Lista.Clear;
  if Todos then
    Lista.AddObject('Todos los Ejercicios', TObject(0));

  with DameQueryRO(Self, DB) do
  begin
    try
      SQL.Add(' SELECT EJERCICIO, APERTURA, CIERRE FROM EMP_EJERCICIOS ');
      SQL.Add(' WHERE EMPRESA = :EMPRESA ');
      SQL.Add(' ORDER BY EJERCICIO DESC');
      ParamByName('EMPRESA').AsInteger := Entorno.Empresa;
      open;

      while not EOF do
      begin
        Ejercicio := FieldByName('EJERCICIO').AsInteger;
        Lista.AddObject(IntToStr(Ejercicio) + ' (' + DateToStr(FieldByName('APERTURA').AsDateTime) + '-' +
          DateToStr(FieldByName('CIERRE').AsDateTime) + ')', TObject(Pointer(Ejercicio)));

        if (Ejercicio = Entorno.Ejercicio) then
          Result := Lista.Count - 1;

        Next;
      end;

      Close;
      Transaction.Commit;
    finally
      Free;
    end;
  end;
end;

function TDMMain.RellenaCanales(Lista: TStrings; Todos: boolean = True): integer;
var
  Canal: integer;
begin
  /// Rellena la lista de canales de la empresa/ejercicio del entorno.
  /// En el objeto asociado al item asigna al numero de canal.
  /// Devuelve el ItemIndex asociado al entorno.

  Result := -1;
  Lista.Clear;
  if Todos then
    Lista.AddObject('Todos los Canales', TObject(0));

  with DameQueryRO(Self, DB) do
  begin
    try
      SQL.Add(' SELECT CANAL FROM EMP_CANALES ');
      SQL.Add(' WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND ACTIVO = 1');
      SQL.Add(' ORDER BY CANAL');
      ParamByName('EMPRESA').AsInteger := Entorno.Empresa;
      ParamByName('EJERCICIO').AsInteger := Entorno.Ejercicio;
      open;

      while not EOF do
      begin
        Canal := FieldByName('CANAL').AsInteger;
        Lista.AddObject('Canal' + ' ' + IntToStr(Canal), TObject(Pointer(Canal)));

        if (Canal = Entorno.Canal) then
          Result := Lista.Count - 1;

        Next;
      end;

      Close;
      Transaction.Commit;
    finally
      Free;
    end;
  end;
end;

Function TDMMain.EliminarImagen(Codigo: integer): boolean;
begin
  Result := False;
  try
    with DameQueryRW(Self, DB) do
    begin
      try
        SQL.Add(' DELETE from SYS_IMAGENES ');
        SQL.Add(' WHERE CODIGO = :CODIGO ');
        ParamByName('CODIGO').AsInteger := Codigo;
        ExecSQL;
        Close;
        Transaction.Commit;
      finally
        Free;
      end;
    end;
    Result := True;
  except
    Result := False;
    ShowMessage('Error eliminando imagen');
  end;

end;

function TDMMain.RellenaSeries(Lista: TStrings; Todos: boolean = True): integer;
var
  Serie: string;
begin
  /// Rellena la lista de series de la empresa/ejercicio del entorno.
  /// El formato del texto será "[SERIE] [DESCRIPCION]".
  /// Devuelve el ItemIndex asociado al entorno.

  Result := -1;
  Lista.Clear;
  if Todos then
    Lista.AddObject('Todas las Series', TObject(0));

  with DameQueryRO(Self, DB) do
  begin
    try
      SQL.Add(' SELECT SERIE, TITULO FROM VER_CANALES_SERIES ');
      SQL.Add(' WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL');
      SQL.Add(' ORDER BY SERIE');
      ParamByName('EMPRESA').AsInteger := Entorno.Empresa;
      ParamByName('EJERCICIO').AsInteger := Entorno.Ejercicio;
      ParamByName('CANAL').AsInteger := Entorno.Canal;
      open;

      while not EOF do
      begin
        Serie := FieldByName('SERIE').AsString;
        Lista.Add(Serie + ' ' + FieldByName('TITULO').AsString);

        if (Serie = Entorno.Serie) then
          Result := Lista.Count - 1;

        Next;
      end;

      Close;
      Transaction.Commit;
    finally
      Free;
    end;
  end;
end;

function TDMMain.ContadorGen(NomGen: string): integer;
begin
  Result := 0;
  if (Trim(NomGen) > '') then
  begin
    with TFDQuery.Create(nil) do
    begin
      try
        Close;
        Connection := DB;
        SQL.Text := 'SELECT GEN_ID(' + NomGen + ', 1) FROM RDB$DATABASE';
        open;
        Result := Fields[0].AsInteger;
        Close;
      finally
        Free;
      end;
    end;
  end;
end;

function TDMMain.InsertaImagenNueva: integer;
var
  ImageStream: TMemoryStream;
  ODAbrirImagen: TOpenDialog;
  Ruta, Extension, CaminoyNombre, Nombre: string;
  ImageCode: integer;
  m, f: TStream;
  DS: TFDQuery;
begin
  ImageCode := -1;

  Extension := '';
  Ruta := '';
  CaminoyNombre := '';
  ODAbrirImagen := TOpenDialog.Create(nil);
  ODAbrirImagen.Filter :=
    'Archivos de imagen (*.bmp; *.jpg; *.jpeg; *.png; *.gif; *.tiff)|*.bmp;*.jpg;*.jpeg;*.png;*.gif;*.tiff';

  if ODAbrirImagen.Execute then
  begin
    Nombre := ExtractFileName(ODAbrirImagen.FileName);
    CaminoyNombre := ODAbrirImagen.FileName;
    Ruta := ExtractFilePath(ODAbrirImagen.FileName);
    Extension := UpperCase(RightStr(ExtractFileExt(Nombre), 3));
  end;

  ImageStream := TMemoryStream.Create;

  try
    ImageStream.LoadFromFile(CaminoyNombre);

    DS := DameQueryRW(Self, DMMain.DB);
    with DS do
    begin
      try
        ImageCode := DMMain.ContadorGen('CONTA_IMAGENES');

        SQL.Add(' INSERT INTO SYS_IMAGENES ( ');
        SQL.Add(' CODIGO,NOMBRE,FORMATO,RUTA,ULT_MODIFICACION,SINC_TIPO,SINC_REFERENCIA,REPOSITORIO) ');
        SQL.Add(' VALUES ( ');
        SQL.Add(' :CODIGO,:NOMBRE,:FORMATO,:RUTA,:ULT_MODIFICACION,:SINC_TIPO,:SINC_REFERENCIA,:REPOSITORIO) ');

        ParamByName('NOMBRE').AsString := LeftStr(Nombre, 35);
        ParamByName('FORMATO').Value := Extension;
        ParamByName('RUTA').Value := Ruta;
        ParamByName('ULT_MODIFICACION').AsDateTime := Now;
        ParamByName('SINC_TIPO').Value := '';
        ParamByName('SINC_REFERENCIA').Value := '';
        ParamByName('REPOSITORIO').Value := 1;

        ParamByName('CODIGO').AsInteger := ImageCode;
        ExecSQL;
        Close;
        Transaction.Commit;
      except
        on E: Exception do
          ShowMessage('Error al intentar guardar Imagen ' + #13#10 + E.Message);
      end;
      Free;
    end;

    DS := DameQueryRW(Self, DMMain.DB);
    with DS do
    begin
      SQL.Add(' SELECT IMAGEN FROM SYS_IMAGENES WHERE CODIGO=:CODIGO ');
      ParamByName('CODIGO').AsInteger := ImageCode;
      open;
      Edit;
      m := CreateBlobStream(FieldByName('IMAGEN'), bmWrite);
      try
        f := TFileStream.Create(ODAbrirImagen.FileName, fmOpenRead);
        try
          m.CopyFrom(f, f.Size);
        finally
          f.Free;
        end;
      finally
        m.Free;
      end;
      Post;
      Close;
      Transaction.Commit;
    end
  finally
    ImageStream.Free;
  end;
  Result := ImageCode;
end;

function TDMMain.InsertaImagen(Consulta: TFDQuery; Nombre, CampoIDImagen: string; im: TBitmap;
  ImageCode: integer): integer;
var
  ImageStream: TMemoryStream;
  ImageExists: boolean;
  ODAbrirImagen: TOpenDialog;
  Ruta, Extension, CaminoyNombre: string;
begin
  Result := -1;

  Extension := '';
  Ruta := '';
  CaminoyNombre := '';
  if Nombre = '' then
  begin
    try
      ODAbrirImagen := TOpenDialog.Create(nil);
      ODAbrirImagen.Filter :=
        'Archivos de imagen (*.bmp; *.jpg; *.jpeg; *.png; *.gif; *.tiff)|*.bmp;*.jpg;*.jpeg;*.png;*.gif;*.tiff';
      if ODAbrirImagen.Execute then
      begin
        Nombre := ExtractFileName(ODAbrirImagen.FileName);
        CaminoyNombre := ODAbrirImagen.FileName;
        Ruta := ExtractFilePath(ODAbrirImagen.FileName);
        Extension := UpperCase(RightStr(ExtractFileExt(Nombre), 3));
      end
      else
        Exit; // si se da cancelar en abrir Image, Cancela el instertar imagen
    finally
      ODAbrirImagen.Free;
    end;
  end;

  try
    ImageStream := TMemoryStream.Create;
    if im = nil then
      ImageStream.LoadFromFile(CaminoyNombre)
    else
      im.SaveToStream(ImageStream);

    with DameQueryRW(Self, DMMain.DB) do
    begin
      try
        // Verificar si el código ya existe
        SQL.Text := 'SELECT COUNT(*) FROM sys_imagenes WHERE CODIGO = :CODIGO';
        ParamByName('CODIGO').AsInteger := ImageCode;
        open;
        ImageExists := Fields[0].AsInteger > 0;
        Close;
        SQL.Clear;

        if ImageExists then
          if ImageCode <> 0 then
            SQL.Text := 'UPDATE sys_imagenes SET IMAGEN = :IMAGEN WHERE CODIGO = :CODIGO';

        if (not ImageExists) or (ImageCode = 0) then
        begin
          ImageCode := DMMain.ContadorGen('CONTA_IMAGENES');

          SQL.Add(' INSERT INTO SYS_IMAGENES ( ');
          SQL.Add(' CODIGO,IMAGEN,NOMBRE,FORMATO,RUTA,ULT_MODIFICACION,SINC_TIPO,SINC_REFERENCIA,REPOSITORIO) ');
          SQL.Add(' VALUES ( ');
          SQL.Add(' :CODIGO,:IMAGEN,:NOMBRE,:FORMATO,:RUTA,:ULT_MODIFICACION,:SINC_TIPO,:SINC_REFERENCIA,:REPOSITORIO) ');

          ParamByName('NOMBRE').AsString := LeftStr(Nombre, 35);
          ParamByName('FORMATO').Value := Extension;
          ParamByName('RUTA').Value := Ruta;
          ParamByName('ULT_MODIFICACION').AsDateTime := Now;
          ParamByName('SINC_TIPO').Value := '';
          ParamByName('SINC_REFERENCIA').Value := '';
          ParamByName('REPOSITORIO').Value := 1;
        end;

        ParamByName('CODIGO').AsInteger := ImageCode;
        ParamByName('IMAGEN').LoadFromStream(ImageStream, ftBlob);

        ExecSQL;
        Close;
        Transaction.Commit;

        if assigned(Consulta) then
          if not(Consulta.State in [dsEdit]) then
          begin
            Consulta.Edit;
            Consulta.FieldByName(CampoIDImagen).AsInteger := ImageCode;
            Consulta.Post;
            Consulta.Refresh;
          end;
        Result := ImageCode;
      except
        on E: Exception do
          ShowMessage('Error al intentar guardar Imagen ' + #13#10 + E.Message);
      end;
    end;
  finally
    ImageStream.Free;
  end;
end;

procedure TDMMain.IdiomaFastReport(Idioma: string);
var
  CaminoFastReport: string;
begin
  CaminoFastReport := ExtractFilePath(ParamStr(0)) + 'FR';

  if DirectoryExists(CaminoFastReport) then
    if Idioma = 'CAS' then
    begin
      frxResources.LoadFromFile(CaminoFastReport + '\ES\' + 'frxrcDesgn.xml');
      frxResources.LoadFromFile(CaminoFastReport + '\ES\' + 'frxrcClass.xml');
      frxResources.LoadFromFile(CaminoFastReport + '\ES\' + 'frxrcExports.xml');
      frxResources.LoadFromFile(CaminoFastReport + '\ES\' + 'frxrcInsp.xml');
    end;
end;

function TDMMain.DameAlmacenDocumento(Tipo, Serie: string): string;
begin
  // if (Entorno.AlmacenRestringido <> '') then
  // Result := Entorno.AlmacenRestringido
  // else
  Result := LeeParametro('ALMD' + Tipo + '001', Serie);

  // if (Trim(Result) = '') then
  // Result := Entorno.AlmacenDefecto;}
end;

function TDMMain.DameTituloDireccion(Direccion, Tercero: integer): string;
begin
  with DameQueryRO(nil, DMMain.DB) do
  begin
    try
      Close;
      SQL.Text := 'SELECT TITULO FROM VER_DIRECCIONES WHERE TERCERO=:TERCERO AND DIRECCION=:DIRECCION';
      ParamByName('TERCERO').AsInteger := Tercero;
      ParamByName('DIRECCION').AsInteger := Direccion;
      open;
      Result := FieldByName('TITULO').AsString;
    finally
      Free;
    end;
  end;

end;

function TDMMain.DameTituloEstado(Estado: integer): string;
begin
  with DameQueryRO(nil, DMMain.DB) do
  begin
    try
      Close;
      SQL.Text := 'SELECT TITULO FROM SYS_GES_ESTADOS WHERE ESTADO=:ESTADO';
      ParamByName('ESTADO').AsInteger := Estado;
      open;
      Result := FieldByName('TITULO').AsString;
      Close;
    finally
      Free;
    end;
  end;

end;

procedure TDMMain.SaldoAnticipo(Tipo: string; CodCliPro: integer; Fecha: TDateTime; var Saldo: double;
  var Moneda: string);
var
  Select: string;
  UsarAnticipos: boolean;
begin
  Saldo := 0;
  Moneda := Entorno.Moneda;

  if (Tipo = 'CLI') then
    Select := 'SELECT USAR_ANTICIPOS FROM EMP_CLIENTES WHERE EMPRESA = :EMPRESA AND CLIENTE = :COD_CLI_PRO'
  else if (Tipo = 'PRO') then
    Select := 'SELECT USAR_ANTICIPOS FROM EMP_PROVEEDORES WHERE EMPRESA = :EMPRESA AND PROVEEDOR = :COD_CLI_PRO'
  else if (Tipo = 'ACR') then
    Select := 'SELECT USAR_ANTICIPOS FROM EMP_ACREEDORES WHERE EMPRESA = :EMPRESA AND ACREEDOR = :COD_CLI_PRO';

  with DameQueryRO(nil, DMMain.DB) do
  begin
    try
      Close;
      SQL.Text := Select;
      ParamByName('EMPRESA').AsInteger := Entorno.Empresa;
      ParamByName('COD_CLI_PRO').AsInteger := CodCliPro;
      open;
      UsarAnticipos := (FieldByName('USAR_ANTICIPOS').AsInteger = 1);
      Close;
    finally
      Free;
    end;
  end;

  if (UsarAnticipos) then
  begin
    with DameQueryRO(nil, DMMain.DB) do
    begin
      try
        Close;
        SQL.Text :=
          'EXECUTE PROCEDURE C_DAME_SALDO_CUENTA_ANT (:EMPRESA, :EJERCICIO, :CANAL, :TIPO_TERCERO, :COD_CLI_PRO, :FECHA)';
        ParamByName('EMPRESA').AsInteger := Entorno.Empresa;
        ParamByName('EJERCICIO').AsInteger := Entorno.Ejercicio;
        ParamByName('CANAL').AsInteger := Entorno.Canal;
        ParamByName('TIPO_TERCERO').AsString := Tipo;
        ParamByName('COD_CLI_PRO').AsInteger := CodCliPro;
        ExecSQL;
        open;
        Saldo := FieldByName('SALDO').AsFloat;
        Moneda := FieldByName('MONEDA').AsString;
        if (Tipo = 'CLI') then
          Saldo := Saldo * (-1);
        Close;
      finally
        Free;
      end;
    end;

    { dji lrk kri - Santa Lucia - Que pueda tomar los Anticipos sin cerrar ejercicio }
    if (not DMMain.EjercicioContableAbierto(Entorno.Ejercicio)) then
    begin
      // Capturo excepciones por si el cod_cli_pro no existe en este ejercicio
      try
        with DameQueryRO(nil, DMMain.DB) do
        begin
          try
            Close;
            SQL.Text :=
              'EXECUTE PROCEDURE C_DAME_SALDO_CUENTA_ANT (:EMPRESA, :EJERCICIO, :CANAL, :TIPO_TERCERO, :COD_CLI_PRO, :FECHA)';
            ParamByName('EMPRESA').AsInteger := Entorno.Empresa;
            ParamByName('EJERCICIO').AsInteger := Entorno.Ejercicio;
            ParamByName('CANAL').AsInteger := Entorno.Canal;
            ParamByName('TIPO_TERCERO').AsString := Tipo;
            ParamByName('COD_CLI_PRO').AsInteger := CodCliPro;
            ParamByName('FECHA').AsDateTime := EncodeDate(Entorno.Ejercicio - 1, 01, 01);;
            ExecSQL;
            open;
            Saldo := FieldByName('SALDO').AsFloat;
            Moneda := FieldByName('MONEDA').AsString;
            if (Tipo = 'CLI') then
              Saldo := Saldo * (-1);
            Close;
          finally
            Free;
          end;
        end;
      except
      end;
    end;
  end;
end;

function TDMMain.EjercicioContableAbierto(Ejercicio: integer): boolean;
begin
  Result := False;
  if (Ejercicio > 0) then
  begin
    with DameQueryRO(nil, DMMain.DB) do
    begin
      try
        Close;
        SQL.Text := ' SELECT ATO_APERTURA FROM EMP_CANALES WHERE EMPRESA=' + Entorno.Empresa.ToString +
          ' AND EJERCICIO=' + IntToStr(Ejercicio) + ' AND CANAL=' + Entorno.Canal.ToString;
        open;
        Result := FieldByName('ATO_APERTURA').AsInteger > 0;
        Close;
      finally
        Free;
      end;
    end;
  end;
end;

procedure TDMMain.CreaReferenciaDte(id_s, CODREF, ID_S_REF: integer; FOLIOREF, TPODOCREF, RAZONREF, RUTOTR: string;
  FCHREF: TDateTime);
begin
  with DameQueryRW(nil, DMMain.DB) do
  begin
    try
      SQL.Add('INSERT INTO SII_DTE_REFERENCIA ');
      SQL.Add('(ID_S, TPODOCREF, FOLIOREF, FCHREF, CODREF, RAZONREF, ID_S_REF, RUTOTR) ');
      SQL.Add('VALUES ');
      SQL.Add('(:ID_S, :TPODOCREF, :FOLIOREF, :FCHREF, :CODREF, :RAZONREF, :ID_S_REF, :RUTOTR) ');
      ParamByName('ID_S').AsInteger := id_s;
      ParamByName('TPODOCREF').AsString := TPODOCREF;
      ParamByName('FOLIOREF').AsString := FOLIOREF;
      ParamByName('FCHREF').AsDateTime := FCHREF;
      ParamByName('CODREF').AsInteger := CODREF;
      ParamByName('RAZONREF').AsString := RAZONREF;
      ParamByName('ID_S_REF').AsInteger := ID_S_REF;
      ParamByName('RUTOTR').AsString := RUTOTR;
      ExecSQL;
      Transaction.Commit;
    finally
      Free;
    end;
  end;
end;

function TDMMain.DameLlaveDosificacion(Tipo, Autorizacion: string): string;
begin
  with DameQueryRO(nil, DMMain.DB) do
  begin
    try
      Close;
      SQL.Add(' SELECT FIRST 1 LLAVE_DOSIFICACION FROM SFV_AUTORIZACIONES ');
      SQL.Add(' WHERE ');
      SQL.Add(' EMPRESA = :EMPRESA AND ');
      SQL.Add(' TIPO = :TIPO AND ');
      SQL.Add(' AUTORIZACION = :AUTORIZACION ');
      ParamByName('EMPRESA').AsInteger := Entorno.Empresa;
      ParamByName('TIPO').AsString := Tipo;
      ParamByName('AUTORIZACION').AsString := Autorizacion;
      open;
      Result := FieldByName('LLAVE_DOSIFICACION').AsString;
      Close;
    finally
      Free;
    end;
  end;
end;

function TDMMain.DameNumeroDosifiacion(Tipo, Autorizacion: string): integer;
begin
  with DameQueryRO(nil, DMMain.DB) do
  begin
    try
      Close;
      SQL.Add(' SELECT CONTADOR FROM SFV_DAME_NUM_DOSIFICACION(:EMPRESA, :TIPO, :AUTORIZACION) ');
      ParamByName('EMPRESA').AsInteger := Entorno.Empresa;
      ParamByName('TIPO').AsString := Tipo;
      ParamByName('AUTORIZACION').AsString := Autorizacion;
      open;
      Result := FieldByName('CONTADOR').AsInteger;
      Close;
    finally
      Free;
    end;
  end;
end;

function TDMMain.DameLineaSiguiente(Tipo: string; IdDoc: integer): integer;
begin
  with DameQueryRO(nil, DMMain.DB) do
  begin
    try
      Close;
      if ((Tipo = 'OFP') or (Tipo = 'OCP') or (Tipo = 'ALP') or (Tipo = 'PEP') or (Tipo = 'FAP') or (Tipo = 'FCR')) then
        SQL.Text := 'SELECT MAX(LINEA) FROM GES_DETALLES_E WHERE ID_E = :ID_DOC'
      else if ((Tipo = 'OFC') or (Tipo = 'ALB') or (Tipo = 'PEC') or (Tipo = 'FAC')) then
        SQL.Text := 'SELECT MAX(LINEA) FROM GES_DETALLES_S WHERE ID_S = :ID_DOC'
      else if (Tipo = 'MOV') then
        SQL.Text := 'SELECT MAX(LINEA) FROM GES_DETALLES_ST WHERE ID_ST = :ID_DOC'
      else if (Tipo = 'REG') then
        SQL.Text := 'SELECT MAX(LINEA) FROM ART_REG_INVENTARIO_DETALLE WHERE ID_REG = :ID_DOC'
      else if (Tipo = 'PEA') then
        SQL.Text := 'SELECT MAX(LINEA) FROM GES_DETALLES_PEA WHERE (ID_CAB = :ID_DOC)'
      else if (Tipo = 'REP') then
        SQL.Text := 'SELECT MAX(LINEA) FROM REPAR_DET_REPARACIONES WHERE IDCABREPARAR = :ID_DOC'
      else if (Tipo = 'PLA') then
        SQL.Text := 'SELECT MAX(LINEA) FROM PRO_PMP_DET WHERE ID_PLANIFICACION = :ID_DOC';

      ParamByName('ID_DOC').AsInteger := IdDoc;
      open;
      Result := FieldByName('MAX').AsInteger + 1;
      Close;
    finally
      Free;
    end;
  end;
end;

function TDMMain.EjercicioActivo(Ejercicio: integer; Empresa: integer = 0): boolean;
begin
  if (Empresa = 0) then
    Empresa := Entorno.Empresa;

  with DameQueryRO(nil, DMMain.DB) do
  begin
    try
      Close;
      SQL.Text :=
        'SELECT FIRST 1 EJERCICIO FROM EMP_EJERCICIOS WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND ACTIVO = 1';
      ParamByName('EMPRESA').AsInteger := Empresa;
      ParamByName('EJERCICIO').AsInteger := Ejercicio;
      open;
      Result := (FieldByName('EJERCICIO').AsInteger > 0);
    finally
      Free;
    end;
  end;
end;

function TDMMain.DameEjercicio(Empresa: integer; Fecha: TDateTime): integer;
begin
  with DameQueryRO(nil, DMMain.DB) do
  begin
    try
      Close;
      SQL.Text := 'EXECUTE PROCEDURE E_PRONOSTICA_EJERCICIO(:EMPRESA, :FECHA)';
      ParamByName('EMPRESA').AsInteger := Empresa;
      ParamByName('FECHA').AsDateTime := Fecha;
      open;
      Result := FieldByName('EJERCICIO').AsInteger;
    finally
      Free;
    end;
  end;
end;

function TDMMain.DameIdModeloArticulo(id_a: integer): integer;
begin
  with DameQueryRO(nil, DMMain.DB) do
  begin
    try
      Close;
      SQL.Add(' SELECT AMC.ID_A_M ');
      SQL.Add(' FROM ART_ARTICULOS A ');
      SQL.Add(' JOIN ART_ARTICULOS_M_C_TALLAS AMCT ON (A.ID_A_M_C_T = AMCT.ID_A_M_C_T) ');
      SQL.Add(' JOIN ART_ARTICULOS_MOD_COLOR AMC ON (AMCT.ID_A_M_C = AMC.ID_A_M_C) ');
      SQL.Add(' WHERE ');
      SQL.Add(' A.ID_A = :ID_A ');
      ParamByName('ID_A').AsInteger := id_a;
      open;
      Result := FieldByName('ID_A_M').AsInteger;
    finally
      Free;
    end;
  end;
end;

procedure TDMMain.MuestraReporte(Grupo: integer; Titulo: string; LDS: TList<TFDQuery>);
begin
  R := CargaReporteFB(Grupo, Titulo);
  If assigned(R) then
  begin
    CreafrxDatasets(LDS, R);
    R.PrepareReport;
    R.ShowReport;
  end;
end;

function TDMMain.CargaReporteFB(Grupo: integer; Titulo: string): TfrxReport;
var
  LBlobStream: TStream;
  Reporte: TfrxReport;
begin
  Result := nil;
  with DameQueryRO(nil, DMMain.DB) do
  begin
    try
      Close;
      SQL.Add(' SELECT DEF_LISTADO FROM DIC_LISTADOS');
      SQL.Add(' WHERE ');
      SQL.Add(' TITULO = :TITULO AND  ');
      SQL.Add(' GRUPO = :GRUPO ');
      ParamByName('TITULO').AsString := Titulo;
      ParamByName('GRUPO').AsInteger := Grupo;
      open;
      If RecordCount > 0 then
      begin
        LBlobStream := CreateBlobStream(FieldByName('DEF_LISTADO'), bmRead);
        try
          Reporte := TfrxReport.Create(nil);
          Reporte.LoadFromStream(LBlobStream);
          Result := Reporte;
        finally
          LBlobStream.Free;
        end;
      end;
    finally
      Free;
    end;
  end;
end;

procedure TDMMain.CargarReporteDesdeFichero(Grupo: integer; Fichero: string);
var
  LFileStream: TFileStream;
  Reporte: TfrxReport;
begin
  try
    LFileStream := TFileStream.Create(Fichero, fmOpenRead or fmShareDenyWrite);
    Reporte := TfrxReport.Create(nil);
    Reporte.LoadFromFile(Fichero);
    DMMain.GuardaReporteFB(Grupo, Fichero, Reporte);
  finally
    LFileStream.Free;
  end;
end;

procedure TDMMain.EditarReporte(Grupo: integer; Titulo: string);
var
  Reporte: TfrxReport;
{$IFDEF FASTREPORTDESIGNER}
  Designer: TfrxDesigner;
{$ENDIF}
begin
  Reporte := CargaReporteFB(Grupo, Titulo);
  if assigned(Reporte) then
  begin
{$IFDEF FASTREPORTDESIGNER}
    Designer := TfrxDesigner.Create(nil);
    try
      Reporte.DesignReport; // Abre el diseñador
      // Después de cerrar el diseñador, guarda los cambios en la base de datos ??????????
      GuardaReporteFB(Grupo, Titulo, Reporte);
    finally
      Designer.Free;
    end;
{$ENDIF}
  end
  else
    ShowMessage('No existe el reporte');
end;

procedure TDMMain.GuardaReporteFB(Grupo: integer; Titulo: string; Reporte: TfrxReport);
var
  LMemoryStream: TMemoryStream;
begin
  EliminaListado(Grupo, ExtractFileName(Titulo));

  LMemoryStream := TMemoryStream.Create;
  Reporte.SaveToStream(LMemoryStream);
  LMemoryStream.Position := 0;

  with DameQueryRW(nil, DMMain.DB) do
  begin
    try
      Close;
      SQL.Text := 'INSERT INTO DIC_LISTADOS ' + '(GRUPO,TITULO,DEF_LISTADO,EDITABLE,CABECERA ,TIPO,LISTADO) ' +
        'VALUES ' + '(:GRUPO, :TITULO, :DEF_LISTADO, :EDITABLE, :CABECERA , :TIPO, :LISTADO)';
      ParamByName('GRUPO').AsInteger := Grupo;
      ParamByName('TITULO').AsString := ExtractFileName(Titulo);
      ParamByName('EDITABLE').AsInteger := 1;
      ParamByName('CABECERA').AsInteger := 0;
      ParamByName('TIPO').AsString := 'FR3';
      var
      s := DMMain.ContadorGen('CONTA_LISTADOS');
      ParamByName('LISTADO').AsInteger := s;
      ParamByName('DEF_LISTADO').LoadFromStream(LMemoryStream, ftBlob);
      ExecSQL;
      Transaction.Commit;
    finally
      Free;
    end;
  end;
end;

procedure TDMMain.EliminaListado(Grupo: integer; Titulo: string);
begin
  with DameQueryRW(nil, DMMain.DB) do
  begin
    try
      Close;
      SQL.Text := ' DELETE FROM DIC_LISTADOS WHERE GRUPO = :GRUPO AND TITULO = :TITULO AND TIPO =' + QuotedStr('FR3');
      ParamByName('GRUPO').AsInteger := Grupo;
      ParamByName('TITULO').AsString := Titulo;
      ExecSQL;
      Transaction.Commit;
    finally
      Free;
    end;
  end;
end;

function TDMMain.ExisteReporte(Grupo: integer; Titulo: string): boolean;
begin
  with DameQueryRO(nil, DMMain.DB) do
  begin
    try
      Close;
      SQL.Add(' SELECT LISTADO FROM DIC_LISTADOS');
      SQL.Add(' WHERE ');
      SQL.Add(' TITULO = :TITULO AND  ');
      SQL.Add(' GRUPO = :GRUPO ');
      ParamByName('TITULO').AsString := Titulo;
      ParamByName('GRUPO').AsInteger := Grupo;
      open;
      Result := FieldByName('LISTADO').AsInteger > 0;
      Close;
    finally
      Free;
    end;
  end;
end;

Function TDMMain.DameCampos(aGrid: TDBGrid): String;
var
  ColumnNames: TStringList;
  ColumnTitles: TStringList;
  i: integer;
  SelectClause: string;
begin
  Result := '';
  with DameQueryRO(nil, DMMain.DB) do
  begin
    try
      SQL.Text := 'SELECT R.CAMPO, T.TITULO, R.TIPO ' + 'FROM DIC_RELACIONES_CAMPOS R ' +
        'LEFT JOIN DIC_TEXTOS T ON (T.TEXTO = R.TEXTO) ' +
        'WHERE R.RELACION = :Relacion AND T.IDIOMA = :Idioma AND R.disponible_maxf = 1 ' + 'ORDER BY R.ORDEN_BUSCADOR';
      ParamByName('Relacion').AsString := aGrid.Hint;
      ParamByName('Idioma').AsString := Entorno.Idioma;
      open;
      if RecordCount <= 0 then // no hay nada en la columna disponible_maxf de DIC_RELACIONES_CAMPOS
      begin
        Close;
        SQL.Text := 'SELECT R.CAMPO, T.TITULO, R.TIPO ' + 'FROM DIC_RELACIONES_CAMPOS R ' +
          'LEFT JOIN DIC_TEXTOS T ON (T.TEXTO = R.TEXTO) ' + 'WHERE R.RELACION = :Relacion AND T.IDIOMA = :Idioma ';
        ParamByName('Relacion').AsString := aGrid.Hint;
        ParamByName('Idioma').AsString := Entorno.Idioma;
        open;
      end;

      ColumnNames := TStringList.Create;
      ColumnTitles := TStringList.Create;
      while not EOF do
      begin
        ColumnNames.Add(FieldByName('CAMPO').AsString.Trim);
        ColumnTitles.Add(FieldByName('TITULO').AsString.Trim);
        Next;
      end;

    finally
      Free;
    end;
    SelectClause := '';
    for i := 0 to ColumnNames.Count - 1 do
    begin
      if i > 0 then
        SelectClause := SelectClause + ', ';
      SelectClause := SelectClause + ColumnNames[i]; // + ' AS ' + ColumnTitles[i] + '';
    end;

    Result := SelectClause;

  end;

end;

function TDMMain.DameClientePorNIF(NIF: string): integer;
begin
  Result := -1;
  with DameQueryRO(nil, DMMain.DB) do
  begin
    try
      Close;
      SQL.Text :=
        'SELECT c.cliente as CLIENTE FROM emp_clientes c left join sys_terceros t on(c.tercero = t.tercero) where t.nif='
        + QuotedStr(NIF);
      open;
      Result := FieldByName('CLIENTE').AsInteger;
    finally
      Free;
    end;
  end;
end;

// marca por defecto de la empresa
Function TDMMain.DameMarcaPorDefecto: integer;
begin
  Result := -1;
  with DameQueryRO(nil, DMMain.DB) do
  begin
    try
      Close;
      SQL.Text := 'SELECT MIN(ID_MARCA) FROM ART_ARTICULOS_MOD_MARCAS WHERE EMPRESA = :EMPRESA';
      ParamByName('EMPRESA').AsInteger := Entorno.Empresa;
      open;
      Result := FieldByName('MIN').AsInteger;
    finally
      Free;
    end;
  end;
end;

// Cargar las constantes del sistema
procedure TDMMain.CargaSysConstantes;
begin
  with DameQueryRO(nil, DMMain.DB) do
  begin
    try
      Close;
      SQL.Text :=
        'SELECT FAM_SYS_CODIGO, FAM_CODIGO, TAR_CODIGO, ART_TEXTO_LIBRE_CODIGO, PVP_POR_UD_SECUNDARIA, MONEDA_SEC, PRECIO_COSTE_MOV FROM SYS_CONSTANTES';
      open;
      Entorno.FamSistema := FieldByName('FAM_SYS_CODIGO').AsString;
      Entorno.FamDefecto := FieldByName('FAM_CODIGO').AsString;
      Entorno.TarifaDefecto := FieldByName('TAR_CODIGO').AsString;
      { Entorno.ArtTextoLibre := FieldByName('ART_TEXTO_LIBRE_CODIGO').AsString;
        Entorno.PVP_Ud_Sec := (FieldByName('PVP_POR_UD_SECUNDARIA').AsInteger = 1);
        Entorno.Moneda_Sec := FieldByName('MONEDA_SEC').AsString;
        Entorno.Precio_coste_mov := (FieldByName('PRECIO_COSTE_MOV').AsInteger = 1); }
    finally
      Free;
    end;
  end;
end;

function TDMMain.Contador_Gen(DataSet: TDataSet; NomGen, NomCampo: string; Fuerza: boolean = False): integer;
begin
  Result := 0;
  if (DataSet.State = dsInsert) then
    if Fuerza or (DataSet.FieldByName(NomCampo).AsInteger = 0) then
    begin
      Result := ContadorGen(NomGen);
      DataSet.FieldByName(NomCampo).AsInteger := Result;
    end;
end;

function TDMMain.DameCodigoArticulo(FormatoCodigo, Familia, SubFamilia: string): string;
var
  CodigoArticulo, aux, car, Contador: string;
  i: integer;
begin
  /// Recorremos el FormatoCodigo en busca de F para familia, S para subfamilia y N para contadores.
  /// Esperamos que los ultimos caracteres sean los N

  CodigoArticulo := '';
  aux := '';
  i := 1;

  while (i <= Length(FormatoCodigo)) do
  begin
    car := Copy(FormatoCodigo, i, 1);

    // Si cambio caracter de formato o llegue al final
    if (((aux <> '') and (car <> Copy(aux, 1, 1))) or (i = Length(FormatoCodigo))) then
    begin
      if (i = Length(FormatoCodigo)) then
        aux := aux + car;

      if (Copy(aux, 1, 1) = 'F') then
      begin
        // Familia
        CodigoArticulo := CodigoArticulo + Ajusta(Familia, 'D', Length(aux), '-');
      end
      else if (Copy(aux, 1, 1) = 'S') then
      begin
        // Subfamilia
        CodigoArticulo := CodigoArticulo + Ajusta(SubFamilia, 'D', Length(aux), '-');
      end
      else if (Copy(aux, 1, 1) = 'N') then
      begin
        // Numero
        // Selecciono el ultimo articulo con el prefijo segun el formato
        with DameQueryRO(nil, DMMain.DB) do
        begin
          try
            Close;
            SQL.Text :=
              'SELECT MAX(ARTICULO) ART FROM ART_ARTICULOS WHERE EMPRESA = :EMPRESA AND FAMILIA = :FAMILIA AND SUBFAMILIA = :SUBFAMILIA AND ARTICULO STARTING WITH :ARTICULO AND CHAR_LENGTH(ARTICULO) = '
              + IntToStr(Length(FormatoCodigo));
            ParamByName('EMPRESA').AsInteger := Entorno.Empresa;
            ParamByName('FAMILIA').AsString := Familia;
            ParamByName('SUBFAMILIA').AsString := SubFamilia;
            ParamByName('ARTICULO').AsString := CodigoArticulo;
            open;
            Contador := FieldByName('ART').AsString;
          finally
            Free;
          end;
        end;

        // Tomo los digitos correspondientes al contador
        if (Length(Contador) = Length(FormatoCodigo)) then
          Contador := Copy(Contador, Length(CodigoArticulo) + 1, Length(Contador))
        else
          // En el caso de que no encuentre nada la longitud sera 0.
          Contador := '0';

        CodigoArticulo := CodigoArticulo + format('%' + IntToStr(Length(aux)) + '.' + IntToStr(Length(aux)) + 'd',
          [StrToIntDef(Contador, 0) + 1]);
      end
      else
      begin
        CodigoArticulo := CodigoArticulo + aux;
      end;

      aux := car;
    end
    else
      aux := aux + car;

    Inc(i);
  end;

  Result := CodigoArticulo;
end;

function TDMMain.EstadoKri(id: integer): integer;
var
  i: integer;
  Buscar: boolean;
begin
  Result := 0;
  i := 0;
  Buscar := True;
  while (i <= (EstadoKri_Codigo.Count - 1)) do
  begin
    if (EstadoKri_Codigo[i] = IntToStr(id)) then
    begin
      Result := StrToInt(EstadoKri_Estado[i]);
      EstadoKri_Codigo.Move(i, 0);
      EstadoKri_Estado.Move(i, 0);
      Buscar := False; { la tengo en memoria }
      i := EstadoKri_Codigo.Count; { por lo tanto no seguir }
    end;
    Inc(i);
  end;

  if (Buscar and DB.Connected) then
  begin
    with DameQueryRO(nil, DMMain.DB) do
    begin
      try
        Close;
        Transaction := DameTransactionRO(DB);
        SQL.Text := 'SELECT ESTADO FROM G_ESTADO_KRI(' + IntToStr(id) + ')';
        open;
        Result := FieldByName('ESTADO').AsInteger;
        EstadoKri_Codigo.Insert(0, IntToStr(id));
        EstadoKri_Estado.Insert(0, IntToStr(FieldByName('ESTADO').AsInteger));
      finally
        Transaction.Free;
        Free;
      end;
    end;
  end;
end;

procedure TDMMain.CargaMonedaInfList;
var
  i, j, aDescimalesVer, aDescimalesCalculos: integer;
  aDescimalesVerStr, aDescimalesCalculosStr: string;
begin
  with DameQueryRO(nil, DMMain.DB) do
  begin
    try
      Close;
      try
        SQL.Text :=
          ' SELECT MONEDA, DEC_VER, DEC_CALCULOS, SIGNO_MONEDA FROM SYS_MONEDAS ORDER BY DEFECTO DESC, MONEDA ';
        open;
        Last;
        SetLength(MonedaInfList, RecordCount);
        First;
        j := 0;
        while not EOF do
        begin
          // DEC_VER
          aDescimalesVer := FieldByName('DEC_VER').AsInteger;
          aDescimalesVerStr := '#,0.';
          for i := 1 to aDescimalesVer do
            aDescimalesVerStr := aDescimalesVerStr + '0';

          // DEC_CALCULOS
          aDescimalesCalculos := FieldByName('DEC_CALCULOS').AsInteger;
          aDescimalesCalculosStr := '#,0.';
          for i := 1 to aDescimalesCalculos do
            aDescimalesCalculosStr := aDescimalesCalculosStr + '0';

          MonedaInfList[j].Moneda := FieldByName('MONEDA').AsString;
          MonedaInfList[j].DecimalesVer := aDescimalesVer;
          MonedaInfList[j].DescimalesCalculos := aDescimalesCalculos;
          MonedaInfList[j].DecimalesVerStr := aDescimalesVerStr;
          MonedaInfList[j].DescimalesCalculosStr := aDescimalesCalculosStr;
          MonedaInfList[j].Signo := FieldByName('SIGNO_MONEDA').AsString;
          Inc(j);
          Next;
        end;
        Close;
        Transaction.Commit;
      finally
        Transaction.Free;
      end;
    finally
      Free;
    end;
  end;
end;

procedure TDMMain.AjustaMascaraMoneda;
begin
  CargaMonedaInfList;

  with DameQueryRO(nil, DMMain.DB) do
  begin
    try
      Close;
      SQL.Text :=
        'SELECT MONEDA FROM EMP_CANALES WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL';
      ParamByName('EMPRESA').AsInteger := Entorno.Empresa;
      ParamByName('EJERCICIO').AsInteger := Entorno.Ejercicio;
      ParamByName('CANAL').AsInteger := Entorno.Canal;
      open;
      MascaraN := MascaraMoneda(FieldByName('MONEDA').AsString, 1);
      MascaraL := MascaraMoneda(FieldByName('MONEDA').AsString, 0);
    finally
      Free;
    end;
  end;

  with DameQueryRO(nil, DMMain.DB) do
  begin
    try
      Close;
      SQL.Text := 'SELECT MONEDA FROM SYS_EMPRESAS WHERE EMPRESA = :EMPRESA';
      ParamByName('EMPRESA').AsInteger := Entorno.Empresa;
      open;
      Entorno.MonedaEmpresa := FieldByName('MONEDA').AsString;
      MascaraE := MascaraMoneda(FieldByName('MONEDA').AsString, 0);
      MascaraD := MascaraMoneda(FieldByName('MONEDA').AsString, 1);
    finally
      Free;
    end;
  end;

  MascaraNSec := MascaraMoneda(Entorno.Moneda_Sec, 1);
end;

function TDMMain.MascaraMoneda(Moneda: string; Tipo: smallint): string;
var
  i: integer;
begin
  // Busca la mascara en el MonedaInfList
  i := 0;
  Result := '';
  while ((i < Length(MonedaInfList)) and (not(MonedaInfList[i].Moneda = Moneda))) do
    Inc(i);

  if ((i < Length(MonedaInfList)) and (MonedaInfList[i].Moneda = Moneda)) then
  begin
    if (Tipo = 1) then
    begin
      Result := MonedaInfList[i].DecimalesVerStr;
      Entorno.DecimalesVer := MonedaInfList[i].DecimalesVer;
    end
    else
    begin
      Result := MonedaInfList[i].DescimalesCalculosStr;
      Entorno.DecimalesCalculo := MonedaInfList[i].DescimalesCalculos;
    end;
  end;
end;

procedure TDMMain.ModificaEntornoSegunUsuarioEmpesa;
begin
  /// Obtiene el entorno de la empresa en la que entró la última vez.

  with DameQueryRW(nil, DB) do
  begin
    try
      Close;
      SQL.Add(' SELECT FIRST 1 EJERCICIO, CANAL, SERIE, MEMORIZAR_FECHA, FECHA_TRABAJO ');
      SQL.Add(' FROM SYS_USUARIOS_ULTIMO_ACCESO ');
      SQL.Add(' WHERE ');
      SQL.Add(' USUARIO = :USUARIO AND ');
      SQL.Add(' EMPRESA = :EMPRESA ');
      SQL.Add(' ORDER BY ULT_MODIFICACION DESC ');
      ParamByName('USUARIO').AsInteger := Entorno.IdUsuario;
      ParamByName('EMPRESA').AsInteger := Entorno.Empresa;
      open;
      Transaction.Commit;
      Entorno.Ejercicio := FieldByName('EJERCICIO').AsInteger;
      Entorno.Canal := FieldByName('CANAL').AsInteger;
      Entorno.Serie := FieldByName('SERIE').AsString;
      Entorno.MemorizarFechaTrab := (FieldByName('MEMORIZAR_FECHA').AsInteger = 1);
      if Entorno.MemorizarFechaTrab then
        Entorno.FechaTrab := FieldByName('FECHA').AsDateTime
      else
        Entorno.FechaTrab := Now;
      Close;
    finally
      Free;
    end;
  end;
end;

procedure TDMMain.ValidaFecha(Empresa: integer; Ejercicio: integer; Fecha: TDateTime);
begin
  /// Verifica si una fecha está dentro del ejercicio.
  /// Si no está, genera una excepción.

  with DameQueryRW(nil, DB) do
  begin
    try
      Close;
      SQL.Text := 'EXECUTE PROCEDURE E_FECHA_EJERCICIO (:EMPRESA, :EJERCICIO, :FECHA)';
      ParamByName('EMPRESA').AsInteger := Empresa;
      ParamByName('EJERCICIO').AsInteger := Ejercicio;
      ParamByName('FECHA').AsDateTime := Fecha;
      ExecSQL;
      Transaction.Commit;
      Close;
    finally
      Free;
    end;
  end;
end;

function TDMMain.Contador_E(Tipo: string; Empresa: integer = 0): integer;
begin
  if (Empresa = 0) then
    Empresa := Entorno.Empresa;

  with spContadores_E do
  begin
    Close;
    ParamByName('EMPRESA').AsInteger := Empresa;
    ParamByName('TIPO').AsString := Tipo;
    try
      ExecProc;
      Result := ParamByName('CODIGO').AsInteger;
      if Transaction.Active then
        Transaction.Commit;
    except
      on E: Exception do
        // MuestraMensaje('Error', _('Error obteneniendo Contadores_E  ') + #13#10 + E.Message, 'Aceptar', '', 0);
    end;
  end;
end;

function TDMMain.DameTitulo(Tabla, CampoMostrar, CampoBuscar, Filtro, Subconsulta: string;
  CampoBuscarValor: Variant): String;
var
  CampoBuscarValorStr: string;
begin
  Result := '';
  if (VarIsStr(CampoBuscarValor)) then
    if CampoBuscarValor = '' then
      Exit;
  with DameQueryRO(nil, DB) do
  begin
    try
      Close;
      if VarIsStr(CampoBuscarValor) then
        CampoBuscarValorStr := QuotedStr(CampoBuscarValor);

      if VarIsNumeric(CampoBuscarValor) then
        CampoBuscarValorStr := IntToStr(CampoBuscarValor);

      SQL.Text := 'SELECT ' + CampoMostrar + ' FROM ' + Tabla + ' WHERE ' + CampoBuscar + '=' + CampoBuscarValorStr;
      if Filtro <> '' then
        SQL.Text := SQL.Text + ' AND ' + FiltroEntorno(Filtro);

      if Subconsulta <> '' then
        SQL.Text := SQL.Text + '  ' + Subconsulta;

      var
      s := SQL.Text;
      open;
      Result := FieldByName(CampoMostrar).AsString;
    finally
      Free;
    end;
  end
end;

function TDMMain.VerificaExisteEnTercero(Tercero: integer; Tipo: string): boolean;
var
  Cliente, Proveedor, Acreedor, Agente, Empleado, Potencial, Crm: boolean;
begin
  QueEs(Tercero, Cliente, Proveedor, Acreedor, Agente, Empleado, Potencial, Crm);

  Result := False;
  if (Tipo = 'CLI') then
    Result := Cliente
  else if (Tipo = 'PROV') then
    Result := Proveedor
  else if (Tipo = 'ACR') then
    Result := Acreedor
  else if (Tipo = 'AGE') then
    Result := Agente
  else if (Tipo = 'OPE') then
    Result := Empleado
  else if (Tipo = 'CRM') then
    Result := Crm;
end;

procedure TDMMain.ExisteFamilia(Familia: integer; var Des: string);
begin
  Des := '';
  with DameQueryRO(Self, DMMain.DB) do
  begin
    try
      Close;
      SQL.Add(' SELECT * FROM ART_FAMILIAS ');
      SQL.Add(' WHERE ');
      SQL.Add(' EMPRESA=' + Entorno.Empresa.ToString + ' AND ');
      SQL.Add(' FAMILIA=' + QuotedStr(Familia.ToString));
      open;
      if RecordCount > 0 then
        Des := FieldByName('TITULO').AsString;
      Close;
    finally
      Free;
    end;
  end;
end;

procedure TDMMain.ExisteDescripcionFamilia(Des: string; var Familia: integer);
begin
  Familia := -1;
  with DameQueryRO(Self, DMMain.DB) do
  begin
    try
      Close;
      SQL.Add(' SELECT FAMILIA FROM ART_FAMILIAS ');
      SQL.Add(' WHERE ');
      SQL.Add(' EMPRESA=' + Entorno.Empresa.ToString + ' AND ');
      SQL.Add(' TITULO = ' + QuotedStr(Des));
      open;
      if RecordCount > 0 then
        Familia := FieldByName('FAMILIA').AsInteger;
      Close;
    finally
      Free;
    end;
  end;
end;

procedure TDMMain.QueEs(Tercero: integer; var Cliente, Proveedor, Acreedor, Agente, Empleado, Potencial, Crm: boolean);
begin
  with DameQueryRO(Self, DMMain.DB) do
  begin
    try
      Close;
      SQL.Text := 'EXECUTE PROCEDURE S_TERCEROS_QUE_SON (:EMPRESA, :EJERCICIO, :CANAL, :TERCERO)';
      ParamByName('EMPRESA').AsInteger := Entorno.Empresa;
      ParamByName('EJERCICIO').AsInteger := Entorno.Ejercicio;
      ParamByName('CANAL').AsInteger := Entorno.Canal;
      ParamByName('TERCERO').AsInteger := Tercero;
      open;
      Cliente := (FieldByName('CLIENTE').AsInteger <> 0);
      Proveedor := (FieldByName('PROVEEDOR').AsInteger <> 0);
      Acreedor := (FieldByName('ACREEDOR').AsInteger <> 0);
      Agente := (FieldByName('AGENTE').AsInteger <> 0);
      Empleado := (FieldByName('EMPLEADO').AsInteger <> 0);
      Potencial := (FieldByName('POTENCIAL').AsInteger <> 0);
      Crm := (FieldByName('CRM').AsInteger <> 0);
    finally
      Free;
    end;
  end;
end;

{procedure TDMMain.CrearCodigoQR(Bitmap: TBitmap; s: string; Factor: integer = 1);
var
  QRCode: TDelphiZXingQRCode;
  Row, Column: integer;
begin
  /// Pinta un codigo QR en el BITMAP.
  /// Modificara el tamaño del BITMAP para que entre el codigo QR.
  /// Factor es el tamaño de cada punto (1 = 1 pixel, 2 son puntos de 2x2 pixels, etc.)

  QRCode := TDelphiZXingQRCode.Create;
  try
    // Configuracion del codigo QR (Alfa o numerico automatico, 4 puntos de borde).
    QRCode.Data := s;
    QRCode.Encoding := qrAuto;
    QRCode.QuietZone := 4;

    // Modifico tamaño del Bitmap
    Bitmap.Height := QRCode.Rows * Factor;
    Bitmap.Width := QRCode.Columns * Factor;

    Bitmap.PixelFormat := pf24bit;

    // Recorro el codigo QR y pinto los puntos
    for Row := 0 to QRCode.Rows - 1 do
    begin
      for Column := 0 to QRCode.Columns - 1 do
      begin
        if (QRCode.IsBlack[Row, Column]) then
          Bitmap.Canvas.Brush.Color := clBlack
        else
          Bitmap.Canvas.Brush.Color := clWhite;

        // Cada punto se corresponderá a un cuadrado de (Factor x Factor) pixeles
        Bitmap.Canvas.FillRect(Rect((Factor * Column), (Factor * Row), (Factor * Column) + Factor,
          (Factor * Row) + Factor));
      end;
    end;
  finally
    QRCode.Free;
  end;
end;  }

procedure TDMMain.EnviarReporteEmail(R: TfrxReport; Asunto, Destinatario, Cuerpo, Copia, NombreAdjunto: string);
var
  Attachments: TList<TMemoryStream>;
  ErrorMsg: string;
  Desde: string;
begin
  Desde := '';
  Attachments := TList<TMemoryStream>.Create;
  try
    Attachments.Add(DamePDFReporte(R));
    // Attachments[0].SaveToFile('d:\ReporteExportado.pdf');
    Desde := DMMain.DameTitulo('SYS_USUARIOS', 'DIR_CORREO', 'USUARIO', '1110', '', Entorno.IdUsuario);

    if Desde = '' then
    begin
      ShowMessage('Debe configurar el e-mail de su usuario para enviar ');
      Exit;
    end;

    if not VerificaSmtpUsuario then
    begin
      ShowMessage('Debe configurar el servidor de correo del usuario para enviar ');
      Exit;
    end;

    ErrorMsg := SendEmailStream(Desde, Destinatario, Copia, Asunto, Cuerpo, Entorno.SMTP_Servidor, Entorno.SMTP_Usuario,
      Entorno.SMTP_Password, NombreAdjunto, Entorno.SMTP_Puerto, Attachments);

    if ErrorMsg <> '' then
      ShowMessage(ErrorMsg)
    else
      ShowMessage('Correo enviado exitosamente a ' + Destinatario);
  finally
    Attachments.Free;
  end;
end;

function TDMMain.VerificaSmtpUsuario: boolean;

begin
  /// Verifica si tiene datos de configuracion SMTP para el usuario del entorno
  Result := False;

  with DameQueryRO(Self, DMMain.DB) do
  begin
    try
      Close;
      SQL.Add(' SELECT SMTP_SERVIDOR, SMTP_USUARIO, SMTP_PASSWORD ');
      SQL.Add(' FROM SYS_USUARIOS ');
      SQL.Add(' WHERE ');
      SQL.Add(' USUARIO = :USUARIO ');

      ParamByName('USUARIO').AsInteger := Entorno.IdUsuario;
      open;
      var
      s := FieldByName('SMTP_SERVIDOR').AsString;
      s := FieldByName('SMTP_USUARIO').AsString;
      s := FieldByName('SMTP_PASSWORD').AsString;
      Result := ((FieldByName('SMTP_SERVIDOR').AsString > '') and (FieldByName('SMTP_USUARIO').AsString > '') and
        (FieldByName('SMTP_PASSWORD').AsString > ''));
    finally
      Free;
    end;
  end;
end;

procedure TDMMain.VerificaDocumentoIdentificacion(Pais, TipoDoc, NumeroDocumento: string; var Valido: boolean;
  var MensajeError: string);
var
  RNC_Limpio: string;
  i, Suma, Resto, DigitoVerificador, Valor: integer;
  Coeficientes: array [1 .. 8] of integer;
  EsDNI: boolean;
begin
  Valido := True;
  MensajeError := '';

  if ((Trim(Pais) > '') and (Trim(NumeroDocumento) > '')) then
  begin
    with DameQueryRW(Self, DB) do
    begin
      try
        SQL.Add('EXECUTE PROCEDURE VERIFICA_DOCUMENTO_IDENTIDAD(:NUMERO_DOCUMENTO, :PAIS, :TIPO_DOCUMENTO)');
        ParamByName('NUMERO_DOCUMENTO').AsString := NumeroDocumento;
        ParamByName('PAIS').AsString := Pais;
        ParamByName('TIPO_DOCUMENTO').AsString := TipoDoc;
        ExecSQL;
        Transaction.Commit;
        open;
        Valido := FieldByName('VALIDO').AsInteger = 1;
        MensajeError := FieldByName('MENSAJE_ERROR').AsString;
      finally
        Free;
      end;
    end;
  end;
end;

procedure TDMMain.CambiaTarifaVentas(id_s: integer; Tarifa, Tarifa_old: string);
var
  Error: boolean;
begin
  with DameQueryRO(Self, DB) do
  begin
    try
      Close;
      SQL.Text := 'SELECT ERROR FROM UT_REFRESCA_DETALLE_S_TARIFA(:ID_S, :TARIFA, :ENTRADA)';
      ParamByName('ID_S').AsInteger := id_s;
      ParamByName('TARIFA').AsString := Tarifa;
      ParamByName('ENTRADA').AsInteger := Entorno.Entrada;
      open;
      Error := (FieldByName('ERROR').AsInteger = 1);
    finally
      Free;
    end;
  end;

  if Error then
  begin
    with DameQueryRW(nil, DB) do
    begin
      try
        Close;
        SQL.Text := 'UPDATE GES_CABECERAS_S SET TARIFA = :TARIFA WHERE ID_S = :ID_S';
        ParamByName('TARIFA').AsString := Tarifa_old;
        ParamByName('ID_S').AsInteger := id_s;
        ExecSQL;
        Transaction.Commit;
        ShowMessage(_('No se puede cambiar la tarifa, el documento es origen o destino de otro.'));
      finally
        Free;
      end;
    end;
  end;
end;

function TDMMain.TarifaEsIvaIncluido(Tarifa: string; Empresa: integer = 0): boolean;
begin
  if (Empresa = 0) then
    Empresa := Entorno.Empresa;

  with DameQueryRO(nil, DB) do
  begin
    try
      Close;
      SQL.Text := 'SELECT IVA_INCLUIDO FROM ART_TARIFAS_C WHERE EMPRESA = :EMPRESA AND TARIFA = :TARIFA';
      ParamByName('EMPRESA').AsInteger := Empresa;
      ParamByName('TARIFA').AsString := Tarifa;
      open;
      Result := (FieldByName('IVA_INCLUIDO').AsInteger = 1);
    finally
      Free;
    end;
  end;
end;

function TDMMain.DameRestriccionAgenteUsuario(Usuario: integer): boolean;
begin
  with DameQueryRO(Self, DB) do
  begin
    try
      SQL.Text := 'SELECT RESTRINGIR_AGENTE FROM SYS_USUARIOS WHERE USUARIO = :USUARIO';
      ParamByName('USUARIO').AsInteger := Usuario;
      open;
      Result := (FieldByName('RESTRINGIR_AGENTE').AsInteger = 1);
    finally
      Free;
    end;
  end;
end;

function TDMMain.DameAgenteUsuario(Usuario: integer): integer;
begin
  with DameQueryRO(Self, DB) do
  begin
    try
      SQL.Text := 'SELECT AGENTE FROM SYS_USUARIOS WHERE USUARIO = :USUARIO';
      ParamByName('USUARIO').AsInteger := Usuario;
      open;
      Result := FieldByName('AGENTE').AsInteger;
    finally
      Free;
    end;
  end;
end;

procedure TDMMain.ReNumerarOrdenDetalleVenta(id_s: integer);
var
  Orden: integer;

  procedure ModificaOrden(id_detalles_s, NuevoOrden: integer);
  begin
    with DameQueryRW(nil, DB) do
    begin
      try
        SQL.Add(' UPDATE GES_DETALLES_S ');
        SQL.Add(' SET ORDEN = :ORDEN ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_DETALLES_S = :ID_DETALLES_S AND ');
        SQL.Add(' ORDEN <> :ORDEN ');
        ParamByName('ORDEN').AsInteger := NuevoOrden;
        ParamByName('ID_DETALLES_S').AsInteger := id_detalles_s;
        ExecSQL;
        Transaction.Commit;
      finally
        Free;
      end;
    end;
  end;

begin
  // Renumeramos el detalle comenzando por el ORDEN=1.
  Orden := 1;
  with DameQueryRO(Self, DB) do
  begin
    try
      try
        SQL.Add(' SELECT ID_DETALLES_S FROM GES_DETALLES_S ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_S = :ID_S ');
        SQL.Add(' ORDER BY ORDEN ');
        ParamByName('ID_S').AsInteger := id_s;
        open;
        First;
        while not EOF do
        begin
          ModificaOrden(FieldByName('ID_DETALLES_S').AsInteger, Orden);
          Inc(Orden);
          Next;
        end;
        Close;
        Transaction.Commit;
      finally
        Transaction.Free;
      end;
    finally
      Free;
    end;
  end;
end;

function TDMMain.DameGiro(Tipo: string; Empresa: integer; Codigo: integer = 0): integer;
begin
  with DameQueryRO(Self, DB) do
  begin
    try
      if (Tipo = 'EMP') then
        SQL.Add('SELECT CODIGO_GIRO FROM SYS_EMPRESAS_GIROS WHERE EMPRESA = :EMPRESA AND DEFECTO = 1');
      if (Tipo = 'CLI') then
        SQL.Add('SELECT CODIGO_GIRO FROM EMP_CLIENTES_GIROS WHERE EMPRESA = :EMPRESA AND CLIENTE = :CODIGO AND DEFECTO = 1');
      if (Tipo = 'PRO') then
        SQL.Add('SELECT CODIGO_GIRO FROM EMP_PROVEEDORES_GIROS WHERE EMPRESA = :EMPRESA AND PROVEEDOR = :CODIGO AND DEFECTO = 1');
      if (Tipo = 'ACR') then
        SQL.Add('SELECT CODIGO_GIRO FROM EMP_ACREEDORES_GIROS WHERE EMPRESA = :EMPRESA AND ACREEDOR = :CODIGO AND DEFECTO = 1');
      ParamByName('EMPRESA').AsInteger := Empresa;
      if (Tipo <> 'EMP') then
        ParamByName('CODIGO').AsInteger := Codigo;
      open;
      Result := FieldByName('CODIGO_GIRO').AsInteger;
    finally
      Free;
    end;
  end;
end;

procedure TDMMain.LlamaVersionNuevaOnError(s: string);
begin
  if assigned(FEspera) then
    FEspera.Free;
  MuestraMensaje('Error', 'No se pudo descargar la nueva versión' + sLineBreak + s, '', 'Aceptar', 0);
end;

procedure TDMMain.ComprobarVersion;
begin
  if MuestraMensaje('Versión', ' Quiere comprobar si existe una nueva versión del MaxFactu?', 'Cancelar', 'Aceptar', 0)
    = mrok then
  begin
    try
      if TieneConexionInternet then
      begin
        if assigned(FEspera) then
          FreeAndNil(FEspera);
        FEspera := TFMEspera.Create(nil);
        FEspera.LCabecera.Caption := 'Comprobando nueva versión';
        FEspera.Show;
        FEspera.ActivityIndicator1.Animate := True;
        Application.ProcessMessages;

        try
          RESTRequest.Execute;
          if MTVersion.RecordCount > 0 then
          begin
            if MTVersionVERSION.AsInteger > Entorno.VersionMaxFactu.ToInteger then
            begin
              if MuestraMensaje('Nueva Versión', 'Hay una nueva version diponible la ' + MTVersionVERSION.AsString +
                ' de fecha : ' + sLineBreak + MTVersionFECHA.AsString + ' con las siguentes mejoras: ' + sLineBreak +
                MTVersionNOTAS.AsString, 'Cancelar', 'Aceptar', 0) = mrok then
              begin
                try
                  ActualizarVersion;
                finally
                end
              end
              else
                FreeAndNil(FEspera);
            end;
          end;
        except
          // FEspera.Free;
        end;
      end
      else
        ShowMessage('No tiene conexión a internet');
    finally

    end;
  end;
end;

// ************************************************************
// Bloque para descaragr asincronico con
procedure TDMMain.ActualizarVersion;
var
  FClient: THTTPClient;
  LResponse: IHTTPResponse;
  LSize: Int64;
  NombreFichero: string;
begin
  if assigned(FMEspera) then
    FEspera.LCabecera.Caption := 'Descargando versión :' + MTVersionVERSION.AsString;

  NombreFichero := 'MaxFactu_temp.exe';
  FicheroVersion := TPath.Combine(TPath.GetDownloadsPath, NombreFichero);

  if FileExists(FicheroVersion) then
    Tfile.Delete(FicheroVersion);

  FClient := THTTPClient.Create;
  try
    FClient.OnReceiveData := ReceiveDataEvent;
    LResponse := FClient.Head(MTVersionURL.Text);
    LSize := LResponse.ContentLength;
    LResponse := nil;
    if assigned(FEspera) then
      with FEspera.ProgressBarDownload do
      begin
        Max := LSize;
        Min := 0;
        Position := 0;
        Visible := True;
      end;
    FDownloadStream := TFileStream.Create(FicheroVersion, fmCreate);
    FDownloadStream.Position := 0;
    FGlobalStart := TThread.GetTickCount;
    // Start the download process
    FAsyncResult := FClient.BeginGet(DoEndDownload, MTVersionURL.Text, FDownloadStream);
  except
    on E: Exception do
    begin
      MuestraMensaje(' Error ', E.Message, '', 'Aceptar', 0);
      FAsyncResult.Cancel;
    end;
  end;
end;

procedure TDMMain.DoEndDownload(const AsyncResult: IAsyncResult);
var
  LAsyncResponse: IHTTPResponse;
  FicheroEXE, RutaEXE, Nombre, NombreOld: string;
begin
  FicheroEXE := ExtractFileName(ParamStr(0));
  RutaEXE := ExtractFilePath(ParamStr(0));
  Nombre := RutaEXE + FicheroEXE;
  NombreOld := RutaEXE + 'MaxFactu_old.exe';
  try
    LAsyncResponse := THTTPClient.EndAsyncHTTP(AsyncResult);
    // TThread.Synchronize(nil,
    // procedure
    // begin

    // end);
  finally
    LAsyncResponse := nil;
    FreeAndNil(FDownloadStream);

    FicheroEXE := ExtractFileName(ParamStr(0));
    RutaEXE := ExtractFilePath(ParamStr(0));
    Nombre := RutaEXE + FicheroEXE;

    if FileExists(TPath.GetDirectoryName(Application.ExeName) + '\MaxFactu_old.exe') then
      deletefile(pwidechar(TPath.GetDirectoryName(Application.ExeName) + '\MaxFactu_old.exe'));

    if FileExists(Nombre) then
    begin
      if RenameFile(PChar(Nombre), 'MaxFactu_old.exe') then
        try
          Tfile.Copy(FicheroVersion, FicheroEXE);
        finally
          RestartApplication;
        end;
    end;
    if assigned(FEspera) then
      FreeAndNil(FEspera);
  end;
end;

procedure TDMMain.RestartApplication;
begin
  ShellExecute(0, 'open', PChar('MaxFactu.exe'), nil, nil, 1);
  Halt;
end;

procedure TDMMain.ReceiveDataEvent(const Sender: TObject; AContentLength, AReadCount: Int64; var Abort: boolean);
var
  LTime: Cardinal;
  LSpeed: integer;
begin
  LTime := TThread.GetTickCount - FGlobalStart;
  if (LTime > 0) then
  begin
    LSpeed := (AReadCount * 1000) div LTime;
    TThread.Queue(nil,
      procedure
      begin
        if assigned(FEspera) then
        begin
          with FEspera.ProgressBarDownload do
          begin
            Position := AReadCount;
            FEspera.LabelGlobalSpeed.Caption := format('%d KB/s', [LSpeed div 1024]);
          end;
        end;
      end);
  end;
end;

procedure TDMMain.ExecuteInstall;
{$IF DEFINED(IOS) or DEFINED (ANDROID)}
var
  LFile: JFile;
  LIntent: JIntent;
  LNet_Uri: JNet_Uri;
{$ENDIF}
begin
{$IF DEFINED(MSWINDOWS) }
  if FileExists(FicheroVersion) then
  begin
    if RenameFile(Application.ExeName, 'MergeDel_old.exe') then
      try
        Tfile.Copy(FicheroVersion, Application.ExeName);
      finally
        Application.Terminate;
        ShellExecute(0, 'OPEN', PChar(Application.ExeName), '', '', 1);
      end;
  end;
{$ENDIF}
{$IF DEFINED(IOS) or DEFINED (ANDROID)}
  LFile := TJFile.JavaClass.init(StringToJString(FicheroVersion));
  LIntent := TJIntent.Create;
  if TOSVersion.Check(8, 0) then
    LIntent.setAction(TJIntent.JavaClass.ACTION_INSTALL_PACKAGE)
  else
    LIntent.setAction(TJIntent.JavaClass.ACTION_VIEW);
  LIntent.addFlags(TJIntent.JavaClass.FLAG_ACTIVITY_NEW_TASK);
  if TOSVersion.Check(7, 0) then
  begin
    LIntent.addFlags(TJIntent.JavaClass.FLAG_GRANT_READ_URI_PERMISSION);
    LNet_Uri := TAndroidHelper.JFileToJURI(LFile);
  end
  else
    LNet_Uri := TJNet_Uri.JavaClass.fromFile(LFile);
  LIntent.setDataAndType(LNet_Uri, StringToJString('application/vnd.android.package-archive'));
  TAndroidHelper.Activity.startActivity(LIntent);
{$ENDIF}
end;

// FIN  del Bloque para descaragr asincronico con progress
// ************************************************************

function TDMMain.ClienteBloqueado(Cliente: integer; Empresa: integer = 0): boolean;
var
  Mensaje, Tipo: string;
  Bloqueo: integer;
begin
  if (Empresa = 0) then
    Empresa := Entorno.Empresa;

  with DameQueryRO(Self, DB) do
  begin
    try
      SQL.Text := 'SELECT BLOQUEO, MOTIVO_BLOQUEO FROM EMP_CLIENTES WHERE EMPRESA = :EMPRESA AND CLIENTE = :CLIENTE';
      ParamByName('EMPRESA').AsInteger := Empresa;
      ParamByName('CLIENTE').AsInteger := Cliente;
      open;
      Bloqueo := FieldByName('BLOQUEO').AsInteger;
      Mensaje := FieldByName('MOTIVO_BLOQUEO').AsString;
    finally
      Free;
    end;

    { 0.- Sin mensaje
      1.- Aviso
      2.- Bloquear }
    Result := (Bloqueo = 2);
    if (Bloqueo > 0) then
    begin
      Mensaje := _('Motivo') + ': ' + Mensaje;

      if (Bloqueo = 1) then
        Tipo := _('Aviso');

      if (Bloqueo = 2) then
        Tipo := _('Bloqueo');
      MuestraMensaje('Cliente bloqueado', Mensaje + ' ' + Tipo, '', 'Aceptar', 0);
    end;
  end;
end;

procedure TDMMain.MuestraAviso(Tipo: string; id: integer; TipoDocumento: string);
var
  Mensaje, TipoMensaje: string;
begin
  with DameQueryRO(Self, DB) do
  begin
    try
      SQL.Add(' SELECT MENSAJE FROM EMP_AVISOS ');
      SQL.Add(' WHERE ');
      SQL.Add(' TIPO_OBJETO = :TIPO_OBJETO AND ');
      SQL.Add(' ID_OBJETO = :ID_OBJETO AND ');
      SQL.Add(' TIPO_DOCUMENTO = :TIPO_DOCUMENTO AND ');
      SQL.Add(' ACTIVO = 1 ');
      ParamByName('TIPO_OBJETO').AsString := Tipo;
      ParamByName('ID_OBJETO').AsInteger := id;
      ParamByName('TIPO_DOCUMENTO').AsString := TipoDocumento;
      open;
      Mensaje := Trim(FieldByName('MENSAJE').AsString);
    finally
      Free;
    end;
  end;

  if (Mensaje > '') then
  begin
    TipoMensaje := _('Aviso');
    MuestraMensaje('Aviso', Mensaje + ' ' + TipoMensaje, '', 'Aceptar', 0);
  end;
end;

function TDMMain.Contador_EECS(Serie, Tipo: string; Empresa: integer = 0; Ejercicio: integer = 0;
Canal: integer = 0): integer;
begin
  if (Empresa = 0) then
    Empresa := Entorno.Empresa;
  if (Ejercicio = 0) then
    Ejercicio := Entorno.Ejercicio;
  if (Canal = 0) then
    Canal := Entorno.Canal;

  with DameQueryRW(nil, DB) do
  begin
    try
      SQL.Text := 'EXECUTE PROCEDURE COD_CONTADORES_EECS(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO)';
      ParamByName('EMPRESA').AsInteger := Empresa;
      ParamByName('EJERCICIO').AsInteger := Ejercicio;
      ParamByName('CANAL').AsInteger := Canal;
      ParamByName('SERIE').AsString := Serie;
      ParamByName('TIPO').AsString := Tipo;
      ExecSQL;
      open;
      Transaction.Commit;
      Result := FieldByName('CODIGO').AsInteger;
    finally
      Free;
    end;
  end;
end;

function TDMMain.DameIDArticulo(Articulo: string; Empresa: integer = 0): integer;
begin
  Result := 0;
  Articulo := Trim(Articulo);

  if (Articulo > '') then
  begin
    if (Empresa = 0) then
      Empresa := Entorno.Empresa;

    with DameQueryRO(nil, DB) do
    begin
      try
        SQL.Text := 'SELECT ID_A FROM ART_ARTICULOS WHERE EMPRESA = :EMPRESA AND ARTICULO = :ARTICULO';
        ParamByName('EMPRESA').AsInteger := Empresa;
        ParamByName('ARTICULO').AsString := Copy(Articulo, 1, 15);
        open;
        Result := FieldByName('ID_A').AsInteger;
      finally
        Free;
      end;
    end;
  end;
end;

procedure TDMMain.CargaImageListGaleria(IdGaleria: integer; Lista: TListView; Alto: integer = 0; Ancho: integer = 0);
var
  Imagen: TImage;
  Item: TListItem;
  RDim: TRect;
begin
  Lista.Clear;
  if not assigned(Lista.LargeImages) then
    Lista.LargeImages := TImageList.Create(Lista);
  Lista.LargeImages.Clear;

  if ((Alto = 0) and (Ancho = 0)) then
  begin
    Alto := 100;
    Ancho := 100;
  end;

  Lista.LargeImages.Height := Alto;
  Lista.LargeImages.Width := Ancho;

  RDim.Left := 0;
  RDim.Top := 0;
  RDim.Right := Lista.LargeImages.Height;
  RDim.Bottom := Lista.LargeImages.Width;

  Imagen := TImage.Create(Self);
  try
    with DameQueryRO(nil, DB) do
    begin
      try
        SQL.Add('SELECT CODIGO, NOMBRE FROM VER_GALERIA_IMAGEN WHERE ID_GALERIA = :ID_GALERIA ORDER BY ORDEN');
        ParamByName('ID_GALERIA').AsInteger := IdGaleria;

        open;
        First;
        while not EOF do
        begin
          Item := Lista.Items.Add;
          Item.Caption := FieldByName('NOMBRE').AsString;
          Item.Data := Pointer(FieldByName('CODIGO').AsInteger);

          Imagen.Picture := nil;
          DMMain.RefrescarImagen(Imagen, FieldByName('CODIGO').AsInteger);
          Imagen.Picture.Bitmap.Canvas.StretchDraw(RDim, Imagen.Picture.Graphic);
          Imagen.Picture.Bitmap.Height := Lista.LargeImages.Height;
          Imagen.Picture.Bitmap.Width := Lista.LargeImages.Width;
          Item.ImageIndex := Lista.LargeImages.Add(Imagen.Picture.Bitmap, nil);

          Next;
        end;
        Close;

      finally
        Free;
      end;
    end;
  finally
    Imagen.Free;
  end;
end;

procedure TDMMain.RefrescarImagen(Imagen: TImage; Codigo: integer);
var
  Repositorio: integer;
  Stream: TStream;
begin
  Imagen.Picture := nil;
  if (Codigo <> 0) then
  begin
    with DameQueryRO(nil, DB) do
    begin
      try
        SQL.Text := 'SELECT REPOSITORIO, RUTA, IMAGEN, FORMATO FROM SYS_IMAGENES WHERE CODIGO = :CODIGO';
        ParamByName('CODIGO').AsInteger := Codigo;
        open;

        // Donde esta el fichero. 0: Carpeta compartida, 1: Base de Datos, 2: Base de Datos de Imagenes
        Repositorio := FieldByName('REPOSITORIO').AsInteger;

        if (Repositorio = 1) then
        begin
          if (not FieldByName('IMAGEN').IsNull) then
          begin
            Stream := CreateBlobStream(FieldByName('IMAGEN'), bmRead);
            try
              CargarImagenDeStream(Imagen, Stream, FieldByName('FORMATO').AsString);
            finally
              Stream.Free;
            end;
          end;
        end;
      finally
        Free;
      end;
    end;

    if (Repositorio = 2) then
    begin
      ConectaImagenes;

      if (DMMain.DataBaseImagenes.Connected) then
      begin
        with DameQueryRO(nil, DB) do
        begin
          try
            SQL.Add(' SELECT REPOSITORIO, RUTA, IMAGEN, NOMBRE, FORMATO FROM SYS_IMAGENES WHERE CODIGO = :CODIGO ');
            ParamByName('CODIGO').AsInteger := Codigo;
            open;

            if (not FieldByName('IMAGEN').IsNull) then
            begin
              Stream := CreateBlobStream(FieldByName('IMAGEN'), bmRead);
              try
                CargarImagenDeStream(Imagen, Stream, FieldByName('FORMATO').AsString);
              finally
                Stream.Free;
              end;
            end;
          finally
            Free;
          end;
        end;
      end;
    end;
  end;
end;

procedure TDMMain.CargarImagenDeStream(Imagen: TImage; Stream: TStream; Formato: string);
var
  BMP: TBitmap;
  JPG: TJpegImage;
  GIF: TGIFImage;
  PNG: TPngImage;
begin
  if Formato = 'BMP' then
  begin
    BMP := TBitmap.Create;
    try
      BMP.LoadFromStream(Stream);
      Imagen.Picture.Assign(BMP);
    finally
      BMP.Free;
    end;
  end
  else if Formato = 'JPG' then
  begin
    JPG := TJpegImage.Create;
    try
      JPG.LoadFromStream(Stream);

      BMP := TBitmap.Create;
      try
        BMP.Assign(JPG);
        Imagen.Picture.Assign(BMP);
      finally
        BMP.Free;
      end;
    finally
      JPG.Free;
    end;
  end
  else if Formato = 'GIF' then
  begin
    GIF := TGIFImage.Create;
    try
      GIF.LoadFromStream(Stream);
      Imagen.Picture.Assign(GIF);
    finally
      GIF.Free;
    end;
  end
  else if Formato = 'PNG' then
  begin
    PNG := TPngImage.Create;
    try
      PNG.LoadFromStream(Stream);
      Imagen.Picture.Assign(PNG);
    finally
      PNG.Free;
    end;
  end;
end;

procedure TDMMain.ConectaImagenes;
var
  CharacterSet: string;
begin
  CharacterSet := 'WIN1252';

  if (Entorno.BaseDeDatosImagenes <> '') then
  begin
    with DataBaseImagenes do
    begin
      try
        begin
          Connected := False;
          LoginPrompt := False;
          DriverName := 'FB';
          Params.Clear;
          Params.Add(format('DriverID=%s', ['FB']));
          Params.Add(format('SQLDialect=%s', ['1']));
          Params.Add(format('Database=%s', [Entorno.BaseDeDatosImagenes]));
          Params.Add(format('User_Name=%s', [Entorno.UsuarioBDImagenes]));
          Params.Add(format('Password=%s', [Entorno.ClaveBDImagenes]));
          if (Entorno.RolBD > '') then
            Params.Add(format('RoleName=%s', [Entorno.RolBDImagenes]));
          Params.Add(format('CharacterSet=%s', [CharacterSet]));

          if (Entorno.VersionFB = '5') then
          begin
            FDPhysFBDriverLink1.Release;
            FDPhysFBDriverLink1.VendorHome := '.\FB50';
            FDPhysFBDriverLink1.VendorLib := 'fbclient.dll';
          end
          else if (Entorno.VersionFB = '4') then
          begin
            FDPhysFBDriverLink1.Release;
            FDPhysFBDriverLink1.VendorHome := '.\FB40';
            FDPhysFBDriverLink1.VendorLib := 'fbclient.dll';
          end
          else if (Entorno.VersionFB = '2.5') then
          begin
            FDPhysFBDriverLink1.Release;
            FDPhysFBDriverLink1.VendorHome := '.\FB25';
            FDPhysFBDriverLink1.VendorLib := 'fbclient.dll';
          end;

          Transaction := TLocalImagenes;
          try
            Connected := False;
          except
            On E: Exception do
            begin
              ShowMessage('No se ha podido conectar con la Base de Datos de Imagenes' + sLineBreak + E.ClassName + ' ' +
                sLineBreak + E.Message);
            end;

          end;

          DataBaseImagenes.StartTransaction;
          open;
        end;

        // Reset de timer para desconectar base de imagenes despues de 1 minuto de inactividad
        // TDesconexionBaseImagenes.Enabled := False;
        // TDesconexionBaseImagenes.Enabled := True;

      except
        on E: Exception do
        begin
          ShowMessage(format(_('Imposible abrir base de datos imagenes %s' + #13#10 +
            'user_name: %s, sql_role_name: %s.') + #13#10 + E.Message, [Entorno.BaseDeDatosImagenes,
            Entorno.UsuarioBDImagenes, Entorno.RolBDImagenes]));
        end;
      end;
    end;
  end;
end;

procedure TDMMain.DesConectaImagenes;
begin
  if (DataBaseImagenes.Connected) then
    DataBaseImagenes.Close;
end;

function TDMMain.DameTituloEmpleado(Empleado: integer): string;
begin
  Result := '';
  if (Empleado <> 0) then
  begin
    with DameQueryRO(nil, DB) do
    begin
      try
        SQL.Text := 'SELECT TITULO FROM VER_EMPLEADOS_EF WHERE EMPRESA = :EMPRESA AND EMPLEADO = :EMPLEADO';
        ParamByName('EMPRESA').AsInteger := Entorno.Empresa;
        ParamByName('EMPLEADO').AsInteger := Empleado;
        open;
        Result := FieldByName('TITULO').AsString;
      finally
        Free;
      end;
    end;
  end;
end;

function TDMMain.DameTituloFichaTecnica(IdFichaTecnica: integer): string;
begin
  Result := '';
  if (IdFichaTecnica <> 0) then
  begin
    with DameQueryRO(nil, DB) do
    begin
      try
        SQL.Add(' SELECT R.MATRICULA, R.BASTIDOR, R.TITULO ');
        SQL.Add(' FROM REP_FICHA_TECNICA R ');
        SQL.Add(' JOIN SYS_MARCA M ON M.ID_MARCA = R.ID_MARCA ');
        SQL.Add(' WHERE ');
        SQL.Add(' R.ID_FICHA_TECNICA = ' + IntToStr(IdFichaTecnica));
        open;
        Result := Trim(FieldByName('MATRICULA').AsString);
        if (Trim(FieldByName('BASTIDOR').AsString) > '') then
          Result := Result + ' (' + Trim(FieldByName('BASTIDOR').AsString) + ')';
        Result := Result + ' - ' + Trim(FieldByName('TITULO').AsString);
      finally
        Free;
      end;
    end;
  end;
end;

procedure TDMMain.FiltraTabla(Tabla: TFDQuery; Filtro: string = '000000'; Abre: boolean = True);
begin
  // Aseguro que Filtro tenga 6 caracteres
  if (Length(Filtro) < 6) then
    Filtro := Copy(Filtro + '000000', 1, 6);

  with Tabla do
  begin
    Close;
    if Filtro[1] = '1' then
      ParamByName('EMPRESA').AsInteger := Entorno.Empresa;
    if Filtro[2] = '1' then
      ParamByName('EJERCICIO').AsInteger := Entorno.Ejercicio;
    if Filtro[3] = '1' then
      ParamByName('CANAL').AsInteger := Entorno.Canal;
    if Filtro[4] = '1' then
      ParamByName('SERIE').AsString := Entorno.Serie;
    if Filtro[5] = '1' then
      ParamByName('PAIS').AsString := Entorno.Pais;
    if Filtro[6] = '1' then
      ParamByName('PGC').AsInteger := Entorno.PGC;
  end;

  if Abre and not(Tabla.Active) then
    Tabla.open;
end;

function TDMMain.DamePorcentajeIva(Pais: string; Tipo: integer): double;
begin
  with DameQueryRO(nil, DB) do
  begin
    try
      SQL.Text := 'SELECT P_IVA FROM SYS_TIPO_IVA WHERE PAIS = :PAIS AND TIPO = :TIPO';
      ParamByName('PAIS').AsString := Pais;
      ParamByName('TIPO').AsInteger := Tipo;
      open;
      Result := FieldByName('P_IVA').AsFloat;
    finally
      Free;
    end;
  end;
end;

function TDMMain.ProveedorBloqueado(Proveedor: integer; Empresa: integer = 0): boolean;
var
  Mensaje, Tipo: string;
  Bloqueo: integer;
begin
  if (Empresa = 0) then
    Empresa := Entorno.Empresa;

  with DameQueryRO(nil, DB) do
  begin
    try
      SQL.Text :=
        'SELECT BLOQUEO, MOTIVO_BLOQUEO FROM EMP_PROVEEDORES WHERE EMPRESA = :EMPRESA AND PROVEEDOR = :PROVEEDOR';
      ParamByName('EMPRESA').AsInteger := Empresa;
      ParamByName('PROVEEDOR').AsInteger := Proveedor;
      open;
      Bloqueo := FieldByName('BLOQUEO').AsInteger;
      Mensaje := FieldByName('MOTIVO_BLOQUEO').AsString;
    finally
      Free;
    end;

    { 0.- Sin mensaje
      1.- Aviso
      2.- Bloquear }
    Result := (Bloqueo = 2);
    if (Bloqueo > 0) then
    begin
      Mensaje := _('Motivo') + ': ' + Mensaje;

      if (Bloqueo = 1) then
        Tipo := _('Aviso');

      if (Bloqueo = 2) then
        Tipo := _('Bloqueo');
      ShowMessage('Proveedor bloqueado ' + sLineBreak + Mensaje)
      // Application.MessageBox(PChar(Mensaje), PChar(Tipo), mb_iconinformation + mb_ok);
    end;
  end;
end;

function TDMMain.DameMinDireccion(Tercero: integer): integer;
begin
  Result := 0;

  if (Tercero <> 0) then
  begin
    with DameQueryRO(nil, DB) do
    begin
      try
        SQL.Add(' SELECT DIRECCION FROM SYS_TERCEROS_DIRECCIONES ');
        SQL.Add(' WHERE ');
        SQL.Add(' TERCERO = :TERCERO AND ');
        SQL.Add(' ACTIVO = 1 ');
        SQL.Add(' ORDER BY DIR_DEFECTO DESC ');
        ParamByName('TERCERO').AsInteger := Tercero;
        open;
        Result := FieldByName('DIRECCION').AsInteger;
      finally
        Free;
      end;
    end;
  end;
end;

function TDMMain.DameStockArticuloFecha(Empresa, Canal: integer; Articulo, Almacen: string; Fecha: TDateTime): double;
begin
  /// Devuelve el stock del articulo a una fecha

  Result := 0;
  if (Trim(Articulo) > '') then
  begin
    with DameQueryRO(nil, DB) do
    begin
      try
        // Temporal, por si falla esta forma de obtener stock
        if (EstadoKri(888) = 0) then
        begin
          SQL.Add(' SELECT STOCK FROM A_ART_DAME_STOCK2(:EMPRESA, :CANAL, :ALMACEN, :ARTICULO, :FECHA) ');
        end
        else
        begin
          SQL.Add(' SELECT SUM(EXISTENCIAS) STOCK FROM ');
          SQL.Add(' A_ART_DAME_STOCK_ART_ED (:EMPRESA, :CANAL, :ARTICULO, :ALMACEN, 1, 0, 0, 0, 0, 0, 0, :FECHA) ');
          SQL.Add(' WHERE (CANAL = :CANAL or :CANAL = 0) ');
        end;
        ParamByName('EMPRESA').AsInteger := Empresa;
        ParamByName('CANAL').AsInteger := Canal;
        ParamByName('ARTICULO').AsString := Articulo;
        ParamByName('ALMACEN').AsString := Almacen;
        ParamByName('FECHA').AsDateTime := Fecha;
        open;
        Result := FieldByName('STOCK').AsFloat;
      finally
        Free;
      end;
    end;
  end;
end;

function TDMMain.DameStockArticulo(Empresa, Canal: integer; Articulo, Almacen: string): double;
begin
  /// Devuelve el stock actual del articulo

  Result := DameStockArticuloFecha(Empresa, Canal, Articulo, Almacen, EncodeDate(3000, 01, 01));

end;

procedure TDMMain.CargaAlmacenDefecto;
begin
  with DameQueryRO(nil, DB) do
  begin
    try
      SQL.Text := 'SELECT ALMACEN FROM ART_ALMACENES WHERE EMPRESA = :EMPRESA AND DEFECTO = 1';
      ParamByName('EMPRESA').AsInteger := Entorno.Empresa;
      open;
      Entorno.AlmacenDefecto := FieldByName('ALMACEN').AsString;
    finally
      Free;
    end;
  end;
end;

function TDMMain.AcreedorBloqueado(Acreedor: integer; Empresa: integer = 0): boolean;
var
  Mensaje, Tipo: string;
  Bloqueo: integer;
begin
  if (Empresa = 0) then
    Empresa := Entorno.Empresa;

  with DameQueryRO(nil, DB) do
  begin
    try
      SQL.Text :=
        'SELECT BLOQUEO, MOTIVO_BLOQUEO FROM EMP_ACREEDORES WHERE EMPRESA = :EMPRESA AND ACREEDOR = :ACREEDOR';
      ParamByName('EMPRESA').AsInteger := Empresa;
      ParamByName('ACREEDOR').AsInteger := Acreedor;
      open;
      Bloqueo := FieldByName('BLOQUEO').AsInteger;
      Mensaje := FieldByName('MOTIVO_BLOQUEO').AsString;
    finally
      Free;
    end;

    { 0.- Sin mensaje
      1.- Aviso
      2.- Bloquear }
    Result := (Bloqueo = 2);
    if (Bloqueo > 0) then
    begin
      Mensaje := _('Motivo') + ': ' + Mensaje;

      if (Bloqueo = 1) then
        Tipo := _('Aviso');

      if (Bloqueo = 2) then
        Tipo := _('Bloqueo');
      MuestraMensaje('Cliente blouqueado', Mensaje + ' ' + Tipo, '', 'Aceptar', 0);
    end;
  end;
end;

procedure TDMMain.DameEmailLicencia(var Correo, Licencia: String);
begin
  try
    with DameQueryRO(nil, DB) do
    begin
      try
        SQL.Text := 'SELECT EMAIL_LICENCIA,LICENCIA FROM SYS_CONSTANTES';
        open;
        Correo := FieldByName('EMAIL_LICENCIA').AsString;
        Licencia := FieldByName('LICENCIA').AsString;
      finally
        Free;
      end;
    end;
  except
  end;
end;

Procedure TDMMain.DameActualizaciones(SG: TStringGrid);
begin
  // SG.Clear; // limpia contenido
  SG.RowCount := 1; // al menos una fila (la 0)
  SG.ColCount := 2; // dos columnas: tipo_revision y actualizacion
  SG.FixedRows := 0; // sin encabezado

  with DameQueryRO(nil, DB) do
  begin
    try
      SQL.Text := 'SELECT * FROM DAME_ACTUALIZACIONES ' + 'WHERE tipo_revision<>' + QuotedStr('HYA') +
        ' AND tipo_revision<>' + QuotedStr('GK2');
      open;

      if RecordCount > 0 then
      begin
        SG.RowCount := RecordCount; // ajusta filas según resultados
        while not EOF do
        begin
          SG.Cells[0, RecNo - 1] := FieldByName('tipo_revision').AsString;
          SG.Cells[1, RecNo - 1] := FieldByName('actualizacion').AsString;
          Next;
        end;
      end;
    finally
      Free;
    end;
  end;
end;

procedure TDMMain.DatosVersion(var VersionBaseDeDatos, Empresa, Copyright, NombreProducto: string;
Forzar: boolean = False);
begin
  // Solo busco los datos en la base de datos si no los tengo o si fuerzo.
  if Forzar or ((VersionBaseDeDatos = '') and (Empresa = 'UNK') and (Copyright = 'UNK') and (NombreProducto = 'UNK'))
  then
  begin
    if (DB.Connected) then
    begin
      try
        with DameQueryRO(nil, DB) do
        begin
          try
            SQL.Text :=
              'SELECT CLAVE, EMPRESA_ACERCA_DE, COPYRIGHT_ACERCA_DE, NOMBRE_PRODUCTO_ACERCA_DE FROM SYS_CONSTANTES';
            open;
            VersionBaseDeDatos := FieldByName('CLAVE').AsString;
            Empresa := FieldByName('EMPRESA_ACERCA_DE').AsString;
            Copyright := FieldByName('COPYRIGHT_ACERCA_DE').AsString;
            NombreProducto := FieldByName('NOMBRE_PRODUCTO_ACERCA_DE').AsString;
          finally
            Free;
          end;
        end;
      except
      end;
    end
    else
    begin
      VersionBaseDeDatos := '';
      Empresa := 'UNK';
      Copyright := 'UNK';
      NombreProducto := 'UNK';
    end;
  end;
end;

procedure TDMMain.DBError(ASender, AInitiator: TObject; var AException: Exception);
var
  FDException: EFDDBEngineException;
  ExceptionName, FriendlyMessage: string;
begin
  if AException is EFDDBEngineException then
  begin
    FDException := EFDDBEngineException(AException);

    if (FDException.ErrorCount > 0) and (FDException.Errors[0].ErrorCode = 335544517) then
    begin
      ExceptionName := DameNombreException(FDException.Message);
      if ExceptionName <> '' then
      begin
        FriendlyMessage := DameError(ExceptionName);
        if FriendlyMessage <> '' then
        begin
          ShowMessage(FriendlyMessage);
          AException := EAbort.Create('');
          Exit;
        end;
      end;
    end;
  end;
  // si el error no es de firebird tendra otro tratamiento
end;

function TDMMain.DameTituloTipoDocIdentidad(Pais, TipoDocIdent: string): string;
begin
  Result := '';
  if ((Pais > '') and (TipoDocIdent > '')) then
  begin
    with DameQueryRO(nil, DB) do
    begin
      try
        SQL.Add(' SELECT TITULO FROM SYS_TIPO_DOC_IDENT_PAIS WHERE PAIS = :PAIS AND TIPO_DOC_IDENT = :TIPO_DOC_IDENT ');
        ParamByName('PAIS').AsString := Pais;
        ParamByName('TIPO_DOC_IDENT').AsString := TipoDocIdent;
        open;
        Result := FieldByName('TITULO').AsString;
      finally
        Free;
      end;
    end;
  end;
end;

function TDMMain.DameTelefonoTercero(Tercero: integer): string;
begin
  Result := '';
  if (Tercero > 0) then
  begin
    with DameQueryRO(nil, DB) do
    begin
      try
        SQL.Text := 'SELECT DIR_TELEFONO01 FROM SYS_TERCEROS_DIRECCIONES WHERE TERCERO = :TERCERO AND DIR_DEFECTO = 1';
        ParamByName('TERCERO').AsInteger := Tercero;
        open;
        Result := FieldByName('DIR_TELEFONO01').AsString;
      finally
        Free;
      end;
    end;
  end;
end;

function TDMMain.DameModoIVACanal: integer;
begin
  with DameQueryRO(nil, DB) do
  begin
    try
      SQL.Text :=
        'SELECT MODO_IVA FROM EMP_CANALES WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL';
      ParamByName('EMPRESA').AsInteger := Entorno.Empresa;
      ParamByName('EJERCICIO').AsInteger := Entorno.Ejercicio;
      ParamByName('CANAL').AsInteger := Entorno.Canal;
      open;
      Result := FieldByName('MODO_IVA').AsInteger;
    finally
      Free;
    end;
  end;
end;

function TDMMain.DameMinIRPF: integer;
begin
  /// Devuelve el primer tipo de IRPF ordenado por porcentaje.
  /// Normalmente devolvera 'IRPF EXCENTO'

  with DameQueryRO(nil, DB) do
  begin
    try
      SQL.Add('SELECT FIRST 1 TIPO FROM SYS_TIPO_IRPF WHERE PAIS=:PAIS ORDER BY P_IRPF');
      ParamByName('PAIS').AsString := Entorno.Pais;
      open;
      Result := FieldByName('TIPO').AsInteger;
    finally
      Free;
    end;
  end;
end;

function TDMMain.DamePaisC2(Pais: string): string;
begin
  Result := '';
  if (Trim(Pais) > '') then
  begin
    with DameQueryRO(nil, DB) do
    begin
      try
        SQL.Text := 'SELECT PAIS_C2 FROM SYS_PAISES WHERE PAIS = :PAIS';
        ParamByName('PAIS').AsString := Pais;
        open;
        Result := FieldByName('PAIS_C2').AsString;
      finally
        Free;
      end;
    end;
  end;
end;

function TDMMain.DameCuentaGestion(Gestion: smallint; TipoTercero: smallint = -1; Empresa: integer = 0): string;
begin
  /// Devuelve la primera cuenta con la GESTION y TIPO_TERCERO pedidos.
  /// Si TIPO_TERCERO < 0, no se tiene en cuenta

  if (Empresa = 0) then
    Empresa := Entorno.Empresa;

  with DameQueryRO(nil, DB) do
  begin
    try
      SQL.Add(' SELECT MIN(CUENTA) FROM CON_CUENTAS ');
      SQL.Add(' WHERE ');
      SQL.Add(' EMPRESA = :EMPRESA AND ');
      SQL.Add(' EJERCICIO = :EJERCICIO AND ');
      SQL.Add(' CANAL = :CANAL AND ');
      SQL.Add(' GESTION = :GESTION AND ');
      SQL.Add(' TIPO = 5 AND ');
      if (TipoTercero > 0) then
        SQL.Add(' TIPO_TERCERO = :TIPO_TERCERO AND ');
      SQL.Add(' PGC = :PGC ');
      ParamByName('EMPRESA').AsInteger := Empresa;
      ParamByName('EJERCICIO').AsInteger := Entorno.Ejercicio;
      ParamByName('CANAL').AsInteger := Entorno.Canal;
      ParamByName('GESTION').AsInteger := Gestion;
      if (TipoTercero > 0) then
        ParamByName('TIPO_TERCERO').AsInteger := TipoTercero;
      ParamByName('PGC').AsInteger := Entorno.PGC;
      open;
      Result := FieldByName('MIN').AsString;
    finally
      Free;
    end;
  end;
end;

function TDMMain.DameSemillaCuentaGestion(Gestion: smallint; TipoTercero: smallint): string;
begin
  {
    Gestion
    1-Compras
    2-Ventas
    3-Clientes
    4-Proveedores
    5-Acreedores
    6-Comisionistas
    7-IVA Soportado
    8-IGIC Soportado
    9-IVA Repercutido
    10-IGIC Repercutido
    11-Tesorería
  }
  with DameQueryRO(nil, DB) do
  begin
    try
      SQL.Text :=
        'SELECT MAX(CUENTA) FROM SYS_CUENTAS WHERE PAIS = :PAIS AND GESTION = :GESTION AND TIPO_TERCERO = :TIPO_TERCERO AND PGC = :PGC';
      ParamByName('PAIS').AsString := Entorno.Pais;
      ParamByName('GESTION').AsInteger := Gestion;
      ParamByName('TIPO_TERCERO').AsInteger := TipoTercero;
      ParamByName('PGC').AsInteger := Entorno.PGC;
      open;
      Result := FieldByName('MAX').AsString + '.';
    finally
      Free;
    end;
  end;

  // Si no se ha encontrado una cuenta de gestion por lo menos doy un mensaje de aviso
  if (Result = '.') then
    ShowMessage(format(_('No se ha encontrado una cuenta en el PGC con Gestion %d y Tipo de Tercero %d'),
      [Gestion, TipoTercero]));
end;

function TDMMain.DameTituloCuenta(Cuenta: string; Ejercicio: integer = 0): string;
begin
  Result := '';
  Cuenta := Copy(Trim(Cuenta), 1, 15);

  if (Cuenta > '') then
  begin
    if (Ejercicio = 0) then
      Ejercicio := Entorno.Ejercicio;
    with DameQueryRO(nil, DB) do
    begin
      try
        SQL.Text :=
          'SELECT TITULO FROM CON_CUENTAS WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL AND CUENTA = :CUENTA';
        ParamByName('EMPRESA').AsInteger := Entorno.Empresa;
        ParamByName('EJERCICIO').AsInteger := Ejercicio;
        ParamByName('CANAL').AsInteger := Entorno.Canal;
        ParamByName('CUENTA').AsString := Cuenta;
        open;
        Result := FieldByName('TITULO').AsString;
      finally
        Free;
      end;
    end;
  end;
end;

procedure TDMMain.AjustaNivelesContables;
var
  n: smallint;
begin
  with DameQueryRW(nil, DB) do
  begin
    try
      SQL.Text := 'EXECUTE PROCEDURE C_CUENTAS_NIVELES_CONTABLES (:EMPRESA, :EJERCICIO, :CANAL)';
      ParamByName('EMPRESA').AsInteger := Entorno.Empresa;
      ParamByName('EJERCICIO').AsInteger := Entorno.Ejercicio;
      ParamByName('CANAL').AsInteger := Entorno.Canal;
      ExecSQL;
      Transaction.Commit;
      open;
      Entorno.NivelesCont := FieldByName('NIVELES').AsInteger;
    finally
      Free;
    end;
  end;

  Entorno.MaxNivCont := 15;
  Entorno.DigitosSub := 0;
  for n := 1 to 15 do
  begin
    Entorno.DigitCont[n] := 0;
    Entorno.DigitAcumula[n] := 0;
  end;

  TSLNiveles.Clear;
  TSLNiveles.Add(_('Todos'));

  with DameQueryRO(nil, DB) do
  begin
    try
      SQL.Add(' SELECT NIVEL, DIGITOS FROM CON_CUENTAS_NIVELES ');
      SQL.Add(' WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL ');
      SQL.Add(' ORDER BY EMPRESA, NIVEL ');
      ParamByName('EMPRESA').AsInteger := Entorno.Empresa;
      ParamByName('EJERCICIO').AsInteger := Entorno.Ejercicio;
      ParamByName('CANAL').AsInteger := Entorno.Canal;
      open;
      while not EOF do
      begin
        n := FieldByName('NIVEL').AsInteger;
        Entorno.DigitCont[n] := FieldByName('DIGITOS').AsInteger;
        if n > 1 then
          Entorno.DigitAcumula[n] := Entorno.DigitAcumula[n - 1] + Entorno.DigitCont[n]
        else
          Entorno.DigitAcumula[n] := Entorno.DigitCont[n];
        if (Entorno.DigitCont[n] > 0) then
        begin
          Entorno.DigitosSub := Entorno.DigitosSub + Entorno.DigitCont[n];
          TSLNiveles.Add(_('Nivel') + ' ' + IntToStr(n));
        end;
        Next;
      end;
    finally
      Free;
    end;
  end;
  UUtiles.LongExpansion := Entorno.DigitosSub;
  Entorno.MascaraCuentas := StringOfChar('C', Entorno.DigitosSub) + ';0;_';
end;

procedure TDMMain.ActualizaUsuario;
begin
  with DameQueryRW(nil, DB) do
  begin
    try
      SQL.Text :=
        'EXECUTE PROCEDURE S_USUARIOS_ACTUALIZA (:EMPRESA, :EJERCICIO, :CANAL, :USUARIO, :FECHA, :MEMORIZAR_FECHA)';
      ParamByName('USUARIO').AsInteger := Entorno.IdUsuario;
      ParamByName('EMPRESA').AsInteger := Entorno.Empresa;
      ParamByName('EJERCICIO').AsInteger := Entorno.Ejercicio;
      ParamByName('CANAL').AsInteger := Entorno.Canal;
      ParamByName('FECHA').AsDateTime := Entorno.FechaTrab;
      ParamByName('MEMORIZAR_FECHA').AsInteger := 1;
      ExecSQL;
      Transaction.CommitRetaining;
    finally
      Free;
    end;
  end;

  AjustaNivelesContables;
  AjustaMascaraMoneda;
end;

function TDMMain.Contador_Libre(Tipo: string; Codigo_Ent: integer): integer;
begin
  with DameQueryRW(nil, DB) do
  begin
    try
      SQL.Text := 'EXECUTE PROCEDURE COD_CONTADORES_LIBRE_E(:EMPRESA, :TIPO, :CODIGO_ENT)';
      ParamByName('EMPRESA').AsInteger := Entorno.Empresa;
      ParamByName('TIPO').AsString := Tipo;
      ParamByName('CODIGO_ENT').AsInteger := Codigo_Ent;
      ExecSQL;
      Transaction.CommitRetaining;
      open;
      Result := FieldByName('CODIGO').AsInteger;
    finally
      Free;
    end;
  end;
end;

procedure TDMMain.RestingeEdicion(DataSet: TDataSet; Estado: integer);
begin
  // Se restringe modificacion del documento si esta cerrado
  if (Estado = 5) then
    raise Exception.Create(_('No puede modificar un documento cerrado.'));
end;

procedure TDMMain.FDConnection1Error(Sender: TFDConnection; var AException: Exception; var AHandled: boolean);
var
  LQuery: TFDQuery;
  LComponentName: string;
begin
  AHandled := False; // Por defecto: permitir que la excepción se propague

  // Identificar qué componente originó el error (Query, Table, etc.)
  if (Sender <> nil) and (Sender.Owner <> nil) then
  begin
    // El "Initiator" suele estar en el campo privado FInitiator de la excepción,
    // pero podemos inferirlo del stack o del Owner actual
    LComponentName := Sender.Owner.Name;
  end
  else
    LComponentName := 'Desconocido';

  // Loguear el error con contexto
  { LogDBError(Format('Error desde: %s | Mensaje: %s | Clase: %s',
    [LComponentName, AException.Message, AException.ClassName])); }

  // Ejemplo: Consumir SOLO errores de conexión perdida para intentar reconectar
  if (AException is EFDDBEngineException) and (EFDDBEngineException(AException).ErrorCode = 335544372) then
  // Error de conexión Firebird
  begin
    { if IntentarReconectar then
      begin
      AHandled := True; // Error manejado internamente, NO se lanza al usuario
      Exit;
      end; }
  end;

  // Para otros errores: mostrar mensaje al usuario (solo en UI thread)
  if not(AException is EAbort) then
  begin
    TThread.Synchronize(nil,
      procedure
      begin
        { Application.MessageBox(PChar('Error en base de datos:'#13#10 +
          AException.Message), 'Error', MB_ICONERROR or MB_OK); }
      end);
  end;
end;

procedure TDMMain.Cambios(Origen, Destino: string; Fecha: TDateTime; Importe: double; var Ver, Calculo: double);
var
  tmp: string;
  Factor: double;
begin
  if (Origen <> Destino) then
  begin
    Factor := DameFactor(Origen, Destino, Fecha);
    if (Factor <> 0) then
      Importe := Importe / Factor;
  end;

  Redondeos(Importe, Destino, Ver, Calculo, tmp, tmp);
end;

procedure TDMMain.Redondeos(var Importe: double; Moneda: string; var Val_Ver, Val_Cal: double;
var Val_VerSTR, Val_CalSTR: string);
var
  MascaraVer, MascaraCal, tmp: string;
begin
  MascaraVer := MascaraMoneda(Moneda, 1);
  MascaraCal := MascaraMoneda(Moneda, 0);

  Val_VerSTR := FormatFloat(MascaraVer, Importe);
  tmp := StringReplace(Val_VerSTR, FormatSettings.ThousandSeparator, '', [rfReplaceAll]);
  Val_Ver := StrToFloat(tmp);

  Val_CalSTR := FormatFloat(MascaraCal, Importe);
  tmp := StringReplace(Val_CalSTR, FormatSettings.ThousandSeparator, '', [rfReplaceAll]);
  Val_Cal := StrToFloat(tmp);
end;

function TDMMain.DameFactor(Origen, Destino: string; Fecha: TDateTime): double;
var
  Encontrado: boolean;
begin
  // Result := 1;
  with xFactorMoneda do
  begin
    if not Active then
    begin
      open;
      Last;
    end;
    Encontrado := Locate('ORIGEN;DESTINO', VarArrayOf([Origen, Destino]), []);
    while ((not Encontrado) or (FieldByName('F_ALTA').AsFloat > Fecha)) do
    begin
      Next;
      if EOF then
        Break;
      Encontrado := Locate('ORIGEN;DESTINO', VarArrayOf([Origen, Destino]), []);
    end;
    if Encontrado then
    begin
      Result := FieldByName('FACTOR').AsFloat;
      Exit;
    end;
    Encontrado := Locate('ORIGEN;DESTINO', VarArrayOf([Origen, Destino]), []);
    while ((not Encontrado) or (FieldByName('F_ALTA').AsFloat > Fecha)) do
    begin
      Next;
      if EOF then
        Break;
      Encontrado := Locate('ORIGEN;DESTINO', VarArrayOf([Origen, Destino]), []);
    end;
    if Encontrado then
    begin
      Result := FieldByName('FACTOR').AsFloat;
      Exit;
    end;
    Result := 1;
  end;
end;

function TDMMain.DameStockMontura(Empresa, Canal: integer; Articulo, Almacen: string): double;
begin
  /// Devuelve el stock virtual del articulo

  Result := 0;
  if (Trim(Articulo) > '') then
  begin
    with DameQueryRO(nil, DB) do
    begin
      try
        // AutoTrans := False;
        // Temporal, por si falla esta forma de obtener stock
        if (EstadoKri(888) = 0) then
        begin
          SQL.Add(' SELECT A.EMPRESA, A.ARTICULO, M.ARTICULO_ESTRUCTURA, E.ARTICULO, ');
          SQL.Add('        -- ');
          SQL.Add('        (SELECT STOCK ');
          SQL.Add('         FROM A_ART_DAME_STOCK2(E.EMPRESA, :CANAL, :ALMACEN, MAT.COMPONENTE, :FECHA)) AS STOCK ');
          SQL.Add(' FROM ART_ARTICULOS A ');
          SQL.Add(' JOIN ART_ARTICULOS_M_C_TALLAS MCT ON A.ARTICULO = MCT.ARTICULO ');
          SQL.Add(' JOIN ART_ARTICULOS_MOD_COLOR MC ON MC.ID_A_M_C = MCT.ID_A_M_C ');
          SQL.Add(' JOIN ART_ARTICULOS_MODELOS M ON M.ID_A_M = MC.ID_A_M ');
          SQL.Add(' JOIN ART_ARTICULOS E ON E.EMPRESA = M.EMPRESA AND E.ARTICULO = M.ARTICULO_ESTRUCTURA ');
          SQL.Add(' JOIN PRO_ESCANDALLO ESC ON ESC.EMPRESA = E.EMPRESA AND ESC.COMPUESTO = E.ARTICULO AND ESC.DEFECTO = 1 ');
          SQL.Add(' JOIN PRO_MAT_ESC MAT ON MAT.ID_ESC = ESC.ID_ESC ');
          SQL.Add(' WHERE ');
          SQL.Add(' A.EMPRESA = :EMPRESA AND ');
          SQL.Add(' A.ARTICULO = :ARTICULO AND ');
          SQL.Add(' -- Solo articulos que vienen de modelos de tallas y colores ');
          SQL.Add(' A.ID_A_M_C_T > 0 ');
        end
        else
        begin
          SQL.Add(' SELECT A.EMPRESA, A.ARTICULO, M.ARTICULO_ESTRUCTURA, E.ARTICULO, ');
          SQL.Add('        -- ');
          SQL.Add('        (SELECT SUM(STOCK_VIRTUAL) STOCK FROM ');
          SQL.Add('         A_ART_DAME_STOCK_ART_ED (E.EMPRESA, :CANAL, MAT.COMPONENTE, :ALMACEN, 1, 0, 1, 1, 0, 0, 0, :FECHA) ');
          SQL.Add('         WHERE (CANAL = :CANAL or :CANAL = 0)) AS STOCK ');
          SQL.Add(' FROM ART_ARTICULOS A ');
          SQL.Add(' JOIN ART_ARTICULOS_M_C_TALLAS MCT ON A.ARTICULO = MCT.ARTICULO ');
          SQL.Add(' JOIN ART_ARTICULOS_MOD_COLOR MC ON MC.ID_A_M_C = MCT.ID_A_M_C ');
          SQL.Add(' JOIN ART_ARTICULOS_MODELOS M ON M.ID_A_M = MC.ID_A_M ');
          SQL.Add(' JOIN ART_ARTICULOS E ON E.EMPRESA = M.EMPRESA AND E.ARTICULO = M.ARTICULO_ESTRUCTURA ');
          SQL.Add(' JOIN PRO_ESCANDALLO ESC ON ESC.EMPRESA = E.EMPRESA AND ESC.COMPUESTO = E.ARTICULO AND ESC.DEFECTO = 1 ');
          SQL.Add(' JOIN PRO_MAT_ESC MAT ON MAT.ID_ESC = ESC.ID_ESC ');
          SQL.Add(' WHERE ');
          SQL.Add(' A.EMPRESA = :EMPRESA AND ');
          SQL.Add(' A.ARTICULO = :ARTICULO AND ');
          SQL.Add(' -- Solo articulos que vienen de modelos de tallas y colores ');
          SQL.Add(' A.ID_A_M_C_T > 0 ');
        end;
        ParamByName('EMPRESA').AsInteger := Empresa;
        ParamByName('CANAL').AsInteger := Canal;
        ParamByName('ARTICULO').AsString := Articulo;
        ParamByName('ALMACEN').AsString := Almacen;
        ParamByName('FECHA').AsDateTime := EncodeDate(3000, 01, 01);
        open;
        Result := FieldByName('STOCK').AsFloat;
      finally
        Free;
      end;
    end;
  end;
end;

function TDMMain.DameStockRealArticulo(Empresa, Canal: integer; Articulo, Almacen: string): double;
begin
  /// Devuelve el (STOCK - PEDIOS DE CLIENTE) del articulo

  Result := 0;
  if (Trim(Articulo) > '') then
  begin
    with DameQueryRO(nil, DB) do
    begin
      try
        // AutoTrans := False;
        // Temporal, por si falla esta forma de obtener stock
        if (EstadoKri(888) = 0) then
        begin
          SQL.Add(' SELECT (STOCK - PEDIDOS_D_CLI) STOCK FROM A_ART_DAME_STOCK2_PED(:EMPRESA, :CANAL, :ALMACEN, :ARTICULO, :FECHA) ');
        end
        else
        begin
          SQL.Add(' SELECT SUM(EXISTENCIAS - PEDIDOS_D_CLI) STOCK FROM ');
          SQL.Add(' A_ART_DAME_STOCK_ART_ED (:EMPRESA, :CANAL, :ARTICULO, :ALMACEN, 1, 0, 0, 1, 0, 0, 0, :FECHA) ');
          SQL.Add(' WHERE (CANAL = :CANAL or :CANAL = 0) ');
        end;
        ParamByName('EMPRESA').AsInteger := Empresa;
        ParamByName('CANAL').AsInteger := Canal;
        ParamByName('ARTICULO').AsString := Articulo;
        ParamByName('ALMACEN').AsString := Almacen;
        ParamByName('FECHA').AsDateTime := EncodeDate(3000, 01, 01);
        open;
        Result := FieldByName('STOCK').AsFloat;
      finally
        Free;
      end;
    end;
  end;
end;

function TDMMain.DameStockRefBase(Empresa, Canal: integer; Articulo, Almacen: string): double;
begin
  /// Cliente: EGINER
  /// Devuelve el stock del articulo padre (Referencia Base)
  /// El articulo padre esta definido en el campo ALFA_1.

  Result := 0;
  if (Trim(Articulo) > '') then
  begin
    with DameQueryRO(nil, DB) do
    begin
      try
        // AutoTrans := False;
        // Temporal, por si falla esta forma de obtener stock
        if (EstadoKri(888) = 0) then
        begin
          SQL.Add(' SELECT (SELECT STOCK FROM A_ART_DAME_STOCK2(A.EMPRESA, :CANAL, :ALMACEN, P.ARTICULO, :FECHA)) AS STOCK ');
          SQL.Add(' FROM ART_ARTICULOS A ');
          SQL.Add(' JOIN ART_ARTICULOS P ON A.EMPRESA = P.EMPRESA AND A.ALFA_1 = P.ARTICULO ');
          SQL.Add(' WHERE ');
          SQL.Add(' A.EMPRESA = :EMPRESA AND ');
          SQL.Add(' A.ARTICULO = :ARTICULO ');
          SQL.Add(' ORDER BY P.ARTICULO ');
        end
        else
        begin
          SQL.Add(' SELECT (SELECT SUM(STOCK_VIRTUAL) ');
          SQL.Add('         FROM A_ART_DAME_STOCK_ART_ED(A.EMPRESA, :CANAL, P.ARTICULO, :ALMACEN, 1, 0, 1, 1, 0, 0, 0, :FECHA) ');
          SQL.Add('         WHERE ');
          SQL.Add('         (CANAL = :CANAL OR :CANAL = 0)) STOCK ');
          SQL.Add(' FROM ART_ARTICULOS A ');
          SQL.Add(' JOIN ART_ARTICULOS P ON A.EMPRESA = P.EMPRESA AND A.ALFA_1 = P.ARTICULO ');
          SQL.Add(' WHERE ');
          SQL.Add(' A.EMPRESA = :EMPRESA AND ');
          SQL.Add(' A.ARTICULO = :ARTICULO ');
          SQL.Add(' ORDER BY P.ARTICULO ');
        end;
        ParamByName('EMPRESA').AsInteger := Empresa;
        ParamByName('CANAL').AsInteger := Canal;
        ParamByName('ARTICULO').AsString := Articulo;
        ParamByName('ALMACEN').AsString := Almacen;
        ParamByName('FECHA').AsDateTime := EncodeDate(3000, 01, 01);
        open;
        Result := FieldByName('STOCK').AsFloat;
      finally
        Free;
      end;
    end;
  end;
end;

function TDMMain.DameStockVirtualArticulo(Empresa, Canal: integer; Articulo, Almacen: string): double;
begin
  /// Devuelve el stock virtual del articulo
  Result := 0;
  if (Trim(Articulo) > '') then
  begin
    with DameQueryRO(nil, DB) do
    begin
      try
        // Temporal, por si falla esta forma de obtener stock
        if (EstadoKri(888) = 0) then
        begin
          SQL.Add(' SELECT (STOCK + PEDIDOS_A_PRO - PEDIDOS_D_CLI) STOCK FROM A_ART_DAME_STOCK2_PED(:EMPRESA, :CANAL, :ALMACEN, :ARTICULO, :FECHA) ');
        end
        else
        begin
          SQL.Add(' SELECT SUM(STOCK_VIRTUAL) STOCK FROM ');
          SQL.Add(' A_ART_DAME_STOCK_ART_ED (:EMPRESA, :CANAL, :ARTICULO, :ALMACEN, 1, 0, 1, 1, 0, 0, 0, :FECHA) ');
          SQL.Add(' WHERE (CANAL = :CANAL or :CANAL = 0) ');
        end;
        ParamByName('EMPRESA').AsInteger := Empresa;
        ParamByName('CANAL').AsInteger := Canal;
        ParamByName('ARTICULO').AsString := Articulo;
        ParamByName('ALMACEN').AsString := Almacen;
        ParamByName('FECHA').AsDateTime := EncodeDate(3000, 01, 01);
        open;
        Result := FieldByName('STOCK').AsFloat;
      finally
        Free;
      end;
    end;
  end;
end;

end.
