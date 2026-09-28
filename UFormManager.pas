unit UFormManager;

interface

uses
  System.Generics.Collections, Vcl.Forms, Vcl.Controls, System.Classes;

type
  TFormManager = class
  private
    FFormList: TList<TForm>;
  public
    constructor Create;
    destructor Destroy; override;

    procedure DeleteForm(AForm: TForm);
    procedure DestroyForms;
    function DeleteFrameByName(AName: string): boolean;
    function AddForm(AForm: TForm): Integer;
    function GetFormByIndex(Index: Integer): TForm;
    function GetFormByName(AName: string): TForm;
    function Count: Integer;
    function GetIndexByForm(AForm: TForm): Integer;
    function GetIndexByName(AName: string): Integer;
  end;

implementation

constructor TFormManager.Create;
begin
  inherited Create;
  FFormList := TList<TForm>.Create;
end;

destructor TFormManager.Destroy;
begin
  DestroyForms;
  FFormList.Free;
  inherited Destroy;
end;

function TFormManager.AddForm(AForm: TForm): Integer;
begin
  if FFormList.IndexOf(AForm) = -1 then
    FFormList.Add(AForm);

  Result := FFormList.IndexOf(AForm);
end;

procedure TFormManager.DeleteForm(AForm: TForm);
begin
  if FFormList.IndexOf(AForm) <> -1 then
    FFormList[FFormList.IndexOf(AForm)].Free;
end;

function TFormManager.DeleteFrameByName(AName: string): boolean;
begin
  Result := false;
  for var i := 0 to FFormList.Count - 1 do
    if FFormList[i].Name = AName then
    begin
      try
        FFormList[i].Free;
        FFormList.Delete(i);
      finally
        Result := True;
      end;

      Exit;
    end;
end;

function TFormManager.GetIndexByForm(AForm: TForm): Integer;
begin
  Result := FFormList.IndexOf(AForm);
end;

procedure TFormManager.DestroyForms;
begin
  while FFormList.Count > 0 do
  begin
    FFormList[0].Free;
    FFormList.Delete(0);
  end;
end;

function TFormManager.GetFormByIndex(Index: Integer): TForm;
begin
  Result := FFormList[Index];
end;

function TFormManager.GetFormByName(AName: string): TForm;
begin
  Result := nil;
  for var i := 0 to FFormList.Count - 1 do
    if FFormList[i].Name = AName then
    begin
      Result := FFormList[i];
      Exit;
    end;
end;

function TFormManager.GetIndexByName(AName: string): Integer;
begin
  Result := -1;
  for var i := 0 to FFormList.Count - 1 do
    if FFormList[i].Name = AName then
    begin
      Result := i;
      Exit;
    end;
end;

function TFormManager.Count: Integer;
begin
  Result := FFormList.Count;
end;

end.
