unit UFMain;

// Formulario principal de Merge en Delphi 13.
// Visual y funcionamiento de MaxFactu (menú lateral por categorías, pestañas / ventanas, panel de sistema)
// con la API de FMain de Merge (acciones con los mismos nombres, EjecutaAccion, FiltroAccion, Enlace*...).
// Las 715 acciones de Merge están en ALMain; el menú solo muestra las de los módulos ya convertidos.

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.DateUtils,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.WinXCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.ButtonGroup, Vcl.Menus, Vcl.ActnList, Vcl.ActnMan, Vcl.PlatformDefaultStyleActnCtrls, System.Actions,
  System.ImageList, Vcl.ImgList, Vcl.Themes, Vcl.Styles, Vcl.ToolWin, Vcl.CategoryButtons, Vcl.Imaging.pngimage,
  Vcl.BaseImageCollection, Vcl.ImageCollection, Vcl.VirtualImageList, UFormManager, UCustomProperties,
  Vcl.DBCtrls, Vcl.Mask, Data.DB, UDateTimePickerHelper, System.UITypes, frxClass,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.Comp.Client, FireDAC.Comp.Script, FireDAC.UI.Intf,
  FireDAC.Stan.Async, FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util;

type
  TGrpButtonItemHelper = class helper for Vcl.ButtonGroup.TGrpButtonItem
  private
    function GetCustomProperties: TCustomProperties;
  public
    procedure SetVentana(const Value: Boolean);
    function GetVentana: Boolean;
    property CustomProperties: TCustomProperties read GetCustomProperties;
    property Ventana: Boolean read GetVentana write SetVentana;
  end;

  TFMain = class(TForm)
    PCMain: TPageControl;
    SplitViewMenu: TSplitView;
    CPGMenu: TCategoryPanelGroup;
    PMenuCabecera: TPanel;
    pnlToolbar: TPanel;
    Image1: TImage;
    BMenu: TButton;
    BVentanas: TButton;
    BSistema: TButton;
    BAuxiliares: TButton;
    BImportador: TButton;
    StatusBar1: TStatusBar;
    SplitViewSistema: TSplitView;
    PNLConfiguracion: TPanel;
    PNLUsuario: TPanel;
    Label1: TLabel;
    LClave: TLabel;
    EUsuario: TEdit;
    EClave: TEdit;
    BSesion: TButton;
    PNLSesion: TPanel;
    LEmpresa: TLabel;
    LEjercicio: TLabel;
    LCanal: TLabel;
    LSerie: TLabel;
    LFechaTrabajo: TLabel;
    CBEmpresa: TComboBox;
    CBEjercicio: TComboBox;
    CBCanal: TComboBox;
    CBSerie: TComboBox;
    DTPFechaTrabajo: TDateTimePicker;
    BModificarEntorno: TButton;
    PNLConexion: TPanel;
    LBaseDatos: TLabel;
    LClaveBD: TLabel;
    LUsuarioBD: TLabel;
    LRoldBD: TLabel;
    Label2: TLabel;
    CBBaseDatos: TComboBox;
    BConectar: TButton;
    EClaveBD: TEdit;
    EUsuarioBD: TEdit;
    ERolBD: TEdit;
    CBVersionFB: TComboBox;
    PNLIdioma: TPanel;
    LIdioma: TLabel;
    CBIdioma: TComboBox;
    PNLEstilo: TPanel;
    LEstilo: TLabel;
    CBEstilo: TComboBoxEx;
    ALMain: TActionManager;
    ATipoNCF: TAction;
    AFamilias: TAction;
    AContaEstructura: TAction;
    AImprimeFacturas: TAction;
    AFacturasProv: TAction;
    AProTareasMan: TAction;
    AClientesPotencialesKri: TAction;
    AContaCuentas: TAction;
    AContaGrupoCuentas: TAction;
    AContaMovimientos: TAction;
    AContaConceptos: TAction;
    AImprimePedidos: TAction;
    AImprimeAlbaranes: TAction;
    AContaExtracto: TAction;
    AContaBorrador: TAction;
    AContaDefBalances: TAction;
    ANominasConstantes: TAction;
    AFormasPago: TAction;
    AContaCuentasAnuales: TAction;
    AContaDiario: TAction;
    AContaSumYSaldos: TAction;
    AContaCierreYApertura: TAction;
    ARepUsuariosVentas: TAction;
    AContaPlantillas: TAction;
    AContaPGC: TAction;
    AContaCuentasIVA: TAction;
    ATipoIva: TAction;
    AModoIva: TAction;
    ARegIVA: TAction;
    ASalir: TAction;
    AAcerca: TAction;
    AUsuarios: TAction;
    AProvincias: TAction;
    ALocalidades: TAction;
    ACFGPrint: TAction;
    AUbicaciones: TAction;
    AEmpresas: TAction;
    AMonedas: TAction;
    AContadores: TAction;
    AConfig: TAction;
    ACambiaUser: TAction;
    ACambiarCanal: TAction;
    ATerceros: TAction;
    ATerceros2: TAction;
    APaises: TAction;
    ACanales: TAction;
    AAlmacenes: TAction;
    ATarifas: TAction;
    APropaga: TAction;
    AArticulos: TAction;
    AMvStMan: TAction;
    APedidos: TAction;
    AAlbaranes: TAction;
    AFacturas: TAction;
    ACambioMonedas: TAction;
    AClientes: TAction;
    AProveedores: TAction;
    AFondo: TAction;
    AAcreedores: TAction;
    AAgentes: TAction;
    ACartera: TAction;
    AFormaPago: TAction;
    AGenCanales: TAction;
    AGenSeries: TAction;
    AGenEjercicios: TAction;
    AOfertas: TAction;
    APropPedidos: TAction;
    APedidosProv: TAction;
    ARecepcionPedidos: TAction;
    ABackup: TAction;
    ASeries: TAction;
    ACampanyas: TAction;
    AFacAlbaranes: TAction;
    AFacHistProcesos: TAction;
    ABusqueda: TAction;
    APeriodosSistema: TAction;
    AGenPeriodos: TAction;
    AAmortizaciones: TAction;
    ASysCuentas: TAction;
    APerfiles: TAction;
    AAjustes: TAction;
    ACentrosInventario: TAction;
    ANewTarifas: TAction;
    AAlbaranesProv: TAction;
    ALSTIVAListado: TAction;
    APerfilesUsuario: TAction;
    ARemesas: TAction;
    APregMayorCantidad: TAction;
    ALSTStockMinimo: TAction;
    ALSTDiarioStock: TAction;
    AFacAlbaranesProv: TAction;
    AContaCuentasIRPF: TAction;
    ATipoIrpf: TAction;
    AEscandallo: TAction;
    ABancos: TAction;
    ALSTStockResumido: TAction;
    ALSTStockAlmacen: TAction;
    AListarCartera: TAction;
    ADiarioIVA: TAction;
    ALSTInventario: TAction;
    AAgrupacionPedidos: TAction;
    AUnidades: TAction;
    ARenumeraContabilidad: TAction;
    AGenBancos: TAction;
    ARazones: TAction;
    AFacturasAcr: TAction;
    ACierraFacturas: TAction;
    ABalance: TAction;
    ACuentasAnuales: TAction;
    AAGrupaciones: TAction;
    ATiposDir: TAction;
    ATiposAcreedor: TAction;
    AListador: TAction;
    AProyectos: TAction;
    ACodigosBarras: TAction;
    ATiposEfectos: TAction;
    APunteoAsientos: TAction;
    ATipoImpuestos: TAction;
    ARetEmpleados: TAction;
    ACondicionesProv: TAction;
    ATarifasProveedor: TAction;
    APropagaEmpresa: TAction;
    ASaldos: TAction;
    ACondAgentes: TAction;
    ACondAgeAgrup: TAction;
    ACondAgeCli: TAction;
    AABCVentas: TAction;
    AABCVentasKri: TAction;
    ATercerosCuentas: TAction;
    AABCCompras: TAction;
    APCRecAgrupados: TAction;
    AAyudaenLinea: TAction;
    APlazosGarantia: TAction;
    AEscandalloProd: TAction;
    AOrdenProduccion: TAction;
    ANuevoRecibo: TAction;
    ACambiaFecha: TAction;
    AABCComprasKri: TAction;
    AFacAlbaranesProvDet: TAction;
    AListNecesidades: TAction;
    AMRP: TAction;
    AConfirming: TAction;
    AAnticipos: TAction;
    AModelo300: TAction;
    AModelo303: TAction;
    AModelo115: TAction;
    AModelo110: TAction;
    AModelo330: TAction;
    ATalones: TAction;
    ATalonesCta: TAction;
    ALSTDepositosActivos: TAction;
    ALSTFichaMargendeProductos: TAction;
    AContaDefBalancesCAB: TAction;
    ACierraFac: TAction;
    AMuestraRecibos: TAction;
    ATraspaso: TAction;
    ALSTUnidadesPendientes: TAction;
    AModelo190: TAction;
    AModelo390: TAction;
    AExporta190: TAction;
    ACierraTodas: TAction;
    AModelo340: TAction;
    AHistoricoPMP: TAction;
    APonderarDocs: TAction;
    AMonedasCuenta: TAction;
    AAgrupacionFac: TAction;
    ACorreoEmpresa: TAction;
    AEmpCanales: TAction;
    AAvisos: TAction;
    AClasesDirecciones: TAction;
    ACamMonCartera: TAction;
    ADuplicaEscandallo: TAction;
    APagares: TAction;
    AConfINI: TAction;
    ARepUsuarioAlm: TAction;
    ArepUsuarioCompras: TAction;
    ARepUsuarioConta: TAction;
    ARepUsuariosTerceros: TAction;
    ATipoAsiento: TAction;
    AIncrementoPorcentual: TAction;
    AContRecuperacion: TAction;
    ATiposCalculo: TAction;
    ACondicionesEspeciales: TAction;
    AMonedasMaestros: TAction;
    ALSTLotes: TAction;
    ALSTLotesCompras: TAction;
    ALSTLotesVentas: TAction;
    ALSTLotesMovimientos: TAction;
    AModelo347: TAction;
    AConfModelo110: TAction;
    AConfModelo115: TAction;
    AConfModelo190: TAction;
    AConfModelo300: TAction;
    AConfModelo303: TAction;
    AConfModelo330: TAction;
    AConfModelo347: TAction;
    AContaDiarioPartido: TAction;
    AArtProv: TAction;
    AArtCli: TAction;
    ALSTUnidPendRecibir: TAction;
    AProcesosProd: TAction;
    ATiposRedondeo: TAction;
    ARepUsuarioTesoreria: TAction;
    ARepUsuarioProduccion: TAction;
    AConsultaNroSerieKri: TAction;
    AMantenimientoNroSerie: TAction;
    AImprimirEtiquetasKri: TAction;
    AProrrateoCostes: TAction;
    APedidosVentaPendientes: TAction;
    APedidosCompraPendientes: TAction;
    AImagenes: TAction;
    ALSTGeneraTmpInventarioKri: TAction;
    ARiesgoBancos: TAction;
    ARiesgoClientes: TAction;
    AAsignaBancoRemesa: TAction;
    AFacAlbaranesCliDet: TAction;
    ATransmisionesPatrimoniales: TAction;
    ASumasYSaldosKri: TAction;
    AColoresTallas: TAction;
    AGruposTallas: TAction;
    AModelosTallas: TAction;
    ALSTStockTallas: TAction;
    AOrdenProduccionTallasKri: TAction;
    AEDI: TAction;
    AAgrupacionDeAlbaranesKri: TAction;
    ACentroDeCostos: TAction;
    ALstCentroCoste: TAction;
    AIntrastat: TAction;
    AIntrastatCompras: TAction;
    AIntrastatVentas: TAction;
    ACierreStocks: TAction;
    ARegStocks: TAction;
    AConfIntrastatCV: TAction;
    AExporta349: TAction;
    ALotes: TAction;
    ALSTEstadisticasArt: TAction;
    APedFueraPlazo: TAction;
    ALoteSimple: TAction;
    ACondicionesVenta: TAction;
    AAsistenteEmpresa: TAction;
    AAsistenteEjercicio: TAction;
    ACondicionesCompra: TAction;
    AMatriculas: TAction;
    ANaturalezaMat: TAction;
    APedFueraPlazoVentas: TAction;
    AIncidencias: TAction;
    AParamApuntes: TAction;
    AConfigTextos: TAction;
    AFacCuotas: TAction;
    AAlmacenesCalles: TAction;
    AAlmacenesEstanterias: TAction;
    AAlmacenesRepisas: TAction;
    AAlmacenesPosicion: TAction;
    AEnvioReparto: TAction;
    AConfigAlmcen: TAction;
    AMovEntreUbicaciones: TAction;
    ALstStockPorUbicacion: TAction;
    ALstMovEntreUbicaciones: TAction;
    AFacturasDirectas: TAction;
    ACaravanas: TAction;
    ATipoPortes: TAction;
    ARangosPortes: TAction;
    APromocionesVenta: TAction;
    APromocionesIndirectas: TAction;
    AOrdenPromocion: TAction;
    ATrazabilidadLotes: TAction;
    AAsistenteTarifa: TAction;
    APropuestas: TAction;
    APropuestasConfirm: TAction;
    AArtBultos: TAction;
    AVentas: TAction;
    ATicketsEdicion: TAction;
    AVentasArticulos: TAction;
    AFacturarTickets: TAction;
    ACobros: TAction;
    ACobrosEdicion: TAction;
    AGastos: TAction;
    ATicketsEdicionGastos: TAction;
    AFacturarTicketsGasto: TAction;
    ASesion: TAction;
    ACajas: TAction;
    ATurnos: TAction;
    ATercerosTPV: TAction;
    AClientesTPV: TAction;
    ACajasEmpresa: TAction;
    ACajasSistema: TAction;
    AUsuariosTPV: TAction;
    AEmpEjerCan: TAction;
    AFondoTPV: TAction;
    AConfiguracion: TAction;
    ATiposGasto: TAction;
    AFormaPagoTpv: TAction;
    APerfilesUsuarioTPV: TAction;
    APedidosPendientes: TAction;
    AAlbaranesPendientes: TAction;
    AFiltroFacturas: TAction;
    APedidosPendientesProv: TAction;
    AAlbaranesPendientesProv: TAction;
    AFiltroFacturasProv: TAction;
    AFiltroFacturasAcr: TAction;
    ADivisionesMaestros: TAction;
    AUsuariosWeb: TAction;
    AHistoricoProcesosProv: TAction;
    AAnaPlanesContables: TAction;
    AAnaCentrosCoste: TAction;
    AAnaPlantillasImputacion: TAction;
    AAnaImputacionesCostes: TAction;
    AAnaExtracto: TAction;
    AAnaSumaYSaldos: TAction;
    AAnaAnalisisPresupuesto: TAction;
    AAnaPropagaEstructuras: TAction;
    AAnaLstPlanContableAnalitico: TAction;
    AUsuarioCambiaClave: TAction;
    AImportarAsientos: TAction;
    AExportarAsientos: TAction;
    AExportarSaldos: TAction;
    AParamModelosHacienda: TAction;
    AOrdenesDePago: TAction;
    ANorma43SLucia: TAction;
    ACRM: TAction;
    ASincronizarBasesKri: TAction;
    ANorma43Kri: TAction;
    AContaRectAsientos: TAction;
    AConfAlmacenes: TAction;
    APreciosCosteKri: TAction;
    AEquivalencias: TAction;
    AModificaPGC: TAction;
    AGestions: TAction;
    ACambioEmpresaEjerCanal: TAction;
    ATipoLineaVenta: TAction;
    APedidoEntreAlmacenes: TAction;
    ATraspasoPedCliAPedProv: TAction;
    ARecepcionWeb: TAction;
    ATipoIncidenciaKri: TAction;
    AAlarmasIberfluidKri: TAction;
    AProcesosKri: TAction;
    AIdiomasKri: TAction;
    AImportarDocumentos: TAction;
    AZonas: TAction;
    APersonalUlises: TAction;
    ATransportistasSEUR: TAction;
    ATransportistasDHL: TAction;
    ATransportistasIDRIL: TAction;
    ACrmAmbitos: TAction;
    ACrmEMails: TAction;
    ACrmTipoAcciones: TAction;
    ACrmContactos: TAction;
    ADisenarTicket: TAction;
    ADisenarVale: TAction;
    ADisenarTicketRecogida: TAction;
    ACrmConsultaAcciones: TAction;
    ACrmConfiguracion: TAction;
    ACrmOrigenRel: TAction;
    ACrmImportarContactos: TAction;
    AEstadisticas: TAction;
    AIsoAccPreventiva: TAction;
    AIsoMantTAcc: TAction;
    AIsoPlanCapac: TAction;
    AIsoClassProv: TAction;
    AIsoDevMat: TAction;
    AIsoMantInformes: TAction;
    AIsoControlEquip: TAction;
    AIsoPunteos: TAction;
    AIsoFirmas: TAction;
    AIsoCursos: TAction;
    AIsoPlanning: TAction;
    AProEscandalloSF: TAction;
    AProMarcajesOpe: TAction;
    AProDiario: TAction;
    AProOrden: TAction;
    AProGestionOrd: TAction;
    AProMarcajesMaq: TAction;
    AProMarcajesTe: TAction;
    AProMarcajesVa: TAction;
    AProGenerarOrd: TAction;
    AProRecursosEmp: TAction;
    AOpeCategoria: TAction;
    AOpeCTrabajo: TAction;
    AOpeDepartamento: TAction;
    AOpeSecciones: TAction;
    AOpeTContrato: TAction;
    AOpeEmpleados: TAction;
    ANomina: TAction;
    AProMaquinas: TAction;
    AOpeImputaciones: TAction;
    AOpeTImputacion: TAction;
    AOpeCalendario: TAction;
    AOpeCalendarioEmp: TAction;
    ACalendarioZona: TAction;
    AProLstOrden: TAction;
    AProLstEscandallo: TAction;
    AProMatInc: TAction;
    AProTMaquina: TAction;
    AProRecMarcajes: TAction;
    AProFases: TAction;
    AProTareas: TAction;
    AProRecursos: TAction;
    AProLstMarcajes: TAction;
    AProConfigMarcajes: TAction;
    AOpeHorario: TAction;
    AProLstMontaje: TAction;
    AProLstNecesidades: TAction;
    AProUtillajes: TAction;
    AProLstHojaTrabajo: TAction;
    AProRelacionUds: TAction;
    AProOfertasE: TAction;
    AProLstofertasE: TAction;
    AProMarcajesOpeEsp: TAction;
    AProMarcajesMaqEsp: TAction;
    AProPlanificar: TAction;
    AProDeslanza: TAction;
    AProCabPlanificacion: TAction;
    AProTipTareasMan: TAction;
    AProEquivalArt: TAction;
    APauta_TipoControl: TAction;
    APauta: TAction;
    AObrObras: TAction;
    AObrPartidas: TAction;
    AObrPartidasPlantilla: TAction;
    AProDiagramaGantt: TAction;
    AProTipoMarcajes: TAction;
    AProMarcajesBD: TAction;
    AProDesTipoPieza: TAction;
    AProDesTipoMat: TAction;
    AProDesDespiece: TAction;
    ARecalcular: TAction;
    ADocumentos: TAction;
    AProLstMatEsc: TAction;
    ALstNecEsc: TAction;
    AImagenesArticulos: TAction;
    AArticulosAlmacenes: TAction;
    AProPantMarcajes: TAction;
    AAgrupaRecEsc: TAction;
    AProUtiles: TAction;
    AProFormulas: TAction;
    APresencia: TAction;
    APresenciaIncidencia: TAction;
    APresenciaDispositivo: TAction;
    APresenciaTipoMarcaje: TAction;
    APresenciaDiario: TAction;
    AImportacionFichajesDePresencia: TAction;
    ALstPresencia: TAction;
    AProTMaquinaRevision: TAction;
    AProTipoRevMaq: TAction;
    ACambioIdioma: TAction;
    ATipoUnidadLogistica: TAction;
    AHojaDePreparacion: TAction;
    AAltaHojaDePreparacion: TAction;
    ACierreParcialOrden: TAction;
    AProtocolosDeVenta: TAction;
    AProtocoloDeVentas: TAction;
    ADepartamento: TAction;
    ACrmTipoSeguimiento: TAction;
    ATipoUbicacion: TAction;
    ASectorAlmacen: TAction;
    ALstUbicaciones: TAction;
    AAlbaranesVentaPendientes: TAction;
    ZASysNCF: TAction;
    ZATalones: TAction;
    ZADiarioVentas: TAction;
    ZAVentasFamilia: TAction;
    ZAIntereses: TAction;
    AListadoITBIS: TAction;
    ALSTTalones: TAction;
    ZARecibos: TAction;
    AResponsableHojaDePreparacion: TAction;
    AGruposIncoterm: TAction;
    ACodigosIncoterm: TAction;
    AAsistenteImpIdiomaArticulos: TAction;
    AProMarcajesMaqEspTurno: TAction;
    AProTurnos: TAction;
    AProCausas: TAction;
    AProDefecto: TAction;
    AProTiposDefecto: TAction;
    AIsoFichaTecnica: TAction;
    AIsoNormativas: TAction;
    AIsoTipoEnsayo: TAction;
    AIsoEnsayos: TAction;
    AImportarPedidos: TAction;
    ATipoRetencion: TAction;
    APlanMaestroProduccion: TAction;
    ADiarioCostes: TAction;
    AGestionDeCobros: TAction;
    AMaestros: TAction;
    AOrdenes: TAction;
    AEtiquetas: TAction;
    APresupuestos: TAction;
    ALstPresupuestos: TAction;
    AMaquinas: TAction;
    ADetalleMaq: TAction;
    ATroqueles: TAction;
    AEtiConstantes: TAction;
    ATiposArticulo: TAction;
    AMateriales: TAction;
    AColadas: TAction;
    AReparaciones: TAction;
    AMantConsumo: TAction;
    AZLstOfertas: TAction;
    AGas: TAction;
    ATiposMoneda: TAction;
    AGasTanque: TAction;
    AGasDispensador: TAction;
    AGasColaCamion: TAction;
    AProSubsComponentes: TAction;
    ASincronizaIncidencias: TAction;
    ACompensacionRecibos: TAction;
    AGasUtiles: TAction;
    ASerializacion: TAction;
    ADescargasGas: TAction;
    ASincronizaTienda: TAction;
    ASincronizaTiendaWoocommerce: TAction;
    AVerificacionesImpuestos: TAction;
    ASeriesCliente: TAction;
    ACrmArticulos: TAction;
    ACrmMarcajes: TAction;
    ACrmVentas: TAction;
    ACrmAcciones: TAction;
    AIsoCertificadoAnalisis: TAction;
    AImportarArticulosExcel: TAction;
    APrevisionTesoreria: TAction;
    ACrmImportarLocalidades: TAction;
    ATipoColorTallas: TAction;
    AParametrizacionTallas: TAction;
    AProOrdTareaMat: TAction;
    AADRNaturalezaPeligro: TAction;
    AADRMedidasProteccion: TAction;
    ALstMatPeligrosas: TAction;
    AListadoCuota: TAction;
    AControlPlazas: TAction;
    AConsultaITBIS: TAction;
    AConciliacionBancaria: TAction;
    AAbreINI: TAction;
    ATraspasoMulticanales: TAction;
    ZAModelos: TAction;
    ZALonas: TAction;
    ZALonasForma: TAction;
    ZARibetes: TAction;
    ZABambalinas: TAction;
    ZAModelosDet: TAction;
    ZAColores: TAction;
    ZAModelosFechas: TAction;
    ZATarifasModelos: TAction;
    ZAPedidosEsp: TAction;
    ZAPedidosEspTodos: TAction;
    AEquivalenciaColores: TAction;
    ZADatosAuxiliares: TAction;
    ZATiposConfig: TAction;
    ZAVerEstadoPedCli: TAction;
    ZAVerEstadoOrdenesCli: TAction;
    ZAMarcajeManual: TAction;
    ZAPuestos: TAction;
    ZAMarcajes: TAction;
    ZAImprimePedEspPdte: TAction;
    ZALstPedEntrega: TAction;
    ZAArticulos: TAction;
    ZAPedidosAAlbaran: TAction;
    ZAPedidosMalCerrados: TAction;
    ZALstPedVenLin: TAction;
    ZATiposArticulos: TAction;
    ZALstTiempoMarc: TAction;
    ZAMarcManDirecto: TAction;
    ZALstFechaPrevProv: TAction;
    ZAConfiguracion: TAction;
    ZAConsultarTarifasModelos: TAction;
    APedidosVentaPendientesTyC: TAction;
    AListadoDeUnidadesPendientesDeServirTyC: TAction;
    AListadoDeStockMnimoTyC: TAction;
    ADespiece: TAction;
    AImprimeRecibos: TAction;
    AOfertasANDALplast: TAction;
    AMoldes: TAction;
    APostizos: TAction;
    ALstCosteVentasMP: TAction;
    ALstArticulosCliente: TAction;
    AGestionDocumentosPago: TAction;
    AEnviarDatosPonys: TAction;
    AGaleriaImagen: TAction;
    AMarca: TAction;
    AGestionTareasProduccion: TAction;
    AExportacionEuroPastry: TAction;
    ADividirFacturas: TAction;
    AMemoriaContable: TAction;
    ASincronizaTiendaMasYMasBarato: TAction;
    AHojaDeTrabajo: TAction;
    AFichaTecnica: TAction;
    AMarcas: TAction;
    AExtraccionDatos: TAction;
    ANecesidadMateraPrima: TAction;
    AParteMovimiento: TAction;
    APedidosPendientesProv2: TAction;
    ARecibosdeIngresosDesglosados: TAction;
    ATipoModelo: TAction;
    ARepartirHorasProyecto: TAction;
    AKitTallas: TAction;
    ASII: TAction;
    ATipoIncidenciaMaq: TAction;
    ALSTIngresos: TAction;
    AImprimeCartaPortes: TAction;
    AAlquileres: TAction;
    AMuestraMenu: TAction;
    APeriodoFacturacion: TAction;
    ASincronizacionTiendaPureWorks: TAction;
    AImportesMaximoPeriodo: TAction;
    ATipoIncidenciaRep: TAction;
    ARutasAgente: TAction;
    ASesionCajaTurno: TAction;
    AConfiguracionTPV: TAction;
    ARegistroFitosanitario: TAction;
    APorcentajeFacturacion: TAction;
    AOpeEstadoMarcajePedido: TAction;
    ANumerosDeAutorizacion: TAction;
    AADRUNNumbers: TAction;
    AADRClases: TAction;
    AADRPackingGroups: TAction;
    AADRTunelCodes: TAction;
    AADRTipos: TAction;
    ATPVSincronizacion: TAction;
    ATPVConfigSincronizacion: TAction;
    APedidosPendientesCli: TAction;
    AListarEtiquetas: TAction;
    ACuotasClientes: TAction;
    AExportacionHelios: TAction;
    AImportacionVending: TAction;
    AMaquinasVending: TAction;
    AUbicacionesSimple: TAction;
    ALstCalendarioLaboral: TAction;
    AAuditoria: TAction;
    ACategoriaCliente: TAction;
    AAsistenteImpClientes: TAction;
    AAsistenteImpProveedores: TAction;
    AAsistenteImpAcreedores: TAction;
    AAsistenteImpArticulos: TAction;
    ARefrescarImpresoras: TAction;
    APruebas: TAction;
    AExportacionTyrsa: TAction;
    AImportaListados: TAction;
    ANuevoGrupoListados: TAction;
    ARecalculaContabilidad: TAction;
    AFiltroAlbaranesCompra: TAction;
    ARegiones: TAction;
    APoblaciones: TAction;
    AImportacionDlivery: TAction;
    AImportacionMulty: TAction;
    ACrmAsuntos: TAction;
    AAtributos: TAction;
    ASincronizacionEginer: TAction;
    ASIILROE: TAction;
    AVerifactu: TAction;
    ATipoImpuestoAdicional: TAction;
    ASIICertificadoDigital: TAction;
    ASIIFolios: TAction;
    ASIIUrlEndpoint: TAction;
    AArtModGenero: TAction;
    AArtModTemporada: TAction;
    AAsistenteImpModelos: TAction;
    AListarCuadreCaja: TAction;
    ATiposBulto: TAction;
    AReestablecerConexionesWEB: TAction;
    ATipoReparacion: TAction;
    ATipoActuacion: TAction;
    AServirPedidosVenta: TAction;
    AEnvioDTE: TAction;
    APrevisionDeCuentas: TAction;
    ADatosTecnicos: TAction;
    ARefrescarBandejas: TAction;
    ACilindros: TAction;
    AEstadisitcasComparadas: TAction;
    AEstadisticaTubosParis: TAction;
    ANominas: TAction;
    ANominasConceptos: TAction;
    ARHPersona: TAction;
    AEtiColor: TAction;
    AEtiAnilox: TAction;
    AAgrupacionOfertas: TAction;
    ARCVCompra: TAction;
    AAsistenteImpStockMinMax: TAction;
    AEmpresasChile: TAction;
    AIncidenciasMarcajes: TAction;
    ASIIConfCorreos: TAction;
    AProTareasExternas: TAction;
    AGenerarFacturasElectronicasES: TAction;
    ASIITipoDTE: TAction;
    AEscandalloGarantias: TAction;
    AAsignacionGarantias: TAction;
    ANominasConceptosCHL: TAction;
    ANominasPlantilla: TAction;
    AJornada: TAction;
    ARecepcionFichaTecnica: TAction;
    AMotivosAbono: TAction;
    AModelo592: TAction;
    APrecioReposicion: TAction;
    AGamasPrecioReposicion: TAction;
    ADashboard: TAction;
    ABrevo: TAction;
    AAdjuntos: TAction;
    AImportarEscProduccion: TAction;
    AComoNosConocieron: TAction;
    AImportacionTarifasTyC: TAction;
    ASincronizacionSkrit: TAction;
    ASincronizacionColon: TAction;
    AECFVentas: TAction;
    ADGIIConfiguracionEnvio: TAction;
    APresentacionesHacienda: TAction;
    AEstadisticasSimples: TAction;
    ADiarioReparaciones: TAction;
    ASincronizacionTyC: TAction;
    AECFCompras: TAction;
    ASMSPubli: TAction;
    ADivilo: TAction;
    APresenciaFichar: TAction;
    AConfigServidoresCorreo: TAction;
    ASincronizacionHubSpot: TAction;
    AAgenda: TAction;
    ACaracteristicasArticulo: TAction;
    AEstadisticasKombat: TAction;
    Imagenes: TImageList;
    IM16: TImageList;
    PMAuxiliares: TPopupMenu;
    Ayuda1: TMenuItem;
    Ayuda2: TMenuItem;
    Acercade1: TMenuItem;
    ALAuxiliares: TActionList;
    procedure Acercade1Click(Sender: TObject);
    procedure BAuxiliaresClick(Sender: TObject);
    procedure BConectarClick(Sender: TObject);
    procedure BImportadorClick(Sender: TObject);
    procedure BMenuClick(Sender: TObject);
    procedure BModificarEntornoClick(Sender: TObject);
    procedure BSesionClick(Sender: TObject);
    procedure BSistemaClick(Sender: TObject);
    procedure BVentanasClick(Sender: TObject);
    procedure CBBaseDatosChange(Sender: TObject);
    procedure CBEjercicioChange(Sender: TObject);
    procedure CBEmpresaChange(Sender: TObject);
    procedure CBEstiloChange(Sender: TObject);
    procedure CBIdiomaChange(Sender: TObject);
    procedure EClaveKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PCMainMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure BGMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure CategoryPanelExpand(Sender: TObject);
    procedure MenuItemClick(Sender: TObject);
  private
    procedure WMUser(var Msg: TMessage); message WM_USER + 1;
    function MuestraLogin: TModalResult;
    procedure CrearMenuVentanas;
    procedure CerrarTodasLasVentanas;
  public
    // ---- API de FMain de Merge ----
    FiltroAccion: string;
    MostrarEnVentana: Boolean;
    EnlaceDatos: Variant;
    EnlaceModal: Boolean;
    EnlaceInstancias: Boolean;
    EnlaceCrea: Boolean;
    sourcecall: Boolean;
    sourcecallTer: Boolean;
    autproveedor, autcliente, autacreedor, autagente: Boolean;
    ComponentesPunto: TList;
    PanelAbierto: Integer;
    procedure EjecutaAccion(Accion: TAction; Filtro: string = '');
    procedure EjecutaAccionFiltro(Accion: TAction; Filtro: string = ''; Ventana: Boolean = False);
    function AbrirEnVentana(Sender: TObject): Boolean;
    procedure AddComponentePunto(Componente: TComponent);
    procedure DelComponentePunto(Componente: TComponent);
    procedure ActualizaMenu;
    procedure TWinControlMouseEnter(Sender: TObject);
    procedure TWinControlMouseLeave(Sender: TObject);
    procedure TWinControlMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    function IsAnotherInstanceRunning: Boolean;
    procedure CloseOtherInstance;
    procedure DateTimePickerKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DTPCloseUp(Sender: TObject);
    procedure DateTimePickerEnter(Sender: TObject);
  end;

