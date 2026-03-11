--SQLQuery4 - COUNT.sql

USE PV_522_Import;

SELECT
			group_name		AS	N'Имя группы',
			COUNT(stud_id)	AS	N'Количество студентов'
FROM		Students, Groups
WHERE		[group]=group_id
GROUP BY	group_name
HAVING		COUNT(stud_id) < 10
;