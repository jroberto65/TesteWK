use BancoTesteWK;
/*Pedidos*/
Alter table Pedidos add constraint fk_Pedidos_CodigoCliente foreign key(CodigoCliente) references Clientea(Codigo);

/*PedidosItens*/
Alter table PedidosItens add constraint fk_PedidosItens_CodigoProduto foreign key(CodigoProduto) references Produtos(Codigo);
Alter table PedidosItens add constraint fk_PedidosItens_CodigoCliente foreign key(CodigoCliente) references Clientes(Codigo);