var
  FMain: TFMain;
  FM: TFormManager;
  CambiandoEstilo: Boolean;
  FCustomProperties: TCustomProperties;

implementation

{$R *.dfm}

uses
  UEntorno, UDMMain, UUtiles, ULog, UFMLogin, UFMAcerca, UModulos, {IDIOMA_CODE} gnugettext {IDIOMA_CODE}, UMensajesDeError, UFMImportador;

function NombreValido(const S: string): string;
var
  C: Char;
begin
  Result := '';
  for C := Low(Char) to Low(Char) do ;
  for var k := 1 to Length(S) do
    if CharInSet(S[k], ['A'..'Z', 'a'..'z', '0'..'9', '_']) then
      Result := Result + S[k];
end;

procedure TFMain.EjecutaAccion(Accion: TAction; Filtro: string = '');
begin
  // Igual que en Merge: el formulario lee FiltroAccion al abrirse
  if Accion = nil then
    Exit;
  FiltroAccion := Filtro;
  Accion.Execute;
end;

procedure TFMain.EjecutaAccionFiltro(Accion: TAction; Filtro: string = ''; Ventana: Boolean = False);
begin
  // Estilo MaxFactu: filtro + abrir en ventana (True) o pestaña (False)
  if Accion = nil then
    Exit;
  FiltroAccion := Filtro;
  MostrarEnVentana := Ventana;
  try
    Accion.Execute;
  finally
    FiltroAccion := '';
    MostrarEnVentana := False;
  end;
