CREATE DATABASE grantFood;
use grantFood;

-- funcionario 
create table usuario(
    idFunc int primary key,
    nome varchar(100),
    tipo int, 
    usuario varchar(40),
    genero varchar(20),
    cpf char(11),
    salario decimal(7,2),
    cargaHoraria int , 
    ponto varchar(15)
);

create table endereco(
    idEndereco int primary key auto_increment,
    cep char(8),
    rua varchar(100),
    bairro varchar(100),
    cidade varchar(50),
    estado char(2),
    complemento varchar(50),
    bloco varchar(3),
    andar int,
    codEndereco int ,
    foreign key(codEndereco) references usuario(idFunc)
);

create table telefone(
    id int primary key auto_increment,
    ddd char(3),
    telefone varchar(9),
    tipo varchar(15),
    codTelefone int, 
    foreign key(codTelefone) references usuario(idFunc)
);

create table gastos(
    id int primary key auto_increment,
    estoque decimal(7,2),
    salario decimal(7,2),
    utensilios decimal(7,2),
    conta decimal(7,2),
    manutencaoGeral decimal(7,2)
);

create table mesa(
    id int primary key auto_increment, 
    numero int, 
    link varchar(255),
    qtdUsada int 
);

create table menu(
    id int primary key auto_increment,
    nome varchar(50),
    codProduto int,
    foreign key(codProduto) references produto(id)
);

create table produto(
    id int primary key auto_increment,
    nome varchar(50),
    descricao varchar(150),
    preco decimal(7,2),
    quantidade int, 
    imagem varchar(255)
);
create table pedido(
    id int primary key auto_increment,
    Pstatus int,
    mesaPedido int
);
create table item(
    id int primary key auto_increment,
    nome varchar(50),
    qtd int,
    obs varchar(150),
    codItem int,
    foreign key(codItem) references pedido(id)
);
create table conta(
    id int primary key auto_increment,
    nMesa int,
    valor decimal(7,2),
    codPedido int,
    foreign key(codPedido) references pedido(id)
);

-- COZINHA
create table recebePedido(
    id int primary key auto_increment,
    horario datetime,
    itens varchar(100),
    obs varchar(100),
    nMesa varchar(100),
    idPedido int,
    foreign key(idPedido) references pedido(id)
);

-- gerente/adm
create table descricaoVenda(
    id int primary key auto_increment,
    lucros decimal(7,2),
    totalVenda varchar(255)
);

create table relatorioVendas(
    id int primary key auto_increment,
    idGastos int ,
    idDescricaoVenda int,
    idMesa int,
    foreign key(idGastos) references gastos(id),
    foreign key(idDescricaoVenda) references descricaoVenda(id),
    foreign key(idMesa) references mesa(id)
);

-- cliente.
create table pedidoCliente(
    id int primary key auto_increment,
    obs varchar(255),
    cupomPromocao varchar(15)
);

create table fechaConta(
    id int primary key auto_increment,
    formaPagamento varchar(50)
);

create  table avaliar(
    id int primary key auto_increment,
    qtdEstrela char(5),
    idPedido int,
    foreign key(idPedido) references pedido(id)
);