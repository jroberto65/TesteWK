object DataModuloPedido: TDataModuloPedido
  Height = 422
  Width = 822
  PixelsPerInch = 120
  object fdQryInserirPedido: TFDQuery
    Connection = DataModulo.fdConexao
    Transaction = fdTransInserir
    SQL.Strings = (
      'Insert into Pedidos('
      '  NumeroPedido,'
      '  InseridoEm,'
      '  CodigoCliente,'
      '  ValorTotal'
      ')'
      'values('
      '  :NumeroPedido,'
      '  :InseridoEm,'
      '  :CodigoCliente,'
      '  :ValorTotal'
      ')')
    Left = 240
    Top = 48
    ParamData = <
      item
        Name = 'NUMEROPEDIDO'
        ParamType = ptInput
      end
      item
        Name = 'INSERIDOEM'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'CODIGOCLIENTE'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'VALORTOTAL'
        DataType = ftCurrency
        ParamType = ptInput
      end>
  end
  object fdTransInserir: TFDTransaction
    Connection = DataModulo.fdConexao
    Left = 240
    Top = 144
  end
  object fdQryPesquisaPedido: TFDQuery
    Connection = DataModulo.fdConexao
    SQL.Strings = (
      'Select '
      '  NumeroPedido,'
      '  InseridoEm,'
      '  CodigoCliente,'
      '  ValorTotal,'
      '  Clientes.Nome'
      '  From Pedidos'
      
        '  Inner join Clientes on Clientes.codigo = Pedidos.CodigoCliente' +
        ' '
      '  Order by NumeroPedido, CodigoCliente'
      '')
    Left = 80
    Top = 48
    object fdQryPesquisaPedidoNumero: TFDAutoIncField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NumeroPedido'
      Origin = 'Numero'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdQryPesquisaPedidoCodigoCliente: TIntegerField
      DisplayLabel = 'C'#243'digo Cliente'
      FieldName = 'CodigoCliente'
      Origin = 'CodigoCliente'
      Required = True
    end
    object fdQryPesquisaPedidoNome: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Nome Cliente'
      FieldName = 'Nome'
      Origin = 'Nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 250
    end
    object fdQryPesquisaPedidoInseridoEm: TDateTimeField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Inserido Em'
      FieldName = 'InseridoEm'
      Origin = 'InseridoEm'
    end
    object fdQryPesquisaPedidoValorTotal: TBCDField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Valor Total'
      FieldName = 'ValorTotal'
      Origin = 'ValorTotal'
      Precision = 10
      Size = 2
    end
  end
  object fdQryExcluirPedido: TFDQuery
    Connection = DataModulo.fdConexao
    Transaction = fdTransExcluir
    SQL.Strings = (
      'Delete from Pedidos'
      'Where NumeroPedido = :NumeroPedido')
    Left = 400
    Top = 48
    ParamData = <
      item
        Name = 'NUMEROPEDIDO'
        ParamType = ptInput
      end>
  end
  object fdTransExcluir: TFDTransaction
    Connection = DataModulo.fdConexao
    Left = 400
    Top = 144
  end
end
