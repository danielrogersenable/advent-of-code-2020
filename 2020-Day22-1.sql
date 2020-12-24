IF OBJECT_ID('tempdb.dbo.#Player1', 'U') IS NOT NULL
BEGIN
	DROP TABLE #Player1
END

IF OBJECT_ID('tempdb.dbo.#Player2', 'U') IS NOT NULL
BEGIN
	DROP TABLE #Player2
END


CREATE TABLE #Player1 (
	InputRowId bigint not null IDENTITY(1,1),
	CardValue int
)

CREATE TABLE #Player2 (
	InputRowId bigint not null IDENTITY(1,1),
	CardValue int
)

INSERT INTO #Player1
VALUES 
(17),
(19),
(30),
(45),
(25),
(48),
(8),
(6),
(39),
(36),
(28),
(5),
(47),
(26),
(46),
(20),
(18),
(13),
(7),
(49),
(34),
(23),
(43),
(22),
(4);

INSERT INTO #Player2
VALUES
(44),
(10),
(27),
(9),
(14),
(15),
(24),
(16),
(3),
(33),
(21),
(29),
(11),
(38),
(1),
(31),
(50),
(41),
(40),
(32),
(42),
(35),
(37),
(2),
(12);
DECLARE @Player1Card int,
		@Player2Card int

WHILE (
	(SELECT COUNT(*) FROM #Player1) > 0
	AND (SELECT COUNT(*) FROM #Player2) > 0
)
BEGIN
	SELECT		TOP 1
				@Player1Card = CardValue
	FROM		#Player1
	ORDER BY	InputRowId

	SELECT		TOP 1
				@Player2Card = CardValue
	FROM		#Player2
	ORDER BY	InputRowId

	DELETE FROM		#Player1
	WHERE			InputRowId = (
		SELECT		MIN(InputRowID)
		FROM		#Player1
	)

	DELETE FROM		#Player2
	WHERE			InputRowId = (
		SELECT		MIN(InputRowID)
		FROM		#Player2
	)

	IF (@Player1Card > @Player2Card)
	BEGIN
		INSERT INTO #Player1
		VALUES 
		(@Player1Card),
		(@Player2Card)
	END
	ELSE
	BEGIN
		INSERT INTO #Player2
		VALUES 
		(@Player2Card),
		(@Player1Card)
	END
END

DECLARE @MaxInputId bigint;

IF ((SELECT COUNT(*) FROM #Player2) > 0)
BEGIN
	SELECT	@MaxInputId = MAX(InputRowId)
	FROM	#Player2

	SELECT		SUM((@MaxInputId - InputRowId + 1) * CardValue)
	FROM		#Player2
END
ELSE
BEGIN
	SELECT	@MaxInputId = MAX(InputRowId)
	FROM	#Player1

	SELECT		SUM((@MaxInputId - InputRowId + 1) * CardValue)
	FROM		#Player1
END