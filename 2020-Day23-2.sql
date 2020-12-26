SET NOCOUNT ON

IF OBJECT_ID('tempdb.dbo.#Cups', 'U') IS NOT NULL
BEGIN
	DROP TABLE #Cups
END

CREATE TABLE #Cups (
	ThisCup int,
	NextCup int
)

CREATE INDEX ThisCupIndex ON #Cups (ThisCup)

INSERT INTO #Cups (ThisCup, NextCup)
VALUES 
(9, 5),
(5, 2),
(2, 4),
(4, 3),
(3, 8),
(8, 7),
(7, 1),
(1, 6),
(6, 10),
(1000000, 9);

--INSERT INTO #Cups (ThisCup, NextCup)
--VALUES 
--(3, 8),
--(8, 9),
--(9, 1),
--(1, 2),
--(2, 5),
--(5, 4),
--(4, 6),
--(6, 7),
--(7, 3),
--(1000000, 9);

DECLARE @IterativeCup int = 10;

WHILE (@IterativeCup < 1000000)
BEGIN
	INSERT INTO #Cups VALUES 
	(@IterativeCup + 0, @IterativeCup + 1),
	(@IterativeCup + 1, @IterativeCup + 2),
	(@IterativeCup + 2, @IterativeCup + 3),
	(@IterativeCup + 3, @IterativeCup + 4),
	(@IterativeCup + 4, @IterativeCup + 5),
	(@IterativeCup + 5, @IterativeCup + 6),
	(@IterativeCup + 6, @IterativeCup + 7),
	(@IterativeCup + 7, @IterativeCup + 8),
	(@IterativeCup + 8, @IterativeCup + 9),
	(@IterativeCup + 9, @IterativeCup + 10);

	SET @IterativeCup = @IterativeCup + 10;
END

UPDATE	#Cups
SET		NextCup = 9
WHERE	ThisCup = 1000000

--SELECT		*
--FROM		#Cups
--ORDER BY	ThisCup

DECLARE @NumberOfCups int;

SELECT		@NumberOfCups = COUNT(*)
FROM		#Cups

DECLARE @IterationCount int = 0;
DECLARE @CurrentCup int,
		@Cup1 int,
		@Cup2 int,
		@Cup3 int,
		@Cup4 int,
		@DestinationCup int,
		@DestinationNextCup int;

-- Update this
SET @CurrentCup = 9

WHILE (@IterationCount < 10000000)
BEGIN
	PRINT @IterationCount

	SET @IterationCount = @IterationCount + 1;

	SELECT		@Cup1 = NextCup
	FROM		#Cups
	WHERE		ThisCup = @CurrentCup

	SELECT		@Cup2 = NextCup
	FROM		#Cups
	WHERE		ThisCup = @Cup1

	SELECT		@Cup3 = NextCup
	FROM		#Cups
	WHERE		ThisCup = @Cup2

	SELECT		@Cup4 = NextCup
	FROM		#Cups
	WHERE		ThisCup = @Cup3

	SET @DestinationCup = ((@CurrentCup - 2 % @NumberOfCups) + @NumberOfCups) % @NumberOfCups + 1
	WHILE (@DestinationCup IN (@Cup1, @Cup2, @Cup3))
	BEGIN
		SET @DestinationCup = ((@DestinationCup - 2 % @NumberOfCups) + @NumberOfCups) % @NumberOfCups + 1
	END

	SELECT		@DestinationNextCup = NextCup
	FROM		#Cups
	WHERE		ThisCup = @DestinationCup

	UPDATE		#Cups
	SET			NextCup = @DestinationNextCup
	WHERE		ThisCup = @Cup3

	UPDATE		#Cups
	SET			NextCup = @Cup4
	WHERE		ThisCup = @CurrentCup

	UPDATE		#Cups
	SET			NextCup = @Cup1
	WHERE		ThisCup = @DestinationCup

	SET @CurrentCup = @Cup4;
END

SELECT		CAST(C.NextCup AS BIGINT) * CAST(NC.NextCup AS BIGINT)
FROM		#Cups C
			INNER JOIN #Cups NC ON C.NextCup = NC.ThisCup
WHERE		C.ThisCup = 1

SET NOCOUNT OFF