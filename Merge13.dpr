program Merge13;

uses
  Vcl.Forms,
  System.SysUtils,
  System.Classes,
  UFMain in 'UFMain.pas' {FMain},
  UDMMain in 'UDMMain.pas' {DMMain: TDataModule},
  UEntorno in 'UEntorno.pas',
  UUtiles in 'UUtiles.pas',
  ULog in 'ULog.pas',
  UFormGest in 'UFormGest.pas',
  UModulos in 'UModulos.pas',
  UFPEditSinNavegador in 'UFPEditSinNavegador.pas' {FPEditSinNavegador},
  UFPEditSimple in 'UFPEditSimple.pas' {FPEditSimple},
  UFPEdit in 'UFPEdit.pas' {FPEdit},
  UFPEditDetalle in 'UFPEditDetalle.pas' {FPEditDetalle},
  UFMSplash in 'UFMSplash.pas' {FMSplash},
  UFMLogin in 'UFMLogin.pas' {FMLogin},
  UMensajesDeError in 'UMensajesDeError.pas',
  {MERGE2M13-INICIO} // units importadas de Merge (las mantiene merge2m13.py)
  UAuxMerge in 'Conversion\UAuxMerge.pas',
  UBuscadorCampo in 'Conversion\UBuscadorCampo.pas',
  UControlConcurrencia in 'Conversion\UControlConcurrencia.pas',
  UUtilesMerge in 'Conversion\UUtilesMerge.pas',
  UDMAdjunto in 'Pendientes\UDMAdjunto.pas',
  UDMLstArticulos in 'Pendientes\UDMLstArticulos.pas',
  UDMLstArticulosProv in 'Pendientes\UDMLstArticulosProv.pas',
  UDMLstEtiquetas in 'Pendientes\UDMLstEtiquetas.pas',
  UDMLstFamilias in 'Pendientes\UDMLstFamilias.pas',
  UDMPrestashop in 'Pendientes\UDMPrestashop.pas',
  UDMRFichasArticulos in 'Pendientes\UDMRFichasArticulos.pas',
  UDMSincronizacionTienda in 'Pendientes\UDMSincronizacionTienda.pas',
  UDMSincronizacionTiendaWoocommerce in 'Pendientes\UDMSincronizacionTiendaWoocommerce.pas',
  UDMStockTallas in 'Pendientes\UDMStockTallas.pas',
  UFBusca in 'Pendientes\UFBusca.pas',
  UFFiltra_Articulos_Agr in 'Pendientes\UFFiltra_Articulos_Agr.pas',
  UFMAdjunto in 'Pendientes\UFMAdjunto.pas',
  UFMCalculaStockMinMax in 'Pendientes\UFMCalculaStockMinMax.pas',
  UFMCodigoCliente in 'Pendientes\UFMCodigoCliente.pas',
  UFMCodigoProveedor in 'Pendientes\UFMCodigoProveedor.pas',
  UFMCondicionesVenta in 'Pendientes\UFMCondicionesVenta.pas',
  UFMControl_Lotes in 'Pendientes\UFMControl_Lotes.pas',
  UFMDocInfoStocks in 'Pendientes\UFMDocInfoStocks.pas',
  UFMGenerarCBs in 'Pendientes\UFMGenerarCBs.pas',
  UFMHistoricoPrecios in 'Pendientes\UFMHistoricoPrecios.pas',
  UFMHistoricoSerializacion in 'Pendientes\UFMHistoricoSerializacion.pas',
  UFMImprimirCodBarras in 'Pendientes\UFMImprimirCodBarras.pas',
  UFMListConfig in 'Pendientes\UFMListConfig.pas',
  UFMRecalculoStocks in 'Pendientes\UFMRecalculoStocks.pas',
  UFMRecalculoStocksTotales in 'Pendientes\UFMRecalculoStocksTotales.pas',
  UFMSeleccion in 'Pendientes\UFMSeleccion.pas',
  UFMSeleccionArticulo in 'Pendientes\UFMSeleccionArticulo.pas',
  UFMStockTallas in 'Pendientes\UFMStockTallas.pas',
  UFMUbicaArticulo in 'Pendientes\UFMUbicaArticulo.pas',
  UFMUnidadesExt in 'Pendientes\UFMUnidadesExt.pas',
  UFMVentasArt in 'Pendientes\UFMVentasArt.pas',
  UFMostrarImagen in 'Pendientes\UFMostrarImagen.pas',
  UFPEditListado in 'Pendientes\UFPEditListado.pas',
  UFPEditListadoSimple in 'Pendientes\UFPEditListadoSimple.pas',
  UFPregAgrupacionArt in 'Pendientes\UFPregAgrupacionArt.pas',
  UFPregArtCompleto in 'Pendientes\UFPregArtCompleto.pas',
  UFPregArtFamilias in 'Pendientes\UFPregArtFamilias.pas',
  UFPregCodArticulo in 'Pendientes\UFPregCodArticulo.pas',
  UFPregCodBarras in 'Pendientes\UFPregCodBarras.pas',
  UFPregEtiArticulosKri in 'Pendientes\UFPregEtiArticulosKri.pas',
  UFPregFichasArticulos in 'Pendientes\UFPregFichasArticulos.pas',
  UFSendCorreo in 'Pendientes\UFSendCorreo.pas',
  UFVerTercerosPorArticulo in 'Pendientes\UFVerTercerosPorArticulo.pas',
  UImagenes in 'Pendientes\UImagenes.pas',
  UProFMFicherosCliente in 'Pendientes\UProFMFicherosCliente.pas',
  UTiposPendientesMerge in 'Pendientes\UTiposPendientesMerge.pas',
  ZUFMArtArmazones in 'Pendientes\ZUFMArtArmazones.pas',
  ZUFMArtLonas in 'Pendientes\ZUFMArtLonas.pas',
  ZUFMArtToldos in 'Pendientes\ZUFMArtToldos.pas',
  UDMFamilias in 'Merge\Almacenes\UDMFamilias.pas' {DMFamilias: TDataModule},
  UFMFamilias in 'Merge\Almacenes\UFMFamilias.pas' {FMFamilias},
  UDMArticulos in 'Merge\UDMArticulos.pas' {DMArticulos: TDataModule},
  UDameDato in 'Merge\UDameDato.pas',
  UFMArticulos in 'Merge\UFMArticulos.pas' {CECaracteristicasPMEdit},
  UParam in 'Merge\UParam.pas',
  URecibeFicheros in 'Merge\URecibeFicheros.pas',
  URellenaLista in 'Merge\URellenaLista.pas',
  {MERGE2M13-FIN}
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Merge';
  UEntorno.CrearRegistroEntorno;
  Entorno.Estilo := LeeDatoIni('Entorno', 'Estilo', '');
  Application.CreateForm(TDMMain, DMMain);
  Application.CreateForm(TFMain, FMain);
  Application.Run;
  UEntorno.DestruirRegistroEntorno;
end.
