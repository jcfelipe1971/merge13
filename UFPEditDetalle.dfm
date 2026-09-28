inherited FPEditDetalle: TFPEditDetalle
  inherited PMain: TPanel
    StyleElements = [seFont, seClient, seBorder]
    object Splitter1: TSplitter [0]
      Left = 1
      Top = 209
      Width = 638
      Height = 8
      Cursor = crVSplit
      Align = alBottom
    end
    inherited PCMain: TPageControl
      Height = 208
      ExplicitHeight = 208
      inherited TSTabla: TTabSheet
        ExplicitHeight = 178
        inherited DBGMain: TDBGrid
          Height = 147
        end
        inherited PTotales: TPanel
          Top = 147
          StyleElements = [seFont, seClient, seBorder]
          ExplicitTop = 147
          inherited CBTotales: TComboBox
            StyleElements = [seFont, seClient, seBorder]
          end
        end
      end
      inherited TSFicha: TTabSheet
        ImageIndex = 1
        ExplicitHeight = 178
        inherited PEdit: TScrollBox
          Height = 178
          ExplicitHeight = 178
        end
      end
    end
    object PDetalle: TPanel
      Left = 1
      Top = 217
      Width = 638
      Height = 202
      Align = alBottom
      TabOrder = 1
      object TBDetalle: TToolBar
        Left = 1
        Top = 1
        Width = 636
        Height = 29
        TabOrder = 0
        object NavDetalle: TDBNavigator
          Left = 0
          Top = 0
          Width = 240
          Height = 22
          DataSource = DSDetalle
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
        end
      end
      object DBGFDetalle: TDBGrid
        Left = 1
        Top = 30
        Width = 636
        Height = 140
        Align = alClient
        DataSource = DSDetalle
        PopupMenu = PMDetalle
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnTitleClick = DBGDetalleTitleClick
      end
      object PTotalesDetalle: TPanel
        Left = 1
        Top = 170
        Width = 636
        Height = 31
        Align = alBottom
        TabOrder = 2
        Visible = False
        object CBTotalesDetalle: TComboBox
          AlignWithMargins = True
          Left = 500
          Top = 4
          Width = 132
          Height = 23
          Align = alRight
          Style = csDropDownList
          TabOrder = 0
          Visible = False
          OnChange = CBTotalesDetalleChange
        end
      end
    end
  end
  inherited TBMain: TToolBar
    inherited NavMain: TDBNavigator
      Hints.Strings = ()
    end
    inherited PFiltrar: TPanel
      StyleElements = [seFont, seClient, seBorder]
      inherited LCantidadFiltrados: TLabel
        StyleElements = [seFont, seClient, seBorder]
      end
      inherited EFiltrar: TEdit
        StyleElements = [seFont, seClient, seBorder]
      end
    end
  end
  inherited TBActions: TPanel
    StyleElements = [seFont, seClient, seBorder]
  end
  object DSDetalle: TDataSource
    Left = 536
    Top = 80
  end
  object PMDetalle: TPopupMenu
    Left = 461
    Top = 184
    object MIConfigurarColumnasDetalle: TMenuItem
      Caption = 'Configurar Columnas'
      OnClick = MIConfigurarColumnasDetalleClick
    end
    object MenuItem2: TMenuItem
      Caption = '-'
    end
    object MICopiarDetalle: TMenuItem
      Caption = 'Copiar'
      OnClick = MICopiarDetalleClick
    end
  end
end
