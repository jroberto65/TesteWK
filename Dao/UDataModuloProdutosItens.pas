unit UDataModuloProdutosItens;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client,
  Data.DB, FireDAC.Comp.DataSet, UPedidosItensModel;

type
  TDataModuloProdutosItens = class(TDataModule)
    fdQryInserirPedidoItens: TFDQuery;
    fdTransInserir: TFDTransaction;
    fdTransExcluir: TFDTransaction;
    fdQryExcluirPedidoItens: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    function InserirPedidosItens(pPedidoItens: TPedidoItens; out pErro: string): Boolean;
    function ExcluirPedidoItens(pCodigoPedido: Integer; out pErro: string): Boolean;
  end;

var
  DataModuloProdutosItens: TDataModuloProdutosItens;

implementation

uses
  UDataModulo;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModuloProdutosItens }

function TDataModuloProdutosItens.ExcluirPedidoItens(pCodigoPedido: Integer;
  out pErro: string): Boolean;
begin
  with fdQryExcluirPedidoItens do
  begin
    params[0].Value := pCodigoPedido;
    try
      Transaction.StartTransaction;
      ExecSQL;
      Transaction.Commit;
      Result := True
    except on E: Exception do
      begin
        Transaction.Rollback;
        pErro := 'Erro ao tentar excluir os itens do pedido: ' + sLineBreak +  e.Message;
        Result := False;
      end;
    end;
  end;
end;

function TDataModuloProdutosItens.InserirPedidosItens(
  pPedidoItens: TPedidoItens; out pErro: string): Boolean;
begin
  with fdQryInserirPedidoItens, pPedidoItens do
  begin
    ParamByName('Id').Value := Id;
    ParamByName('NumeroPedido').Value := NumeroPedido;
    ParamByName('CodigoProduto').Value := CodigoProduto;
    ParamByName('Quantidade').Value := Quantidade;
    ParamByName('ValorUnitario').Value := ValorUnitario;
    ParamByName('ValorTotal').Value := ValorTotal;
    try
      Transaction.StartTransaction;
      ExecSQL();
      Transaction.Commit;
      Result := True;
    except on E: Exception do
      begin
        Transaction.Rollback;
        pErro := 'Erro ao tentar inserir os itens do pedido: ' + sLineBreak +  e.Message;
        Result := False;
      end;
    end;
  end;
end;

end.