end;

function TFMain.AbrirEnVentana(Sender: TObject): Boolean;
begin
  // Clic en el icono del menú -> ventana; en el nombre -> pestaña (igual que MaxFactu)
  Result := MostrarEnVentana or EnlaceModal;
  if (Sender is TAction) and (TAction(Sender).ActionComponent is TButtonGroup) then
    Result := Result or TButtonGroup(TAction(Sender).ActionComponent).Items[0].GetVentana;
end;

procedure TFMain.AddComponentePunto(Componente: TComponent);
begin
  if ComponentesPunto.IndexOf(Componente) = -1 then
    ComponentesPunto.Add(Componente);
end;

procedure TFMain.DelComponentePunto(Componente: TComponent);
begin
  ComponentesPunto.Remove(Componente);
end;


procedure TFMain.FormCreate(Sender: TObject);
var
  StileName: string;
begin
  CambiandoEstilo := False;
  if IsAnotherInstanceRunning then
    CloseOtherInstance;
  Log('FMain.FormCreate');
  FiltroAccion := '';
  ComponentesPunto := TList.Create;
  with Entorno do
  begin
    NombrePrograma := 'Merge';
    // Conexion
    BaseDeDatos := LeeDatoIni('Conexion', 'BaseDeDatos', '');
    CBBaseDatos.Text := LeeDatoIni('Conexion', 'BaseDeDatos', '');
    UsuarioBD := LeeDatoIni('Conexion', 'UsuarioBD', '');
    EUsuarioBD.Text := UsuarioBD;
    ClaveBD := LeeDatoIni('Conexion', 'ClaveBD', '');
    if (ClaveBD = '') then
      ClaveBD := LeeDatoIni('Conexion', 'ClaveBDSinCodificar', '')
    else
      ClaveBD := DescodificaClave(Entorno.ClaveBD);
    EClaveBD.Text := ClaveBD;
    RolBD := LeeDatoIni('Conexion', 'RolBD', '');
    ERolBD.Text := RolBD;
    VersionFB := LeeDatoIni('Conexion', 'VersionFB', '');
    CBVersionFB.Text := VersionFB;
    // Sesion
    Usuario := LeeDatoIni('Sesion', 'Usuario', '');
    EUsuario.Text := Usuario;
    EClave.Text := '';
    // Entorno
    Idioma := LeeDatoIni('Entorno', 'Idioma', '');
    Estilo := LeeDatoIni('Entorno', 'Estilo', '');
    Moneda := LeeDatoIni('Entorno', 'Moneda', '');
    FM := TFormManager.Create;
  end;
  Self.Caption := Entorno.NombrePrograma;
  CBEstilo.Items.Clear;
  for StileName in TStyleManager.StyleNames do
    CBEstilo.Items.Add(StileName);
  if Entorno.Estilo > '' then
    CBEstilo.Text := Entorno.Estilo;
  PanelAbierto := -1;
  // Módulos de Merge ya convertidos: su acción del menú abre el formulario (UModulos)
  AsignaModulos(Self);
