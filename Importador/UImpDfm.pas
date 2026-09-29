unit UImpDfm;

// Lectura y escritura de DFM en formato texto como árbol de nodos (componentes) con sus propiedades.
// Cada propiedad guarda su valor tal cual está en el DFM (una o varias líneas), así se reescribe sin perder nada.

interface

uses
  System.SysUtils, System.Classes, System.Generics.Collections;

type
  TDfmProp = class
  public
    Nombre: string;
    Lineas: TStringList;   // primera línea: lo que va detrás de "Nombre = "; resto: continuación
    constructor Create(const ANombre: string);
    destructor Destroy; override;
    function Texto: string;
  end;

  TDfmNodo = class
  private
    FHijos: TObjectList<TDfmNodo>;
    FProps: TObjectList<TDfmProp>;
  public
    Tipo: string;          // object | inherited | inline
    Nombre: string;
    Clase: string;
    Orden: string;         // [n]
    Padre: TDfmNodo;
    Info: TObject;         // uso libre del importador
    constructor Create(const ATipo, ANombre, AClase: string);
    destructor Destroy; override;
    function Prop(const ANombre: string): TDfmProp;
    function Valor(const ANombre: string): string;          // texto completo (sin retornos)
    function Cadenas(const ANombre: string): TArray<string>; // TStrings: X.Strings = ('a' 'b')
    procedure PonValor(const ANombre, AValor: string); overload;
    procedure PonValor(const ANombre: string; ALineas: TStrings); overload;
    procedure PonCadenas(const ANombre: string; const AItems: TArray<string>);
    procedure Quita(const ANombre: string);
    function Busca(const ANombre: string): TDfmNodo;
    procedure Recorre(Proc: TProc<TDfmNodo>);
    function AnyadeHijo(N: TDfmNodo): TDfmNodo;
    function QuitaHijo(N: TDfmNodo): TDfmNodo;   // lo saca sin liberarlo
    property Hijos: TObjectList<TDfmNodo> read FHijos;
    property Props: TObjectList<TDfmProp> read FProps;
  end;

function LeeDfm(const Texto: string): TDfmNodo;
function EscribeDfm(Raiz: TDfmNodo): string;
function CargaDfm(const Fichero: string): TDfmNodo;
procedure GuardaDfm(Raiz: TDfmNodo; const Fichero: string);
function Comillas(const S: string): string;          // 'texto' con #nnn para lo no ASCII
function SinComillas(const S: string): string;       // valor DFM de cadena -> texto

implementation

uses
  System.RegularExpressions, System.StrUtils;

{ TDfmProp }

constructor TDfmProp.Create(const ANombre: string);
begin
  Nombre := ANombre;
  Lineas := TStringList.Create;
end;

destructor TDfmProp.Destroy;
begin
  Lineas.Free;
  inherited;
end;

function TDfmProp.Texto: string;
var
  i: Integer;
