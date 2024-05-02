drop database Delidalu;
create schema if not exists Delidalu default character set utf8;
use Delidalu;

-- tabela cliente --
create table if not exists Cliente (
	id_cliente int not null,
	cpf varchar(11) not null,
    nome varchar(50) not null,
    endereco varchar(100) not null,
    email varchar(50) not null,
    telefone varchar(11) not null,
primary key (id_cliente)
) Engine = InnoDB;    

-- tabela produto -- 
create table if not exists Estoque (
	id_produto int not null,
	tipo_estoque varchar(20) not null,
    quantidade_estoque int not null,
primary key (tipo_estoque)
) Engine = InnoDB;

-- tabela Cliente_Pedido --
create table if not exists ClientePedido (
	id_pedido int auto_increment not null,
	id_cliente int not null,
    id_produto int not null,
    quantidade_pedido int not null,
    tipo_pedido varchar(20) not null,
    mes int not null,
    ano int not null,
primary key (id_pedido),
foreign key (id_cliente) references Cliente(id_cliente),
foreign key (tipo_pedido) references Estoque(tipo_estoque)
) Engine = InnoDB;


-- inserts -- 
insert into Cliente (id_cliente, cpf, nome, endereco, email, telefone) values
(1,'12345678901','Marcos Almeida','Samambaia','marcosa32@gmail.com','61912341234'),
(2,'23456788313','Carlos Silva','Taguatinga','carlos@gmail.com','61983791046'),
(3,'34567890124','Julia Campos','Ceilândia','juliacampos@gmail.com','61984016847'),
(4,'48507259103','Maria Silveira','Guará','mariasilveira@gmail.com','61980426501'),
(5,'57103856201','Douglas Fabio','Guará','douglas@gmail.com','61986032265'),
(6,'87910462917','Jurema Felix','Recanto das Emas','jurema45@gmail.com','61987023659'),
(7,'76829463910','Silvio Santos','Samambaia','silvinho@gmail.com','61985024659'),
(8,'57291056493','Natalia Souza','Samambaia','nat89@gmail.com','61985013465'),
(9,'57690137503','Clara Costa','Taguatinga','clara56@gmail.com','61984720462'),
(10,'99201048693','Maria Alice','Samambaia','maria21@gmail.com','61980791753');

insert into Estoque (id_produto, tipo_estoque, quantidade_estoque) values
(1,'Brigadeiro','150'),
(2,'Beijinho','130'),
(3,'Casadinho','135'),
(4,'Ninho','120');

insert into ClientePedido(id_pedido, id_cliente, id_produto, quantidade_pedido, tipo_pedido, mes, ano) values
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
select * from Estoque;
select * from ClientePedido;
select * from cliente, Estoque, ClientePedido;

-- retorna os dados do cliente junto com seus pedidos -- 
select c.nome as Nome, c.email as 'E-mail', c.telefone as Telefone, c.endereco as Endereço, p.quantidade_pedido as Quantidade, e.tipo_estoque as Tipo
from ClientePedido as p
inner join Cliente as c on c.id_cliente = p.id_cliente 
inner join Estoque as e on e.tipo_estoque = p.tipo_pedido
order by tipo_estoque asc;

-- retorna o total de brigadeiros vendidos -- 
select  e.tipo_estoque as Tipo, sum(p.quantidade_pedido) as Quantidade from ClientePedido as p
inner join Estoque as e on e.tipo_estoque = p.tipo_pedido
where tipo_estoque = 'Brigadeiro';

-- retorna a quantidade de doces Ninho vendidos em samambaia em 2023 --
select e.tipo_estoque as Tipo,sum(quantidade_pedido) as Quantidade from Cliente as c 
inner join ClientePedido as p on c.id_cliente = p.id_cliente
inner join Estoque as e on e.tipo_estoque = tipo_pedido
where endereco = 'Samambaia'
and tipo_estoque = 'Ninho'
and ano = '2023';

-- retorna os clientes que pediram entre 30 a 50 itens em ordem decrescente -- 
select c.nome as Nome, e.tipo_estoque as Tipo, p.quantidade_pedido as Quantidade from ClientePedido as p
inner join Estoque as e on e.tipo_estoque = p.tipo_pedido
inner join Cliente as c on c.id_cliente = p.id_cliente
where quantidade_pedido between 30 and 50
order by quantidade_pedido desc;

-- retorna a região que pediu mais Casadinhos -- 
select c.endereco as Endereço, count(id_pedido) as pedidos from ClientePedido as p
inner join Cliente as c on c.id_cliente = p.id_cliente
inner join Estoque as e on e.tipo_estoque = p.tipo_pedido
where tipo_estoque = 'Casadinho';

-- retorna os clientes que mais pediram em 2023 -- 
select c.nome as Nome ,c.endereco as Endereço ,e.tipo_estoque as Tipo, p.quantidade_pedido from Cliente as c
inner join ClientePedido as p on c.id_cliente = p.id_pedido
inner join Estoque as e on e.tipo_estoque = p.tipo_pedido
where ano ='2023'
order by quantidade_pedido desc;

-- retorna a quantidade de beijinhos no estoque -- 
select e.tipo_estoque as Tipo, sum(quantidade_estoque) as 'Total no Estoque' from Estoque as e
where e.id_produto = '2';

-- retorna nome, email e endereço de clientes que pediram Brigadeiro -- 
select c.nome as Nome, c.email as Email, c.endereco as Endereço, p.quantidade_pedido as Quantidade from ClientePedido as p
inner join Cliente as c on c.id_cliente = p.id_cliente 
inner join Estoque as e on e.tipo_estoque = tipo_pedido

