-- Создайте таблицу logs типа Archive. 
-- Пусть при каждом создании записи в таблицах users, catalogs и products в таблицу logs 
-- помещается время и дата создания записи, название таблицы, идентификатор первичного ключа и содержимое поля name.

use vk;
drop table if exists logs;
create table logs(
	id SERIAL,
	tablename varchar(100),
	table_id bigint,
	name varchar(255)
) ENGINE=Archive;

drop trigger if exists t_users_insert;
drop trigger if exists t_catalogs_insert;
drop trigger if exists t_products_insert;
DELIMITER //

CREATE TRIGGER t_users_insert BEFORE INSERT ON users
FOR EACH row
begin
	insert logs (tablename, table_id, name) values 
	('users', new.id, new.name);
END//

CREATE TRIGGER t_catalogs_insert BEFORE INSERT ON catalogs
FOR EACH row
begin
	insert logs (tablename, table_id, name) values 
	('catalogs', new.id, new.name);
END//

CREATE TRIGGER t_products_insert BEFORE INSERT ON products
FOR EACH row
begin
	insert logs (tablename, table_id, name) values 
	('products', new.id, new.name);
END//
DELIMITER ;
