unit UMensajesDeError;

interface

uses
  System.SysUtils, FireDAC.Stan.Error, FireDAC.DApt,vcl.Dialogs;

type
  TFireDADErrorMessage = record
    ErrorCode: Integer;
    Category: (catFireDAC, catFirebird, catGeneric);
    Description: string;
    Suggestion: string;
  end;

// Obtiene un mensaje amigable para excepciones de FireDAC/Firebird
function GetFriendlyErrorMessage(AException: Exception): string;

// Obtiene mensaje para códigos de error específicos de FireDAC
function GetFireDACMessage(ACode: Integer): TFireDADErrorMessage;

// Versión sobrecargada para manejar directamente el código y mensaje original
function GetFriendlyErrorMessageByCode(ACode: Integer; const AOriginalMessage: string): string;

// Consulta Exceptions de Firebird
function DameNombreException(const AMessage: string): string;

function DameError(E: string): string;
procedure ManejarErrorFirebird(E: Exception; NombreCampo: string = '');
function TraducirErrorFirebird(ErrorMsg: string): string;

implementation
         uses UUtiles,UDMMain;

procedure ManejarErrorFirebird(E: Exception; NombreCampo: string = '');
var
  MensajeTrad: string;
begin
  MensajeTrad := TraducirErrorFirebird(E.Message);

  if MensajeTrad <> E.Message then
  begin
    // Es un error conocido, mostrar traducido
    MessageDlg(MensajeTrad, mtError, [mbOK], 0);
  end
  else
  begin
    // Error desconocido
    MessageDlg(
      'Error al procesar los datos:' + #13#10 +
      'Por favor, contacta con soporte técnico.' + #13#10#13#10 +
      'Detalles: ' + E.Message,
      mtError, [mbOK], 0);
  end;
end;

function TraducirErrorFirebird(ErrorMsg: string): string;
begin
  Result := ErrorMsg; // Por defecto, devolver el mismo mensaje

  // Errores de validación
  if Pos('validation error', ErrorMsg) > 0 then
  begin
    if Pos('ARTICULO', ErrorMsg) > 0 then
      Result := 'El código de artículo no cumple con el formato requerido.' + #13#10 +
                'Debe comenzar con números (ej: 00000SOPMS022)'
    else if Pos('FAMILIA', ErrorMsg) > 0 then
      Result := 'Error: La familia de artículos no es válida.'
    else if Pos('TIPO_IVA', ErrorMsg) > 0 then
      Result := 'Error: El tipo de IVA no es válido.'
    else
      Result := 'Error de validación: Los datos no cumplen con los requisitos del sistema.';
  end

  // Errores de restricción única
  else if Pos('UNIQUE constraint', ErrorMsg) > 0 then
  begin
    if Pos('ARTICULO', ErrorMsg) > 0 then
      Result := 'Este código de artículo ya existe en el sistema.' + #13#10 +
                'Por favor, utiliza un código diferente.'
    else if Pos('CODIGO_INTRA', ErrorMsg) > 0 then
      Result := 'Este código interno ya está asignado a otro artículo.'
    else
      Result := 'Error: Este valor ya existe en el sistema.';
  end

  // Errores de valores nulos
  else if Pos('NOT NULL constraint', ErrorMsg) > 0 then
  begin
    Result := 'Error: Algunos campos requeridos están vacíos.' + #13#10 +
              'Por favor, completa todos los campos obligatorios.';
  end

  // Errores de integridad referencial
  else if Pos('FOREIGN KEY constraint', ErrorMsg) > 0 then
  begin
    Result := 'Error: No se puede completar la operación porque hay dependencias en otros registros.' + #13#10 +
              'Verifica que todos los datos referenciados existan en el sistema.';
  end

  // Errores de trigger
  else if Pos('trigger', ErrorMsg) > 0 then
  begin
    Result := 'Error en las reglas de negocio: ' + #13#10 +
              'Los datos no cumplen con las validaciones requeridas.';
  end;
end;


function DameError(E: string): string;
begin
  Result := '';
  with DameQueryRO(nil,DMMain.DB) do
  begin
     try
        SQL.Text := 'SELECT  RDB$MESSAGE as error FROM RDB$EXCEPTIONS WHERE RDB$EXCEPTION_NAME = ' + QuotedStr(E) ;
        Open;
        Result := FieldByName('error').AsString;
     finally
        Free;
     end;
  end;
end;

function ExtractExceptionName(const AMessage: string): string;
var
  PosStart, PosEnd: Integer;
  Temp: string;
