unit UFPEditSimple;

// Ventana con navegador de datos (en Merge: TFPEditSimple). Estilo MaxFactu: TDBNavigator en la barra superior.

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFPEditSinNavegador, Vcl.ToolWin, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.DBCtrls,
  Data.DB, Vcl.Buttons, Vcl.StdCtrls, System.Actions, Vcl.ActnList;

type
  TFPEditSimple = class(TFPEditSinNavegador)
    NavMain: TDBNavigator;
    TSepNav: TToolButton;
    TSepTerc: TToolButton;
    TbuttComp: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  end;

var
  FPEditSimple: TFPEditSimple;

implementation

{$R *.dfm}

procedure TFPEditSimple.FormCreate(Sender: TObject);
begin
  inherited;
  NavMain.Hints.Text := 'Primero' + sLineBreak + 'Anterior' + sLineBreak + 'Siguiente' + sLineBreak + 'Último' +
    sLineBreak + 'Insertar' + sLineBreak + 'Eliminar' + sLineBreak + 'Editar' + sLineBreak + 'Guardar' + sLineBreak +
    'Cancelar' + sLineBreak + 'Refrescar' + sLineBreak + 'Aplicar Cambios' + sLineBreak + 'Cancelar Cambios';
end;

procedure TFPEditSimple.FormActivate(Sender: TObject);
begin
  // en Merge activaba el navegador G2K de la ventana activa; el TDBNavigator no lo necesita
end;

procedure TFPEditSimple.FormShow(Sender: TObject);
begin
  inherited;
end;

end.