end;

procedure TFMain.ActualizaMenu;
var
  i, aGroupIndex: Integer;
  Categorias: TStringList;
  CP: TCategoryPanel;
  BG: TButtonGroup;
begin
  SplitViewMenu.Close;

  if (Entorno.Entrada = 0) then
  begin
    with CBEmpresa do
    begin
      ItemIndex := -1;
      Items.Clear;
      Text := '';
    end;

    with CBEjercicio do
    begin
      ItemIndex := -1;
      Items.Clear;
      Text := '';
    end;

    with CBCanal do
    begin
      ItemIndex := -1;
      Items.Clear;
      Text := '';
    end;

    with CBSerie do
    begin
      ItemIndex := -1;
      Items.Clear;
      Text := '';
    end;

    Self.Caption := Entorno.NombrePrograma;

    // Elimino paneles de menu
    for i := CPGMenu.Panels.Count - 1 downto 0 do
    begin
      CP := TCategoryPanel(CPGMenu.Panels[i]);
      CPGMenu.Panels.Delete(i);
      CP.Free;
    end;
  end
  else
  begin
    i := DMMain.RellenaEmpresas(CBEmpresa.Items, False);
    if CBEmpresa.ItemIndex = -1 then
      CBEmpresa.ItemIndex := i;

    i := DMMain.RellenaEjercicios(CBEjercicio.Items, False);
    if CBEjercicio.ItemIndex = -1 then
      CBEjercicio.ItemIndex := i;

    i := DMMain.RellenaCanales(CBCanal.Items, False);
    if CBCanal.ItemIndex = -1 then
      CBCanal.ItemIndex := i;

    i := DMMain.RellenaSeries(CBSerie.Items, False);
    if CBSerie.ItemIndex = -1 then
      CBSerie.ItemIndex := i;

    Self.Caption := format('%s (%d-%d) - %s', [Entorno.NombrePrograma, Entorno.Empresa, Entorno.Ejercicio,
      CBEmpresa.Text]);

    // Elimino paneles de menu
    for i := CPGMenu.Panels.Count - 1 downto 0 do
    begin
      CP := TCategoryPanel(CPGMenu.Panels[i]);
      CPGMenu.Panels.Delete(i);
      CP.Free;
    end;

    // Creo paneles de menu: una categoría por panel, en el orden de las acciones.
    // Solo se muestran las acciones de los módulos ya convertidos (tienen OnExecute).
    Categorias := TStringList.Create;
    try
      for i := 0 to ALMain.ActionCount - 1 do
        if Assigned(ALMain.Actions[i].OnExecute) and (Categorias.IndexOf(ALMain.Actions[i].Category) < 0) then
          Categorias.Add(ALMain.Actions[i].Category);
      for aGroupIndex := 0 to Categorias.Count - 1 do
      begin
        CP := TCategoryPanel(CPGMenu.CreatePanel(CPGMenu.Owner));
        CP.Caption := Categorias[aGroupIndex];
        CP.Name := 'CP' + NombreValido(Categorias[aGroupIndex]);
        CP.Tag := aGroupIndex + 1;
        CP.ClientHeight := 0;
        CP.OnExpand := CategoryPanelExpand;
        BG := TButtonGroup.Create(CP.Owner);
        BG.Parent := CP;
        BG.Name := 'BG' + NombreValido(Categorias[aGroupIndex]);
        BG.Tag := aGroupIndex + 1;
        BG.Align := alClient;
        BG.ButtonHeight := 32;
        BG.ButtonOptions := [gboFullSize, gboShowCaptions];
        BG.BorderStyle := bsNone;
        BG.Images := IM16;
        BG.OnMouseDown := BGMouseDown;
        for i := 0 to ALMain.ActionCount - 1 do
          if Assigned(ALMain.Actions[i].OnExecute) and (ALMain.Actions[i].Category = Categorias[aGroupIndex]) then
            with BG.Items.Add do
            begin
              Action := ALMain.Actions[i];
              ImageIndex := TAction(ALMain.Actions[i]).ImageIndex;
            end;
        CP.ClientHeight := (BG.Items.Count * BG.ButtonHeight) + 2;
        CP.Collapsed := True;
      end;
    finally
      Categorias.Free;
    end;
  end;

  SplitViewMenu.Open;

