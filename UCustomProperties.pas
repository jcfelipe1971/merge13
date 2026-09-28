unit UCustomProperties;

interface

uses
  System.Generics.Collections;

type
  TCustomProperties = class
  private
    FProperties: TDictionary<string, Variant>;
  public
    constructor Create;
    destructor Destroy; override;
    procedure SetProperty(const AName: string; const AValue: Variant);
    function GetProperty(const AName: string): Variant;
  end;

implementation

constructor TCustomProperties.Create;
begin
  FProperties := TDictionary<string, Variant>.Create;
end;

destructor TCustomProperties.Destroy;
begin
  FProperties.Free;
  inherited;
end;

procedure TCustomProperties.SetProperty(const AName: string; const AValue: Variant);
begin
  FProperties.AddOrSetValue(AName, AValue);
end;

function TCustomProperties.GetProperty(const AName: string): Variant;
begin
  if not FProperties.TryGetValue(AName, Result) then
    Result := '';
end;

end.

