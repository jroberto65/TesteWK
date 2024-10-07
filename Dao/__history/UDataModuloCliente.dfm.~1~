object DataModuloCliente: TDataModuloCliente
  Height = 490
  Width = 953
  PixelsPerInch = 120
  object fdQryPesquisaCliente: TFDQuery
    Connection = DataModulo.fdConexao
    SQL.Strings = (
      'Select * from Clientes'
      'Where nome like :nome')
    Left = 80
    Top = 48
    ParamData = <
      item
        Name = 'NOME'
        ParamType = ptInput
      end>
    object fdQryPesquisaClienteCodigo: TFDAutoIncField
      FieldName = 'Codigo'
      Origin = 'Codigo'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdQryPesquisaClienteNome: TStringField
      FieldName = 'Nome'
      Origin = 'Nome'
      Required = True
      Size = 250
    end
    object fdQryPesquisaClienteCidade: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Cidade'
      Origin = 'Cidade'
      Size = 150
    end
    object fdQryPesquisaClienteUF: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UF'
      Origin = 'UF'
      Size = 2
    end
  end
  object fdQryInserirCliente: TFDQuery
    Connection = DataModulo.fdConexao
    Transaction = fdTransInserir
    SQL.Strings = (
      'Insert into Clientes('
      '  Nome,'
      '  Cidade,'
      '  UF'
      ')'
      'values('
      '  :Nome,'
      '  :Cidade,'
      '  :UF'
      ')')
    Left = 240
    Top = 48
    ParamData = <
      item
        Name = 'NOME'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CIDADE'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'UF'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object fdQryAlterarCliente: TFDQuery
    Connection = DataModulo.fdConexao
    Transaction = fdTransAlterar
    SQL.Strings = (
      'Update Clientes set'
      '  Nome = :Nome,'
      '  Cidade = :Cidade,'
      '  UF = :UF'
      'Where Codigo = :Codigo')
    Left = 400
    Top = 48
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'NOME'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CIDADE'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'UF'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object fdQryExcluirCliente: TFDQuery
    Connection = DataModulo.fdConexao
    Transaction = fdTransExcluir
    SQL.Strings = (
      'Delete from Clientes'
      'Where Codigo = :Codigo')
    Left = 560
    Top = 48
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object fdTransInserir: TFDTransaction
    Connection = DataModulo.fdConexao
    Left = 240
    Top = 144
  end
  object fdTransAlterar: TFDTransaction
    Connection = DataModulo.fdConexao
    Left = 400
    Top = 144
  end
  object fdTransExcluir: TFDTransaction
    Connection = DataModulo.fdConexao
    Left = 560
    Top = 144
  end
  object fbQryCliente: TFDQuery
    Connection = DataModulo.fdConexao
    SQL.Strings = (
      'Select * from Clientes')
    Left = 704
    Top = 56
    object FDAutoIncField1: TFDAutoIncField
      FieldName = 'Codigo'
      Origin = 'Codigo'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object StringField1: TStringField
      FieldName = 'Nome'
      Origin = 'Nome'
      Required = True
      Size = 250
    end
    object StringField2: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Cidade'
      Origin = 'Cidade'
      Size = 150
    end
    object StringField3: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UF'
      Origin = 'UF'
      Size = 2
    end
  end
end
