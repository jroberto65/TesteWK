unit UPedidosModel;

interface
uses
  System.SysUtils;
type
  TPedidos = class
  private
    { private declarations }
    FNumeroPedido: Integer;
    FEmitidoEm: TDateTime;
    FCodigoCliente: Integer;
    FValorTotal: Double;
  public
    { public declarations }
    //Utilizadn leitura e escrita do prórpio Delphi
    property NumeroPedido: Integer read FNumeroPedido write FNumeroPedido;
    property EmitidoEm: TDateTime read FEmitidoEm write FEmitidoEm;
    property CodigoCliente: Integer read FCodigoCliente Write FCodigoCliente;
    property ValorTotal: Double read FValorTotal Write FValorTotal;
  end;

implementation

{ TPedidos }

end.
