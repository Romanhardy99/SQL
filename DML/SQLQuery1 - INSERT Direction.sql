--SQLQuery1 - INSERT Direction.sql

USE PV_522_DDL;

--INSERT Directions
--		(direction_id, derection_name)
--VALUES	(1,				N'Разработка программного обеспечения'); --N 'Unicode string'

--INSERT Directions
--(direction_id, derection_name)
--VALUES 
--(2, N'Компьютерная графика и дизайн'),
--(3, N'Сетевые технологии и системное администрирование')
--;

INSERT Directions

VALUES 
		(4, N'Java'),
		(5, N'C++ development'),
		(6, N'Python'),
		(7, N'GameDev'),
		(8, N'Android'),
		(9, N'.Net dev'),
		(10, N'Web dev')
		;

SELECT *FROM Directions; -- * - все поля