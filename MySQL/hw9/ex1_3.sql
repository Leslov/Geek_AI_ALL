-- Пришлось повозиться, но это стоило того!
-- Подготавливаем тестовые данные
DROP TABLE IF EXISTS prod;
CREATE TEMPORARY TABLE prod(
created_at DATETIME
);
INSERT INTO prod VALUES
('2018-08-01'), ('2016-08-04'), ('2018-08-16'), ('2018-08-17'), ('2018-04-10');

-- Представление для 31 элемента (ровно столько, сколько дней в августе)
CREATE OR REPLACE VIEW august_days_temp AS  
SELECT 0 FROM
(SELECT 1 AS a UNION SELECT 2 UNION SELECT 3) as a
JOIN (SELECT 1 AS a UNION SELECT 2 UNION SELECT 3) AS b
JOIN (SELECT 1 AS a UNION SELECT 2 UNION SELECT 3) AS c
UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4;

-- Запрос
SET @day = 0;
SELECT 
	@day := @day + 1 as 'Day',
	(SELECT COUNT(*) FROM prod WHERE MONTH(created_at) = 8 AND DAY(created_at) = @day LIMIT 1) as IsContains
FROM days_temp;