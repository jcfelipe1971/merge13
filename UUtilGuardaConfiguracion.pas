unit UUtilGuardaConfiguracion;

{
  Unit con funciones y procedimientos utiles para Guardar
  las propiedades de los formularios, grids y TabControls en
  las Tablas DIC_ de Firebird.
}
interface

uses
  Classes, SysUtils, IniFiles, UUtiles, UDMMain,
  System.UITypes, System.UIConsts, System.StrUtils,
  System.Types, Data.Bind.Grid, System.Rtti, vcl.Forms, vcl.DBGrids,
  vcl.Dialogs;

procedure GuardaFormulario(Formulario: TForm);
procedure GuardaFrame(Fr: TFrame);
procedure InsertaIniFormulario(Nombre: string; TX: TStringList);
procedure CargaIniFormulario(Formulario: TForm);
procedure CargaIniFRame(Fr: TFrame);
Function AgregaGridsINI(Formulario: TForm; INI: TMemIniFile): TMemIniFile;
Function AgregaGridsINIFrame(Fr: TFrame; INI: TMemIniFile): TMemIniFile;
procedure CargaIniGrids(Formulario: TForm; INI: TMemIniFile);
procedure CargaIniGridsFrame(Fr: TFrame); overload;
procedure CargaIniGridsFrame(Fr: TFrame; INI: TMemIniFile); overload;
function BuscarColumna(g: TDBGrid; const AFieldName: string): TColumn;
function DameColumnasGrid(g: TDBGrid): string;
procedure CargarColumnasGrid(Formulario: TForm; g: TDBGrid; cfg: string);
procedure CargarColumnasGridFrame(Fr: TFrame; g: TDBGrid; cfg: string);
procedure CargarColumnasGridOrigen(g: TDBGrid);

implementation

uses System.TypInfo;

// para cargar las imagenes en el fichero de recursos
const // en el INI se gurada    Columns=EJERCICIO|71|S;EMPRESA|42|S;CANAL|71|S;EMPLEADO|71|S;
  FIELD_SEP = '|'; // separador de  las propiedades de cada columna
  REGISTER_SEP = ';'; // separador de  las columnas en el INI


function DameColumnasGrid(g: TDBGrid): string;
var
  i: integer;
begin
  result := '';
  for i := 0 to g.Columns.Count - 1 do
    result := result + g.Columns[i].FieldName + FIELD_SEP + g.Columns[i].Width.ToString + FIELD_SEP +
      ifthen(g.Columns[i].Visible, 'S', 'N') + FIELD_SEP + g.Columns[i].Index.ToString + REGISTER_SEP;

end;

// busca la columna de un grid por el titulo Header
function BuscarColumna(g: TDBGrid; const AFieldName: string): TColumn;
var
  i: integer;
begin
  result := nil;
  // L := DameLinkGrid(Formulario, g);
  for i := 0 to g.Columns.Count - 1 do
  begin
    if (g.Columns[i].FieldName = AFieldName) then
    begin
      result := g.Columns[i];
      Exit;
    end;
  end;
end;

procedure CargarColumnasGridOrigen(g: TDBGrid);
var
  Campos: string;
begin
  Campos := DMMain.DameCampos(g);

  for var i := 0 to g.Columns.Count -1 do
   begin
   if pos (trim(g.Columns[i].FieldName),Campos ) > 0 then
    g.Columns[i].Visible := true
    else
     g.Columns[i].Visible := false
   end;
   g.Repaint;

end;

