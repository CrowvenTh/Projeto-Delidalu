drop database delidalu;
create schema if not exists delidalu default character set utf8;
use delidalu;

-- tabela cliente --
create table if not exists cliente (
    id_cliente int auto_increment,
    cpf varchar(11) not null unique,
    nome varchar(50) not null,
    endereco varchar(100) not null,
    email varchar(50) not null unique,
    telefone varchar(11) not null unique,
		primary key (id_cliente)
) engine = innodb;    

-- tabela produto -- 
create table if not exists estoque (
    id_produto int not null auto_increment,
    tipo_estoque varchar(20) not null,
    preco_unidade decimal(5,2) not null,
    quantidade_estoque int,
		primary key (id_produto)
) engine = innodb;

-- tabela cliente_pedido --
create table if not exists cliente_pedido (
    id_pedido int auto_increment not null,
    id_cliente int not null,
    id_produto int not null,
    quantidade_pedido int not null,
    tipo_pedido varchar(20) not null,
    mes int not null,
    ano int not null,
		primary key (id_pedido),
		foreign key (id_cliente) references cliente(id_cliente),
		foreign key (id_produto) references estoque(id_produto)
) engine = innodb;


-- inserts -- 
insert into cliente (id_cliente, cpf, nome, endereco, email, telefone) values
(null,'12345678901','Marcos Almeida','Samambaia','marcosa32@gmail.com','61912341234'),
(null,'23456788313','Carlos Silva','Taguatinga','carlos@gmail.com','61983791046'),
(null,'34567890124','Julia Campos','Ceilândia','juliacampos@gmail.com','61984016847'),
(null,'48507259103','Maria Silveira','Guará','mariasilveira@gmail.com','61980426501'),
(null,'57103856201','Douglas Fabio','Guará','douglas@gmail.com','61986032265'),
(null,'87910462917','Jurema Felix','Recanto das Emas','jurema45@gmail.com','61987023659'),
(null,'76829463910','Silvio Santos','Samambaia','silvinho@gmail.com','61985024659'),
(null,'57291056493','Natalia Souza','Samambaia','nat89@gmail.com','61985013465'),
(null,'57690137503','Clara Costa','Taguatinga','clara56@gmail.com','61984720462'),
(null,'99201048693','Maria Alice','Samambaia','maria21@gmail.com','61980791753'),
(null,'09758690305','Milena Moraes','Goiânia','milena@gmail.com','62939448446');

insert into estoque (id_produto, tipo_estoque,preco_unidade, quantidade_estoque) values
(null,'Brigadeiro',4.50,'150'),
(null,'Beijinho',4.20,'130'),
(null,'Casadinho',5.10,'135'),
(null,'Ninho',5.20,'120');

insert into cliente_pedido(id_pedido, id_cliente, id_produto, quantidade_pedido, tipo_pedido, mes, ano) values
(null,1,4,32,'Ninho',08,2023),
(null,2,2,20,'Beijinho',09,2022),
(null,3,1,45,'Brigadeiro',12,2022),
(null,4,3,70,'Casadinho',12,2022),
(null,5,2,30,'Beijinho',12,2022),
(null,6,3,40,'Casadinho',08,2023),
(null,7,4,20,'Ninho',10,2023),
(null,8,1,10,'Brigadeiro',10,2023),
(null,9,1,50,'Brigadeiro',10,2023),
(null,10,1,95,'Brigadeiro',11,2023);

-- selects -- 
select * from cliente;
select * from estoque;
select * from cliente_pedido;
select * from cliente, estoque, cliente_pedido;

-- retorna os dados do cliente junto com seus pedidos -- 
select c.nome as nome, c.email as 'e-mail', c.telefone as telefone, c.endereco as endereço, p.quantidade_pedido as quantidade, e.tipo_estoque as tipo
from cliente_pedido as p
inner join cliente as c on c.id_cliente = p.id_cliente 
inner join estoque as e on e.tipo_estoque = p.tipo_pedido
order by tipo_estoque asc;

-- retorna o total de brigadeiros vendidos -- 
select  e.tipo_estoque as tipo, sum(p.quantidade_pedido) as quantidade from clientepedido as p
inner join estoque as e on e.tipo_estoque = p.tipo_pedido
where tipo_estoque = 'brigadeiro';

-- retorna a quantidade de doces ninho vendidos em samambaia em 2023 --
select e.tipo_estoque as tipo,sum(quantidade_pedido) as quantidade from cliente as c 
inner join cliente_pedido as p on c.id_cliente = p.id_cliente
inner join estoque as e on e.tipo_estoque = tipo_pedido
where endereco = 'samambaia'
and tipo_estoque = 'ninho'
and ano = '2023';

-- retorna os clientes que pediram entre 30 a 50 itens em ordem decrescente -- 
select c.nome as nome, e.tipo_estoque as tipo, p.quantidade_pedido as quantidade from cliente_pedido as p
inner join estoque as e on e.tipo_estoque = p.tipo_pedido
inner join cliente as c on c.id_cliente = p.id_cliente
where quantidade_pedido between 30 and 50
order by quantidade_pedido desc;

-- retorna a região que pediu mais casadinhos -- 
select c.endereco as endereço, count(id_pedido) as pedidos from cliente_pedido as p
inner join cliente as c on c.id_cliente = p.id_cliente
inner join estoque as e on e.tipo_estoque = p.tipo_pedido
where tipo_estoque = 'casadinho';

-- retorna os clientes que mais pediram em 2023 -- 
select c.nome as nome ,c.endereco as endereço ,e.tipo_estoque as tipo, p.quantidade_pedido from cliente as c
inner join cliente_pedido as p on c.id_cliente = p.id_pedido
inner join estoque as e on e.tipo_estoque = p.tipo_pedido
where ano ='2023'
order by quantidade_pedido desc;

-- retorna a quantidade de beijinhos no estoque -- 
select e.tipo_estoque as tipo, sum(quantidade_estoque) as 'total no estoque' from estoque as e
where e.id_produto = '2';

-- retorna nome, email e endereço de clientes que pediram brigadeiro -- 
select c.nome as nome, c.email as email, c.endereco as endereço, p.quantidade_pedido as quantidade from cliente_pedido as p
inner join cliente as c on c.id_cliente = p.id_cliente 
inner join estoque as e on e.tipo_estoque = tipo_pedido;
