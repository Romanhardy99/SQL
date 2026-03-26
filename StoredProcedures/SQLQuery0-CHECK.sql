--SQLQuery0-CHECK.sql
USE PV_522_Import;
SET DATEFIRST 1;

DELETE FROM Schedule --WHERE discipline = (SELECT discipline_id FROM Disciplines WHERE discipline_name=N'HTML/CSS')

EXEC sp_InsertSchedule N'PV_522',N'%Win%C++', N'Олег', N'2025-12-09'
EXEC sp_InsertSchedule N'PV_522',N'%Win%C#', N'Олег', N'2025-12-30'
--EXEC sp_InsertSchedule N'PV_522', N'%Программирование MS SQL Server', N'Олег', N'2026-01-20';

--EXEC	sp_InsertSchedule N'PV_522',N'%Win%C++',N'HTML/CSS',N'Олег',
EXEC	sp_SelectShedule;
--EXECUTE sp_SelectShedule;

--EXEC	SelectDisciplineFromSchedule N'%ADO.NET%'

--DELETE FROM DaysOFF
--EXEC sp_InsertAllHolidaysFor 2025;
--SELECT [date],holiday_name FROM DaysOFF, Holidays WHERE holiday=holiday_id;