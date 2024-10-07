use BancoTesteWK;

CREATE TABLE Produtos(
    Codigo integer primary key auto_increment,
    Descricao varchar(250) not null,
    PrecoVenda decimal(10,2)
);
