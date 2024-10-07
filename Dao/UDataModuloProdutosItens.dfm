object DataModuloProdutosItens: TDataModuloProdutosItens
  Height = 509
  Width = 926
  PixelsPerInch = 120
  object fdQryInserirPedidoItens: TFDQuery
    Connection = DataModulo.fdConexao
    Transaction = fdTransInserir
    SQL.Strings = (
      'Insert into PedidosItens('
      '  Id,'
      '  NumeroPedido,'
      '  CodigoProduto,'
      '  Quantidade,'
      '  ValorUnitario,'
      '  ValorTotal'
      ')'
      'values('
      '  :Id,'
      '  :NumeroPedido,'
      '  :CodigoProduto,'
      '  :Quantidade,'
      '  :ValorUnitario,'
      '  :ValorTotal'
      ')')
    Left = 240
    Top = 48
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'NUMEROPEDIDO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'CODIGOPRODUTO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'QUANTIDADE'
        DataType = ftCurrency
        ParamType = ptInput
      end
      item
        Name = 'VALORUNITARIO'
        DataType = ftCurrency
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
  object fdTransExcluir: TFDTransaction
    Connection = DataModulo.fdConexao
    Left = 448
    Top = 144
  end
  object fdQryExcluirPedidoItens: TFDQuery
    Connection = DataModulo.fdConexao
    Transaction = fdTransExcluir
    SQL.Strings = (
      'Delete from PedidosItens'
      'Where NumeroPedido = :NumeroPedido')
    Left = 448
    Top = 48
    ParamData = <
      item
        Name = 'NUMEROPEDIDO'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
end
