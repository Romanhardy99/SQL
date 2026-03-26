--SQLQuery7-sp_InsertAllHolidaysFor.sql
USE PV_522_Import;
SET DATEFIRST 1;
GO

CREATE OR ALTER PROCEDURE sp_InsertAllHolidaysFor @year AS SMALLINT
AS
BEGIN
	EXEC	sp_InsertHolidays	@year, 'Новогодние%';
	EXEC	sp_InsertHolidays	@year, '23%';
	EXEC	sp_InsertHolidays	@year, '8%';
	EXEC	sp_InsertHolidays	@year, 'Пасха';
	EXEC	sp_InsertHolidays	@year, 'Майские%';
	EXEC	sp_InsertHolidays	@year, 'Летние%';
END