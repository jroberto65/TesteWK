object PesquisarProduto: TPesquisarProduto
  Left = 0
  Top = 0
  Caption = 'Pesquisar Produtos'
  ClientHeight = 442
  ClientWidth = 628
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
  object dbgProdutos: TDBGrid
    Left = 0
    Top = 73
    Width = 628
    Height = 369
    Align = alClient
    DataSource = dsProdutos
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = dbgProdutosDblClick
    OnKeyDown = dbgProdutosKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 350
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PrecoVenda'
        Title.Caption = 'Preco Venda'
        Visible = True
      end>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 628
    Height = 73
    Align = alTop
    Caption = 'Pesquisa'
    TabOrder = 1
    ExplicitWidth = 622
    object lblCodigo: TLabel
      Left = 32
      Top = 32
      Width = 39
      Height = 15
      Caption = 'C'#243'digo'
    end
    object edtCodigo: TEdit
      Left = 88
      Top = 29
      Width = 73
      Height = 23
      TabOrder = 0
      OnExit = edtCodigoExit
    end
  end
  object dsProdutos: TDataSource
    DataSet = DataModuloProduto.fdQryPesquisaProduto
    Left = 304
    Top = 256
  end
end
