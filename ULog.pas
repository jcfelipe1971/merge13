unit ULog;

interface

uses
  Classes, System.SysUtils;

procedure Log(s: string);
procedure LogIni(s: string);
procedure LogFin(s: string);

implementation

uses
  Vcl.Forms, Vcl.Dialogs;

var
  ContadorLog: integer;
  InicioLog: array [1 .. 20] of TDateTime;

procedure Log(s: string);
var
  F: TextFile;
  FileName: string;
begin
  FileName := ChangeFileExt(Application.Title, '.log');
  AssignFile(F, FileName);
  try
    if FileExists(FileName) then
      Append(F)
    else
      Rewrite(F);
  except
    on e: Exception do
      ShowMessage('Error al abrir fichero : ' + FileName + #13#10 + e.Message);
  end;

  WriteLn(F, FormatDatetime('[yyyy-mm-dd hh:nn:ss.zzz] ', Now) + s);

  CloseFile(F);
end;

procedure LogIni(s: string);
var
  espacio: string;
  i: integer;
begin
  Inc(ContadorLog);
  espacio := '';
  for i := 2 to ContadorLog do
    espacio := espacio + '   ';
  if (ContadorLog < 20) then
    InicioLog[ContadorLog] := Now;
  Log('I - ' + espacio + s);
end;

procedure LogFin(s: string);
var
  espacio: string;
  i: integer;
begin
  espacio := '';
  for i := 2 to ContadorLog do
    espacio := espacio + '   ';
  if (ContadorLog < 20) then
    Log('F - ' + espacio + FormatDatetime('[nn:ss.zzz]', Now - InicioLog[ContadorLog]) + ' - ' + s)
  else
    Log('F - ' + espacio + FormatDatetime('[nn:ss.zzz]', Now - Now) + ' - ' + s);
  if (ContadorLog > 0) then
    Dec(ContadorLog);
end;

end.
