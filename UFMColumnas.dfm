object FMColumnas: TFMColumnas
  Left = 0
  Top = 0
  Caption = 'Columnas del Grid'
  ClientHeight = 497
  ClientWidth = 473
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 15
  object PPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 473
    Height = 497
    Align = alClient
    ParentBackground = False
    TabOrder = 0
    object PCabecera: TPanel
      Left = 1
      Top = 1
      Width = 471
      Height = 64
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object LCabecera: TLabel
        AlignWithMargins = True
        Left = 10
        Top = 10
        Width = 451
        Height = 44
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alClient
        Alignment = taCenter
        Caption = 'Columnas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitWidth = 88
        ExplicitHeight = 25
      end
      object CBSeleccionarTodo: TCheckBox
        Left = 24
        Top = 24
        Width = 121
        Height = 17
        Caption = 'Seleccionar Todo'
        TabOrder = 0
        OnClick = CBSeleccionarTodoClick
      end
    end
    object BAceptar: TButton
      AlignWithMargins = True
      Left = 6
      Top = 447
      Width = 461
      Height = 44
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alBottom
      Caption = 'Aceptar'
      ModalResult = 1
      TabOrder = 1
    end
    object LVColumnas: TListView
      Left = 1
      Top = 65
      Width = 471
      Height = 377
      Align = alClient
      Checkboxes = True
      Columns = <>
      RowSelect = True
      ShowColumnHeaders = False
      TabOrder = 2
      ViewStyle = vsTile
      OnMouseDown = LVColumnasMouseDown
    end
  end
end
