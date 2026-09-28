object DMAdjuntos: TDMAdjuntos
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 480
  Width = 640
  object Ver_adjuntos: TFDQuery
    CachedUpdates = True
    Connection = DMMain.DB
    Transaction = TLocal
    UpdateTransaction = TUpdate
    SQL.Strings = (
      'SELECT * FROM VER_ADJUNTOS'
      'where '
      'EMPRESA=:EMPRESA '
      'and TIPO=:TIPO'
      'and ID=:ID')
    Left = 98
    Top = 23
    ParamData = <
      item
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        Name = 'TIPO'
        ParamType = ptInput
      end
      item
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object Emp_adjuntos_relacion: TFDQuery
    Connection = DMMain.DB
    Transaction = TLocal
    UpdateTransaction = TUpdate
    SQL.Strings = (
      'SELECT * FROM EMP_ADJUNTOS_RELACION')
    Left = 97
    Top = 84
  end
  object Emp_adjuntos: TFDQuery
    Connection = DMMain.DB
    Transaction = TLocal
    UpdateTransaction = TUpdate
    SQL.Strings = (
      'SELECT * FROM EMP_ADJUNTOS')
    Left = 97
    Top = 146
  end
  object TLocal: TFDTransaction
    Options.Isolation = xiReadCommitted
    Options.ReadOnly = True
    Connection = DMMain.DB
    Left = 494
    Top = 19
  end
  object TUpdate: TFDTransaction
    Options.Isolation = xiReadCommitted
    Connection = DMMain.DB
    Left = 494
    Top = 83
  end
end
