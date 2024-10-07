object RelatorioCliente: TRelatorioCliente
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de clientes'
  ClientHeight = 223
  ClientWidth = 468
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 182
    Width = 468
    Height = 41
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 173
    ExplicitWidth = 462
    object btnimprimir: TSpeedButton
      Left = 149
      Top = 9
      Width = 65
      Height = 22
      Caption = '&Imprimir'
      OnClick = btnimprimirClick
    end
    object btnfechar: TSpeedButton
      Left = 255
      Top = 9
      Width = 65
      Height = 22
      Caption = '&Fechar'
      OnClick = btnfecharClick
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 468
    Height = 182
    Align = alClient
    Caption = 'Par'#226'metros'
    TabOrder = 1
    ExplicitWidth = 462
    ExplicitHeight = 173
    object Label1: TLabel
      Left = 40
      Top = 40
      Width = 61
      Height = 13
      Caption = 'C'#243'digo inicial'
    end
    object Label2: TLabel
      Left = 199
      Top = 40
      Width = 56
      Height = 13
      Caption = 'C'#243'digo final'
    end
    object edtcodigoI: TEdit
      Left = 40
      Top = 59
      Width = 121
      Height = 21
      MaxLength = 6
      TabOrder = 0
      Text = '000000'
      OnExit = edtcodigoIExit
    end
    object edtCodigoF: TEdit
      Left = 199
      Top = 59
      Width = 121
      Height = 21
      MaxLength = 6
      TabOrder = 1
      Text = '999999'
      OnExit = edtCodigoFExit
    end
  end
  object zqryCli: TZQuery
    Connection = DataModulo.conexao
    SQL.Strings = (
      '')
    Params = <>
    Left = 404
    Top = 137
    object zqryCliID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object zqryCliCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object zqryCliNOME: TWideStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object zqryCliENDERECO: TWideStringField
      FieldName = 'ENDERECO'
      Size = 40
    end
    object zqryCliNUMERO: TIntegerField
      FieldName = 'NUMERO'
    end
    object zqryCliCEP: TWideStringField
      FieldName = 'CEP'
      Size = 9
    end
    object zqryCliBAIRRO: TWideStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object zqryCliCIDADE: TWideStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object zqryCliESTADO: TWideStringField
      FieldName = 'ESTADO'
      Size = 2
    end
    object zqryCliFONE: TWideStringField
      FieldName = 'FONE'
      Size = 15
    end
    object zqryCliCELULAR: TWideStringField
      FieldName = 'CELULAR'
      Size = 15
    end
    object zqryCliEMAIL: TWideStringField
      FieldName = 'EMAIL'
      Size = 100
    end
    object zqryCliDATAINCLUSAO: TDateField
      FieldName = 'DATAINCLUSAO'
    end
  end
end
