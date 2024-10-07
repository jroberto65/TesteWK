use BancoTesteWK;

CREATE TABLE PedidosItens(
    Id integer primary key auto_increment,
    NumeroPedido integer not null,
    CodigoProduto integer not null,
    Quantidade decimal(4,2),
    ValorUnitario decimal(10,2),
    ValorTotal decimal(10,2)
);

Alter table PedidosItens add constraint fk_PedidosItens_NumeroPedido foreign key(NumeroPedido) references pedidos(NumeroPedido);
Alter table PedidosItens add constraint fk_PedidosItens_CodigoProduto foreign key(CodigoProduto) references Produtos(Codigo);
