-- скрипты создания структуры БД (DDL, с первичными ключами, индексами, внешними ключами);



DROP DATABASE IF EXISTS hh_it;
CREATE DATABASE hh_it;
USE hh_it;


DROP TABLE IF EXISTS skill;
CREATE TABLE skill(
id SERIAL PRIMARY KEY,
name VARCHAR(255) COMMENT 'Например "C++", "MySQL"'
);

DROP TABLE IF EXISTS employment_type;
CREATE TABLE employment_type(
id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
name VARCHAR(255) COMMENT 'Например "полная занятость", "стажировка"'
);

DROP TABLE IF EXISTS work_schedule;
CREATE TABLE work_schedule(
id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
name VARCHAR(255) COMMENT 'Например "полный день", "удаленная работа"'
);

DROP TABLE IF EXISTS city;
CREATE TABLE city( 
id INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
name VARCHAR(255)
);

DROP TABLE IF EXISTS employer;
CREATE TABLE employer(
id SERIAL PRIMARY KEY,
name VARCHAR(255),
text TEXT COMMENT 'описание работодателя'
);

DROP TABLE IF EXISTS vacancy;
CREATE TABLE vacancy(
id SERIAL PRIMARY KEY,
min_exp TINYINT COMMENT 'минимальный опыт работы (лет)',
max_exp TINYINT COMMENT 'максимальный опыт работы (лет)',
min_income INT COMMENT 'минимальная зарплата',
max_income INT COMMENT 'максимальная зарплата',
city_id INT UNSIGNED NOT NULL COMMENT 'город',
work_schedule_id TINYINT UNSIGNED NOT NULL COMMENT 'график работы',
employment_type_id TINYINT UNSIGNED NOT NULL COMMENT 'тип занятости',
text TEXT COMMENT 'описание вакансии',
employer_id BIGINT UNSIGNED NOT NULL,

CONSTRAINT fk_vacancy_employerId FOREIGN KEY (employer_id) REFERENCES employer (id),
CONSTRAINT fk_vacancy_cityId FOREIGN KEY (city_id) REFERENCES city (id),
CONSTRAINT fk_vacancy_scheduleId FOREIGN KEY (work_schedule_id) REFERENCES work_schedule (id),
CONSTRAINT fk_vacancy_employmentTypeId FOREIGN KEY (employment_type_id) REFERENCES employment_type (id)
);

DROP TABLE IF EXISTS review;
CREATE TABLE review(
id SERIAL PRIMARY KEY,
sender_name VARCHAR(255),
text TEXT
);

-- Связующие таблицы (связи * - * или 1 - *)
DROP TABLE IF EXISTS vacancy_skills;
CREATE TABLE vacancy_skills(
vacancy_id BIGINT UNSIGNED NOT NULL,
skill_id BIGINT UNSIGNED NOT NULL,
PRIMARY KEY (vacancy_id, skill_id),
CONSTRAINT fk_vacancySkill_vacId FOREIGN KEY (vacancy_id) REFERENCES vacancy (id),
CONSTRAINT fk_vacancySkill_skillId FOREIGN KEY (skill_id) REFERENCES skill (id)
);

DROP TABLE IF EXISTS employer_reviews;
CREATE TABLE employer_reviews(
review_id SERIAL PRIMARY KEY,
employer_id BIGINT UNSIGNED NOT NULL,
CONSTRAINT fk_employerReviews_reviewId FOREIGN KEY (review_id) REFERENCES review (id),
CONSTRAINT fk_employerReviews_employerId FOREIGN KEY (employer_id) REFERENCES employer (id)
);

DROP TABLE IF EXISTS vacancy_reviews;
CREATE TABLE vacancy_reviews(
review_id SERIAL PRIMARY KEY,
vacancy_id BIGINT UNSIGNED NOT NULL,
CONSTRAINT fk_vacancyReviews_skillId FOREIGN KEY (review_id) REFERENCES review (id),
CONSTRAINT fk_vacancyReviews_vacId FOREIGN KEY (vacancy_id) REFERENCES vacancy (id)
);