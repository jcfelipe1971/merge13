unit UImpTexto;

// Utilidades de texto para convertir código Pascal: sustituciones que respetan comentarios y literales,
// lectura/escritura con la codificación correcta, parámetros de llamadas y cláusulas uses.

interface

uses
  System.SysUtils, System.Classes, System.RegularExpressions, System.Generics.Collections;

type
  TEvaluador = reference to function(M: TMatch): string;

function LeeTexto(const Fichero: string): string;
procedure GuardaTexto(const Fichero, Texto: string; ConBOM: Boolean = True);

// Sustituye solo en el código (fuera de comentarios y de literales)
function EnCodigo(const Src, Patron, Reemplazo: string; Opc: TRegExOptions = [roIgnoreCase]): string; overload;
function EnCodigo(const Src, Patron: string; Eval: TEvaluador; Opc: TRegExOptions = [roIgnoreCase]): string; overload;
function ReemplazaFn(const Input, Patron: string; Fn: TFunc<TMatch, string>; Opc: TRegExOptions = [roIgnoreCase]): string;
// Sustituye fuera de comentarios, pero puede abarcar literales (p.ej. ByName['X'])
function SinComentarios(const Src, Patron, Reemplazo: string; Opc: TRegExOptions = [roIgnoreCase]): string;
// Aplica Eval a cada literal '...'
function EnLiterales(const Src: string; Eval: TFunc<string, string>): string;
// Texto con comentarios sustituidos por espacios (misma longitud, para buscar)
function QuitaComentarios(const Src: string): string;
function Cuenta(const Src, Patron: string): Integer;

// uses
function UnitsDeUses(const Src: string; SoloInterface: Boolean = False): TArray<string>;
function ReescribeUses(const Src: string; Fn: TFunc<string, string>): string;   // Fn('X') -> 'X' | nuevo | '' (quitar)
function AnyadeUses(const Src, Seccion: string; const Units: TArray<string>): string;  // 'interface' | 'implementation'
function QuitaDuplicadosUses(const Src: string): string;
// gnugettext en los uses siempre como  {IDIOMA_CODE} gnugettext {IDIOMA_CODE}
function MarcaIdioma(const Src: string): string;

// Llamadas con argumentos (aunque ocupen varias líneas): Fn(args) -> texto nuevo o '' para dejarla
function ReescribeLlamadas(const Src, Patron: string; Fn: TFunc<TArray<string>, string>): string;

implementation

uses
  System.StrUtils, System.IOUtils;

function ReemplazaFn(const Input, Patron: string; Fn: TFunc<TMatch, string>; Opc: TRegExOptions): string;
var
  M: TMatch;
  Pos_: Integer;
  S: TStringBuilder;
begin
  S := TStringBuilder.Create;
  try
    Pos_ := 1;
    for M in TRegEx.Matches(Input, Patron, Opc) do
    begin
      S.Append(Copy(Input, Pos_, M.Index - Pos_));
      S.Append(Fn(M));
      Pos_ := M.Index + M.Length;
    end;
    S.Append(Copy(Input, Pos_, MaxInt));
    Result := S.ToString;
  finally
    S.Free;
  end;
end;

const
  TOKENS = '\{[^}]*\}|\(\*.*?\*\)|//[^\n]*|''(?:[^'']|'''')*''';

function EsUTF8(const B: TBytes): Boolean;
var
  i, n, k: Integer;
begin
  i := 0;
  Result := True;
  while i < Length(B) do
  begin
    if B[i] < $80 then n := 0
    else if (B[i] and $E0) = $C0 then n := 1
    else if (B[i] and $F0) = $E0 then n := 2
    else if (B[i] and $F8) = $F0 then n := 3
    else Exit(False);
    for k := 1 to n do
      if (i + k >= Length(B)) or ((B[i + k] and $C0) <> $80) then
        Exit(False);
    Inc(i, n + 1);
  end;
end;

function LeeTexto(const Fichero: string): string;
var
  B: TBytes;
begin
  B := TFile.ReadAllBytes(Fichero);
  if (Length(B) >= 3) and (B[0] = $EF) and (B[1] = $BB) and (B[2] = $BF) then
    Result := TEncoding.UTF8.GetString(B, 3, Length(B) - 3)
  else if EsUTF8(B) then
    Result := TEncoding.UTF8.GetString(B)
  else
    Result := TEncoding.GetEncoding(1252).GetString(B);   // Delphi 6: ANSI 1252