end;

procedure TFMain.BMenuClick(Sender: TObject);
begin
  if SplitViewMenu.Opened then
    SplitViewMenu.Close
  else
    SplitViewMenu.Open;
  FMain.FormResize(FMain);
end;

procedure TFMain.FormShow(Sender: TObject);
begin
  if not CambiandoEstilo then
  begin
    if (Entorno.BaseDeDatos <> '') then
      BConectar.Click;

    // CPSistema.ClientHeight := PNLEstilo.Height + PNLIdioma.Height + PNLUsuario.Height + PNLSesion.Height +
    // PNLConexion.Height;

    if (CBIdioma.Items.Count > 0) then
    begin
      PNLIdioma.Visible := False;
      // CPSistema.ClientHeight := CPSistema.ClientHeight - PNLIdioma.Height;
    end;

    if DMMain.BDConectada then
      EClave.SetFocus
    else
    begin
      PNLUsuario.Enabled := False;
      PNLSesion.Enabled := False;
      SplitViewSistema.Opened := True;
    end;

    PostMessage(Handle, WM_USER + 1, 0, 0); // Aseguro que termine de cargar el FMain

    StatusBar1.Panels[0].Text := 'Merge (Delphi 13)';
    CambiandoEstilo := False;
  end;

end;

procedure TFMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 // Application.Terminate; //todo: da error al cerrar todas las ventanas abiertas, revisar esto, quitar el terminate
  Action := caFree;
