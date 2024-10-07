unit UDataModuloProduto;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDataModuloProduto = class(TDataModule)
    fdQryPesquisaProduto: TFDQuery;
    fdQryPesquisaProdutoCodigo: TFDAutoIncField;
    fdQryPesquisaProdutoDescricao: TStringField;
    fdQryPesquisaProdutoPrecoVenda: TBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure pesquisarProduto;
  end;

var
  DataModuloProduto: TDataModuloProduto;

implementation

uses
  UDataModulo;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ DataModuloProduto }

procedure TDataModuloProduto.pesquisarProduto;
const
  SQL_ = 'Select * from Produtos ';
begin
  fdQryPesquisaProduto.Close;
  fdQryPesquisaProduto.sql.Text := SQL_;
  fdQryPesquisaProduto.Open;
  fdQryPesquisaProduto.First;
end;

end.
