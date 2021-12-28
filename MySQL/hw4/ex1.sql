use vk;
DELETE FROM `profiles`;
DELETE FROM friendrequests;
DELETE FROM messages;
DELETE FROM friendrequests;
DELETE FROM media;
DELETE FROM mediatypes;
DELETE FROM communities_users;
DELETE FROM communities;
DELETE FROM wall;
DELETE FROM commentary;
DELETE FROM post;
DELETE FROM users;

ALTER TABLE `profiles` AUTO_INCREMENT = 1;
ALTER TABLE friendrequests AUTO_INCREMENT = 1;
ALTER TABLE messages AUTO_INCREMENT = 1;
ALTER TABLE friendrequests AUTO_INCREMENT = 1;
ALTER TABLE media AUTO_INCREMENT = 1;
ALTER TABLE mediatypes AUTO_INCREMENT = 1;
ALTER TABLE communities AUTO_INCREMENT = 1;
ALTER TABLE communities_users AUTO_INCREMENT = 1;
ALTER TABLE post AUTO_INCREMENT = 1;
ALTER TABLE wall AUTO_INCREMENT = 1;
ALTER TABLE commentary AUTO_INCREMENT = 1;
ALTER TABLE users AUTO_INCREMENT = 1;

INSERT IGNORE users (ID, FirstName, LastName, Phone, Email, Password) VALUES 
(1, 'Василий', 'Пупкин', 88005553535, 'example1@mail.ru', 'D41D8CD98F00B204E9800998ECF8427E'),
(2, 'Петръ', 'Петровъъ', 88005553535, 'example2@mail.ru', 'D41D8CD98F00B204E9800998ECF8427E'),
(3, 'Макс', 'Мартышкин', 88005553535, 'example3@mail.ru', 'D41D8CD98F00B204E9800998ECF8427E'),
(4, 'Амбразуров', 'Сет', 88005553535, 'example4@mail.ru', 'D41D8CD98F00B204E9800998ECF8427E'),
(5, 'Грузов', 'Грузтик', 88005553535, 'example5@mail.ru', 'D41D8CD98F00B204E9800998ECF8427E'),
(6, 'Пар', 'Параметров', 88005553535, 'example6@mail.ru', 'D41D8CD98F00B204E9800998ECF8427E'),
(7, 'Шаман', 'Шомполов', 88005553535, 'example7@mail.ru', 'D41D8CD98F00B204E9800998ECF8427E'),
(8, 'Король', 'Личинов', 88005553535, 'example8@mail.ru', 'D41D8CD98F00B204E9800998ECF8427E'),
(9, 'Артасъ', 'Менетил', 88005553535, 'example9@mail.ru', 'D41D8CD98F00B204E9800998ECF8427E'),
(10, 'Семеновъ', 'Семен', 88005553536, 'example0@mail.ru', 'D41D8CD98F00B204E9800998ECF8427E');

INSERT IGNORE `profiles` (UserID, Birthday, City, Country, Gender, PhotoId) VALUES 
(1, '1994-04-03', 'Zabugorsk', 'Russia', 'm', 1488),
(2, '1994-04-03', 'Zabugorsk', 'Russia', 'f', 1488),
(3, '1994-04-03', 'Zabugorsk', 'Russia', 'x', 1488),
(4, '1994-04-03', 'Zabugorsk', 'Russia', 'f', 1488),
(5, '1994-04-03', 'Zabugorsk', 'Russia', 'x', 1488),
(6, '2009-01-08', 'Zabugorsk', 'Russia', 'm', 1488),
(7, '2009-01-08', 'Zabugorsk', 'Russia', 'm', 1488),
(8, '2009-01-08', 'Zabugorsk', 'Russia', 'm', 1488),
(9, '2009-01-08', 'Zabugorsk', 'Russia', 'm', 1488),
(10, '1990-07-20', 'Zabugorsk', 'Russia', 'm', 1488),
(11, '1990-07-20', 'Zabugorsk', 'Russia', 'm', 1488);