end;

procedure TFMain.FormResize(Sender: TObject);
begin
  { if PCMain.PageCount > 0 then
    if PCMain.Pages[PCMain.ActivePageIndex].ControlCount > 0 then
    for var I := 0 to PCMain.Pages[PCMain.ActivePageIndex].ControlCount - 1 do
    if PCMain.Pages[PCMain.ActivePageIndex].Controls[I] is TForm then
    (PCMain.Pages[PCMain.ActivePageIndex].Controls[I] as TForm).Width := FMain.Width; }
end;

// **********************************************************************

procedure TFMain.WMUser(var Msg: TMessage);
begin
  if DMMain.BDConectada then
    if (MuestraLogin = mrCancel) then
    begin
      { TODO : Aqui debería abrir el panel de configuracion de conexion-sesion-usuario. }
      Application.Terminate
    end
    else
    begin
      if DMMain.ValidaUsuario(Entorno.Usuario, Entorno.Password) then
       begin
        EUsuario.Text := Entorno.Usuario;
        EClave.Text := Entorno.Password;
        BSesionClick(BSesion);
       end
      else
       begin
        MuestraMensaje('Usuario','Credenciales de Entra Inválidas ', '', 'Aceptar', 0);
        WMUser(Msg);
       end;
    end;
end;

function TFMain.MuestraLogin: TModalResult;
var
  // Resultado: TModalResult;
  FMLogin: TFMLogin;
  F: TForm;
begin
  FMLogin := TFMLogin.Create(nil);
  with FMLogin do
  begin
    try
      F := TForm.Create(nil);
      with F do
      begin
        AlphaBlend := True;
        AlphaBlendValue := 200;
        Color := clBlack;
        WindowState := wsMaximized;
        BorderStyle := bsNone;
        Show;
      end;

      Result := FMLogin.ShowModal;
    finally
      FreeAndNil(F);
    end;
  end;
end;

