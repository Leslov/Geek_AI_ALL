-- Поработаем с колонкой таблицы users, добавлением, модификацией, удалением
-- Добавим колонку с номером паспорта
ALTER TABLE users ADD COLUMN passport_number VARCHAR(10);

-- Посмотрим структуру таблицы
DESCRIBE users;

-- Изменим ее тип
ALTER TABLE users MODIFY COLUMN passport_number VARCHAR(20);

-- Переименуем колонку. 
-- Для MySQL 5.7 команда будет иная ALTER TABLE table_name CHANGE old_column_name new_column_name <column definition>;
ALTER TABLE users RENAME COLUMN passport_number TO passport;

-- Добавим индекс на колонку
ALTER TABLE users ADD INDEX passport_idx (passport);

-- Удалим индекс
ALTER TABLE users DROP INDEX passport_idx;

-- Удалим колонку
ALTER TABLE users DROP COLUMN passport;


-- CHECK CONSTRAINTS

-- совершенствуем таблицу дружбы
-- добавляем ограничение, что отправитель запроса на дружбу 
-- не может быть одновременно и получателем
ALTER TABLE friend_requests ADD CONSTRAINT CHECK(from_user_id != to_user_id);

-- проверяем огрнаничение, данные не добавятся, появится ошибка
-- INSERT INTO friend_requests VALUES(1, 1, 0);

-- добавляем ограничение, что номер телефона должен состоять из 11
-- символов и только из цифр
-- https://regex101.com/
ALTER TABLE users ADD CONSTRAINT CHECK(REGEXP_LIKE(phone, '^[0-9]{11}$'));

-- делаем foreign key на media
ALTER TABLE profiles ADD CONSTRAINT fk_profiles_media FOREIGN KEY (photo_id) REFERENCES media (id);

-- делаем id photo пользователей уникальными
ALTER TABLE profiles MODIFY COLUMN photo_id BIGINT UNSIGNED DEFAULT NULL UNIQUE;

/* 
  C - Create = INSERT
  R - Read   = SELECT
  U - Update = UPDATE
  D - Delete = DELETE
*/

/*
 * INSERT
 * https://dev.mysql.com/doc/refman/8.0/en/insert.html
 */

DESCRIBE users;

-- добавляем пользователя
INSERT users (id, firstname, lastname, phone, email, password_hash, created_at, updated_at)
VALUES (DEFAULT, 'Alex', 'Stepanov', '89213546566','alex@mail.com','asdsdaasd',DEFAULT, DEFAULT);

-- не указываем default значения
INSERT INTO users (firstname, lastname, phone, email, password_hash) 
VALUES ('Lena', 'Stepanova', '89213546568', 'lena@mail.com', 'hjkhkjh');

SELECT * FROM users;

-- если попытаемся добавить второй раз пользователя с такими же email, который уже есть, появится ошибка
-- INSERT users (id, firstname, lastname, phone, email, password_hash, created_at, updated_at) VALUES (DEFAULT, 'Alex', 'Stepanov', '89213546566','alex@mail.com','asdsdaasd',DEFAULT, DEFAULT);

-- добавляем повторно того же пользователя, ошибка не возникает
INSERT IGNORE users (id, firstname, lastname, phone, email, password_hash, created_at, updated_at)
VALUES (DEFAULT, 'Alex', 'Stepanov', '89213546566','alex@mail.com','asdsdaasd',DEFAULT, DEFAULT);

-- не указываем названия колонок
INSERT users 
VALUES (DEFAULT, 'Chris', 'Ivanov','89213546560', 'chris@mail.com', 'kdfhgkasd', DEFAULT, DEFAULT);

-- явно задаем id
INSERT INTO users (id, firstname, lastname, email, phone) VALUES (55, 'Jane', 'Kvanov', 'jane@mail.com', '89293546560' );

-- пробуем добавить id меньше текущего
INSERT INTO users (id, firstname, lastname, email, phone) VALUES (45, 'Jane', 'Night', 'jane_n@mail.com', '89293946560');