procedure CargarColumnasGridFrame(Fr: TFrame; g: TDBGrid; cfg: string);
begin
  var // Columns=EJERCICIO|71|S;EMPRESA|42|S;CANAL|71|S;EMPLEADO|71|S;    esta es la forma que viene el INI
  reg := cfg.Split([REGISTER_SEP]);
  // se divide todo antes del ' ; '  para cada campo
  for var i := 0 to High(reg) do
  begin
    var
    cmp := reg[i].Split([FIELD_SEP]);
    // se divide todo lo separado por ' | '  nombre|tamaño | visible de cada columna
    if length(cmp) > 0 then
    begin
      var
      col := BuscarColumna(g, cmp[0]);
      // busca la columna por el nombre
      // asigna los parametros de configuracion a la columna del grid
      if Assigned(col) then
      begin
        col.Width := StrToIntDef(cmp[1], col.Width.ToString.ToInteger);
        col.Visible := cmp[2] = 'S';
        if col.Index <> cmp[3].ToInteger then
          col.Index := StrToIntDef(cmp[3], 0);
        col := nil;
      end;
    end;
  end;
end;

// Funcion que carga las columnas del grid, cfg es el string del INI que tiene toda la configuracion de las columnas en una linea
procedure CargarColumnasGrid(Formulario: TForm; g: TDBGrid; cfg: string);
begin
  var // Columns=EJERCICIO|71|S;EMPRESA|42|S;CANAL|71|S;EMPLEADO|71|S;    esta es la forma que viene el INI
  reg := cfg.Split([REGISTER_SEP]);
  // se divide todo antes del ' ; '  para cada campo
  for var i := 0 to High(reg) do
  begin
    var
    cmp := reg[i].Split([FIELD_SEP]);
    // se divide todo lo separado por ' | '  nombre|tamaño | visible de cada columna
    if length(cmp) > 0 then
    begin
      var
      col := BuscarColumna(g, cmp[0]);
      // busca la columna por el nombre
      // asigna los parametros de configuracion a la columna del grid
      if Assigned(col) then
      begin
        col.Width := StrToIntDef(cmp[1], col.Width.ToString.ToInteger);
        col.Visible := cmp[2] = 'S';
        if col.Index <> cmp[3].ToInteger then
          col.Index := StrToIntDef(cmp[3], 0);
        col := nil;
      end;
    end;
  end;
end;

// para guardar la posicion de los formularios segun el perfil o lo que sea necesario
procedure GuardaFormulario(Formulario: TForm);
var
  INI: TMemIniFile;
  TX: TStringList;
begin
  INI := TMemIniFile.Create('Fichero.INI');
  TX := TStringList.Create;
  try
    with Formulario do
    begin
      INI.WriteInteger('Form', 'Top', Top);
      INI.WriteInteger('Form', 'Left', Left);
      INI.WriteInteger('Form', 'Width', Width);
      INI.WriteInteger('Form', 'Height', Height);
    end;
    INI := AgregaGridsINI(Formulario, INI);
    // agrega la parte de los grids al INI
    INI.GetStrings(TX); // lo convierto a Strings
    InsertaIniFormulario(Formulario.name, TX);
    // Guarda en FB en DIC_FORMULARIOS dentro de CONFIGURACION
  finally
    INI.Free;
    TX.Free;
  end;
end;

// para guardar la posicion de los formularios segun el perfil o lo que sea necesario
procedure GuardaFrame(Fr: TFrame);
var
  INI: TMemIniFile;
  TX: TStringList;
begin
  INI := TMemIniFile.Create('Fichero.INI');
  TX := TStringList.Create;
  try
    with Fr do
    begin
      INI.WriteInteger('Form', 'Top', Top);
      INI.WriteInteger('Form', 'Left', Left);
      INI.WriteInteger('Form', 'Width', Width);
      INI.WriteInteger('Form', 'Height', Height);
    end;
    INI := AgregaGridsINIFrame(Fr, INI);
    // agrega la parte de los grids al INI
    INI.GetStrings(TX); // lo convierto a Strings
    InsertaIniFormulario(Fr.name, TX);
    // Guarda en FB en DIC_FORMULARIOS dentro de CONFIGURACION
  finally
    INI.Free;
    TX.Free;
  end;
end;

