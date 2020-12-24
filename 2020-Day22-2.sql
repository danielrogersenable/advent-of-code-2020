IF OBJECT_ID('tempdb.dbo.#Player1', 'U') IS NOT NULL
BEGIN
	DROP TABLE #Player1
END

IF OBJECT_ID('tempdb.dbo.#Player2', 'U') IS NOT NULL
BEGIN
	DROP TABLE #Player2
END

IF TYPE_ID(N'CardTableType') IS NULL
BEGIN
	CREATE TYPE dbo.CardTableType
	AS TABLE
	(
		InputRowId bigint not null IDENTITY(1,1),
		CardValue int
	)
END

DECLARE @Player1 AS CardTableType
DECLARE @Player2 AS CardTableType

INSERT INTO @Player1
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

INSERT INTO @Player2
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


--INSERT INTO @Player1
--VALUES 
--(9),
--(2),
--(6),
--(3),
--(1);

--INSERT INTO @Player2
--VALUES
--(5),
--(8),
--(4),
--(7),
--(10)

DECLARE @Player1Text nvarchar(max),
		@Player2Text nvarchar(max)

SELECT		@Player1Text = STRING_AGG(CardValue, ',') WITHIN GROUP (ORDER BY InputRowId)
FROM		@Player1

SELECT		@Player2Text = STRING_AGG(CardValue, ',') WITHIN GROUP (ORDER BY InputRowId)
FROM		@Player2

SELECT @Player1Text


DECLARE @ReturnStatement int;

DECLARE @TempTable TABLE (InputRowId bigint, CardValue int)

INSERT @TempTable
EXECUTE @ReturnStatement = GetRecursiveWinner @Player1Text, @Player2Text

SELECT	*
FROM	@TempTable

-- Results obtained from the logs - SQL isn't playing ball with stored procedures so doing it manually
-- 6,3,47,23,28,1,49,21,34,5,26,2,17,12,39,35,25,14,46,43,41,36,32,20,15,10,45,42,37,33,22,18,16,9,50,19,40,31,48,13,38,8,44,7,29,4,30,27,24,11

DECLARE @Results nvarchar(max) = '6,3,47,23,28,1,49,21,34,5,26,2,17,12,39,35,25,14,46,43,41,36,32,20,15,10,45,42,37,33,22,18,16,9,50,19,40,31,48,13,38,8,44,7,29,4,30,27,24,11';

WITH Results_CTE AS 
(
	SELECT		value as Card,
				ROW_NUMBER() OVER (ORDER BY (SELECT 0)) AS Position
	FROM		STRING_SPLIT(@results, ',')
)
SELECT		SUM(Card * (51 - Position))
FROM		Results_CTE
