/*Создайте хранимую функцию hello(), которая будет возвращать приветствие, 
в зависимости от текущего времени суток. 
С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", 
с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", 
с 18:00 до 00:00 — "Добрый вечер", 
с 00:00 до 6:00 — "Доброй ночи".*/

DROP FUNCTION IF EXISTS hello;
DELIMITER //
CREATE FUNCTION hello ()
RETURNS VARCHAR(255) DETERMINISTIC
BEGIN
	DECLARE hours TINYINT DEFAULT HOUR(NOW());
	RETURN CASE 
		WHEN hours BETWEEN 6 AND 11 THEN 'Доброе утро'
		WHEN hours BETWEEN 12 AND 17 THEN 'Добрый день'
		WHEN hours BETWEEN 18 AND 23 THEN 'Добрый вечер'
		WHEN hours BETWEEN 0 AND 5 THEN 'Доброй ночи'
	END;
END//
DELIMITER ;

SELECT hello();