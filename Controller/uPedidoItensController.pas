unit uPedidoItensController;

interface

uses
  UDataModuloProdutosItens, UPedidosItensModel, System.SysUtils;

type
  TPedidoItensController = class
  private
    { private declarations }
  public
    { public declarations }
    Constructor Create;
    destructor Destroy; override;
    function Inserir(pPedidoItens: TPedidoItens; var pErro: String): Boolean;
    function Excluir(pCodigoPedido: Integer; var pErro: String): Boolean;
  end;

implementation

{ TPedidosController }

constructor TPedidoItensController.Create;
begin
  DataModuloProdutosItens := TDataModuloProdutosItens.Create(nil);
end;

destructor TPedidoItensController.Destroy;
begin
  FreeAndNil(DataModuloProdutosItens);
  inherited;
end;

function TPedidoItensController.Excluir(pCodigoPedido: Integer;
  var pErro: String): Boolean;
begin
  Result := DataModuloProdutosItens.ExcluirPedidoItens(pCodigoPedido, pErro);
end;

function TPedidoItensController.Inserir(pPedidoItens: TPedidoItens;
  var pErro: String): Boolean;
begin
  Result := DataModuloProdutosItens.InserirPedidosItens(pPedidoItens, pErro);
end;

end.