// Inserta o updatea el ini creado en memoria de GuardaFormulario
// en la tabla DIC_FORMULARIOS
procedure InsertaIniFormulario(Nombre: string; TX: TStringList);
begin
  with DameQueryRW(nil, DMMain.DB) do
  begin
    try
      try
        SQL.Clear;
        SQL.Add(' UPDATE OR INSERT INTO DIC_FORMULARIOS ( ');
        SQL.Add(' FORMULARIO, PERFIL, CONFIGURACION) ');
        SQL.Add(' VALUES ( ');
        SQL.Add(' :FORMULARIO, :PERFIL, :CONFIGURACION) ');
        SQL.Add(' MATCHING (FORMULARIO, PERFIL) ');
        ParamByName('FORMULARIO').AsString := Nombre;
        ParamByName('CONFIGURACION').AsString := TX.Text;
        ParamByName('PERFIL').Asinteger := 0;
        ExecSQL;
        Transaction.Commit;
      except
        on E: Exception do
          ShowMessage('Error al intentar en DIC_FORMULARIOS ' + #13#10 + E.Message);
      end;
    finally
      Free;
    end;
  end;
end;

Function AgregaGridsINIFrame(Fr: TFrame; INI: TMemIniFile): TMemIniFile;
var
  Grids: string;
  Grid: TDBGrid;

begin
  result := INI;
  Grids := '';
  // buscar los Tgrid de todo el formulario

  for var i := Fr.ComponentCount - 1 downto 0 do
  begin
    if Fr.Components[i] is TDBGrid then
    if Assigned((Fr.Components[i] as TDBGrid).PopupMenu) then //si no tienen popup asingnado no se guarda
    begin
      Grid := TDBGrid(Fr.Components[i]); // encontro  alguno
      if Grid.Columns.Count > 0 then // comprueba que tenga columnas no vacio
        try
          Grids := Grids + Grid.name + ',';
          // agrega la session para grids en el ini
          INI.WriteString('Form', 'Grids', Grids);
          { INI.WriteString(Grid.name, 'FontFamily', Grid.TextSettings.Font.Family); // guarda tipo de letra
            INI.WriteString(Grid.name, 'FontColor', AlphaColorToString(Grid.TextSettings.Fontcolor)); // color
            INI.WriteBool(Grid.name, 'fsBold', TFontStyle.fsBold in Grid.TextSettings.Font.Style);
            // negrita
            INI.WriteString(Grid.name, 'FontSize', Grid.TextSettings.Font.Size.ToString); // tamaño de la letra }
          INI.WriteString(Grid.name, 'Columns', DameColumnasGrid(Grid)); //
        finally
          Grid.Free;
          result := INI;
        end;
    end;
  end;
end;

// agrega la parte de los grids al INI si estos tienen columnas
Function AgregaGridsINI(Formulario: TForm; INI: TMemIniFile): TMemIniFile;
var
  Grids: string;
  Grid: TDBGrid;

begin
  result := INI;
  Grids := '';
  // buscar los Tgrid de todo el formulario

  for var i := Formulario.ComponentCount - 1 downto 0 do
  begin
    if Formulario.Components[i] is TDBGrid then
    begin
      Grid := TDBGrid(Formulario.Components[i]); // encontro  alguno
      if Grid.Columns.Count > 0 then // comprueba que tenga columnas no vacio
        try
          Grids := Grids + Grid.name + ',';
          // agrega la session para grids en el ini
          INI.WriteString('Form', 'Grids', Grids);
          { INI.WriteString(Grid.name, 'FontFamily', Grid.TextSettings.Font.Family); // guarda tipo de letra
            INI.WriteString(Grid.name, 'FontColor', AlphaColorToString(Grid.TextSettings.Fontcolor)); // color
            INI.WriteBool(Grid.name, 'fsBold', TFontStyle.fsBold in Grid.TextSettings.Font.Style);
            // negrita
            INI.WriteString(Grid.name, 'FontSize', Grid.TextSettings.Font.Size.ToString); // tamaño de la letra
            INI.WriteString(Grid.name, 'Columns', GuardarColumnasGrid(Formulario, Grid)); // }
        finally
          Grid.Free;
          result := INI;
        end;
    end;
  end;
end;

procedure CargaIniFRame(Fr: TFrame);
var
  TX: TStringList;
  INI: TMemIniFile;
  s, Grids: string;
begin
  with DameQueryRO(nil, DMMain.DB) do
  begin
    try
      try
        s := '  select CONFIGURACION from  DIC_FORMULARIOS  ' + '  where FORMULARIO = ' + QuotedStr(Fr.name);
        SQL.Text := s;
        open;
        // Encontro el formulario
        if RecordCount > 0 then
        begin
          INI := TMemIniFile.Create('Fichero.INI');
          TX := TStringList.Create;
          TX.Text := FieldByName('CONFIGURACION').AsString;
          // llevo a Tstrings el texto del campo CONFIGURACION de DIC_FORMULARIOS
          INI.SetStrings(TX);
          // asigno parametros del INI a el Formulario
          Fr.Top := INI.ReadInteger('Form', 'Top', 100);
          Fr.Left := INI.ReadInteger('Form', 'Left', 100);
          Fr.Width := INI.ReadInteger('Form', 'Width', 0);
          Fr.Height := INI.ReadInteger('Form', 'Height', 0);
          // Leo la seccion de los Grids
          Grids := INI.ReadString('Form', 'Grids', '');
          if Trim(Grids) <> ',' then
            CargaIniGridsFrame(Fr, INI);
          TX.Free;
          INI.Free;
        end
        else
        begin
          CargaIniGridsFrame(Fr); //cargo los grids sin que esten guardados en DIC_FORMULARIOS
        end;

        // Free;
      except
        on E: Exception do
          ShowMessage('Error al intentar en DIC_FORMULARIOS ' + #13#10 + E.Message);
      end;
    finally
      close;
    end;
  end;
end;

// carga las propiedades del el formulario y los grid guardados en DIC_FORMULARIOS
procedure CargaIniFormulario(Formulario: TForm);
var
  TX: TStringList;
  INI: TMemIniFile;
  s, Grids: string;
begin
  with DameQueryRO(nil, DMMain.DB) do
  begin
    try
      try
        s := '  select CONFIGURACION from  DIC_FORMULARIOS  ' + '  where FORMULARIO = ' +
          QuotedStr('RH_' + Formulario.name);
        SQL.Text := s;
        open;
        // Encontro el formulario mio de RH_
        if RecordCount > 0 then
        begin
          INI := TMemIniFile.Create('Fichero.INI');
          TX := TStringList.Create;
          TX.Text := FieldByName('CONFIGURACION').AsString;
          // llevo a Tstrings el texto del campo CONFIGURACION de DIC_FORMULARIOS
          INI.SetStrings(TX);
          // asigno parametros del INI a el Formulario
          Formulario.Top := INI.ReadInteger('Form', 'Top', 100);
          Formulario.Left := INI.ReadInteger('Form', 'Left', 100);
          Formulario.Width := INI.ReadInteger('Form', 'Width', 0);
          Formulario.Height := INI.ReadInteger('Form', 'Height', 0);
          // Leo la seccion de los Grids
          Grids := INI.ReadString('Form', 'Grids', '');
          if Trim(Grids) <> ',' then
            CargaIniGrids(Formulario, INI);
          // si no esta vacia  cargo las configuraciones de todos
        end;
        close;
        Transaction.Commit;
      except
        on E: Exception do
          ShowMessage('Error al intentar en DIC_FORMULARIOS ' + #13#10 + E.Message);
      end;
    finally
      Free;
      INI.Free;
      TX.Free;
    end;
  end;
end;

procedure CargaIniGridsFrame(Fr: TFrame);
var
  Grid: TDBGrid;
  i: integer;
begin
  for i := Fr.ComponentCount - 1 downto 0 do
  begin
    if Fr.Components[i] is TDBGrid   then
    if Assigned((Fr.Components[i] as TDBGrid).PopupMenu) then //si No tiene popup no se guarda en DIC_FORMULARIOS
    begin
      Grid := TDBGrid(Fr.Components[i]); // encontro  algun Grid
      CargarColumnasGridOrigen(Grid);
    end;
  end;
end;

procedure CargaIniGridsFrame(Fr: TFrame; INI: TMemIniFile);
var
  Grids, Columns : string;
  Grid: TDBGrid;
  ListaGrids: tstrings;
  i: integer;
begin
  Grids := INI.ReadString('Form', 'Grids', '');
  // ListaGrids lista con  los nombres de los grid del frame ya quitando las comas
  ListaGrids := TStringList.Create;
  Assert(Assigned(ListaGrids));
  ListaGrids.Clear;
  ListaGrids.Delimiter := ',';
  ListaGrids.DelimitedText := Grids;
  for i := 0 to ListaGrids.Count - 1 do // recorro todos los grids de ListaGrids
  begin
    // encuentro el grid con ese nombre para instanciarlo en la variable grid
    Grid := TDBGrid(Fr.FindComponent(ListaGrids[i]));

    if (Assigned(Grid)) then // lo encontro en el Frame
      if Grid.Columns.Count > 0 then // tiene columnas ese grid
      begin
        // Grid.Hint := DameColumnasGrid(Grid); //guardo primero las columnas por defecto del grid
        Columns := INI.ReadString(Grid.name, 'Columns', '');
        CargarColumnasGridFrame(Fr, Grid, Columns);
        // carga la configuracion de las columnas
        Grid.Repaint;
      end;
  end;
  ListaGrids.Free;
end;

// Carga la configuracion de todos los grids del formulario
procedure CargaIniGrids(Formulario: TForm; INI: TMemIniFile);
var
  Grids, col, Columns : string;
  Grid: TDBGrid;
  ListaGrids: tstrings;
  i: integer;
begin
  Grids := INI.ReadString('Form', 'Grids', '');
  // ListaGrids lista con  los nombres de los grid del formulario ya quitando las comas
  ListaGrids := TStringList.Create;
  Assert(Assigned(ListaGrids));
  ListaGrids.Clear;
  ListaGrids.Delimiter := ',';
  ListaGrids.DelimitedText := Grids;
  for i := 0 to ListaGrids.Count - 1 do // recorro todos los grids de ListaGrids
  begin
    // encuentro el grid con ese nombre para instanciarlo en la variable grid
    Grid := TDBGrid(Formulario.FindComponent(ListaGrids[i]));

    if (Assigned(Grid)) then // lo encontro en el formulario
      if Grid.Columns.Count > 0 then // tiene columnas ese grid
      begin
        // Grid.TagString := GuardarColumnasGrid(Formulario,Grid); //guardo primero las columnas por defecto del grid en el tagstring
        // asigno propiedades del ini
        // tipo de letra
        // Grid.TextSettings.Font.Family := INI.ReadString(Grid.name, 'FontFamily', '');
        // color de la letra del grid da error porque no se bien como guardar el color convertido a texto
        col := INI.ReadString(Grid.name, 'FontColor', '');
        if col <> 'Null' then
          // Grid.TextSettings.Fontcolor := StringToAlphaColor(col);
          // Negrita
          if INI.ReadBool(Grid.name, 'fsBold', false) then
            // Grid.TextSettings.Font.Style := [TFontStyle.fsBold]
          else
            // Grid.TextSettings.Font.Style := [];
            // tamaño de la letra
            // Grid.TextSettings.Font.Size := INI.ReadInteger(Grid.name, 'FontSize', 0);
            // ListaColumnas lista de todas las colunnas sin la coma ColumnName es la lista del INI con comas
            Columns := INI.ReadString(Grid.name, 'Columns', '');
        CargarColumnasGrid(Formulario, Grid, Columns);
        // carga la configuracion de las columnas
        Grid.Repaint;
      end;
  end;
  ListaGrids.Free;
end;

end.
