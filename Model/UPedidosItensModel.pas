unit UPedidosItensModel;

interface
uses
  System.SysUtils;
type
  TPedidoItens = class
  private
    { private declarations }
    FId: integer;
    FNumeroPedido: integer;
    FCodigoProduto: integer;
    FQuantidade: Double;
    FValorUnitario: Double;
    FValorTotal: Double;

  public
    { public declarations }
    //Utilizadn leitura e escrita do prórpio Delphi
    property Id: Integer read FId write FId;
    property NumeroPedido: Integer read FNumeroPedido write FNumeroPedido;
    property CodigoProduto: Integer read FCodigoProduto write FCodigoProduto;
    property Quantidade: Double read FQuantidade Write FQuantidade;
    property ValorUnitario: Double read FValorUnitario Write FValorUnitario;
    property ValorTotal: Double read FValorTotal Write FValorTotal;
  end;

implementation

{ TPedidosItens }

end.
