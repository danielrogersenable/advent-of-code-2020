IF OBJECT_ID('tempdb.dbo.#Input', 'U') IS NOT NULL
BEGIN
	DROP TABLE #Input
END

CREATE TABLE #Input (
	InputRowId int not null IDENTITY(1,1),
	Number int
)

INSERT INTO #Input
VALUES
(0),
(13),
(16),
(17),
(1),
(10),
(6);

CREATE NONCLUSTERED INDEX ix_number
ON #Input (Number, InputRowId)

DECLARE @CurrentCount int;
SET @CurrentCount = (	SELECT		COUNT(*)
						FROM		#Input)
DECLARE @CurrentNumber int;

WHILE @CurrentCount < 2020
BEGIN
	SET @CurrentNumber = (	SELECT		Number 
							FROM		#Input 
							WHERE		InputRowId = @CurrentCount)

	IF EXISTS (	SELECT		TOP 1 *
				FROM		#Input
				WHERE		Number = @CurrentNumber
							AND InputRowId < @CurrentCount)
	BEGIN
			INSERT INTO		#Input
			SELECT			@CurrentCount - MAX(InputRowId)
			FROM			#Input
			WHERE			Number = @CurrentNumber
							AND InputRowId < @CurrentCount
	END
	ELSE
	BEGIN
			INSERT INTO		#Input
			VALUES			(0)
	END

	SET @CurrentCount = @CurrentCount + 1
END

SELECT		Number
FROM		#Input
WHERE		InputRowId = 2020