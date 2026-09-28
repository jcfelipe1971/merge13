object DMMain: TDMMain
  OnCreate = DataModuleCreate
  Height = 524
  Width = 808
  object TLocal: TFDTransaction
    Options.ReadOnly = True
    Connection = DataBase
    Left = 733
    Top = 19
  end
  object TUpdate: TFDTransaction
    Connection = DataBase
    Left = 733
    Top = 83
  end
  object DataBase: TFDConnection
    Params.Strings = (
      'CharacterSet=WIN1252'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'SQLDialect=1'
      'DriverID=FB')
    LoginPrompt = False
    OnError = DBError
    Left = 40
    Top = 32
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 648
    Top = 16
  end
  object QDatosEmpresa: TFDQuery
    Connection = DataBase
    SQL.Strings = (
      'SELECT I.IMAGEN,e.*,T.* FROM sys_empresas E'
      'JOIN SYS_IMAGENES I ON  E.E_IMAGEN=I.CODIGO'
      'JOIN SYS_TERCEROS T ON  T.TERCERO=E.TERCERO'
      'where EMPRESA = :EMPRESA')
    Left = 88
    Top = 184
    ParamData = <
      item
        Name = 'EMPRESA'
        DataType = ftSmallint
        ParamType = ptInput
        Value = Null
      end>
    object QDatosEmpresaIMAGEN: TBlobField
      FieldName = 'IMAGEN'
      Origin = 'IMAGEN'
    end
    object QDatosEmpresaEMPRESA: TSmallintField
      FieldName = 'EMPRESA'
      Origin = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QDatosEmpresaTITULO: TStringField
      FieldName = 'TITULO'
      Origin = 'TITULO'
      Required = True
      Size = 60
    end
    object QDatosEmpresaTERCERO: TIntegerField
      FieldName = 'TERCERO'
      Origin = 'TERCERO'
      Required = True
    end
    object QDatosEmpresaFECHA_ALTA: TSQLTimeStampField
      FieldName = 'FECHA_ALTA'
      Origin = 'FECHA_ALTA'
      Required = True
    end
    object QDatosEmpresaAPERTURA: TSQLTimeStampField
      FieldName = 'APERTURA'
      Origin = 'APERTURA'
      Required = True
    end
    object QDatosEmpresaDURACION: TSmallintField
      FieldName = 'DURACION'
      Origin = 'DURACION'
      Required = True
    end
    object QDatosEmpresaMONEDA: TStringField
      FieldName = 'MONEDA'
      Origin = 'MONEDA'
      Required = True
      Size = 3
    end
    object QDatosEmpresaABIERTA: TSmallintField
      FieldName = 'ABIERTA'
      Origin = 'ABIERTA'
      Required = True
    end
    object QDatosEmpresaMODO_IVA: TSmallintField
      FieldName = 'MODO_IVA'
      Origin = 'MODO_IVA'
      Required = True
    end
    object QDatosEmpresaIMPRIME_CABECERA: TSmallintField
      FieldName = 'IMPRIME_CABECERA'
      Origin = 'IMPRIME_CABECERA'
      Required = True
    end
    object QDatosEmpresaCLIENTE_AUT: TSmallintField
      FieldName = 'CLIENTE_AUT'
      Origin = 'CLIENTE_AUT'
      Required = True
    end
    object QDatosEmpresaPMP_CERO: TSmallintField
      FieldName = 'PMP_CERO'
      Origin = 'PMP_CERO'
      Required = True
    end
    object QDatosEmpresaFECHA_CONTABILIZACION_COMPRAS: TSmallintField
      FieldName = 'FECHA_CONTABILIZACION_COMPRAS'
      Origin = 'FECHA_CONTABILIZACION_COMPRAS'
      Required = True
    end
    object QDatosEmpresaCIERRE_CONTABLE: TSmallintField
      FieldName = 'CIERRE_CONTABLE'
      Origin = 'CIERRE_CONTABLE'
      Required = True
    end
    object QDatosEmpresaFECHA_VENTAS: TSmallintField
      FieldName = 'FECHA_VENTAS'
      Origin = 'FECHA_VENTAS'
      Required = True
    end
    object QDatosEmpresaLISTAR_PEDIDOS: TSmallintField
      FieldName = 'LISTAR_PEDIDOS'
      Origin = 'LISTAR_PEDIDOS'
      Required = True
    end
    object QDatosEmpresaSERIE_AUTOFAC: TStringField
      FieldName = 'SERIE_AUTOFAC'
      Origin = 'SERIE_AUTOFAC'
      Required = True
      Size = 10
    end
    object QDatosEmpresaE_IMAGEN: TIntegerField
      FieldName = 'E_IMAGEN'
      Origin = 'E_IMAGEN'
      Required = True
    end
    object QDatosEmpresaCIERRA_DOC_CERO: TSmallintField
      FieldName = 'CIERRA_DOC_CERO'
      Origin = 'CIERRA_DOC_CERO'
      Required = True
    end
    object QDatosEmpresaREG_MERCANTIL: TMemoField
      FieldName = 'REG_MERCANTIL'
      Origin = 'REG_MERCANTIL'
      BlobType = ftMemo
    end
    object QDatosEmpresaE_MAIL: TStringField
      FieldName = 'E_MAIL'
      Origin = 'E_MAIL'
      Required = True
      Size = 100
    end
    object QDatosEmpresaSERIALIZADO_AUTO: TSmallintField
      FieldName = 'SERIALIZADO_AUTO'
      Origin = 'SERIALIZADO_AUTO'
      Required = True
    end
    object QDatosEmpresaMOV_STOCK_ANULA_VENTAS: TSmallintField
      FieldName = 'MOV_STOCK_ANULA_VENTAS'
      Origin = 'MOV_STOCK_ANULA_VENTAS'
      Required = True
    end
    object QDatosEmpresaMOV_STOCK_ANULA_COMPRAS: TSmallintField
      FieldName = 'MOV_STOCK_ANULA_COMPRAS'
      Origin = 'MOV_STOCK_ANULA_COMPRAS'
      Required = True
    end
    object QDatosEmpresaNO_CONTABILIZAR_FECHA_KRI: TSmallintField
      FieldName = 'NO_CONTABILIZAR_FECHA_KRI'
      Origin = 'NO_CONTABILIZAR_FECHA_KRI'
      Required = True
    end
    object QDatosEmpresaFECHA_NO_CONTABILIZACION_KRI: TSQLTimeStampField
      FieldName = 'FECHA_NO_CONTABILIZACION_KRI'
      Origin = 'FECHA_NO_CONTABILIZACION_KRI'
      Required = True
    end
    object QDatosEmpresaPORTES_VENTAS: TSmallintField
      FieldName = 'PORTES_VENTAS'
      Origin = 'PORTES_VENTAS'
      Required = True
    end
    object QDatosEmpresaPORTES_COMPRAS: TSmallintField
      FieldName = 'PORTES_COMPRAS'
      Origin = 'PORTES_COMPRAS'
      Required = True
    end
    object QDatosEmpresaSEPARAR_APUNTES_REMESAS: TSmallintField
      FieldName = 'SEPARAR_APUNTES_REMESAS'
      Origin = 'SEPARAR_APUNTES_REMESAS'
      Required = True
    end
    object QDatosEmpresaSEPARAR_PEDIDOS_RECEPCION: TSmallintField
      FieldName = 'SEPARAR_PEDIDOS_RECEPCION'
      Origin = 'SEPARAR_PEDIDOS_RECEPCION'
      Required = True
    end
    object QDatosEmpresaCONTROL_STOCK_NEG: TSmallintField
      FieldName = 'CONTROL_STOCK_NEG'
      Origin = 'CONTROL_STOCK_NEG'
      Required = True
    end
    object QDatosEmpresaCONTROL_ASIENTO_NEG: TSmallintField
      FieldName = 'CONTROL_ASIENTO_NEG'
      Origin = 'CONTROL_ASIENTO_NEG'
      Required = True
    end
    object QDatosEmpresaIMPORTE_MAX_PEP: TFloatField
      FieldName = 'IMPORTE_MAX_PEP'
      Origin = 'IMPORTE_MAX_PEP'
      Required = True
    end
    object QDatosEmpresaIMPORTE_LETRAS: TSmallintField
      FieldName = 'IMPORTE_LETRAS'
      Origin = 'IMPORTE_LETRAS'
      Required = True
    end
    object QDatosEmpresaSEPARAR_DTO_CIAL: TSmallintField
      FieldName = 'SEPARAR_DTO_CIAL'
      Origin = 'SEPARAR_DTO_CIAL'
      Required = True
    end
    object QDatosEmpresaRECC: TSmallintField
      FieldName = 'RECC'
      Origin = 'RECC'
      Required = True
    end
    object QDatosEmpresaINVENTARIO_PERMANENTE: TSmallintField
      FieldName = 'INVENTARIO_PERMANENTE'
      Origin = 'INVENTARIO_PERMANENTE'
      Required = True
    end
    object QDatosEmpresaTEXTO_LOPD: TMemoField
      FieldName = 'TEXTO_LOPD'
      Origin = 'TEXTO_LOPD'
      BlobType = ftMemo
    end
    object QDatosEmpresaTEXTO_LOPD_PIE_DOCUMENTO: TMemoField
      FieldName = 'TEXTO_LOPD_PIE_DOCUMENTO'
      Origin = 'TEXTO_LOPD_PIE_DOCUMENTO'
      BlobType = ftMemo
    end
    object QDatosEmpresaTAMANYO_EMPRESA: TStringField
      FieldName = 'TAMANYO_EMPRESA'
      Origin = 'TAMANYO_EMPRESA'
      Required = True
      Size = 60
    end
    object QDatosEmpresaAGENCIA_TRIBUTARIA: TStringField
      FieldName = 'AGENCIA_TRIBUTARIA'
      Origin = 'AGENCIA_TRIBUTARIA'
      Required = True
      Size = 60
    end
    object QDatosEmpresaGS1_COMPANY_PREFIX: TStringField
      FieldName = 'GS1_COMPANY_PREFIX'
      Origin = 'GS1_COMPANY_PREFIX'
      Required = True
    end
    object QDatosEmpresaPROVEEDOR_AUT: TSmallintField
      FieldName = 'PROVEEDOR_AUT'
      Origin = 'PROVEEDOR_AUT'
      Required = True
    end
    object QDatosEmpresaACREEDOR_AUT: TSmallintField
      FieldName = 'ACREEDOR_AUT'
      Origin = 'ACREEDOR_AUT'
      Required = True
    end
    object QDatosEmpresaF_IMAGEN: TIntegerField
      FieldName = 'F_IMAGEN'
      Origin = 'F_IMAGEN'
      Required = True
    end
    object QDatosEmpresaTERCERO_1: TIntegerField
      FieldName = 'TERCERO_1'
      Origin = 'TERCERO'
      Required = True
    end
    object QDatosEmpresaNOMBRE_R_SOCIAL: TStringField
      FieldName = 'NOMBRE_R_SOCIAL'
      Origin = 'NOMBRE_R_SOCIAL'
      Required = True
      Size = 60
    end
    object QDatosEmpresaNOMBRE_COMERCIAL: TStringField
      FieldName = 'NOMBRE_COMERCIAL'
      Origin = 'NOMBRE_COMERCIAL'
      Required = True
      Size = 60
    end
    object QDatosEmpresaTIPO_RAZON: TStringField
      FieldName = 'TIPO_RAZON'
      Origin = 'TIPO_RAZON'
      Required = True
      Size = 4
    end
    object QDatosEmpresaNIF: TStringField
      FieldName = 'NIF'
      Origin = 'NIF'
      Required = True
    end
    object QDatosEmpresaFECHA_ALTA_1: TSQLTimeStampField
      FieldName = 'FECHA_ALTA_1'
      Origin = 'FECHA_ALTA'
      Required = True
    end
    object QDatosEmpresaNOTAS: TMemoField
      FieldName = 'NOTAS'
      Origin = 'NOTAS'
      BlobType = ftMemo
    end
    object QDatosEmpresaTELEFONO01: TStringField
      FieldName = 'TELEFONO01'
      Origin = 'TELEFONO01'
      Required = True
    end
    object QDatosEmpresaTELEFONO02: TStringField
      FieldName = 'TELEFONO02'
      Origin = 'TELEFONO02'
      Required = True
    end
    object QDatosEmpresaTELEFAX: TStringField
      FieldName = 'TELEFAX'
      Origin = 'TELEFAX'
      Required = True
    end
    object QDatosEmpresaEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Required = True
      Size = 100
    end
    object QDatosEmpresaWEB: TStringField
      FieldName = 'WEB'
      Origin = 'WEB'
      Required = True
      Size = 60
    end
    object QDatosEmpresaCLIENTE_POTENCIAL: TSmallintField
      FieldName = 'CLIENTE_POTENCIAL'
      Origin = 'CLIENTE_POTENCIAL'
      Required = True
    end
    object QDatosEmpresaIMAGEN_1: TIntegerField
      FieldName = 'IMAGEN_1'
      Origin = 'IMAGEN'
      Required = True
    end
    object QDatosEmpresaCODIGO_EDI: TStringField
      FieldName = 'CODIGO_EDI'
      Origin = 'CODIGO_EDI'
      Required = True
      Size = 25
    end
    object QDatosEmpresaREGISTRO_MERCANTIL: TStringField
      FieldName = 'REGISTRO_MERCANTIL'
      Origin = 'REGISTRO_MERCANTIL'
      Required = True
      Size = 100
    end
    object QDatosEmpresaCOD_CREDITO_Y_CAUCION: TIntegerField
      FieldName = 'COD_CREDITO_Y_CAUCION'
      Origin = 'COD_CREDITO_Y_CAUCION'
      Required = True
    end
    object QDatosEmpresaULT_MODIFICACION: TSQLTimeStampField
      FieldName = 'ULT_MODIFICACION'
      Origin = 'ULT_MODIFICACION'
      Required = True
    end
    object QDatosEmpresaID_REGISTRO: TIntegerField
      FieldName = 'ID_REGISTRO'
      Origin = 'ID_REGISTRO'
      Required = True
    end
    object QDatosEmpresaFEC_PROP_CREDITO_Y_CAUCION: TSQLTimeStampField
      FieldName = 'FEC_PROP_CREDITO_Y_CAUCION'
      Origin = 'FEC_PROP_CREDITO_Y_CAUCION'
    end
    object QDatosEmpresaFECHA_NACIMIENTO: TSQLTimeStampField
      FieldName = 'FECHA_NACIMIENTO'
      Origin = 'FECHA_NACIMIENTO'
    end
    object QDatosEmpresaCARNET_APLICADOR: TStringField
      FieldName = 'CARNET_APLICADOR'
      Origin = 'CARNET_APLICADOR'
      Required = True
    end
    object QDatosEmpresaFECHA_VALIDEZ_CARNET_APLICADOR: TSQLTimeStampField
      FieldName = 'FECHA_VALIDEZ_CARNET_APLICADOR'
      Origin = 'FECHA_VALIDEZ_CARNET_APLICADOR'
    end
    object QDatosEmpresaPAIS_TERCERO: TStringField
      FieldName = 'PAIS_TERCERO'
      Origin = 'PAIS_TERCERO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object QDatosEmpresaTIPO_DOC_IDENT: TStringField
      FieldName = 'TIPO_DOC_IDENT'
      Origin = 'TIPO_DOC_IDENT'
      Required = True
      Size = 3
    end
    object QDatosEmpresaCOMO_NOS_CONOCIERON: TIntegerField
      FieldName = 'COMO_NOS_CONOCIERON'
      Origin = 'COMO_NOS_CONOCIERON'
      Required = True
    end
  end
  object RESTClient: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'https://versions.delfos-online.com/maxfactu/version.json'
    Params = <>
    SynchronizedEvents = False
    Left = 736
    Top = 152
  end
  object RESTRequest: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient
    Params = <>
    Response = RESTResponse
    SynchronizedEvents = False
    Left = 736
    Top = 208
  end
  object RESTResponse: TRESTResponse
    ContentType = 'application/json'
    Left = 736
    Top = 272
  end
  object RESTResponseDataSetAdapter: TRESTResponseDataSetAdapter
    Dataset = MTVersion
    FieldDefs = <>
    Response = RESTResponse
    TypesMode = Rich
    NestedElements = True
    Left = 88
    Top = 264
  end
  object MTVersion: TFDMemTable
    FieldDefs = <
      item
        Name = 'success'
        DataType = ftBoolean
      end
      item
        Name = 'EXE'
        DataType = ftWideString
        Size = 8
      end
      item
        Name = 'VERSION'
        DataType = ftInteger
      end
      item
        Name = 'URL'
        DataType = ftWideString
        Size = 56
      end
      item
        Name = 'FECHA'
        DataType = ftWideString
        Size = 19
      end
      item
        Name = 'NOTAS'
        DataType = ftWideString
        Size = 7
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockPoint, uvLockWait, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.LockWait = True
    UpdateOptions.FetchGeneratorsPoint = gpNone
    UpdateOptions.CheckRequired = False
    StoreDefs = True
    Left = 88
    Top = 344
    object MTVersionsuccess: TBooleanField
      FieldName = 'success'
    end
    object MTVersionEXE: TWideStringField
      FieldName = 'EXE'
      Size = 8
    end
    object MTVersionVERSION: TIntegerField
      FieldName = 'VERSION'
    end
    object MTVersionURL: TWideStringField
      FieldName = 'URL'
      Size = 56
    end
    object MTVersionFECHA: TWideStringField
      FieldName = 'FECHA'
      Size = 19
    end
    object MTVersionNOTAS: TWideStringField
      FieldName = 'NOTAS'
      Size = 7
    end
  end
  object DataBaseImagenes: TFDConnection
    Params.Strings = (
      'Database=D:\DELFOS\VIRTUAL\Datos\SERHVAS.FDB'
      'CharacterSet=WIN1252'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'SQLDialect=1'
      'DriverID=FB')
    LoginPrompt = False
    Left = 400
    Top = 208
  end
  object TLocalImagenes: TFDTransaction
    Options.ReadOnly = True
    Connection = DataBase
    Left = 573
    Top = 171
  end
  object TUpdateImagenes: TFDTransaction
    Connection = DataBase
    Left = 573
    Top = 235
  end
  object frxDBQDatosEmpresa: TfrxDBDataset
    UserName = 'frxDBQDatosEmpresa'
    CloseDataSource = False
    DataSet = QDatosEmpresa
    BCDToCurrency = False
    DataSetOptions = []
    Left = 400
    Top = 291
  end
  object xFactorMoneda: TFDQuery
    Connection = DataBase
    SQL.Strings = (
      'SELECT ORIGEN, DESTINO, F_ALTA, FACTOR  FROM SYS_MONEDAS_CAMBIOS'
      'ORDER BY F_ALTA DESC'
      '')
    Left = 576
    Top = 296
  end
  object spContadores_E: TFDStoredProc
    Connection = DataBase
    Transaction = TUpdate
    UpdateTransaction = TUpdate
    StoredProcName = 'COD_CONTADORES_E'
    Left = 200
    Top = 392
    ParamData = <
      item
        Position = 1
        Name = 'EMPRESA'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'TIPO'
        DataType = ftWideString
        ParamType = ptInput
        Size = 3
      end
      item
        Position = 3
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
end
