IF OBJECT_ID('tempdb.dbo.#Cups', 'U') IS NOT NULL
BEGIN
	DROP TABLE #Cups
END

IF OBJECT_ID('tempdb.dbo.#CupsTemp', 'U') IS NOT NULL
BEGIN
	DROP TABLE #CupsTemp
END

CREATE TABLE #Cups (
	Position int,
	Cup int
)

CREATE TABLE #CupsTemp (
	Position int,
	Cup int
)

--INSERT INTO #Cups (Position, Cup)
--VALUES 
--(1, 3),
--(2, 8),
--(3, 9),
--(4, 1),
--(5, 2),
--(6, 5),
--(7, 4),
--(8, 6),
--(9, 7);

INSERT INTO #Cups (Position, Cup)
VALUES 
(1, 9),
(2, 5),
(3, 2),
(4, 4),
(5, 3),
(6, 8),
(7, 7),
(8, 1),
(9, 6);

DECLARE @NumberOfCups int;

SELECT		@NumberOfCups = COUNT(*)
FROM		#Cups

DECLARE @IterationCount int = 0;
DECLARE @CurrentCup int,
		@CurrentCupPosition int,
		@Cup1 int,
		@Cup2 int,
		@Cup3 int,
		@DestinationCup int,
		@DestinationPosition int;

SELECT		TOP 1 @CurrentCup = Cup,
			@CurrentCupPosition = Position
FROM		#Cups
ORDER BY	Position


WHILE (@IterationCount < 100)
BEGIN
	SET @IterationCount = @IterationCount + 1;

	DELETE FROM #CupsTemp

	INSERT INTO	#CupsTemp
	SELECT		*
	FROM		#Cups

	DELETE FROM #Cups

	SELECT		TOP 1
				@Cup1 = Cup,
				@Cup2 = LEAD(Cup, 1) OVER (ORDER BY Position),
				@Cup3 = LEAD(Cup, 2) OVER (ORDER BY Position)
	FROM		#CupsTemp
	WHERE		Position > @CurrentCupPosition
	
	DELETE FROM		#CupsTemp
	WHERE			Cup IN (@Cup1, @Cup2, @Cup3)

	SET @DestinationCup = ((@CurrentCup - 2 % @NumberOfCups) + @NumberOfCups) % @NumberOfCups + 1
	WHILE (@DestinationCup IN (@Cup1, @Cup2, @Cup3))
	BEGIN
		SET @DestinationCup = ((@DestinationCup - 2 % @NumberOfCups) + @NumberOfCups) % @NumberOfCups + 1
	END

	--SELECT		*
	--FROM		#CupsTemp

	SELECT		TOP 1 @DestinationPosition = Position
	FROM		#CupsTemp
	WHERE		Cup = @DestinationCup;
	
	UPDATE		#CupsTemp
	SET			Position = Position + 4
	WHERE		Position > @DestinationPosition

	--SELECT	@Cup1 as Cup1,
	--		@Cup2 as Cup2,
	--		@Cup3 as Cup3,
	--		@DestinationCup as DestinationCup,
	--		@DestinationPosition as DestinationPosition

	INSERT INTO #CupsTemp (Cup, Position)
	VALUES
	(@Cup1, @DestinationPosition + 1),
	(@Cup2, @DestinationPosition + 2),
	(@Cup3, @DestinationPosition + 3)

	UPDATE		#CupsTemp
	SET			Position = Position + @NumberOfCups + 10
	WHERE		Position = 1

	--SELECT		*
	--FROM		#CupsTemp
	--ORDER BY	Position

	INSERT INTO	#Cups (Cup, Position)
	SELECT		Cup,
				ROW_NUMBER() OVER (ORDER BY Position) AS Position
	FROM		#CupsTemp

	SELECT		TOP 1 @CurrentCup = Cup,
				@CurrentCupPosition = Position
	FROM		#Cups
	ORDER BY	Position
END

SELECT		*
FROM		#Cups

DECLARE @PositionOfCupOne int;

SELECT			@PositionOfCupOne = Position
FROM			#Cups
WHERE			Cup = 1;

WITH PutOneFirst_CTE AS
(
	SELECT		Cup,
				(((Position - @PositionOfCupOne) % @NumberOfCups) + @NumberOfCups) % @NumberOfCups + @PositionOfCupOne - 1 as Position
	FROM		#Cups
)
--SELECT		*
--FROM		PutOneFirst_CTE
SELECT		STRING_AGG(Cup, '') WITHIN GROUP (ORDER BY Position)
FROM		PutOneFirst_CTE
WHERE		Position > 1

