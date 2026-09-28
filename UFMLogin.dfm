object FMLogin: TFMLogin
  Left = 0
  Top = 0
  ActiveControl = EClave
  BorderStyle = bsNone
  Caption = 'Login'
  ClientHeight = 193
  ClientWidth = 291
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
    Top = 26
    Width = 291
    Height = 167
    Align = alClient
    TabOrder = 1
    object LClave: TLabel
      Left = 36
      Top = 71
      Width = 60
      Height = 15
      Caption = 'Contrase'#241'a'
    end
    object LUsuario: TLabel
      Left = 56
      Top = 34
      Width = 40
      Height = 15
      Caption = 'Usuario'
    end
    object Shape1: TShape
      Left = 13
      Top = 112
      Width = 260
      Height = 1
    end
    object BAceptar: TButton
      Left = 174
      Top = 125
      Width = 75
      Height = 25
      Caption = 'Aceptar'
      ModalResult = 1
      TabOrder = 1
      OnClick = BAceptarClick
    end
    object BCancelar: TButton
      Left = 36
      Top = 125
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      ModalResult = 2
      TabOrder = 2
    end
    object EClave: TEdit
      Left = 128
      Top = 68
      Width = 121
      Height = 23
      PasswordChar = '*'
      TabOrder = 0
      OnKeyPress = EClaveKeyPress
    end
    object EUsuario: TEdit
      Left = 128
      Top = 31
      Width = 121
      Height = 23
      TabOrder = 3
    end
  end
  object PCabecera: TPanel
    Left = 0
    Top = 0
    Width = 291
    Height = 26
    Align = alTop
    Caption = 'Entrada de Usuario'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
end
