object FMFiltrar: TFMFiltrar
  Left = 0
  Top = 0
  Caption = 'Filtrar'
  ClientHeight = 537
  ClientWidth = 785
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnActivate = FormActivate
  OnDestroy = FormDestroy
  TextHeight = 15
  object SBFondo: TScrollBox
    Left = 0
    Top = 0
    Width = 785
    Height = 496
    Align = alClient
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 496
    Width = 785
    Height = 41
    Align = alBottom
    TabOrder = 1
    object Button1: TButton
      AlignWithMargins = True
      Left = 679
      Top = 4
      Width = 75
      Height = 33
      Margins.Right = 30
      Align = alRight
      Caption = 'Cerrar'
      ModalResult = 1
      TabOrder = 0
    end
    object BTAplicarFiltro: TButton
      AlignWithMargins = True
      Left = 11
      Top = 4
      Width = 89
      Height = 33
      Margins.Left = 10
      Align = alLeft
      Caption = 'Aplicar Filtro'
      TabOrder = 1
      OnClick = BTAplicarFiltroClick
    end
    object BTQuitarFiltro: TButton
      AlignWithMargins = True
      Left = 113
      Top = 4
      Width = 89
      Height = 33
      Margins.Left = 10
      Align = alLeft
      Caption = 'Quitar Filtro'
      TabOrder = 2
      OnClick = BTQuitarFiltroClick
    end
  end
end
