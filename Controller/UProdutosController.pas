unit UProdutosController;

interface

uses
  UDataModuloProduto, UProdutosModel, System.SysUtils;

type
  TProdutosController = class
  private
    { private declarations }
  public
    { public declarations }
    codigoPedido : Integer;
    Constructor Create;
    destructor Destroy; override;
    procedure pesquisarProdutos; overload;
  end;

implementation

{ TProdutosController }

constructor TProdutosController.Create;
begin
  DataModuloProduto := TDataModuloProduto.Create(nil);
end;

destructor TProdutosController.Destroy;
begin
  FreeAndNil(DataModuloProduto);
  inherited;
end;

procedure TProdutosController.pesquisarProdutos;
begin
  DataModuloProduto.pesquisarProduto;
end;

end.
