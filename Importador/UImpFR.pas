unit UImpFR;

// Conversión de listados de Merge a la FastReport actual.
//  - .fr3 (FastReport 3.19 con clases propias de Merge): TfrxHYReport -> TfrxReport; consultas FIB del informe ->
//    TfrxFDQuery si FastReport tiene instalados sus componentes FireDAC (directiva FR_FIREDAC), si no se retiran.
//  - .frf (FastReport 2): con el conversor oficial de FastReport (frx2xto30, directiva FR2; necesita TeeChart VCL).
//  - .hyr / .hym (formatos propios de Merge: matricial y correo): no son FastReport, se informan.
// El informe se carga en un TfrxReport y se guarda con la versión actual: así se comprueba que se puede abrir.

interface

uses
  System.SysUtils, System.Classes;

type
  TImpFRLog = reference to procedure(const S: string);

function ConvierteListado(const Origen, Destino: string; Log: TImpFRLog): Boolean;
function EsListado(const Fichero: string): Boolean;

implementation

uses
  System.StrUtils, System.RegularExpressions, System.IOUtils, frxClass, frxDBSet, frxBarcode, frxCross, frxChBox,
  frxRich, frxOLE, frxDCtrl, frxDMPClass
  {$IFDEF FR_FIREDAC}, frxFDComponents{$ENDIF}
  {$IFDEF FR2}, frx2xto30{$ENDIF};

function EsListado(const Fichero: string): Boolean;
begin
  Result := MatchText(ExtractFileExt(Fichero), ['.fr3', '.frf', '.hyr', '.hym']);
end;

function PreparaFR3(const Xml: string; Log: TImpFRLog; const Nombre: string): string;
var
  N: Integer;
begin
  Result := StringReplace(Xml, '<TfrxHYReport ', '<TfrxReport ', []);
  Result := StringReplace(Result, '</TfrxHYReport>', '</TfrxReport>', []);
  {$IFDEF FR_FIREDAC}
  Result := StringReplace(Result, '<TfrxFIBHYQuery ', '<TfrxFDQuery ', [rfReplaceAll]);
  Result := StringReplace(Result, '<TfrxFIBHYDatabase ', '<TfrxFDDatabase ', [rfReplaceAll]);
  // parámetros FIB ?X -> :X dentro de la SQL del informe
  Result := TRegEx.Replace(Result, '(SQL\.Text="[^"]*)', '$1');
  {$ELSE}
  N := TRegEx.Matches(Result, '<TfrxFIBHY\w+[^>]*/>').Count;
  if N > 0 then
  begin
    Result := TRegEx.Replace(Result, '<TfrxFIBHY\w+[^>]*/>', '');
    Log(Format('   %s: %d consultas FIB dentro del informe retiradas (instalar los componentes FireDAC de FastReport ' +
      'y compilar con FR_FIREDAC para convertirlas)', [Nombre, N]));
  end;
  {$ENDIF}
end;

function ConvierteListado(const Origen, Destino: string; Log: TImpFRLog): Boolean;
var
  R: TfrxReport;
  S: TStringStream;
  Ext, Xml: string;
begin
  Result := False;
  Ext := LowerCase(ExtractFileExt(Origen));
  if MatchText(Ext, ['.hyr', '.hym']) then
  begin
    Log('   ' + ExtractFileName(Origen) + ': formato propio de Merge (matricial/correo), no es FastReport; se omite.');
    Exit;
  end;
  ForceDirectories(ExtractFilePath(Destino));
  R := TfrxReport.Create(nil);
  try
    R.EngineOptions.SilentMode := True;
    R.ShowProgress := False;
    try
      if Ext = '.fr3' then
      begin
        Xml := TFile.ReadAllText(Origen, TEncoding.UTF8);
        S := TStringStream.Create(PreparaFR3(Xml, Log, ExtractFileName(Origen)), TEncoding.UTF8);
        try
          R.LoadFromStream(S);
        finally
          S.Free;
        end;
      end
      else
      begin
        {$IFDEF FR2}
        R.LoadFromFile(Origen);
        {$ELSE}
        Log('   ' + ExtractFileName(Origen) + ': FastReport 2 (.frf) necesita el conversor frx2xto30 de FastReport ' +
          '(compilar con la directiva FR2; requiere TeeChart VCL).');
        Exit;
        {$ENDIF}
      end;
      if R.Errors.Count > 0 then
        Log('   ' + ExtractFileName(Origen) + ': avisos al cargar: ' + StringReplace(R.Errors.Text, sLineBreak, ' | ', [rfReplaceAll]));
      R.SaveToFile(ChangeFileExt(Destino, '.fr3'));
      Result := True;
    except
      on E: Exception do
        Log('   ERROR ' + ExtractFileName(Origen) + ': ' + E.ClassName + ': ' + E.Message);
    end;
  finally
    R.Free;
  end;
end;

end.
