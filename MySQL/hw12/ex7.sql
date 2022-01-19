-- представления (минимум 2);


CREATE OR REPLACE VIEW all_employer_reviews AS 
SELECT empl.`name` as 'Employer', rev.sender_name as 'Review author', rev.text as 'Review text'
FROM employer as empl
INNER JOIN employer_reviews as er ON er.employer_id = empl.id
INNER JOIN review as rev ON rev.id = er.review_id
ORDER BY empl.`name`, rev.sender_name

CREATE OR REPLACE VIEW all_vacancy_reviews AS 
SELECT vac.id as 'VacancyID', rev.sender_name as 'ReviewAuthor', rev.text as 'ReviewText'
FROM vacancy as vac
INNER JOIN vacancy_reviews as vr ON vr.vacancy_id = vac.id
INNER JOIN review as rev ON rev.id = vr.review_id
ORDER BY rev.sender_name
