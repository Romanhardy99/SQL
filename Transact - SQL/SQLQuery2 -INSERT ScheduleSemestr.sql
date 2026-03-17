--SQLQuery2 -INSERT ScheduleSemestr.sql

USE PV_522_Import;
SET DATEFIRST 1;
SET LANGUAGE RUSSIAN;

DECLARE @group AS INT = 
(
	SELECT group_id
	FROM	Groups
	WHERE group_name = N'PV_522'
);

DECLARE @discipline AS	SMALLINT =	
(
	SELECT discipline_id	
	FROM Disciplines	
	WHERE discipline_name LIKE N'Сетевое%'
);

DECLARE	@number_of_lessons AS TINYINT =
(
	SELECT number_of_lessons 
	FROM Disciplines 
	WHERE discipline_name LIKE N'Сетевое%'
);

DECLARE @teacher AS	SMALLINT=
(
	SELECT teacher_id		
	FROM Teachers		
	WHERE first_name=N'Олег'
);

DECLARE @start_date AS DATE = '2026-04-28';
DECLARE @start_time AS TIME(0) = '18:30';
DECLARE @lesson_number TINYINT = 0;
DECLARE @date DATE = @start_date;
DECLARE @time TIME(0) = @start_time;
DECLARE @pattern TINYINT = 1;
DECLARE @days TABLE(day INT);

INSERT INTO @days VALUES (1),(3),(5);
--INSERT INTO @days VALUES (2), (4);

DECLARE @holidays TABLE(holiday_date DATE);
INSERT INTO @holidays VALUES ('2026-05-01');
INSERT INTO @holidays VALUES ('2026-05-09');

WHILE @lesson_number < @number_of_lessons
BEGIN

	IF DATEPART(WEEKDAY, @date) IN (SELECT day FROM @days)

	AND NOT EXISTS
	(
		SELECT 1
		FROM @holidays
		WHERE holiday_date=@date
	)
	BEGIN
	SET @time = @start_time;
	IF @pattern=1
	BEGIN
		EXEC sp_InsertLesson @group,@discipline,@teacher,@date,@time OUTPUT,@lesson_number OUTPUT;
		IF @lesson_number < @number_of_lessons
		BEGIN
		EXEC sp_InsertLesson @group,@discipline,@teacher,@date,@time OUTPUT,@lesson_number OUTPUT;
		END
	END
	ELSE
	BEGIN
		SET @time =  DATEADD(MINUTE,95,@start_time);

		EXEC sp_InsertLesson @group,@discipline,@teacher,@date,@time OUTPUT,@lesson_number OUTPUT;

		IF @lesson_number < @number_of_lessons

		BEGIN

		EXEC sp_InsertLesson @group,@discipline,@teacher,@date,@time OUTPUT,@lesson_number OUTPUT;
		END
	END

	SET @pattern = IIF(@pattern=1,2,1);

	END

	SET @date = DATEADD(DAY,1,@date);
END

SELECT 
    g.group_name AS [Группа],
    d.discipline_name AS [Дисциплина],
    FORMATMESSAGE('%s %s %s', t.last_name, t.first_name, t.middle_name) AS [Преподаватель],
    s.[date] AS [Дата],
    DATENAME(WEEKDAY, s.[date]) AS [День недели],
    s.[time] AS [Время],
    IIF(s.spent=1,'Проведено','Запланировано') AS [Статус]
FROM Schedule s
JOIN Groups g ON s.[group] = g.group_id
JOIN Disciplines d ON s.discipline = d.discipline_id
JOIN Teachers t ON s.teacher = t.teacher_id
WHERE s.[date] >= '2026-04-28'
ORDER BY s.[date], s.[time];