INSERT IGNORE messages (Body, IsDelivered, RecieverUserId, SenderUserId, DateCreate, DateChange) VALUES 
('Привет, как дела? Как погода азаза.', TRUE, 1, 3, DEFAULT, DEFAULT),
('Привет, как дела? Как погода азаза.', TRUE, 1, 3, DATE_ADD(NOW(), INTERVAL 1 YEAR), DEFAULT),
('Привет, как дела? Как погода азаза.', TRUE, 1, 3, DEFAULT, DEFAULT),
('Привет, как дела? Как погода азаза.', TRUE, 1, 3, DEFAULT, DEFAULT),
('Привет, как дела? Как погода азаза.', TRUE, 1, 3, DEFAULT, DEFAULT),
('Привет, как дела? Как погода азаза.', TRUE, 1, 3, DEFAULT, DEFAULT),
('Привет, как дела? Как погода азаза.', TRUE, 1, 3, DEFAULT, DEFAULT),
('Привет, как дела? Как погода азаза.', TRUE, 1, 3, DEFAULT, DEFAULT),
('Привет, как дела? Как погода азаза.', TRUE, 1, 3, DEFAULT, DEFAULT),
('Привет, как дела? Как погода азаза.', TRUE, 1, 3, DEFAULT, DEFAULT);

INSERT IGNORE friendrequests (RecieverUserId, RequesterUserId) VALUES 
(1, 9),
(2, 1),
(3, 1),
(4, 3),
(5, 2),
(6, 7),
(7, 3),
(7, 6),
(8, 3),
(4, 4),
(3, 3);

INSERT IGNORE mediatypes (ID, Name) VALUES 
(1, 'картинка'),
(2, 'видео'),
(3, 'документ');

INSERT IGNORE media (FileName, FileSize, MediaTypeId, UserId) VALUES 
('я1.png', 32678, 1, 1),
('я2.png', 32678, 1, 2),
('я3.png', 32678, 1, 3),
('я4.png', 32678, 1, 4),
('я5.png', 32678, 1, 5),
('я6.png', 32678, 1, 6),
('я7.png', 32678, 1, 7),
('я8.png', 32678, 1, 8),
('я9.png', 32678, 1, 9),
('я10.png', 32678, 1, 10);

INSERT IGNORE communities (AdminId, Description, Name) VALUES 
(1, 'Здесь собраны все мемы интернета', 'Мемная атака'),
(2, 'Здесь собраны все мемы интернета', 'Мемная атака'),
(3, 'Здесь собраны все мемы интернета', 'Мемная атака'),
(4, 'Здесь собраны все мемы интернета', 'Мемная атака'),
(5, 'Здесь собраны все мемы интернета', 'Мемная атака'),
(6, 'Здесь собраны все мемы интернета', 'Мемная атака'),
(7, 'Здесь собраны все мемы интернета', 'Мемная атака'),
(8, 'Здесь собраны все мемы интернета', 'Мемная атака'),
(9, 'Здесь собраны все мемы интернета', 'Мемная атака'),
(10, 'Здесь собраны все мемы интернета', 'Мемная атака');

INSERT IGNORE communities_users (CommunityId, UserID) VALUES 
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10);

INSERT IGNORE post (AuthorUserId, ID, Body) VALUES 
(1, 1, 'Привет всем, я сегодня тут зарегался!'),
(2, 2, 'Привет всем, я сегодня тут зарегался!'),
(3, 3, 'Привет всем, я сегодня тут зарегался!'),
(4, 4, 'Привет всем, я сегодня тут зарегался!'),
(5, 5, 'Привет всем, я сегодня тут зарегался!'),
(6, 6, 'Привет всем, я сегодня тут зарегался!'),
(7, 7, 'Привет всем, я сегодня тут зарегался!'),
(8, 8, 'Привет всем, я сегодня тут зарегался!'),
(9, 9, 'Привет всем, я сегодня тут зарегался!'),
(10, 10, 'Привет всем, я сегодня тут зарегался!');

INSERT IGNORE wall (PostId) VALUES 
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10);

INSERT IGNORE commentary (PostId, Body) VALUES 
(1, 'Молодец! Я тоже!'),
(2, 'Молодец! Я тоже!'),
(3, 'Молодец! Я тоже!'),
(4, 'Круто! И я!'),
(5, 'Круто! И я!'),
(6, 'Ого, и ты тоже тут зарегался!'),
(7, 'Круто! И я!'),
(8, 'Круто! И я!'),
(9, 'Вау, вот это совпадение. Я тоже!'),
(10, 'Вау, вот это совпадение. Я тоже!');