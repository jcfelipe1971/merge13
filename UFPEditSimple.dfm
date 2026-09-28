inherited FPEditSimple: TFPEditSimple
  Caption = 'FPEditSimple'
  OnActivate = FormActivate
  inherited TBMain: TToolBar
    object NavMain: TDBNavigator
      Left = 0
      Top = 0
      Width = 230
      Height = 22
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object TSepNav: TToolButton
      Left = 230
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object TSepTerc: TToolButton
      Left = 238
      Top = 0
      Width = 8
      Style = tbsSeparator
      Visible = False
    end
    object TbuttComp: TToolButton
      Left = 246
      Top = 0
      Visible = False
    end
  end
end
