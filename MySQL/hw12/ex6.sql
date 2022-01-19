--скрипты характерных выборок (включающие группировки, JOIN'ы, вложенные запросы);


SELECT CONCAT(vac.min_income, ' - ', vac.max_income, ' руб.') as 'Зарплата', CONCAT(vac.min_exp, ' - ', vac.max_exp, ' лет') as 'Опыт работы', city.`name` as 'Город', ws.`name` as 'График работы', et.`name` as 'Тип занятости', vac.text as 'Описание', employer.name as 'Компания'
FROM vacancy as vac
INNER JOIN work_schedule as ws on ws.id = vac.work_schedule_id
INNER JOIN employment_type as et on et.id = vac.employment_type_id
INNER JOIN city on city.id = vac.city_id
INNER JOIN employer on employer.id = vac.employer_id
WHERE 
	vac.min_exp <= 3 
	AND (vac.min_income > 30000 or vac.max_income >= 70000)



SELECT skill.name, COUNT(*) as 'Популярность навыка'
FROM skill
INNER JOIN vacancy_skills as vs ON vs.skill_id = skill.id
INNER JOIN vacancy as vac ON vac.id = vs.vacancy_id
GROUP BY skill.id ORDER BY COUNT(*), skill.name