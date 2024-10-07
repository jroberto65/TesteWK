unit UPedidosController;

interface

uses
  UDataModuloPedido, UPedidosModel, System.SysUtils;

type
  TPedidosController = class
  private
    { private declarations }
  public
    { public declarations }
    codigoPedido : Integer;
    Constructor Create;
    destructor Destroy; override;
    function  Inserir(pPedido: TPedidos; var pErro: String): Boolean;
    function Excluir(pCodigoPedido: Integer; var pErro: String): Boolean;
    procedure pesquisarPedidos; overload;
  end;

implementation

{ TPedidosController }

constructor TPedidosController.Create;
begin
  DataModuloPedido := TDataModuloPedido.Create(nil);
end;

destructor TPedidosController.Destroy;
begin
  FreeAndNil(DataModuloPedido);
  inherited;
end;

function TPedidosController.Excluir(pCodigoPedido: Integer;
  var pErro: String): Boolean;
begin
  Result := DataModuloPedido.ExcluirPedido(pCodigoPedido, pErro);
end;

function TPedidosController.Inserir(pPedido: TPedidos;
  var pErro: String): Boolean;
begin
  Result := DataModuloPedido.InserirPedido(pPedido, pErro);
  if pErro.IsEmpty then
    codigoPedido := DataModuloPedido.CodigoPedido;
end;

procedure TPedidosController.pesquisarPedidos;
begin
  DataModuloPedido.pesquisarPedido;
end;

end.
