unit UDateTimePickerHelper;

interface

uses
  System.Classes, System.Generics.Collections, Vcl.ComCtrls, Data.DB, System.SysUtils, Vcl.Controls;

type
  TDateTimePickerHelper = class helper for TDateTimePicker
  private
    function GetDataSource: TDataSource;
    procedure SetDataSource(const Value: TDataSource);
    function GetDataField: string;
    procedure SetDataField(const Value: string);
  public
    procedure BindToData(ADataSource: TDataSource; const AFieldName: string);
    procedure UnbindData;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property DataField: string read GetDataField write SetDataField;
    procedure InternalUpdateData;
  end;

implementation

type
  TDateTimePickerDataLink = class(TDataLink)
  private
    FPicker: TDateTimePicker;
    FFieldName: string;
    FUpdatingControl: Boolean;
    function GetField: TField;
  protected
    procedure RecordChanged(Field: TField); override;
    procedure UpdateData; override;
  public
    constructor Create(APicker: TDateTimePicker);
    property FieldName: string read FFieldName write FFieldName;
    property Field: TField read GetField;
  end;

var
  DateTimePickerLinks: TDictionary<TDateTimePicker, TDateTimePickerDataLink>;

  { TDateTimePickerDataLink }

function TDateTimePickerDataLink.GetField: TField;
begin
  Result := nil;
  if (DataSource <> nil) and (DataSource.DataSet <> nil) and (FFieldName <> '') then
  begin
    Result := DataSource.DataSet.FindField(FFieldName);
  end;
end;

constructor TDateTimePickerDataLink.Create(APicker: TDateTimePicker);
begin
  inherited Create;
  FPicker := APicker;
end;

procedure TDateTimePickerDataLink.RecordChanged(Field: TField);
var
  F: TField;
begin
  if FUpdatingControl then
  Exit;

  if Assigned(FPicker) then
  begin
    F := Self.Field;
    if (F <> nil) and (not F.IsNull) then
     begin
      FPicker.format := 'dd/MM/yyyy ';
      FPicker.Date := F.AsDateTime;
     end
    else
     begin
      FPicker.DateTime := 0; // Fecha cero (30/12/1899)
      FPicker.format := ' '; // Formato en blanco
     end;
  end;
end;

procedure TDateTimePickerDataLink.UpdateData;
var
  F: TField;
begin
  if Assigned(FPicker) then
  begin
    F := Self.Field;
    if (F <> nil) then
      if Assigned(Self.DataSet) then
      begin
        if FormatDateTime('dd/MM/yyyy',F.AsDateTime) <> FormatDateTime('dd/MM/yyyy',FPicker.DateTime)   then
         Self.DataSet.edit;//Trato de editar
        if Self.DataSet.State in [dsEdit] then // A lo mejor se hace un cancel del edit porque no se puede editar la cabecera
         begin
          if FPicker.DateTime = 0  then
           f.Clear
          else
           F.AsDateTime := FPicker.Date //Si no se hace ningun Cancel, se puede editar el campo fecha
         end
        else
          FPicker.Date := F.AsDateTime ; //Aqui es que si se ejecurto un Cancel del DataSet.edit entonces vuelvo a poner la fecha que estaba

      end;
  end;
end;

{ TDateTimePickerHelper }

procedure TDateTimePickerHelper.BindToData(ADataSource: TDataSource; const AFieldName: string);
var
  Link: TDateTimePickerDataLink;
begin
  UnbindData; // Limpiar si ya existía algo

  Link := TDateTimePickerDataLink.Create(Self);
  Link.DataSource := ADataSource;
  Link.FieldName := AFieldName;

  if not Assigned(DateTimePickerLinks) then
    DateTimePickerLinks := TDictionary<TDateTimePicker, TDateTimePickerDataLink>.Create;

  DateTimePickerLinks.Add(Self, Link);

  if Assigned(Link.FPicker) and Assigned(ADataSource.DataSet) then
    Link.FPicker.DateTime := ADataSource.DataSet.FieldByName(AFieldName).AsDateTime;
end;

function TDateTimePickerHelper.GetDataField: string;
var
  Link: TDateTimePickerDataLink;
begin
  Result := '';
  if Assigned(DateTimePickerLinks) and DateTimePickerLinks.TryGetValue(Self, Link) then
    Result := Link.FieldName;
end;

function TDateTimePickerHelper.GetDataSource: TDataSource;
var
  Link: TDateTimePickerDataLink;
begin
  Result := nil;
  if Assigned(DateTimePickerLinks) and DateTimePickerLinks.TryGetValue(Self, Link) then
    Result := Link.DataSource;
end;

procedure TDateTimePickerHelper.InternalUpdateData;
var
  Link: TDateTimePickerDataLink;
begin
  if Assigned(DateTimePickerLinks) and DateTimePickerLinks.TryGetValue(Self, Link) then
  begin
    Link.FUpdatingControl := True;
    try
      Link.UpdateData;
    finally
      Link.FUpdatingControl := False;
    end;
  end;
end;

procedure TDateTimePickerHelper.SetDataField(const Value: string);
var
  Link: TDateTimePickerDataLink;
begin
  if Assigned(DateTimePickerLinks) and DateTimePickerLinks.TryGetValue(Self, Link) then
    Link.FieldName := Value;
end;

procedure TDateTimePickerHelper.SetDataSource(const Value: TDataSource);
var
  Link: TDateTimePickerDataLink;
begin
  if Assigned(DateTimePickerLinks) and DateTimePickerLinks.TryGetValue(Self, Link) then
    Link.DataSource := Value;
end;

procedure TDateTimePickerHelper.UnbindData;
var
  Link: TDateTimePickerDataLink;
begin
  if Assigned(DateTimePickerLinks) then
  begin
    if DateTimePickerLinks.TryGetValue(Self, Link) then
    begin
      DateTimePickerLinks.Remove(Self);
      Link.Free;
    end;
  end;
end;

initialization

DateTimePickerLinks := TDictionary<TDateTimePicker, TDateTimePickerDataLink>.Create;

finalization

FreeAndNil(DateTimePickerLinks);

end.
