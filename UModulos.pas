unit UModulos;

// Registro de módulos convertidos de Merge.
// Cada módulo convertido se registra en su sección initialization:
//   RegistraModulo('AProveedores', TFMProveedores, @FMProveedores, 'FiltraProveedores');
// y la acción del mismo nombre de FMain pasa a abrirlo (en pestaña o ventana) y aparece en el menú.

interface

uses
  System.SysUtils, System.Classes, System.Generics.Collections, Vcl.Forms, Vcl.ActnList;

procedure RegistraModulo(const Accion: string; Clase: TFormClass; Referencia: PPointer;
  const MetodoFiltro: string = '');
procedure AsignaModulos(Main: TForm);
function ModuloRegistrado(const Accion: string): Boolean;

implementation

uses
  System.Rtti, UFormGest, UFMain;

type
  TModulo = record
    Clase: TFormClass;
    Referencia: PPointer;
    MetodoFiltro: string;
  end;

  TEjecutor = class
    procedure Ejecuta(Sender: TObject);
  end;

var
  Modulos: TDictionary<string, TModulo>;
  Ejecutor: TEjecutor;

procedure RegistraModulo(const Accion: string; Clase: TFormClass; Referencia: PPointer; const MetodoFiltro: string);
var
  M: TModulo;
begin
  M.Clase := Clase;
  M.Referencia := Referencia;
  M.MetodoFiltro := MetodoFiltro;
  Modulos.AddOrSetValue(UpperCase(Accion), M);
end;

function ModuloRegistrado(const Accion: string): Boolean;
begin
  Result := Modulos.ContainsKey(UpperCase(Accion));
end;

procedure AsignaModulos(Main: TForm);
var
  Par: TPair<string, TModulo>;
  C: TComponent;
begin
  for Par in Modulos do
  begin
    C := Main.FindComponent(Par.Key);
    if C is TAction then
      TAction(C).OnExecute := Ejecutor.Ejecuta;
  end;
end;

procedure TEjecutor.Ejecuta(Sender: TObject);
// Lo mismo que hacían las acciones de FMain en Merge: AbreForm(TFMxxx, FMxxx, Sender) y FMxxx.FiltraXxx(FiltroAccion)
var
  M: TModulo;
  F: TForm;
  Ctx: TRttiContext;
  Met: TRttiMethod;
begin
  if not Modulos.TryGetValue(UpperCase(TComponent(Sender).Name), M) then
    Exit;
  AbreForm(M.Clase, M.Referencia^, Sender);
  F := TForm(M.Referencia^);
  if (F <> nil) and (M.MetodoFiltro <> '') and not FMain.EnlaceModal then
  begin
    Met := Ctx.GetType(F.ClassType).GetMethod(M.MetodoFiltro);
    if Met <> nil then
      Met.Invoke(F, [FMain.FiltroAccion]);
  end;
end;

initialization
  Modulos := TDictionary<string, TModulo>.Create;
  Ejecutor := TEjecutor.Create;

finalization
  Modulos.Free;
  Ejecutor.Free;

end.
