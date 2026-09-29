# Merge13 con importador de Merge en Delphi

El importador está **dentro de Merge13**: botón pequeño **Importador** en la barra superior (el cuarto por la
izquierda, junto a Auxiliares). Usa la conexión abierta de Merge13, así que los tipos de campo los decide FireDAC
con vuestra base de datos, y comprueba con RTTI las propiedades y eventos de cada componente de Delphi 13.

## Cómo se usa
1. Compilar y abrir `Merge13\Merge13.dpr` (o `compila.bat`). Conectar a la base de datos (panel de sistema).
2. Pulsar **Importador**.
3. **Carpeta de Merge (D6)**: la raíz de las fuentes de Merge (la que contiene `UFMain.pas`, `Almacenes\`...).
   **Proyecto Merge13**: la carpeta con `Merge13.dpr` (se rellena sola si el exe está en `_exe`).
4. Pestaña **Módulos**: aparece el árbol de carpetas de Merge con sus formularios (`UFMFamilias — Familias`...).
   Marcar los que se quieran (marcar una carpeta marca todo lo que contiene) y **Importar marcados**.
5. Cerrar Merge13, **compilar** y volver a abrir: el módulo aparece en su grupo del menú (Almacenes > Familias).
6. Pestaña **Listados (FastReport)**: carpeta de listados de Merge y carpeta destino; marcar y **Convertir marcados**.

Se puede importar el mismo módulo las veces que haga falta: se regenera sin duplicar nada.

## Qué hace al importar un módulo
- Formulario: misma unit, clase y base (`TFPEdit`...). Componentes de Merge -> VCL estándar con sus propiedades y
  eventos válidos en Delphi 13 (RTTI); EditFind -> `TDBEdit` + `TBuscadorCampo` (F3 / doble clic).
- Módulo de datos: FIB -> FireDAC (consultas, SQL de actualización, transacciones `TLocal`/`TUpdate`, parámetros
  guardados en el DFM, tipos de campo reales).
- Código: reglas de conversión (ExecQuery, ByName, AutoTrans, FormatSettings, parámetros `?X`...).
- Lo deja en `Merge\<carpeta de Merge>\`, las dependencias sin importar en `Pendientes\` (interfaz real, cuerpo
  vacío), `UUtilesMerge` y utilidades en `Conversion\`, registra la acción del menú y actualiza `Merge13.dpr`.
- Informe en `Conversion\informes\informe_<módulo>.txt`.

## Listados
- `.fr3` (FastReport 3.19 de Merge): se abren y se guardan con la FastReport actual (`TfrxHYReport` -> `TfrxReport`).
  Las consultas FIB dentro del informe (5 de 212) necesitan los componentes FireDAC de FastReport: compilar con
  la directiva `FR_FIREDAC`; sin ella se retiran y se avisa.
- `.frf` (FastReport 2, 645 listados): usa el conversor oficial `frx2xto30` de FastReport; compilar con la directiva
  `FR2` (necesita TeeChart VCL instalado). No lo he podido probar: mis librerías no traen TeeChart VCL.
- `.hyr` / `.hym` (matricial y correo de Merge): no son FastReport; se informan.

## Configuración (carpeta `Importador\`)
- `equivalencias.txt`: nombres de Merge -> Merge13 (`Entorno.Usuario => Entorno.IdUsuario`...).
- `m13_pendientes.txt`: units que se dejan en Pendientes aunque no tengan formulario (p.ej. `UImagenes`).
- `units_componentes_merge.txt`: units de componentes de Merge que desaparecen de los `uses`.
- `framework\`: `UBuscadorCampo`, `UControlConcurrencia`, `UAuxMerge` (se copian a `Conversion\`).
- Código del importador: `UFMImportador` (ventana), `UImpConversor` (motor), `UImpReglas` (reglas y RTTI),
  `UImpDfm` (DFM), `UImpTexto` (texto), `UImpFR` (listados).

## Prueba realizada
Ver `pruebas\resultado.txt` y `pruebas\captura_importador.png`.