procedure TFMain.PCMainMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  TabIndex: Integer;
begin
  if Button = mbLeft then
  begin
    if ssDouble in Shift then
    begin
      TabIndex := PCMain.IndexOfTabAt(X, Y);
      if TabIndex <> -1 then
      begin
        if MuestraMensaje(format('Cerrar %s', [PCMain.Pages[TabIndex].Caption]),
          format('Esta seguro que desea cerrar %s?', [PCMain.Pages[TabIndex].Caption]), 'Cancelar', 'Aceptar', 0) = mrok
        then
        begin
          if (PCMain.Pages[TabIndex].ControlCount > 0) and (PCMain.Pages[TabIndex].Controls[0] is TForm) then
            TForm(PCMain.Pages[TabIndex].Controls[0]).Close
          else
          begin
            FM.DeleteForm(FM.GetFormByName(PCMain.Pages[TabIndex].Name));
            PCMain.Pages[TabIndex].Free;
          end;
        end;
      end;
    end;
  end;
end;

procedure TFMain.BAuxiliaresClick(Sender: TObject);
begin
  // Mostrar el PopupMenu justo debajo del botón
  BAuxiliares.PopupMenu.Popup(BAuxiliares.ClientToScreen(Point(0, BAuxiliares.Height)).X,
    BAuxiliares.ClientToScreen(Point(0, BAuxiliares.Height)).Y);
end;

procedure TFMain.BConectarClick(Sender: TObject);
begin
  if Assigned(DMMain) then
  begin
    if (DMMain.BDConectada) then
    begin
      CierraForms;

      // Cierro sesion
      if (Entorno.Entrada <> 0) then
        BSesion.Click;

      DMMain.Desconectar;
      BConectar.Caption := 'Conectar';
      PNLUsuario.Enabled := False;
      PNLSesion.Enabled := False;
    end
    else
    begin
      if (Trim(CBBaseDatos.Text) > '') then
        try
          Entorno.BaseDeDatos := CBBaseDatos.Text;
          Entorno.UsuarioBD := EUsuarioBD.Text;
          Entorno.ClaveBD := EClaveBD.Text;
          Entorno.RolBD := ERolBD.Text;
          Entorno.VersionFB := CBVersionFB.Text;
          Entorno.Tercero := 1;

          DMMain.Conectar;

          BConectar.Caption := 'Desconectar';

          EscribeDatoIni('Conexion', 'BaseDeDatos', CBBaseDatos.Text);
          EscribeDatoIni('Conexion', 'UsuarioBD', EUsuarioBD.Text);
          EscribeDatoIni('Conexion', 'ClaveBD', CodificaClave(EClaveBD.Text));
          EscribeDatoIni('Conexion', 'RolBD', ERolBD.Text);
          EscribeDatoIni('Conexion', 'VersionFB', CBVersionFB.Text);

          PNLUsuario.Enabled := True;
          PNLSesion.Enabled := (Entorno.Entrada > 0);
        except
          {
            on e: exception do
            ShowMessage('Error al conectar la base de datos' + #13#10 + e.Message);
          }
        end;
    end;
  end;
end;

procedure TFMain.BModificarEntornoClick(Sender: TObject);
var
  s: string;
begin
  // Se debe elegir un Empresa+Ejercicio+Canal
  if (CBEmpresa.ItemIndex >= 0) and (CBEjercicio.ItemIndex >= 0) and (CBCanal.ItemIndex >= 0) then
  begin
    // Si cambia Empresa, Ejercicio o Canal cierro todos los formularios
    if (Entorno.Empresa <> Integer(CBEmpresa.Items.Objects[CBEmpresa.ItemIndex])) or
      (Entorno.Ejercicio <> Integer(CBEjercicio.Items.Objects[CBEjercicio.ItemIndex])) or
      (Entorno.Canal <> Integer(CBCanal.Items.Objects[CBCanal.ItemIndex])) then
      CierraForms;

    DMMain.RegistraSalida;
    DMMain.RegistraEntrada;

    Entorno.Empresa := Integer(CBEmpresa.Items.Objects[CBEmpresa.ItemIndex]);
    Entorno.Ejercicio := Integer(CBEjercicio.Items.Objects[CBEjercicio.ItemIndex]);
    Entorno.Canal := Integer(CBCanal.Items.Objects[CBCanal.ItemIndex]);
    Entorno.FechaTrab := DTPFechaTrabajo.DateTime;


    if (CBSerie.ItemIndex < 0) then
      Entorno.Serie := ''
    else
    begin
      s := CBSerie.Items[CBSerie.ItemIndex];
      Entorno.Serie := Copy(s, 1, Pos(' ', s) - 1);
    end;

    DMMain.ActualizaDatosUltimoLogin;

    ActualizaMenu;
  end;
end;

procedure TFMain.BSesionClick(Sender: TObject);
begin
  if (Entorno.Entrada = 0) then
  begin
    DMMain.Login(EUsuario.Text, EClave.Text);

    if (Entorno.Entrada <> 0) then
    begin
      BSesion.Caption := 'Finalizar Sesion ' + IntToStr(Entorno.Entrada);
      PNLSesion.Enabled := True;
    end;
  end
  else
  begin
    CierraForms;
    DMMain.Logout;
    BSesion.Caption := 'Iniciar Sesion';
    PNLSesion.Enabled := False;
  end;

  ActualizaMenu;
  CBEmpresaChange(Sender);
  // CPSistema.Collapsed := True;
end;

procedure TFMain.BSistemaClick(Sender: TObject);
begin
  if SplitViewSistema.Opened then
    SplitViewSistema.Close
  else
    SplitViewSistema.Open;
  FMain.FormResize(FMain);
end;

procedure TFMain.BVentanasClick(Sender: TObject);
begin
  CrearMenuVentanas;
end;

procedure TFMain.CrearMenuVentanas;
var
  MenuItem: TMenuItem;
  i: Integer;
  Cantidad: Integer;
begin
  Cantidad := 0;
  // Crear el PopupMenu si no existe
  if not Assigned(BVentanas.PopupMenu) then
    BVentanas.PopupMenu := TPopupMenu.Create(Self);

  BVentanas.PopupMenu.Items.Clear;

  // Agregar ventanas al PopupMenu
  // (excepto FMain y las que esten en TabSheet)
  for i := Screen.FormCount - 1 downto 0 do
    if (Screen.Forms[i] <> FMain) and not(Screen.Forms[i].Parent is TTabSheet) then
      if Screen.Forms[i].Caption <> '' then
      begin
        MenuItem := TMenuItem.Create(BVentanas.PopupMenu);
        with MenuItem do
        begin
          Caption := Screen.Forms[i].Caption;
          OnClick := MenuItemClick;
          Tag := Screen.Forms[i].Handle;
          Inc(Cantidad);
        end;

        BVentanas.PopupMenu.Items.Add(MenuItem);
      end;

  // Agrego item "-------"
  MenuItem := TMenuItem.Create(BVentanas.PopupMenu);
  with MenuItem do
  begin
    Caption := '-';
    MenuItem.Tag := 0;
  end;
  BVentanas.PopupMenu.Items.Add(MenuItem);

  // Agrego item "Cerrar Todas"
  MenuItem := TMenuItem.Create(BVentanas.PopupMenu);
  with MenuItem do
  begin
    Caption := 'Cerrar Todas';
    MenuItem.OnClick := MenuItemClick;
    MenuItem.Tag := 0;
    Enabled := Cantidad > 0;
  end;
  BVentanas.PopupMenu.Items.Add(MenuItem);

  // Mostrar el PopupMenu justo debajo del botón
  BVentanas.PopupMenu.Popup(BVentanas.ClientToScreen(Point(0, BVentanas.Height)).X,
    BVentanas.ClientToScreen(Point(0, BVentanas.Height)).Y);

end;

procedure TFMain.CerrarTodasLasVentanas;
begin
    for var i := Screen.FormCount - 1 downto 0 do
    begin
      // No utilizo CierraForms porque cerraria todos los TabSheets
      // CierraForms;
       if Screen.Forms[i] <> Application.MainForm then
      Screen.Forms[i].Close;
     // if (Screen.Forms[i] <> FMain) and not(Screen.Forms[i].Parent is TTabSheet) then
      //  Screen.Forms[i].Close;
    end
end;

procedure TFMain.MenuItemClick(Sender: TObject);
var
  aForm: TForm;
  i: Integer;
begin
  if (Sender as TMenuItem).Tag = 0 then
  begin
    CerrarTodasLasVentanas;
  end
  else
  begin
    // Activo la ventana seleccionada
    aForm := DameFormByHandle((Sender as TMenuItem).Tag);
    if Assigned(aForm) then
      aForm.Show;
  end;
end;

procedure TFMain.CBBaseDatosChange(Sender: TObject);
begin
  CBBaseDatos.Hint := CBBaseDatos.Text;
end;

procedure TFMain.CBEjercicioChange(Sender: TObject);
var
  Apertura, Cierre: TDateTime;
begin
  if (CBEjercicio.ItemIndex < 0) then
  begin
    if (CBEjercicio.Items.Count > 0) then
    begin
      CBEjercicio.ItemIndex := 0;
      CBEjercicio.Text := CBEjercicio.Items[CBEjercicio.ItemIndex];
    end;
  end;

  if (CBEjercicio.ItemIndex >= 0) then
    Entorno.Ejercicio := Integer(CBEjercicio.Items.Objects[CBEjercicio.ItemIndex]);

  // Si la fecha actual no esta entre APERTURA y CIERRE, tomo la fecha CIERRE.
  DameMinMax('EJE', Apertura, Cierre, Entorno.Empresa, Entorno.Ejercicio);

  if ((Apertura <= Today) and (Cierre >= Today)) then
    Entorno.FechaTrab := Today
  else if (Cierre < Today) then
    Entorno.FechaTrab := Cierre
  else if (Apertura > Today) then
    Entorno.FechaTrab := Apertura;

  DTPFechaTrabajo.Date := Entorno.FechaTrab;

  ActualizaMenu;
end;

procedure TFMain.CBEmpresaChange(Sender: TObject);
begin
  if (CBEmpresa.ItemIndex < 0) then
  begin
    if (CBEmpresa.Items.Count > 0) then
    begin
      CBEmpresa.ItemIndex := 0;
      CBEmpresa.Text := CBEmpresa.Items[CBEmpresa.ItemIndex];
    end;
  end;

  if (CBEmpresa.ItemIndex >= 0) then
    Entorno.Empresa := Integer(CBEmpresa.Items.Objects[CBEmpresa.ItemIndex]);

  DMMain.ModificaEntornoSegunUsuarioEmpesa;

  // Relleno combos segun nueva empresa
  ActualizaMenu;

  CBEjercicioChange(Sender);
end;

procedure TFMain.CBEstiloChange(Sender: TObject);
begin
  if (CBEstilo.ItemIndex < CBEstilo.Items.Count) and (CBEstilo.ItemIndex >= 0) and
    (TStyleManager.ActiveStyle.Name <> CBEstilo.Items[CBEstilo.ItemIndex]) then
  begin
    CambiandoEstilo := True;
    TStyleManager.TrySetStyle(CBEstilo.Items[CBEstilo.ItemIndex]);
    EscribeDatoIni('Entorno', 'Estilo', CBEstilo.Items[CBEstilo.ItemIndex]);
  end;
end;

procedure TFMain.CBIdiomaChange(Sender: TObject);
begin
  if (CBIdioma.ItemIndex < CBIdioma.Items.Count) and (CBIdioma.ItemIndex >= 0) then
  begin
    EscribeDatoIni('Entorno', 'Idioma', CBIdioma.Items[CBIdioma.ItemIndex]);
    if Entorno.Idioma = 'CAS' then
      UseLanguage('es');
  end;
end;

procedure TFMain.TWinControlMouseEnter(Sender: TObject);
begin
  TWinControl(Sender).Cursor := crHand;
end;

procedure TFMain.TWinControlMouseLeave(Sender: TObject);
begin
  TWinControl(Sender).Cursor := crDefault;
end;

procedure TFMain.TWinControlMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TDBEdit(Sender).SelLength := 0;
end;

procedure TFMain.CategoryPanelExpand(Sender: TObject);
var
  i: Integer;
begin
  if Sender is TCategoryPanel then
  begin
    for i := 0 to CPGMenu.Panels.Count - 1 do
      if (Sender <> CPGMenu.Panels[i]) then
      begin
        TCategoryPanel(CPGMenu.Panels[i]).Collapse;
      end;
  end;
end;

procedure TFMain.EClaveKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    BSesion.Click;
end;

procedure TFMain.Acercade1Click(Sender: TObject);
var f:TFMAcerca;
begin
   try
     f:=TFMAcerca.Create(nil);
     f.showmodal;
   finally
     f.free;
   end;
end;

procedure TFMain.BGMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  // Si X < 25 es un click arriba del icono del boton
  (Sender as TButtonGroup).Items.Items[(Sender as TButtonGroup).IndexOfButtonAt(X, Y)].SetVentana(X < 25)
end;

// Crea una instancia de una clase cualquiera partiendo de su nombre "Unit.NombreClase"

function TGrpButtonItemHelper.GetCustomProperties: TCustomProperties;
begin
  if not Assigned(FCustomProperties) then
    FCustomProperties := TCustomProperties.Create;
  Result := FCustomProperties;
end;

procedure TGrpButtonItemHelper.SetVentana(const Value: Boolean);
begin
  CustomProperties.SetProperty('Ventana', Value);
end;

function TGrpButtonItemHelper.GetVentana: Boolean;
begin
  Result := CustomProperties.GetProperty('Ventana');
end;

// ******* End del TGrpButtonItemHelper *****************************************************

procedure TFMain.DateTimePickerKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_BACK) or (Key = VK_DELETE) then // Backspace o Delete
  begin
    try
      (Sender as TDateTimePicker).DateTime := 0; // Fecha cero (30/12/1899)
      (Sender as TDateTimePicker).format := ' '; // Formato en blanco
      (Sender as TDateTimePicker).InternalUpdateData;
    finally
    end;
  end;
