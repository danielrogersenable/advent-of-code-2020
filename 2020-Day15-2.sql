IF OBJECT_ID('tempdb.dbo.#Input', 'U') IS NOT NULL
BEGIN
	DROP TABLE #Input
END

IF OBJECT_ID('tempdb.dbo.#PreviousSeenNumber', 'U') IS NOT NULL
BEGIN
	DROP TABLE #PreviousSeenNumber
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

CREATE TABLE #PreviousSeenNumber (
	Number int,
	LastSeenPosition int
)

CREATE CLUSTERED INDEX ix_number
ON #PreviousSeenNumber (Number, LastSeenPosition)

INSERT INTO	#PreviousSeenNumber (Number, LastSeenPosition)
SELECT		Number,
			InputRowId AS LastSeenPosition
FROM		#Input
WHERE		InputRowId != (SELECT MAX(InputRowId) FROM #Input)

DECLARE @TargetCount int = 30000000

DECLARE @CurrentCount int;
SET @CurrentCount = (	SELECT		COUNT(*)
						FROM		#Input)
DECLARE @CurrentNumber int = (	SELECT		TOP 1 Number
								FROM		#Input
								ORDER BY	InputRowId desc);

DECLARE @NextNumber int;

WHILE @CurrentCount < @TargetCount + 1
BEGIN
	IF EXISTS (	SELECT		TOP 1 *
				FROM		#PreviousSeenNumber
				WHERE		Number = @CurrentNumber)
	BEGIN
			SELECT		@NextNumber = @CurrentCount - LastSeenPosition
			FROM		#PreviousSeenNumber
			WHERE		Number = @CurrentNumber

			UPDATE		#PreviousSeenNumber
			SET			LastSeenPosition = @CurrentCount
			WHERE		Number = @CurrentNumber

			SET @CurrentNumber = @NextNumber;
	END
	ELSE
	BEGIN
			INSERT INTO		#PreviousSeenNumber (Number, LastSeenPosition)
			VALUES			(@CurrentNumber, @CurrentCount)

			SET @CurrentNumber = 0
	END

	SET @CurrentCount = @CurrentCount + 1
	IF (@CurrentCount % 100000 = 0)
	BEGIN
		SELECT @CurrentCount
	END
END

SELECT		Number
FROM		#PreviousSeenNumber
WHERE		LastSeenPosition = @TargetCount