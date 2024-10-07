object DataModuloProduto: TDataModuloProduto
  Height = 356
  Width = 758
  PixelsPerInch = 120
  object fdQryPesquisaProduto: TFDQuery
    Connection = DataModulo.fdConexao
    SQL.Strings = (
      'Select * from Produtos'
      'Order by descricao')
    Left = 80
    Top = 48
    object fdQryPesquisaProdutoCodigo: TFDAutoIncField
      FieldName = 'Codigo'
      Origin = 'Codigo'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object fdQryPesquisaProdutoDescricao: TStringField
      FieldName = 'Descricao'
      Origin = 'Descricao'
      Required = True
      Size = 250
    end
    object fdQryPesquisaProdutoPrecoVenda: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PrecoVenda'
      Origin = 'PrecoVenda'
      Precision = 10
      Size = 2
    end
  end
end