end;

procedure TFMain.DTPCloseUp(Sender: TObject);
begin
  (Sender as TDateTimePicker).InternalUpdateData;
end;

procedure TFMain.DateTimePickerEnter(Sender: TObject);
begin
  if (Sender as TDateTimePicker).DateTime = 0 then
  begin
    (Sender as TDateTimePicker).format := 'dd/MM/yyyy ';
    (Sender as TDateTimePicker).DateTime := Now;
  end;
end;

function TFMain.IsAnotherInstanceRunning: Boolean;
var
  WindowHandle: HWND;
begin
  // Buscar una ventana con el mismo título de la aplicación
  WindowHandle := FindWindow(nil, PChar(Application.Title));
  Result := (WindowHandle <> 0) and (WindowHandle <> Application.Handle) and (WindowHandle <> Self.Handle);
end;

procedure TFMain.CloseOtherInstance;
var
  WindowHandle: HWND;
begin
  // Buscar una ventana con el mismo título de la aplicación
  WindowHandle := FindWindow(nil, PChar(Application.Title));
  if (WindowHandle <> 0) and (WindowHandle <> Application.Handle) and (WindowHandle <> Self.Handle) then
  begin
    // Enviar el mensaje WM_CLOSE para cerrar la otra instancia
    PostMessage(WindowHandle, WM_CLOSE, 0, 0);
  end;
end;

procedure TFMain.BImportadorClick(Sender: TObject);
begin
  // Importador de módulos y listados de Merge (ventana independiente)
  if FMImportador = nil then
    FMImportador := TFMImportador.Create(Application);
  FMImportador.Show;
  FMImportador.BringToFront;
end;

end.
