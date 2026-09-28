object FPEditSinNavegador: TFPEditSinNavegador
  Left = 0
  Top = 0
  Caption = 'FPEditSinNavegador'
  ClientHeight = 480
  ClientWidth = 780
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poDefaultPosOnly
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  TextHeight = 15
  object TBMain: TToolBar
    Left = 0
    Top = 0
    Width = 780
    Height = 29
    TabOrder = 0
  end
  object PMain: TPanel
    Left = 0
    Top = 29
    Width = 780
    Height = 420
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
  end
  object TBActions: TPanel
    Left = 0
    Top = 449
    Width = 780
    Height = 31
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
  end
  object ALMain: TActionList
    Left = 704
    Top = 40
  end
end
