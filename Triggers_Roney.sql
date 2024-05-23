-- ----------------------------------
-- Tabela do Registro de Auditoria --
-- ----------------------------------
create table if not exists registro_auditoria (
    id_produto int not null references estoque(id_produto),
  	quantidade_estoque int not null references estoque(quantidade_estoque),
    data_alteracao datetime,
    nova_quantidade int not null 
) engine = InnoDB;   

-- ---------------------------------- --
-- Trigger's do Registro de Auditoria --
-- ---------------------------------- --
delimiter $

create trigger registro_auditoria_updt
before update on estoque
for each row
begin
    insert into registro_auditoria (id_produto, quantidade_estoque, data_alteracao, nova_quantidade) 
    values (old.id_produto, old.quantidade_estoque, now(), new.quantidade_estoque);
end $

delimiter ;

drop trigger registro_auditoria_updt; -- utilizar em caso de erro na trigger

-- ------------------------------------------------------------- --
-- Trigger que subtrai quantidade no estoque  --
-- ------------------------------------------------------------- --
delimiter $
CREATE TRIGGER vendas AFTER update ON clientepedido
FOR EACH ROW
BEGIN
    UPDATE estoque
    SET quantidade_estoque = quantidade_estoque - new.quantidade_pedido
    WHERE id_produto = new.id_produto;
END $
delimiter ;

drop trigger vendas;
-- -------------------- --
-- Select's e updates para testes --
-- -------------------- --

update estoque set quantidade_estoque ='240' where id_produto = 1;
update estoque set quantidade_estoque ='290' where id_produto = 2;
update estoque set quantidade_estoque ='300' where id_produto = 3;
update estoque set quantidade_estoque ='310' where id_produto = 4;

update clientepedido set quantidade_pedido = '45' where id_pedido = 1 and id_cliente = 1 and id_produto = 4;
update clientepedido set quantidade_pedido = '30' where id_produto = 2;
update clientepedido set quantidade_pedido = '30' where id_produto = 3;

select * from clientepedido;
select * from estoque;
select * from registro_auditoria;