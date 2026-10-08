# Proyecto Merge13 — Importador de Merge (Delphi 6) a Delphi 13

## Contexto del proyecto

Estoy en `C:\Delfos\Proyectos\Merge13`, un proyecto Delphi 13 con un 
esqueleto vacío cuyo único propósito es **importar formularios** de un 
proyecto Delphi 6 llamado "Merge" que se encuentra en 
`C:\Delfos\Proyectos\Merge`.

- **Punto de entrada**: el formulario `TFMImportador` en 
  `Importador\UFMImportador.pas`. El botón "Convertir marcados" 
  (`TFMImportador.BConvertirClick`) convierte los formularios 
  seleccionados de la carpeta de Merge (Delphi 6) a Delphi 13, y en el 
  proceso arrastra también el módulo de datos asociado a cada formulario.
- **Motor de conversión**: `Importador\UImpConversor.pas`, que usa 
  `UImpDfm`, `UImpReglas`, `UImpTexto` y `UImpFR`.
- **Estilo de units**: fíjate en cómo `UFMImportador` referencia 
  `UEntorno`, `UDMMain`, `UImpConversor`, `UImpFR` y `UImpDfm`. Ese es 
  el estilo que quiero mantener, sin añadir capas nuevas innecesarias.

---

## REGLA CRÍTICA — No crear units nuevas si ya existe una equivalente

**Esta es la primera regla y está por encima de cualquier otra.** Aplica 
SIEMPRE, sin excepciones.

Cuando el convertidor genere código nuevo que provenga del Merge de 
Delphi 6, debe colocarlo en las units **EXISTENTES** de Merge13 que ya 
cumplen esa función, **no en units nuevas con nombres parecidos**.

### Casos concretos a corregir en el código actual del convertidor

1. **NO generar `UUtilesMerge.pas`.**
   Las rutinas nuevas que provienen de la `UUtiles` de Merge deben ir a 
   la `UUtiles` de Merge13 (que ya existe).
   Afecta a: procedimiento `GeneraUUtilesMerge` en `UImpConversor.pas`, 
   y a cualquier `AnyadeUses` que mencione `'UUtilesMerge'`.

2. **NO generar `UAuxMerge.pas`.**
   Lo que provenga de funciones auxiliares de Merge y que hoy Merge13 
   tiene repartido en `UUtiles` / `UFMain` / `UDMMain` debe ir a la unit 
   existente que le corresponda por tema.
   Afecta a los `AnyadeUses(..., ['UAuxMerge'])` repartidos por 
   `ConviertePasUnit`, `ConviertePasDM` y `ConviertePasForm`.

3. **NO crear `UControlConcurrencia.pas`** si Merge13 ya tiene su propio 
   mecanismo de control de concurrencia. Verifica primero si existe; si 
   existe, escribe ahí.

4. **Lo mismo para `FMain` y `DMMain`**: si algo nuevo proviene del 
   `FMain` o del `DMMain` de Merge, va al `UFMain` / `UDMMain` de 
   Merge13, no a una unit nueva ni a una unit generada.

### Regla general para decidir dónde va cada cosa nueva

- Función/procedimiento/variable/tipo/constante que en Merge vivía en 
  `<UnitX>` de Merge → va a la `<UnitX>` equivalente de Merge13 si existe.
- Si la `<UnitX>` de Merge13 **no existe todavía**, ENTONCES sí se puede 
  crear, pero **avísame antes** y explica por qué no encaja en ninguna de 
  las existentes.
- **Nunca** dupliques una función que ya exista en Merge13 con otro 
  nombre distinto.

### Excepciones explícitas (no se importan de Delphi 6)

No vamos a importar de Delphi 6 nada relacionado con:
- `TControlEdit`
- `TPopUpTeclas`

Estos quedan obsoletos. No se importan y no llevan equivalentes.

---

## Ficheros de referencia

Antes de contestar cualquier pregunta sobre el convertidor, si no los 
tienes ya en contexto, léelos:

**Formulario importador tal como está hoy en Merge13:**
- `C:\Delfos\Proyectos\Merge13\Importador\UFMImportador.pas`
- `C:\Delfos\Proyectos\Merge13\Importador\UFMImportador.dfm`

**Ejemplo de par formulario + módulo de datos en el Merge original (Delphi 6)** 
que el convertidor debe saber transformar:
- `C:\Delfos\Proyectos\Merge\Almacenes\UFMFamilias.pas`
- `C:\Delfos\Proyectos\Merge\Almacenes\UFMFamilias.dfm`
- `C:\Delfos\Proyectos\Merge\Almacenes\UDMFamilias.pas`
- `C:\Delfos\Proyectos\Merge\Almacenes\UDMFamilias.dfm`

---

## Reglas de Navegación de Código Delphi (Ahorro de Tokens)

**OBJETIVO**: Minimizar la lectura de archivos completos. Usa siempre las 
herramientas especializadas.

### 1. Búsqueda de Símbolos (delphi-lookup)

**CRÍTICO**: Para encontrar DÓNDE se define un símbolo Pascal:
1. **PRIMERO**: Usa `delphi-lookup.exe`
2. **FALLBACK**: Usa Grep solo si delphi-lookup no devuelve resultados 
   o falla por "database is locked".

| Situación | Comando |
|---|---|
| Error "Undeclared identifier: X" | `delphi-lookup.exe "X" -n 5` |
| Buscar definición de función/tipo | `delphi-lookup.exe "SymbolName" -n 5` |

### 2. Estructura de Archivos (LSP)

**CRÍTICO**: Para entender la estructura de un archivo `.pas`:
1. **PRIMERO**: Usa el LSP (`documentSymbol`).
2. **NUNCA** leas un archivo `.pas` completo con `cat` o `Grep` si el LSP 
   puede darte la estructura.

| Situación | Herramienta LSP |
|---|---|
| Listar clases, métodos y propiedades | `documentSymbol` |
| Ver firma de un método | `hover` |

### 3. Flujo de Trabajo Recomendado

1. Localizar símbolo con `delphi-lookup.exe`.
2. Ver firma con LSP (`hover`).
3. Ver estructura con LSP (`documentSymbol`).
4. Solo entonces, leer el método específico si es necesario para editarlo.