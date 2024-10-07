object PesquisarCliente: TPesquisarCliente
  Left = 0
  Top = 0
  Caption = 'Pesquisar Cliente'
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
  object dbgPedidos: TDBGrid
    Left = 0
    Top = 73
    Width = 628
    Height = 369
    Align = alClient
    DataSource = dsClientes
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = dbgPedidosDblClick
    OnKeyDown = dbgPedidosKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cidade'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UF'
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
  object dsClientes: TDataSource
    DataSet = DataModuloCliente.fdQryPesquisaCliente
    Left = 304
    Top = 256
  end
end
