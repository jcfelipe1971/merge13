object FMImportador: TFMImportador
  Left = 0
  Top = 0
  Caption = 'Importador de Merge'
  ClientHeight = 600
  ClientWidth = 1000
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object PTop: TPanel
    Left = 0
    Top = 0
    Width = 1000
    Height = 64
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object LMerge: TLabel
      Left = 8
      Top = 10
      Width = 120
      Height = 15
      Caption = 'Carpeta de Merge (D6)'
    end
    object LProyecto: TLabel
      Left = 8
      Top = 38
      Width = 120
      Height = 15
      Caption = 'Proyecto Merge13'
    end
    object EMerge: TEdit
      Left = 140
      Top = 6
      Width = 520
      Height = 23
      TabOrder = 0
    end
    object BMerge: TButton
      Left = 664
      Top = 5
      Width = 30
      Height = 25
      Caption = '...'
      TabOrder = 1
      OnClick = BMergeClick
    end
    object EProyecto: TEdit
      Left = 140
      Top = 34
      Width = 520
      Height = 23
      TabOrder = 2
    end
    object BProyecto: TButton
      Left = 664
      Top = 33
      Width = 30
      Height = 25
      Caption = '...'
      TabOrder = 3
      OnClick = BProyectoClick
    end
    object CBSinTeeChart: TCheckBox
      Left = 712
      Top = 36
      Width = 270
      Height = 17
      Caption = 'Sin TeeChart (gr'#225'ficos como panel)'
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
  end
  object PC: TPageControl
    Left = 0
    Top = 64
    Width = 1000
    Height = 516
    ActivePage = TSModulos
    Align = alClient
    TabOrder = 1
    object TSModulos: TTabSheet
      Caption = 'M'#243'dulos'
      object SPModulos: TSplitter
        Left = 420
        Top = 0
        Height = 445
      end
      object TVModulos: TTreeView
        Left = 0
        Top = 0
        Width = 420
        Height = 445
        Align = alLeft
        CheckBoxes = True
        Indent = 19
        ReadOnly = True
        TabOrder = 0
        OnMouseUp = TVMouseUp
      end
      object MLog: TMemo
        Left = 423
        Top = 0
        Width = 569
        Height = 445
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 1
        WordWrap = False
      end
      object PBotonesModulos: TPanel
        Left = 0
        Top = 445
        Width = 992
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        object BCargarModulos: TButton
          Left = 8
          Top = 8
          Width = 130
          Height = 25
          Caption = 'Cargar m'#243'dulos'
          TabOrder = 0
          OnClick = BCargarModulosClick
        end
        object BMarcarNada: TButton
          Left = 144
          Top = 8
          Width = 110
          Height = 25
          Caption = 'Desmarcar todo'
          TabOrder = 1
          OnClick = BMarcarNadaClick
        end
        object BImportar: TButton
          Left = 260
          Top = 8
          Width = 160
          Height = 25
          Caption = 'Importar marcados'
          TabOrder = 2
          OnClick = BImportarClick
        end
      end
    end
    object TSListados: TTabSheet
      Caption = 'Listados (FastReport)'
      ImageIndex = 1
      object SPListados: TSplitter
        Left = 420
        Top = 64
        Height = 381
      end
      object PListados: TPanel
        Left = 0
        Top = 0
        Width = 992
        Height = 64
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object LListados: TLabel
          Left = 8
          Top = 10
          Width = 120
          Height = 15
          Caption = 'Listados de Merge'
        end
        object LDestino: TLabel
          Left = 8
          Top = 38
          Width = 120
          Height = 15
          Caption = 'Carpeta destino'
        end
        object EListados: TEdit
          Left = 140
          Top = 6
          Width = 520
          Height = 23
          TabOrder = 0
        end
        object BListados: TButton
          Left = 664
          Top = 5
          Width = 30
          Height = 25
          Caption = '...'
          TabOrder = 1
          OnClick = BListadosClick
        end
        object EDestino: TEdit
          Left = 140
          Top = 34
          Width = 520
          Height = 23
          TabOrder = 2
        end
        object BDestino: TButton
          Left = 664
          Top = 33
          Width = 30
          Height = 25
          Caption = '...'
          TabOrder = 3
          OnClick = BDestinoClick
        end
      end
      object TVListados: TTreeView
        Left = 0
        Top = 64
        Width = 420
        Height = 381
        Align = alLeft
        CheckBoxes = True
        Indent = 19
        ReadOnly = True
        TabOrder = 1
        OnMouseUp = TVMouseUp
      end
      object MLogFR: TMemo
        Left = 423
        Top = 64
        Width = 569
        Height = 381
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 2
        WordWrap = False
      end
      object PBotonesListados: TPanel
        Left = 0
        Top = 445
        Width = 992
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 3
        object BCargarListados: TButton
          Left = 8
          Top = 8
          Width = 130
          Height = 25
          Caption = 'Cargar listados'
          TabOrder = 0
          OnClick = BCargarListadosClick
        end
        object BConvertir: TButton
          Left = 144
          Top = 8
          Width = 180
          Height = 25
          Caption = 'Convertir marcados'
          TabOrder = 1
          OnClick = BConvertirClick
        end
      end
    end
  end
  object LEstado: TLabel
    Left = 0
    Top = 580
    Width = 1000
    Height = 20
    Align = alBottom
    AutoSize = False
    Caption = ' '
  end
end
