use BancoTesteWK;

CREATE TABLE Clientes(
    Codigo integer primary key auto_increment,
    Nome varchar(250) not null,
    Cidade varchar(150),
    UF varchar(2)
);

