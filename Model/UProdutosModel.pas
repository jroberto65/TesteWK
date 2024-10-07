unit UProdutosModel;

interface
uses
  System.SysUtils;
type
  TProdutos = class
  private
    { private declarations }
    FCodigo: Integer;
    FDescricao: string;
    FPrecoVenda: Double;
  public
    { public declarations }
    //Utilizadn leitura e escrita do prórpio Delphi
    property Codigo: Integer read FCodigo write FCodigo;
    property Descricao: String read FDescricao Write FDescricao;
    property PrecoVenda: Double read FPrecoVenda Write FPrecoVenda;
  end;

implementation

{ TPedidos }

end.
