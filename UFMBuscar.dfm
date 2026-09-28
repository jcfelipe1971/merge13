object FMBuscar: TFMBuscar
  Left = 0
  Top = 0
  Caption = 'Buscar'
  ClientHeight = 444
  ClientWidth = 627
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  TextHeight = 15
  object EBusqueda: TEdit
    Left = 8
    Top = 8
    Width = 608
    Height = 23
    TabOrder = 0
    OnChange = EBusquedaChange
    OnKeyDown = EBusquedaKeyDown
  end
  object DBGrid: TDBGrid
    Left = 8
    Top = 37
    Width = 608
    Height = 364
    DataSource = DS
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = DBGridDblClick
  end
  object btnAceptar: TButton
    Left = 216
    Top = 408
    Width = 75
    Height = 25
    Caption = '&Ok'
    ModalResult = 1
    TabOrder = 2
    OnClick = btnAceptarClick
  end
  object btnCancelar: TButton
    Left = 336
    Top = 407
    Width = 75
    Height = 25
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 3
    OnClick = btnCancelarClick
  end
  object TimerBusqueda: TTimer
    Interval = 125
    OnTimer = TimerBusquedaTimer
    Left = 304
    Top = 224
  end
  object DS: TDataSource
    DataSet = FDQueryBuscar
    Left = 560
    Top = 72
  end
  object FDQueryBuscar: TFDQuery
    Left = 560
    Top = 16
  end
end
