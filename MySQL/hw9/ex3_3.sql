/*(по желанию) Напишите хранимую функцию для вычисления произвольного числа Фибоначчи. 
Числами Фибоначчи называется последовательность в которой число равно сумме двух предыдущих чисел. 
Вызов функции FIBONACCI(10) должен возвращать число 55.*/

DROP FUNCTION IF EXISTS fib;
DELIMITER //
CREATE FUNCTION fib (num INTEGER)
RETURNS BIGINT NO SQL-- NOT DETERMINISTIC
BEGIN
	DECLARE i BIGINT DEFAULT 2;
	DECLARE first BIGINT DEFAULT 0;
	DECLARE second BIGINT DEFAULT 1;
	DECLARE bucket BIGINT DEFAULT 0;
	IF num = 0 THEN
		RETURN 0;
		END IF;
	WHILE i <= num DO
		SET i = i + 1;
		SET bucket = first;
		SET first = second;
		SET second = bucket + second;
	END WHILE;
	RETURN second;
END//
DELIMITER ;

SELECT fib(10);