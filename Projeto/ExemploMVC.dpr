program ExemploMVC;

uses
  Vcl.Forms,
  UPrincipal in '..\View\UPrincipal.pas' {frmPrincipal},
  UCadastroCliente in '..\View\UCadastroCliente.pas' {CadastroCliente},
  uFuncao in '..\View\uFuncao.pas',
  uClienteModel in '..\Model\uClienteModel.pas',
  uClienteController in '..\Controller\uClienteController.pas',
  UDataModulo in '..\Dao\UDataModulo.pas' {DataModulo: TDataModule},
  UPedidoVendas in '..\View\UPedidoVendas.pas' {PedidoVendas},
  UPedidosModel in '..\Model\UPedidosModel.pas',
  UPedidosItensModel in '..\Model\UPedidosItensModel.pas',
  UPedidosController in '..\Controller\UPedidosController.pas',
  UPesquisarPedido in '..\View\UPesquisarPedido.pas' {PesquisarPedido},
  UPesquisarCliente in '..\View\UPesquisarCliente.pas' {PesquisarCliente},
  uPedidoItensController in '..\Controller\uPedidoItensController.pas',
  UDataModuloCliente in '..\Dao\UDataModuloCliente.pas' {DataModuloCliente: TDataModule},
  UDataModuloPedido in '..\Dao\UDataModuloPedido.pas' {DataModuloPedido: TDataModule},
  UDataModuloProdutosItens in '..\Dao\UDataModuloProdutosItens.pas' {DataModuloProdutosItens: TDataModule},
  UPesquisarProduto in '..\View\UPesquisarProduto.pas' {PesquisarProduto},
  UProdutosController in '..\Controller\UProdutosController.pas',
  UDataModuloProduto in '..\Dao\UDataModuloProduto.pas' {DataModuloProduto: TDataModule},
  UProdutosModel in '..\Model\UProdutosModel.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModulo, DataModulo);
  Application.CreateForm(Tfrmprincipal, frmprincipal);
  Application.Run;
end.
