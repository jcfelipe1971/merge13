object FMEspera: TFMEspera
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Mensajes'
  ClientHeight = 190
  ClientWidth = 322
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object PPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 322
    Height = 190
    Align = alClient
    ParentBackground = False
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = 24
    ExplicitWidth = 500
    ExplicitHeight = 250
    object LCabecera: TLabel
      Left = 1
      Top = 1
      Width = 320
      Height = 33
      Margins.Left = 20
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 10
      Align = alTop
      Alignment = taCenter
      Caption = 'Prueba de Texto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object LabelGlobalSpeed: TLabel
      Left = 1
      Top = 106
      Width = 320
      Height = 25
      Margins.Left = 20
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 10
      Align = alBottom
      Alignment = taCenter
      Caption = 'Prueba de Texto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitTop = 1
      ExplicitWidth = 145
    end
    object ActivityIndicator1: TActivityIndicator
      Left = 137
      Top = 63
    end
    object BCancelar: TButton
      Left = 1
      Top = 156
      Width = 320
      Height = 33
      Margins.Left = 20
      Margins.Top = 5
      Margins.Bottom = 5
      Align = alBottom
      Caption = 'Cancelar'
      ModalResult = 2
      TabOrder = 1
      ExplicitTop = 216
    end
    object ProgressBarDownload: TProgressBar
      AlignWithMargins = True
      Left = 4
      Top = 134
      Width = 314
      Height = 17
      Margins.Bottom = 5
      Align = alBottom
      TabOrder = 2
      ExplicitLeft = 104
      ExplicitTop = 144
      ExplicitWidth = 150
    end
  end
end