-- добавляем через SELECT
-- нужно выполнить файл users.sql, чтобы добавить БД test1 с таблицей users
-- также необходимо удалить ограничение на формат номера телефона, которое мы создали с помощью команды ALTER TABLE users ADD CONSTRAINT CHECK(REGEXP_LIKE(phone, '^[0-9]{11}$'));
INSERT INTO users (firstname, lastname, email, phone)
SELECT name, surname, email, phone FROM test1.users;

SELECT * FROM users;

-- добавляем несколько пользователей
INSERT INTO users (firstname, lastname, email, phone) 
VALUES ('Igor', 'Petrov', 'igor@mail.com', '89213549560'),
('Oksana', 'Petrova', 'oksana@mail.com', '89213549561');

-- добавляем через SET
INSERT users 
SET firstname = 'Iren',
	lastname = 'Sidorova',
	email = 'iren@mail.com',
	phone = '89213541560';

/*
 * SELECT
 * https://dev.mysql.com/doc/refman/8.0/en/select.html
 */

SELECT 8;

SELECT 'HELLO WORLD!';

SELECT 1 + 10;

-- выбираем все поля users
SELECT * FROM users;

-- выбираем только фамилии, имена, email и телефон из таблицы users
SELECT lastname, firstname, email, phone FROM users;

-- выбираем только уникальные имена
SELECT DISTINCT firstname FROM users;

-- выбираем пользователей с именем Аноним
SELECT * FROM users WHERE firstname = 'Аноним';

-- выбираем пользователей с id больше или равным 85 и меньше или равным 100
SELECT * FROM users WHERE id >= 85 AND id <= 100;

-- аналогично предыдущему запросу
SELECT * FROM users WHERE id BETWEEN 85 AND 100;

-- соединяем имя и фамилию с помощью CONCAT, оставляет от имени только первую букву с помощью SUBSTR
-- задаем псевдоним username для столбца
SELECT CONCAT(lastname, ' ', SUBSTR(firstname, 1, 1), '.') AS username, phone FROM users;

-- выбираем четырёх пользователей
SELECT * FROM users LIMIT 4;

-- выбираем 5 пользователей, пропускаем первых 10
SELECT * FROM users LIMIT 5 OFFSET 10;

-- аналогично предыдущему запросу
SELECT * FROM users LIMIT 10, 5;

-- выбираем информацию из таблицы users, отсортировав по фамилии по возрастанию
SELECT * FROM users ORDER BY lastname ASC;

-- выбираем информацию из таблицы users, отсортировав по фамилии по убыванию
SELECT * FROM users ORDER BY lastname DESC;

/*
 * UPDATE
 * https://dev.mysql.com/doc/refman/8.0/en/update.html 
*/
-- добавляем несколько сообщений
INSERT INTO messages (from_user_id, to_user_id, body)
VALUES (45, 55, 'Hi!');

INSERT INTO messages (from_user_id, to_user_id, body)
VALUES (45, 55, 'I hate you!');

SELECT * FROM messages;

-- меняем текст сообщения
UPDATE messages 
SET body = 'I love you'
WHERE id = 5;

-- меняем статус на сообщение доставлено
UPDATE messages SET is_delivered = TRUE;

/*
 * DELETE
 * https://dev.mysql.com/doc/refman/8.0/en/update.html 
 * TRUNCATE
 * https://dev.mysql.com/doc/refman/8.0/en/truncate-table.html
*/

SELECT * FROM users WHERE lastname = 'Stepanov';

-- удаляем пользователя с фамилией Степанов
DELETE FROM users WHERE lastname = 'Stepanov';

SELECT * FROM users WHERE lastname = 'Иванов' OR lastname = 'Ivanov';

-- удаляем ивановых
DELETE FROM users WHERE lastname = 'Иванов' OR lastname = 'Ivanov';

-- удаляем все строки из messages
DELETE FROM messages;

SELECT * FROM messages;

-- Пытаемся удалить пользователя с id = 1
-- Но это не получится, так как есть информация, связанная с ним в дочерних таблицах (сообщения, сообщества и т.д)
DELETE FROM users WHERE id = 1;

-- Очищаем таблицу
TRUNCATE TABLE communities_users;