begin
  Result := '';
  for i := 0 to Lineas.Count - 1 do
    Result := Result + IfThen(i > 0, #10) + Lineas[i];
  Result := Trim(Result);
end;

{ TDfmNodo }

constructor TDfmNodo.Create(const ATipo, ANombre, AClase: string);
begin
  Tipo := ATipo;
  Nombre := ANombre;
  Clase := AClase;
  FHijos := TObjectList<TDfmNodo>.Create(True);
  FProps := TObjectList<TDfmProp>.Create(True);
end;

destructor TDfmNodo.Destroy;
begin
  FHijos.Free;
  FProps.Free;
  inherited;
end;

function TDfmNodo.Prop(const ANombre: string): TDfmProp;
begin
  for Result in FProps do
    if SameText(Result.Nombre, ANombre) then
      Exit;
  Result := nil;
end;

function TDfmNodo.Valor(const ANombre: string): string;
var
  P: TDfmProp;
begin
  P := Prop(ANombre);
  if P = nil then
    Result := ''
  else
    Result := P.Texto;
end;

function SinComillas(const S: string): string;
// 'abc'#233'def' + 'ghi'  ->  abcédefghi
var
  i: Integer;
  Num: string;
begin
  Result := '';
  i := 1;
  while i <= Length(S) do
  begin
    if S[i] = '''' then
    begin
      Inc(i);
      while i <= Length(S) do
      begin
        if S[i] = '''' then
        begin
          if (i < Length(S)) and (S[i + 1] = '''') then
          begin
            Result := Result + '''';
            Inc(i, 2);
            Continue;
          end;
          Break;
        end;
        Result := Result + S[i];
        Inc(i);
      end;
      Inc(i);
    end
    else if S[i] = '#' then
    begin
      Inc(i);
      Num := '';
      while (i <= Length(S)) and CharInSet(S[i], ['0'..'9']) do
      begin
        Num := Num + S[i];
        Inc(i);
      end;
      if Num <> '' then
        Result := Result + Char(StrToInt(Num));
    end
    else
      Inc(i);
  end;
end;

function TDfmNodo.Cadenas(const ANombre: string): TArray<string>;
var
  P: TDfmProp;
  L: TList<string>;
  Acum, Linea: string;
  Continua, HayAcum: Boolean;
  i: Integer;
begin
  L := TList<string>.Create;
  try
    P := Prop(ANombre);
    if P <> nil then
    begin
      Acum := '';
      HayAcum := False;
      for i := 0 to P.Lineas.Count - 1 do
      begin
        Linea := Trim(P.Lineas[i]);
        if (Linea = '(') or (Linea = ')') or (Linea = '') then
          Continue;
        if StartsStr('(', Linea) then
          Linea := Trim(Copy(Linea, 2, MaxInt));
        Continua := EndsStr('+', Linea);
        if Continua then
          Linea := Trim(Copy(Linea, 1, Length(Linea) - 1));
        if (not Continua) and EndsStr(')', Linea) then
          Linea := Trim(Copy(Linea, 1, Length(Linea) - 1));
        Acum := Acum + SinComillas(Linea);
        HayAcum := True;
        if not Continua then
        begin
          L.Add(Acum);
          Acum := '';
          HayAcum := False;
        end;
      end;
      if HayAcum then
        L.Add(Acum);
    end;
    Result := L.ToArray;
  finally
    L.Free;
  end;
end;

function Comillas(const S: string): string;
var
  C: Char;
  Buf: string;
  Hay: Boolean;
begin
  Result := '';
  Buf := '';
  Hay := False;
  for C in S do
    if (Ord(C) < 32) or (Ord(C) > 126) then
    begin
      if Buf <> '' then
        Result := Result + '''' + StringReplace(Buf, '''', '''''', [rfReplaceAll]) + '''';
      Buf := '';
      Result := Result + '#' + IntToStr(Ord(C));
      Hay := True;
    end
    else
      Buf := Buf + C;
  if (Buf <> '') or not Hay then
    Result := Result + '''' + StringReplace(Buf, '''', '''''', [rfReplaceAll]) + '''';
end;

procedure TDfmNodo.PonValor(const ANombre, AValor: string);
var
  P: TDfmProp;
begin
  P := Prop(ANombre);
  if P = nil then
  begin
    P := TDfmProp.Create(ANombre);
    FProps.Add(P);
  end;
  P.Lineas.Text := AValor;
  if P.Lineas.Count = 0 then
    P.Lineas.Add('');
end;

procedure TDfmNodo.PonValor(const ANombre: string; ALineas: TStrings);
var
  P: TDfmProp;
begin
  P := Prop(ANombre);
  if P = nil then
  begin
    P := TDfmProp.Create(ANombre);
    FProps.Add(P);
  end;
  P.Lineas.Assign(ALineas);
end;

procedure TDfmNodo.PonCadenas(const ANombre: string; const AItems: TArray<string>);
// Igual que el IDE: los elementos largos se parten en trozos de 64 caracteres unidos con +
var
  L: TStringList;
  i, j: Integer;
  Cierre, Trozo: string;
begin
  L := TStringList.Create;
  try
    L.Add('(');
    if Length(AItems) = 0 then
      L.Add('  '''')')
    else
      for i := 0 to High(AItems) do
      begin
        Cierre := IfThen(i = High(AItems), ')', '');
        if Length(AItems[i]) <= 64 then
          L.Add('  ' + Comillas(AItems[i]) + Cierre)
        else
        begin
          L.Add('  ');
          j := 1;
          while j <= Length(AItems[i]) do
          begin
            Trozo := Copy(AItems[i], j, 64);
            Inc(j, 64);
            L.Add('    ' + Comillas(Trozo) + IfThen(j <= Length(AItems[i]), ' +', Cierre));
          end;
        end;
      end;
    PonValor(ANombre, L);
  finally
    L.Free;
  end;
end;

procedure TDfmNodo.Quita(const ANombre: string);
var
  i: Integer;
begin
  for i := FProps.Count - 1 downto 0 do
    if SameText(FProps[i].Nombre, ANombre) then
      FProps.Delete(i);
end;

function TDfmNodo.Busca(const ANombre: string): TDfmNodo;
var
  H: TDfmNodo;
begin
  if SameText(Nombre, ANombre) then
    Exit(Self);
  for H in FHijos do
  begin
    Result := H.Busca(ANombre);
    if Result <> nil then
      Exit;
  end;
  Result := nil;
end;

procedure TDfmNodo.Recorre(Proc: TProc<TDfmNodo>);
var
  i: Integer;
begin
  Proc(Self);
  for i := 0 to FHijos.Count - 1 do
    FHijos[i].Recorre(Proc);
end;

function TDfmNodo.AnyadeHijo(N: TDfmNodo): TDfmNodo;
begin
  N.Padre := Self;
  FHijos.Add(N);
  Result := N;
end;

function TDfmNodo.QuitaHijo(N: TDfmNodo): TDfmNodo;
begin
  FHijos.Extract(N);
  N.Padre := nil;
  Result := N;
end;

{ Lectura }

function Saldo(const S: string): Integer;
// ( < {  menos  ) > }  fuera de literales
var
  i: Integer;
begin
  Result := 0;
  i := 1;
  while i <= Length(S) do
  begin
    if S[i] = '''' then
    begin
      Inc(i);
      while (i <= Length(S)) and (S[i] <> '''') do
        Inc(i);
    end
    else if CharInSet(S[i], ['(', '<', '{']) then
      Inc(Result)
    else if CharInSet(S[i], [')', '>', '}']) then
      Dec(Result);
    Inc(i);
  end;
end;

function LeeDfm(const Texto: string): TDfmNodo;
var
  L: TStringList;
  Pila: TStack<TDfmNodo>;
  i, Base, Bal: Integer;
  Linea, Valor: string;
  M: TMatch;
  N: TDfmNodo;
  P: TDfmProp;
  Cont: Boolean;
begin
  Result := nil;
  L := TStringList.Create;
  Pila := TStack<TDfmNodo>.Create;
  try
    L.Text := Texto;
    if (L.Count > 0) and (Length(L[0]) > 0) and (L[0][1] = #$FEFF) then
      L[0] := Copy(L[0], 2, MaxInt);
    i := 0;
    while i < L.Count do
    begin
      Linea := L[i];
      if Trim(Linea) = '' then
      begin
        Inc(i);
        Continue;
      end;
      M := TRegEx.Match(Linea, '^(\s*)(object|inherited|inline)\s+(\w+)\s*:\s*(\w+)(\s*\[\d+\])?\s*$', [roIgnoreCase]);
      if M.Success then
      begin
        N := TDfmNodo.Create(LowerCase(M.Groups[2].Value), M.Groups[3].Value, M.Groups[4].Value);
        if (M.Groups.Count > 5) and M.Groups[5].Success then
          N.Orden := Trim(M.Groups[5].Value);
        if Pila.Count > 0 then
          Pila.Peek.AnyadeHijo(N)
        else
          Result := N;
        Pila.Push(N);
        Inc(i);
        Continue;
      end;
      if TRegEx.IsMatch(Linea, '^\s*end\s*$', [roIgnoreCase]) and (Pila.Count > 0) then
      begin
        Pila.Pop;
        Inc(i);
        Continue;
      end;
      M := TRegEx.Match(Linea, '^(\s*)([\w\.]+)\s*=\s?(.*)$');
      if M.Success and (Pila.Count > 0) then
      begin
        Base := Length(M.Groups[1].Value);
        Valor := M.Groups[3].Value;
        P := TDfmProp.Create(M.Groups[2].Value);
        P.Lineas.Add(Valor);
        Bal := Saldo(Valor);
        Cont := EndsStr('+', TrimRight(Valor)) or (Trim(Valor) = '');
        Inc(i);
        while ((Bal > 0) or Cont) and (i < L.Count) do
        begin
          if Trim(Copy(L[i], 1, Base)) = '' then
            P.Lineas.Add(Copy(L[i], Base + 1, MaxInt))
          else
            P.Lineas.Add(Trim(L[i]));
          Bal := Bal + Saldo(L[i]);
          Cont := EndsStr('+', TrimRight(L[i])) and (Bal = 0);
          Inc(i);
        end;
        Pila.Peek.FProps.Add(P);
        Continue;
      end;
      Inc(i);
    end;
  finally
    Pila.Free;
    L.Free;
  end;
end;

procedure Escribe(N: TDfmNodo; Nivel: Integer; S: TStringBuilder);
var
  Ind: string;
  P: TDfmProp;
  i: Integer;
  H: TDfmNodo;
begin
  Ind := StringOfChar(' ', Nivel * 2);
  S.Append(Ind + N.Tipo + ' ' + N.Nombre + ': ' + N.Clase + IfThen(N.Orden <> '', ' ' + N.Orden) + #13#10);
  for P in N.FProps do
  begin
    S.Append(Ind + '  ' + P.Nombre + ' = ' + IfThen(P.Lineas.Count > 0, P.Lineas[0]) + #13#10);
    for i := 1 to P.Lineas.Count - 1 do
      S.Append(Ind + '  ' + P.Lineas[i] + #13#10);
  end;
  for H in N.FHijos do
    Escribe(H, Nivel + 1, S);
  S.Append(Ind + 'end' + #13#10);
end;

function EscribeDfm(Raiz: TDfmNodo): string;
var
  S: TStringBuilder;
begin
  S := TStringBuilder.Create;
  try
    Escribe(Raiz, 0, S);
    Result := S.ToString;
  finally
    S.Free;
  end;
end;

function CargaDfm(const Fichero: string): TDfmNodo;
var
  L: TStringList;
begin
  L := TStringList.Create;
  try
    // Merge (Delphi 6): ANSI 1252; lo generado por Delphi 13: UTF-8 si lleva BOM
    L.LoadFromFile(Fichero, TEncoding.ANSI);
    if (L.Count > 0) and StartsStr(#$EF#$BB#$BF, L[0]) then
      L.LoadFromFile(Fichero, TEncoding.UTF8);
    Result := LeeDfm(L.Text);
  finally
    L.Free;
  end;
end;

procedure GuardaDfm(Raiz: TDfmNodo; const Fichero: string);
var
  L: TStringList;
begin
  L := TStringList.Create;
  try
    L.Text := EscribeDfm(Raiz);
    L.WriteBOM := False;
    L.SaveToFile(Fichero, TEncoding.ANSI);   // los DFM de texto de Delphi van en ANSI con #nnn
  finally
    L.Free;
  end;
end;

end.
