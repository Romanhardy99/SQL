--SQLQuery0-CHECK.sql

USE PV_522_Import;

--PRINT dbo.GetLastLearningDate(N'PV_522');
----EXEC sp_SelectShedule;

--PRINT dbo.GetNExtLearningDay(N'PV_522', N'2026-03-19')
--PRINT dbo.GetNExtLearningDate(N'PV_522', N'2026-03-21')

--PRINT dbo.GetNewYearHolidaysStartDate(2026);
--PRINT dbo.GetSummerHolidaysStartDate(2025);
--PRINT dbo.GetEasterDate(2022);

PRINT dbo.GetHolidaysStartDate(2026, N'Новогодние%');
PRINT dbo.GetHolidaysStartDate(2026, N'23%');
PRINT dbo.GetHolidaysStartDate(2026, N'8%');
PRINT dbo.GetHolidaysStartDate(2026, N'Пасха');
PRINT dbo.GetHolidaysStartDate(2026, N'Майские%');
PRINT dbo.GetHolidaysStartDate(2026, N'Летние%');