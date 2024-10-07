use BancoTesteWK;

CREATE TABLE Pedidos(
    NumeroPedido integer primary key auto_increment,
    InseridoEm datetime Default current_timestamp,
    CodigoCliente integer not null,
    ValorTotal decimal(10,2)
);

Alter table Pedidos add constraint fk_Pedidos_CodigoCliente foreign key(CodigoCliente) references Clientes(Codigo);



