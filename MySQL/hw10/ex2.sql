START TRANSACTION;
-- Чистим базу
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE hh_it.city;
TRUNCATE TABLE hh_it.employer;
TRUNCATE TABLE hh_it.employer_reviews;
TRUNCATE TABLE hh_it.employment_type;
TRUNCATE TABLE hh_it.review;
TRUNCATE TABLE hh_it.skill;
TRUNCATE TABLE hh_it.vacancy;
TRUNCATE TABLE hh_it.vacancy_reviews;
TRUNCATE TABLE hh_it.vacancy_skills;
TRUNCATE TABLE hh_it.work_schedule;
SET FOREIGN_KEY_CHECKS = 1;

-- Составление запроса для чистки (на случай изменения таблиц)
/*SELECT CONCAT('TRUNCATE TABLE ', table_schema, '.', table_name, ';')
FROM   information_schema.tables
WHERE  table_type   = 'BASE TABLE' AND  table_schema = 'hh_it';*/

-- Заполняем базу
INSERT skill (name) VALUES
('C#'),
('MySQL'),
('Java'),
('Английский язык'),
('Spring Framework'),
('Управление проектами'),
('Python'),
('SQL'),
('Teradata'),
('Hibernate ORM');

INSERT work_schedule (name) VALUES
('Полный день'),
('Полный день'),
('Сменный график'),
('Гибкий график'),
('Удаленная работа'),
('Вахтовый метод');

INSERT employment_type (name) VALUES
('Полная занятость'),
('Частичная занятость'),
('Проектная работа/разовое задание'),
('Волонтерство'),
('Стажировка');

INSERT city (name) VALUES
('Москва'),
('Уфа'),
('Екатеринбург'),
('Тольяти'),
('Вашингтон'),
('Нью Йорк'),
('Киев'),
('Крым'),
('Нью-Дели'),
('Токио');

INSERT employer (name, text) VALUES
('ТОО Business and Technology Services', 'ТОО «Business & Technology Services» реализует масштабную программу ...'),
('ЗАО Сервис Деск', 'Service Desk – продуктовая ИТ- компания, основанная в 2012 году, является ...');

INSERT vacancy (min_exp, max_exp, min_income, max_income, city_id, work_schedule_id, employment_type_id, employer_id, text) VALUES
(3, 6, 40000, 70000, 2, 1, 1, 1, 'Мы ищем Разработчка Java. Мы предлагаем кандидатам удобное рабочее место, гибкий график, возможности личностного роста и профессионального развития.'),
(2, 4, 50000, 90000, 1, 1, 1, 1, 'Мы ищем Разработчка С#. Мы предлагаем кандидатам удобное рабочее место, гибкий график, возможности личностного роста и профессионального развития.'),
(1, 3, 30000, 60000, 3, 1, 1, 2, 'Мы ищем Разработчка Python. Мы предлагаем кандидатам удобное рабочее место, гибкий график, возможности личностного роста и профессионального развития.');

INSERT review (sender_name, text) VALUES
('Василий','В компании очень высокий уровень организации внутренних процессов. После EPAM тяжело воспринимать уровень организации в других крупных компаниях. '),
('Петр','Был приятно удивлен. Стоило во время первой встречи с ресурсным менеджером упомянуть, что был несколько удивлен выданному ноуту 13 дюймов,  что ожидал 15... как через пару дней пришло уведомление, что могу получить новый MacBook Pro 15".И так во всем =) Ибо компания не настолько богата, чтоб терять людей из-за таких мелочей (оборудование и зп).'),
('Семен','Правила игры меняются на ходу. Вчера ассесмент помогал поддерживать одинаковый уровень инженеров между локациями благодаря тому, что комитет состоит из представителей различных офисов, сегодня фактически один ментор решает достоин ли человек повышения грейда.'),
('Иван','Стабильность (хотя в этом году относительная) Хороший соц.пакет. Разрешают работать удаленно (но с кучей условий)'),
('Ольга','Недостаточно налажен поток информации о сотруднике между менеджерами компании и менеджерами проекта.');

INSERT vacancy_reviews (review_id, vacancy_id) VALUES
(3, 1),
(4, 2);

INSERT employer_reviews (review_id, employer_id) VALUES
(1, 1),
(2, 1),
(5, 2);

INSERT vacancy_skills (vacancy_id, skill_id) VALUES
(1, 3),
(1, 4),
(2, 1),
(2, 5),
(3, 7);
COMMIT;