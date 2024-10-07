object PedidoVendas: TPedidoVendas
  Left = 0
  Top = 0
  Caption = 'Pedido de Vendas'
  ClientHeight = 522
  ClientWidth = 863
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  TextHeight = 15
  object pnlPedidosVenda: TPanel
    Left = 0
    Top = 444
    Width = 863
    Height = 39
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 435
    ExplicitWidth = 857
    object lblTotalPedido: TLabel
      Left = 640
      Top = 14
      Width = 68
      Height = 15
      Caption = 'Total Pedido:'
    end
    object edtTotalPedido: TEdit
      Left = 735
      Top = 8
      Width = 113
      Height = 23
      Alignment = taRightJustify
      ReadOnly = True
      TabOrder = 0
    end
  end
  object dbgProdutosIens: TDBGrid
    Tag = 7
    Left = 0
    Top = 232
    Width = 863
    Height = 212
    Align = alBottom
    DataSource = dsPedidosItens
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = dbgProdutosIensDblClick
    OnKeyDown = dbgProdutosIensKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'NumeroPedido'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CodigoProduto'
        Title.Caption = 'C'#243'digo Produto'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 400
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quantidade'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CodigoCliente'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'ValorUnitario'
        Title.Caption = 'Valor Unit'#225'rio'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ValorTotal'
        Title.Caption = 'Valor Total'
        Width = 80
        Visible = True
      end>
  end
  object grbPedido: TGroupBox
    Left = 0
    Top = 0
    Width = 863
    Height = 80
    Align = alTop
    Caption = 'Pedido'
    TabOrder = 2
    ExplicitWidth = 857
    object lblCodigoCliente: TLabel
      Left = 162
      Top = 16
      Width = 79
      Height = 15
      Caption = 'C'#243'digo Cliente'
    end
    object lblNomeCliente: TLabel
      Left = 280
      Top = 16
      Width = 73
      Height = 15
      Caption = 'Nome Cliente'
    end
    object lblCodigoPedido: TLabel
      Left = 16
      Top = 16
      Width = 39
      Height = 15
      Caption = 'C'#243'digo'
    end
    object edtCodigoCliente: TEdit
      Tag = 1
      Left = 162
      Top = 37
      Width = 73
      Height = 23
      TabOrder = 1
      OnChange = edtCodigoClienteChange
      OnExit = edtCodigoClienteExit
    end
    object edtNomeCliente: TEdit
      Left = 280
      Top = 37
      Width = 485
      Height = 23
      ReadOnly = True
      TabOrder = 2
    end
    object edtCodigoPedido: TEdit
      Tag = 1
      Left = 16
      Top = 37
      Width = 73
      Height = 23
      TabOrder = 0
    end
    object btnPesquisarPedido: TButton
      Left = 92
      Top = 37
      Width = 31
      Height = 25
      Hint = 'Pesquisar pedidos'
      ImageIndex = 0
      Images = frmPrincipal.ImageIcons
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = btnPesquisarPedidoClick
    end
    object btnPesquisarCliente: TButton
      Left = 237
      Top = 36
      Width = 31
      Height = 25
      Hint = 'Pesquisar cliente'
      ImageIndex = 0
      Images = frmPrincipal.ImageIcons
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = btnPesquisarClienteClick
    end
    object btnNovoPedido: TButton
      Left = 125
      Top = 36
      Width = 31
      Height = 25
      Hint = 'Novo pedido'
      ImageIndex = 1
      Images = frmPrincipal.ImageIcons
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = btnNovoPedidoClick
    end
  end
  object grbItensProduto: TGroupBox
    Left = 0
    Top = 93
    Width = 863
    Height = 139
    Align = alBottom
    Caption = 'Produtos'
    TabOrder = 3
    ExplicitTop = 84
    ExplicitWidth = 857
    object Label1: TLabel
      Left = 16
      Top = 23
      Width = 39
      Height = 15
      Caption = 'C'#243'digo'
    end
    object lblNomeProduto: TLabel
      Left = 138
      Top = 23
      Width = 33
      Height = 15
      Caption = 'Nome'
    end
    object lblQuantidade: TLabel
      Left = 647
      Top = 23
      Width = 62
      Height = 15
      Caption = 'Quantidade'
    end
    object Label2: TLabel
      Left = 519
      Top = 23
      Width = 62
      Height = 15
      Caption = 'Vlr. Unit'#225'rio'
    end
    object Label4: TLabel
      Left = 735
      Top = 23
      Width = 45
      Height = 15
      Caption = 'Vlr. Total'
    end
    object edtCodigoProduto: TEdit
      Tag = 3
      Left = 16
      Top = 44
      Width = 73
      Height = 23
      TabOrder = 0
      OnExit = edtCodigoProdutoExit
    end
    object edtNomeProduto: TEdit
      Tag = 3
      Left = 142
      Top = 44
      Width = 371
      Height = 23
      ReadOnly = True
      TabOrder = 1
    end
    object edtQuantidade: TEdit
      Tag = 5
      Left = 647
      Top = 44
      Width = 73
      Height = 23
      Alignment = taRightJustify
      TabOrder = 3
      OnExit = edtQuantidadeExit
    end
    object edtValorUnitario: TEdit
      Tag = 4
      Left = 519
      Top = 44
      Width = 113
      Height = 23
      Alignment = taRightJustify
      TabOrder = 2
      OnExit = edtValorUnitarioExit
    end
    object edtValorTotal: TEdit
      Tag = 6
      Left = 735
      Top = 44
      Width = 113
      Height = 23
      Alignment = taRightJustify
      ReadOnly = True
      TabOrder = 4
    end
    object pnlItensProduto: TPanel
      Left = 2
      Top = 96
      Width = 859
      Height = 41
      Align = alBottom
      TabOrder = 5
      ExplicitWidth = 853
      object btnConfirmar: TSpeedButton
        Left = 347
        Top = 6
        Width = 65
        Height = 22
        Caption = '&Confirmar'
        OnClick = btnConfirmarClick
      end
      object btnLimpar: TSpeedButton
        Left = 446
        Top = 6
        Width = 65
        Height = 22
        Caption = '&Limpar'
        OnClick = btnLimparClick
      end
    end
    object btnPesquisarProduto: TButton
      Left = 95
      Top = 44
      Width = 31
      Height = 25
      Hint = 'Pesquisar produto'
      ImageIndex = 0
      Images = frmPrincipal.ImageIcons
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = btnPesquisarProdutoClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 483
    Width = 863
    Height = 39
    Align = alBottom
    TabOrder = 4
    ExplicitTop = 474
    ExplicitWidth = 857
    object btnSalvarPedido: TSpeedButton
      Left = 296
      Top = 9
      Width = 80
      Height = 22
      Caption = '&Gravar Pedido'
      OnClick = btnSalvarPedidoClick
    end
    object btnExcluir: TSpeedButton
      Left = 392
      Top = 9
      Width = 80
      Height = 22
      Caption = '&Excluir Pedido'
      OnClick = btnExcluirClick
    end
    object btnFechar: TSpeedButton
      Left = 488
      Top = 9
      Width = 80
      Height = 22
      Caption = '&Fechar'
      OnClick = btnfecharClick
    end
  end
  object dsPedidosItens: TDataSource
    DataSet = fdMemProdutos
    Left = 584
    Top = 312
  end
  object fdMemProdutos: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 464
    Top = 312
    object fdMemProdutosNumeroPedido: TIntegerField
      FieldName = 'NumeroPedido'
    end
    object fdMemProdutosCodigoProduto: TIntegerField
      FieldName = 'CodigoProduto'
    end
    object fdMemProdutosQuantidade: TFloatField
      FieldName = 'Quantidade'
      OnGetText = fdMemProdutosQuantidadeGetText
    end
    object fdMemProdutosValorUnitario: TFloatField
      FieldName = 'ValorUnitario'
      OnGetText = fdMemProdutosValorUnitarioGetText
    end
    object fdMemProdutosValorTotal: TFloatField
      FieldName = 'ValorTotal'
      OnGetText = fdMemProdutosValorTotalGetText
    end
    object fdMemProdutosDescricao: TStringField
      FieldName = 'Descricao'
    end
  end
end
