/*В таблице products есть два текстовых поля: name с названием товара и description с его описанием. 
Допустимо присутствие обоих полей или одно из них. 
Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема. 
Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены. 
При попытке присвоить полям NULL-значение необходимо отменить операцию.*/
USE vk;
DROP TABLE IF EXISTS products;
CREATE TABLE products(
ID SERIAL PRIMARY KEY,
name VARCHAR(255),
description VARCHAR(255)
);

DELIMITER //
CREATE TRIGGER t_prod_insert BEFORE INSERT ON products
FOR EACH ROW
BEGIN
	DECLARE error_msg VARCHAR(255);
	IF NEW.name IS NULL AND NEW.description IS NULL THEN
		 set error_msg = 'Columns name or description must have a value (at least in one column)';
	END IF;
	IF error_msg <> '' THEN
		signal sqlstate '45000' set message_text = error_msg;
	END IF;
END//
CREATE TRIGGER t_prod_update BEFORE UPDATE ON products
FOR EACH ROW
BEGIN
	DECLARE error_msg VARCHAR(255);
	IF NEW.name IS NULL AND NEW.description IS NULL THEN
		 set error_msg = 'Columns name or description must have a value (at least in one column)';
	END IF;
	IF error_msg <> '' THEN
		signal sqlstate '45000' set message_text = error_msg;
	END IF;
END//
DELIMITER ;


INSERT INTO products (name, description) VALUES 
('name1', 'desu');
INSERT INTO products (name, description) VALUES 
('name2', NULL);

SELECT * FROM products;

UPDATE products SET description = NULL;
UPDATE products SET name = NULL;

/*INSERT INTO products (name, description) VALUES 
(NULL, NULL);
SELECT * FROM products;*/


DROP TABLE products;