end;

procedure GuardaTexto(const Fichero, Texto: string; ConBOM: Boolean);
var
  S: TStringList;
begin
  S := TStringList.Create;
  try
    S.Text := Texto;
    S.WriteBOM := ConBOM;
    S.SaveToFile(Fichero, TEncoding.UTF8);
  finally
    S.Free;
  end;
end;

type
  TTrozo = record
    Texto: string;
    EsCodigo: Boolean;
    EsLiteral: Boolean;
  end;

function Trocea(const Src: string): TArray<TTrozo>;
var
  L: TList<TTrozo>;
  M: TMatch;
  Pos_: Integer;
  T: TTrozo;
begin
  L := TList<TTrozo>.Create;
  try
    Pos_ := 1;
    for M in TRegEx.Matches(Src, TOKENS, [roSingleLine]) do
    begin
      if M.Index > Pos_ then
      begin
        T.Texto := Copy(Src, Pos_, M.Index - Pos_);
        T.EsCodigo := True;
        T.EsLiteral := False;
        L.Add(T);
      end;
      T.Texto := M.Value;
      T.EsCodigo := False;
      T.EsLiteral := StartsStr('''', M.Value);
      L.Add(T);
      Pos_ := M.Index + M.Length;
    end;
    if Pos_ <= Length(Src) then
    begin
      T.Texto := Copy(Src, Pos_, MaxInt);
      T.EsCodigo := True;
      T.EsLiteral := False;
      L.Add(T);
    end;
    Result := L.ToArray;
  finally
    L.Free;
  end;
end;

function EnCodigo(const Src, Patron, Reemplazo: string; Opc: TRegExOptions): string;
var
  T: TTrozo;
  S: TStringBuilder;
begin
  S := TStringBuilder.Create;
  try
    for T in Trocea(Src) do
      if T.EsCodigo then
        S.Append(TRegEx.Replace(T.Texto, Patron, Reemplazo, Opc))
      else
        S.Append(T.Texto);
    Result := S.ToString;
  finally
    S.Free;
  end;
end;

function EnCodigo(const Src, Patron: string; Eval: TEvaluador; Opc: TRegExOptions): string;
var
  T: TTrozo;
  S: TStringBuilder;
begin
  S := TStringBuilder.Create;
  try
    for T in Trocea(Src) do
      if T.EsCodigo then
        S.Append(ReemplazaFn(T.Texto, Patron,
          function(M: TMatch): string
          begin
            Result := Eval(M);
          end, Opc))
      else
        S.Append(T.Texto);
    Result := S.ToString;
  finally
    S.Free;
  end;
end;

function SinComentarios(const Src, Patron, Reemplazo: string; Opc: TRegExOptions): string;
var
  T: TTrozo;
  S: TStringBuilder;
  Acum: string;
begin
  S := TStringBuilder.Create;
  try
    Acum := '';
    for T in Trocea(Src) do
      if T.EsCodigo or T.EsLiteral then
        Acum := Acum + T.Texto
      else
      begin
        S.Append(TRegEx.Replace(Acum, Patron, Reemplazo, Opc));
        Acum := '';
        S.Append(T.Texto);
      end;
    S.Append(TRegEx.Replace(Acum, Patron, Reemplazo, Opc));
    Result := S.ToString;
  finally
    S.Free;
  end;
end;

function EnLiterales(const Src: string; Eval: TFunc<string, string>): string;
var
  T: TTrozo;
  S: TStringBuilder;
begin
  S := TStringBuilder.Create;
  try
    for T in Trocea(Src) do
      if T.EsLiteral then
        S.Append(Eval(T.Texto))
      else
        S.Append(T.Texto);
    Result := S.ToString;
  finally
    S.Free;
  end;
end;

function QuitaComentarios(const Src: string): string;
begin
  Result := ReemplazaFn(Src, '\{[^}]*\}|\(\*.*?\*\)|//[^\n]*',
    function(M: TMatch): string
    begin
      Result := StringOfChar(' ', M.Length);
    end, [roSingleLine]);
end;

function Cuenta(const Src, Patron: string): Integer;
begin
  Result := TRegEx.Matches(QuitaComentarios(Src), Patron, [roIgnoreCase]).Count;
end;

function UnitsDeUses(const Src: string; SoloInterface: Boolean): TArray<string>;
var
  T: string;
  M: TMatch;
  X: string;
  L: TList<string>;
begin
  T := QuitaComentarios(Src);
  if SoloInterface then
    T := TRegEx.Split(T, '\bimplementation\b', [roIgnoreCase])[0];
  L := TList<string>.Create;
  try
    for M in TRegEx.Matches(T, '\buses\b(.*?);', [roIgnoreCase, roSingleLine]) do
      for X in M.Groups[1].Value.Split([',']) do
        if Trim(X) <> '' then
          L.Add(Trim(X).Split([' ', #9, #13, #10])[0]);
    Result := L.ToArray;
  finally
    L.Free;
  end;
end;

function ReescribeUses(const Src: string; Fn: TFunc<string, string>): string;
begin
  Result := ReemplazaFn(Src, '\buses\b((?:[^;{]|\{[^}]*\})*);',
    function(M: TMatch): string
    var
      Partes, Salida: TList<string>;
      P, U, Nuevo, Gettext: string;
      Vistos: TStringList;
    begin
      Partes := TList<string>.Create;
      Salida := TList<string>.Create;
      Vistos := TStringList.Create;
      try
        for P in M.Groups[1].Value.Split([',']) do
        begin
          U := Trim(TRegEx.Replace(P, '\{[^}]*\}', ''));
          if U = '' then
            Continue;
          Nuevo := Fn(U);
          if Nuevo = '' then
            Continue;
          if Vistos.IndexOf(LowerCase(Nuevo)) >= 0 then
            Continue;
          Vistos.Add(LowerCase(Nuevo));
          Salida.Add(Nuevo);
        end;
        if Salida.Count = 0 then
          Result := ''
        else
        begin
          // criterio de Delfos: gnugettext el primero, en la misma línea que uses:
          //   uses {IDIOMA_CODE} gnugettext {IDIOMA_CODE},
          //     Winapi.Windows, ...
          Gettext := '';
          for var k := Salida.Count - 1 downto 0 do
            if ContainsText(Salida[k], 'gnugettext') then
            begin
              Gettext := '{IDIOMA_CODE} gnugettext {IDIOMA_CODE}';
              Salida.Delete(k);
            end;
          if Gettext = '' then
            Result := 'uses' + #13#10 + '  ' + String.Join(', ', Salida.ToArray) + ';'
          else if Salida.Count = 0 then
            Result := 'uses ' + Gettext + ';'
          else
            Result := 'uses ' + Gettext + ',' + #13#10 + '  ' + String.Join(', ', Salida.ToArray) + ';';
        end;
      finally
        Partes.Free;
        Salida.Free;
        Vistos.Free;
      end;
    end, [roIgnoreCase]);
end;

function AnyadeUses(const Src, Seccion: string; const Units: TArray<string>): string;
var
  M: TMatch;
  Ya: TStringList;
  Faltan: TList<string>;
  U, X, Zona: string;
  Corte: Integer;
begin
  Result := Src;
  if Length(Units) = 0 then
    Exit;
  M := TRegEx.Match(Src, '\b' + Seccion + '\b(\s|\{[^}]*\})*(uses\b((?:[^;{]|\{[^}]*\})*);)?', [roIgnoreCase]);
  if not M.Success then
    Exit;
  Ya := TStringList.Create;
  Faltan := TList<string>.Create;
  try
    // units ya presentes en la sección y, para implementation, también en la interfaz
    Zona := Src;
    for X in UnitsDeUses(Zona) do
      Ya.Add(LowerCase(X));
    for U in Units do
      if Ya.IndexOf(LowerCase(U)) < 0 then
        Faltan.Add(U);
    if Faltan.Count = 0 then
      Exit;
    if (M.Groups.Count > 2) and M.Groups[2].Success then
    begin
      Corte := M.Groups[3].Index + M.Groups[3].Length;
      Result := Copy(Src, 1, Corte - 1) + ', ' + String.Join(', ', Faltan.ToArray) + Copy(Src, Corte, MaxInt);
    end
    else
    begin
      Corte := M.Index + M.Length;
      Result := Copy(Src, 1, Corte - 1) + #13#10#13#10 + 'uses' + #13#10 + '  ' + String.Join(', ', Faltan.ToArray) + ';' +
        #13#10 + Copy(Src, Corte, MaxInt);
    end;
  finally
    Ya.Free;
    Faltan.Free;
  end;
end;

function QuitaDuplicadosUses(const Src: string): string;
// Una unit no puede estar en el uses de la interfaz y en el de la implementación
var
  Corte: TMatch;
  Iface: TStringList;
  X: string;
begin
  Result := Src;
  Corte := TRegEx.Match(Src, '\bimplementation\b', [roIgnoreCase]);
  if not Corte.Success then
    Exit;
  Iface := TStringList.Create;
  try
    for X in UnitsDeUses(Copy(Src, 1, Corte.Index - 1)) do
      Iface.Add(LowerCase(X));
    Result := Copy(Src, 1, Corte.Index - 1) + ReescribeUses(Copy(Src, Corte.Index, MaxInt),
      function(U: string): string
      begin
        if Iface.IndexOf(LowerCase(U)) >= 0 then
          Result := ''
        else
          Result := U;
      end);
  finally
    Iface.Free;
  end;
end;

function MarcaIdioma(const Src: string): string;
begin
  Result := ReemplazaFn(Src, '\buses\b((?:[^;{]|\{[^}]*\})*);',
    function(M: TMatch): string
    begin
      Result := TRegEx.Replace(M.Value, '(\{IDIOMA_CODE\}\s*)?\bgnugettext\b(\s*\{IDIOMA_CODE\})?',
        '{IDIOMA_CODE} gnugettext {IDIOMA_CODE}', [roIgnoreCase]);
    end, [roIgnoreCase]);
end;

function Argumentos(const Src: string; Inicio: Integer; out Fin: Integer): TArray<string>;
// Src[Inicio] = '('
var
  Nivel, i, Ini: Integer;
  L: TList<string>;
begin
  Result := nil;
  L := TList<string>.Create;
  try
    Nivel := 0;
    i := Inicio;
    Ini := Inicio + 1;
    while i <= Length(Src) do
    begin
      case Src[i] of
        '''':
          begin
            Inc(i);
            while (i <= Length(Src)) and (Src[i] <> '''') do
              Inc(i);
          end;
        '(':
          Inc(Nivel);
        ')':
          begin
            Dec(Nivel);
            if Nivel = 0 then
            begin
              L.Add(Trim(Copy(Src, Ini, i - Ini)));
              Fin := i + 1;
              Exit(L.ToArray);
            end;
          end;
        ',':
          if Nivel = 1 then
          begin
            L.Add(Trim(Copy(Src, Ini, i - Ini)));
            Ini := i + 1;
          end;
      end;
      Inc(i);
    end;
  finally
    L.Free;
  end;
end;

function ReescribeLlamadas(const Src, Patron: string; Fn: TFunc<TArray<string>, string>): string;
var
  Masc: string;
  M: TMatch;
  Pos_, Fin, j: Integer;
  Args: TArray<string>;
  Nuevo: string;
  S: TStringBuilder;
begin
  Masc := ReemplazaFn(Src, TOKENS,
    function(MM: TMatch): string
    begin
      Result := StringOfChar(' ', MM.Length);
    end, [roSingleLine]);
  S := TStringBuilder.Create;
  try
    Pos_ := 1;
    for M in TRegEx.Matches(Masc, Patron + '\s*(?=\()', [roIgnoreCase]) do
    begin
      if M.Index < Pos_ then
        Continue;
      j := M.Index + M.Length;
      Args := Argumentos(Src, j, Fin);
      if Args = nil then
        Continue;
      Nuevo := Fn(Args);
      if Nuevo = '' then
        Continue;
      S.Append(Copy(Src, Pos_, M.Index - Pos_));
      S.Append(Nuevo);
      Pos_ := Fin;
    end;
    S.Append(Copy(Src, Pos_, MaxInt));
    Result := S.ToString;
  finally
    S.Free;
  end;
end;

end.
