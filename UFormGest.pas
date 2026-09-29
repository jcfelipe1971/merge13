unit UFormGest;

// Gestión de ventanas y módulos de datos con la misma API que Merge (AbreForm, CierraForm, AbreData...),
// mostrando los formularios al estilo MaxFactu: en una pestaña del formulario principal o en ventana.

interface

uses
  System.SysUtils, System.Classes, Vcl.Forms, Vcl.Controls, Vcl.ComCtrls;

procedure AbreForm(Clase: TFormClass; var Referencia; Sender: TObject = nil);
procedure AbreFormVarias(Clase: TFormClass; var Referencia; Sender: TObject = nil);
procedure CierraForm(var Form);
procedure AbreData(Clase: TComponentClass; var Referencia);
procedure AbreDataVarias(Clase: TComponentClass; var Referencia; Padre: TComponent);
procedure CierraData(var DModuloPar);
function EstructuraCreada: Boolean;
// Navegador HY de Merge (EditaControl / InsertaControl): pone el foco en el control si se puede
procedure EnfocaControl(Control: TWinControl);

implementation

uses
  Data.DB, FireDAC.Comp.Client, UFMain, UDMMain, UEntorno;

type
  // Vigila un formulario: cuando se destruye pone a nil su variable global (FMProveedores...) y quita su pestaña
  TVigia = class(TComponent)
  private
    FForm: TForm;
    FRef: PPointer;
    FTab: TTabSheet;
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  end;

procedure TVigia.Notification(AComponent: TComponent; Operation: TOperation);
var
  Tab: TTabSheet;
begin
  inherited;
  if (Operation = opRemove) and (AComponent = FTab) then
    FTab := nil;   // la pestaña se ha liberado antes que el formulario
  if (Operation = opRemove) and (AComponent = FForm) then
  begin
    if (FRef <> nil) and (FRef^ = Pointer(FForm)) then
      FRef^ := nil;
    Tab := FTab;
    FTab := nil;
    if Tab <> nil then
      TThread.ForceQueue(nil, procedure begin Tab.Free; end);
    TThread.ForceQueue(nil, procedure begin Self.Free; end);
  end;
end;

procedure Muestra(F: TForm; Sender: TObject; Ref: PPointer);
var
  Tab: TTabSheet;
  V: TVigia;
begin
  V := TVigia.Create(nil);
  V.FForm := F;
  V.FRef := Ref;
  F.FreeNotification(V);
  if (FMain = nil) or FMain.AbrirEnVentana(Sender) then
  begin
    if (FMain <> nil) and FMain.EnlaceModal then
      F.ShowModal
    else
      F.Show;
  end
  else
  begin
    // Dentro de una pestaña del formulario principal (como los módulos de MaxFactu)
    Tab := TTabSheet.Create(FMain.PCMain);
    Tab.PageControl := FMain.PCMain;
    Tab.Caption := F.Caption;
    V.FTab := Tab;
    Tab.FreeNotification(V);
    F.BorderStyle := bsNone;
    F.Parent := Tab;
    F.Align := alClient;
    F.Visible := True;
    FMain.PCMain.ActivePage := Tab;
  end;
end;

procedure AbreForm(Clase: TFormClass; var Referencia; Sender: TObject);
var
  F: TForm;
begin
  // Una sola instancia por clase, como en Merge: si ya está abierta se trae al frente
  F := TForm(Referencia);
  if F <> nil then
  begin
    if F.Parent is TTabSheet then
      FMain.PCMain.ActivePage := TTabSheet(F.Parent)
    else
    begin
      F.Show;
      F.BringToFront;
    end;
    Exit;
  end;
  F := Clase.Create(Application);
  TForm(Referencia) := F;
  Muestra(F, Sender, @Referencia);
end;

procedure AbreFormVarias(Clase: TFormClass; var Referencia; Sender: TObject);
begin
  TForm(Referencia) := Clase.Create(Application);
  Muestra(TForm(Referencia), Sender, nil);
end;

procedure CierraForm(var Form);
begin
  if TForm(Form) <> nil then
    TForm(Form).Close;
end;

procedure AbreData(Clase: TComponentClass; var Referencia);
begin
  // Módulo compartido con contador de uso en Tag (igual que Merge)
  if TComponent(Referencia) <> nil then
  begin
    TComponent(Referencia).Tag := TComponent(Referencia).Tag + 1;
    Exit;
  end;
  TComponent(Referencia) := Clase.Create(Application);
  TComponent(Referencia).Tag := 0;
end;

procedure AbreDataVarias(Clase: TComponentClass; var Referencia; Padre: TComponent);
begin
  TComponent(Referencia) := Clase.Create(Padre);
end;

procedure CierraModuloDatos(DM: TComponent);
// Antes de destruir un módulo de datos se cierran sus consultas y se terminan sus transacciones activas.
// Si se destruye con transacciones abiertas (p.ej. TLocal.StartTransaction de Merge), la conexión compartida de
// FireDAC puede quedar con referencias a objetos ya liberados y fallar al volver a abrir el módulo.
var
  i: Integer;
begin
  for i := 0 to DM.ComponentCount - 1 do
    if DM.Components[i] is TDataSet then
      try
        TDataSet(DM.Components[i]).Close;
      except
      end;
  for i := 0 to DM.ComponentCount - 1 do
    if (DM.Components[i] is TFDTransaction) and TFDTransaction(DM.Components[i]).Active then
      try
        if TFDTransaction(DM.Components[i]).Options.ReadOnly then
          TFDTransaction(DM.Components[i]).Commit
        else
          TFDTransaction(DM.Components[i]).Rollback;
      except
      end;
end;

procedure CierraData(var DModuloPar);
var
  DM: TComponent;
begin
  DM := TComponent(DModuloPar);
  if (DM = nil) or (csDestroying in DM.ComponentState) then
    Exit;
  if DM.Owner <> Application then
    Exit;  // los de AbreDataVarias los libera su formulario
  DM.Tag := DM.Tag - 1;
  if DM.Tag < 0 then
  begin
    TComponent(DModuloPar) := nil;
    CierraModuloDatos(DM);
    DM.Free;
  end;
end;

function EstructuraCreada: Boolean;
begin
  Result := Assigned(DMMain) and DMMain.BDConectada and (Entorno.Entrada <> 0);
end;

procedure EnfocaControl(Control: TWinControl);
begin
  if Assigned(Control) and Control.CanFocus then
    Control.SetFocus;
end;

end.