begin
  Result := '';
  PosStart := Pos('ERR_', UpperCase(AMessage));
  if PosStart > 0 then
  begin
    Temp := Copy(AMessage, PosStart, Length(AMessage) - PosStart + 1);
    PosEnd := 1;
    while (PosEnd <= Length(Temp)) and (Temp[PosEnd] in ['A'..'Z', '0'..'9', '_']) do
      Inc(PosEnd);
    Result := Copy(Temp, 1, PosEnd - 1);
  end;
end;

function GetRegisteredFirebirdError(const AExceptionName: string): string;
begin
  Result := DameError(AExceptionName);
end;


function DameNombreException(const AMessage: string): string;
var
  PosStart, PosEnd: Integer;
  Temp: string;
begin
  Result := '';
  PosStart := Pos('ERR_', UpperCase(AMessage));  // Busca 'ERR_' (insensible a case)
  if PosStart > 0 then
  begin
    Temp := Copy(AMessage, PosStart, Length(AMessage) - PosStart + 1);
    PosEnd := 1;
    while (PosEnd <= Length(Temp)) and (Temp[PosEnd] in ['A'..'Z', '0'..'9', '_']) do
      Inc(PosEnd);
    Result := Copy(Temp, 1, PosEnd - 1);  // Extrae hasta fin de palabra (letras, números, _)
  end;
end;


function GetFireDACMessage(ACode: Integer): TFireDADErrorMessage;
begin
  Result.ErrorCode := ACode;
  Result.Category := catFireDAC;

  case ACode of
    312, 400: // Update afectó 0 filas
      begin
        Result.Description := 'El registro no pudo ser actualizado porque no se encontró en la base de datos.';
        Result.Suggestion := 'Posibles causas:'#13#10 +
                            '• El registro fue eliminado o modificado por otro usuario'#13#10 +
                            '• La tabla no tiene una PRIMARY KEY definida'#13#10 +
                            '• Los valores de clave han cambiado desde la lectura'#13#10#13#10 +
                            'Recomendación: Recargue los datos e intente nuevamente.';
      end;

    100: // Error de conexión
      begin
        Result.Description := 'Error de conexión con la base de datos.';
        Result.Suggestion := 'Verifique:'#13#10 +
                            '• La conexión de red'#13#10 +
                            '• El servicio de Firebird está ejecutándose'#13#10 +
                            '• Las credenciales de acceso son correctas';
      end;

    200: // Error de ejecución de comando
      begin
        Result.Description := 'Error al ejecutar el comando SQL.';
        Result.Suggestion := 'Revise la sintaxis SQL y los permisos del usuario.';
      end;

    -500: // Error de fetch/recuperación de datos
      begin
        Result.Description := 'Error al recuperar los datos del servidor.';
        Result.Suggestion := 'Verifique la integridad de la consulta y la conexión.';
      end;

    else
      begin
        Result.Category := catGeneric;
        Result.Description := Format('Error de FireDAC [%d].', [ACode]);
        Result.Suggestion := 'Consulte el log técnico o contacte al administrador.';
      end;
  end;
end;

function GetFriendlyErrorMessageByCode(ACode: Integer; const AOriginalMessage: string): string;
var
  MsgInfo: TFireDADErrorMessage;
  ExceptionName, FBMensaje: string;
begin
  // 🔹 Primero intentar con códigos FireDAC conocidos
  if ACode > 0 then // Códigos FireDAC
  begin
    MsgInfo := GetFireDACMessage(ACode);
    if MsgInfo.Category = catFireDAC then
      Exit(Format('%s'#13#10#13#10'%s', [MsgInfo.Description, MsgInfo.Suggestion]));
  end;

  // 🔹 Luego intentar con excepciones Firebird registradas en RDB$EXCEPTIONS
  if Pos('ERR_', UpperCase(AOriginalMessage)) > 0 then
  begin
    ExceptionName := ExtractExceptionName(AOriginalMessage); // Función auxiliar abajo
    if ExceptionName <> '' then
    begin
      FBMensaje := GetRegisteredFirebirdError(ExceptionName); // Llama a tu DameError
      if FBMensaje <> '' then
        Exit(FBMensaje);
    end;
  end;

  // 🔹 Fallback: mensaje genérico con código
  Result := Format('Error de base de datos [%d]: %s', [ACode, AOriginalMessage]);
end;

function GetFriendlyErrorMessage(AException: Exception): string;
var
  FDEx: EFDDBEngineException;
  ErrorCode: Integer;
begin
  if AException is EFDDBEngineException then
  begin
    FDEx := EFDDBEngineException(AException);
    if FDEx.ErrorCount > 0 then
    begin
      ErrorCode := FDEx.Errors[0].ErrorCode;
      Exit(GetFriendlyErrorMessageByCode(ErrorCode, FDEx.Message));
    end;
  end;

  // Para excepciones no FireDAC
  Result := AException.Message;
end;




end.
