-- Тоже пришлось повозиться, а решение оказалось достаточно простым

-- Подготавливаем тестовые данные
DROP TABLE IF EXISTS prod;
CREATE TEMPORARY TABLE prod(
id SERIAL PRIMARY KEY,
created_at DATETIME
);
INSERT INTO prod (created_at) VALUES
('2018-08-01'), ('2016-08-04'), ('2018-08-16'), ('2018-08-17'), ('2018-04-10'),
('2019-08-01'), ('2019-08-04'), ('2019-08-16'), ('2019-08-17');


DROP TABLE IF EXISTS ids_to_save;
CREATE TEMPORARY TABLE ids_to_save(id SERIAL);
INSERT INTO ids_to_save SELECT id FROM prod ORDER BY created_at DESC LIMIT 5;

DELETE FROM prod WHERE id NOT IN 
(SELECT id FROM ids_to_save);

SELECT * FROM prod;