IF OBJECT_ID('tempdb.dbo.#Input', 'U') IS NOT NULL
BEGIN
	DROP TABLE #Input
END

CREATE TABLE #Input (
	IndexId bigint not null IDENTITY(1,1),
	ValuesRow nvarchar(max)
)

INSERT INTO #Input
VALUES
('62: 93 93'),
('41: 40 111 | 127 70'),
('95: 127 93 | 40 40'),
('73: 127 24 | 40 58'),
('121: 127 82 | 40 75'),
('101: 93 95'),
('54: 127 64 | 40 112'),
('76: 71 40 | 106 127'),
('25: 50 40 | 126 127'),
('21: 127 65'),
('111: 65 40 | 57 127'),
('44: 127 127 | 127 40'),
('120: 98 127 | 108 40'),
('59: 40 111 | 127 34'),
('63: 65 40 | 65 127'),
('8: 42'),
('106: 44 40 | 50 127'),
('98: 127 48 | 40 13'),
('1: 36 127 | 74 40'),
('52: 127 20 | 40 114'),
('114: 50 127 | 88 40'),
('2: 29 40 | 45 127'),
('57: 127 127 | 40 127'),
('65: 40 40'),
('43: 40 89 | 127 73'),
('42: 40 69 | 127 5'),
('110: 127 122 | 40 128'),
('83: 40 30 | 127 103'),
('105: 110 40 | 53 127'),
('19: 116 127 | 59 40'),
('90: 40 40 | 127 127'),
('75: 93 90'),
('11: 42 31'),
('20: 127 61 | 40 62'),
('16: 83 127 | 12 40'),
('33: 65 127 | 62 40'),
('4: 81 127 | 91 40'),
('10: 40 57'),
('18: 61 40 | 62 127'),
('88: 40 127 | 127 40'),
('102: 40 109 | 127 107'),
('49: 9 127 | 51 40'),
('81: 25 127 | 84 40'),
('115: 104 40 | 106 127'),
('125: 43 40 | 92 127'),
('9: 93 127 | 127 40'),
('130: 106 40 | 67 127'),
('56: 95 40 | 57 127'),
('34: 40 44'),
('77: 127 55 | 40 124'),
('79: 27 40 | 13 127'),
('80: 40 41 | 127 52'),
('82: 126 127 | 61 40'),
('61: 40 40 | 40 127'),
('27: 51 40 | 95 127'),
('94: 40 127 | 93 40'),
('6: 78 127 | 129 40'),
('24: 61 127 | 50 40'),
('126: 127 40'),
('108: 82 40 | 56 127'),
('29: 127 62 | 40 61'),
('70: 127 95'),
('99: 90 127 | 61 40'),
('127: "b"'),
('124: 15 127 | 120 40'),
('48: 40 65 | 127 50'),
('74: 50 127 | 61 40'),
('55: 40 66 | 127 16'),
('64: 40 9'),
('109: 127 88 | 40 95'),
('112: 40 94 | 127 9'),
('30: 44 127 | 61 40'),
('47: 121 127 | 130 40'),
('28: 27 40 | 56 127'),
('23: 48 40 | 97 127'),
('96: 40 95 | 127 65'),
('37: 63 40 | 7 127'),
('116: 123 127 | 36 40'),
('7: 40 44 | 127 65'),
('35: 40 127'),
('69: 40 125 | 127 72'),
('36: 65 127 | 94 40'),
('123: 127 65 | 40 57'),
('85: 40 126 | 127 65'),
('39: 9 127 | 126 40'),
('26: 127 35 | 40 88'),
('5: 22 127 | 100 40'),
('60: 40 90 | 127 65'),
('71: 9 127 | 61 40'),
('78: 40 82 | 127 39'),
('87: 21 40 | 101 127'),
('46: 126 127 | 44 40'),
('66: 127 54 | 40 37'),
('13: 127 61 | 40 50'),
('91: 40 119 | 127 99'),
('31: 77 40 | 105 127'),
('38: 60 40 | 106 127'),
('128: 38 40 | 2 127'),
('3: 46 40 | 49 127'),
('117: 44 127 | 95 40'),
('17: 14 40 | 79 127'),
('84: 127 65 | 40 65'),
('45: 90 127 | 95 40'),
('86: 127 18 | 40 85'),
('72: 40 80 | 127 4'),
('103: 93 62'),
('50: 93 127 | 40 40'),
('104: 35 40 | 65 127'),
('89: 117 127 | 46 40'),
('51: 127 127'),
('107: 90 40 | 88 127'),
('0: 8 11'),
('32: 40 102 | 127 115'),
('113: 96 40 | 26 127'),
('14: 10 40 | 24 127'),
('58: 50 127 | 126 40'),
('15: 23 127 | 87 40'),
('68: 1 40 | 28 127'),
('40: "a"'),
('119: 65 40 | 50 127'),
('12: 40 33 | 127 56'),
('118: 57 127 | 35 40'),
('122: 113 127 | 3 40'),
('67: 127 9 | 40 126'),
('22: 68 40 | 47 127'),
('92: 86 40 | 76 127'),
('93: 127 | 40'),
('129: 84 127 | 118 40'),
('97: 88 127 | 65 40'),
('100: 17 40 | 19 127'),
('53: 40 6 | 127 32');

IF OBJECT_ID('tempdb.dbo.#RuleMappings', 'U') IS NOT NULL
BEGIN
	DROP TABLE #RuleMappings
END

CREATE TABLE #RuleMappings (
	RuleNumber int,
	RelatedRuleNumber int
)

IF OBJECT_ID('tempdb.dbo.#RuleIndex', 'U') IS NOT NULL
BEGIN
	DROP TABLE #RuleIndex
END

SELECT		CAST(SUBSTRING(ValuesRow, 0, CHARINDEX(':', ValuesRow)) AS INT) AS RuleNumber,
			SUBSTRING(ValuesRow, CHARINDEX(':', ValuesRow) + 2, 10000) AS RuleLine
INTO		#RuleIndex
FROM		#Input;

IF OBJECT_ID('tempdb.dbo.#PipeSplit', 'U') IS NOT NULL
BEGIN
	DROP TABLE #PipeSplit
END

SELECT		RuleNumber,
			LTRIM(RTRIM(value)) AS RuleLine,
			ROW_NUMBER() OVER (PARTITION BY RuleNumber ORDER BY (SELECT 0)) as RuleOptionNumber
INTO		#PipeSplit
FROM		#RuleIndex
CROSS APPLY	string_split(RuleLine, '|')

IF OBJECT_ID('tempdb.dbo.#RuleKeySplit', 'U') IS NOT NULL
BEGIN
	DROP TABLE #RuleKeySplit
END

SELECT		RuleNumber,
			LTRIM(RTRIM(value)) AS RuleLine,
			RuleOptionNumber,
			ROW_NUMBER() OVER (PARTITION BY RuleNumber, RuleOptionNumber ORDER BY (SELECT 0)) as RuleOrder
INTO		#RuleKeySplit
FROM		#PipeSplit
CROSS APPLY	string_split(RuleLine, ' ')

IF OBJECT_ID('tempdb.dbo.#BaseRule', 'U') IS NOT NULL
BEGIN
	DROP TABLE #BaseRule
END

SELECT		RuleNumber,
			SUBSTRING(RuleLine, 2, 1) AS Regex
INTO		#BaseRule
FROM		#RuleKeySplit
WHERE		RuleLine LIKE '"%"'

IF OBJECT_ID('tempdb.dbo.#RuleRegex', 'U') IS NOT NULL
BEGIN
	DROP TABLE #RuleRegex
END

CREATE TABLE #RuleRegex (
	IndexId bigint not null IDENTITY(1,1),
	RuleNumber int,
	Regex nvarchar(max)
)

INSERT INTO	#RuleRegex (RuleNumber, Regex)
SELECT		RuleNumber, Regex
FROM		#BaseRule

IF OBJECT_ID('tempdb.dbo.#TemporaryRuleRegex', 'U') IS NOT NULL
BEGIN
	DROP TABLE #TemporaryRuleRegex
END

SELECT		RuleNumber,
			CONCAT(' ', RuleLine, ' ') AS RuleLine
INTO		#TemporaryRuleRegex
FROM		#RuleIndex

DECLARE @CurrentRuleNumber int,
		@CurrentRegex nvarchar(max);

WHILE NOT EXISTS (SELECT 1 FROM #RuleRegex WHERE RuleNumber = 0)
BEGIN
	DELETE		#TemporaryRuleRegex
	FROM		#TemporaryRuleRegex TRR
	INNER JOIN	#RuleRegex RR ON TRR.RuleNumber = RR.RuleNumber

	DECLARE Foo_Cursor CURSOR FOR(
		SELECT		RuleNumber,
					Regex
		FROM		#RuleRegex)

	OPEN Foo_Cursor;

	FETCH NEXT FROM Foo_Cursor
	INTO @CurrentRuleNumber, @CurrentRegex;

	WHILE @@FETCH_STATUS = 0
	BEGIN
		UPDATE		#TemporaryRuleRegex
		SET			RuleLine = REPLACE(RuleLine, CONCAT(' ', @CurrentRuleNumber, ' '), CONCAT(' ', @CurrentRegex, ' '))

		FETCH NEXT FROM Foo_Cursor
		INTO @CurrentRuleNumber, @CurrentRegex;
	END

	INSERT INTO	#RuleRegex (RuleNumber, Regex)
	SELECT		RuleNumber,
				REPLACE(CONCAT('(',RuleLine,')'), ' ', '') AS Regex
	FROM		#TemporaryRuleRegex
	WHERE		PATINDEX('%[0-9]%', RuleLine) = 0

	CLOSE Foo_Cursor
	DEALLOCATE Foo_Cursor
END

	SELECT		RR.RuleNumber,
				Regex,
				RuleLine
	FROM		#RuleRegex RR
	INNER JOIN	#RuleIndex RI ON RR.RuleNumber = RI.RuleNumber
	ORDER BY	RuleNumber

SELECT		CONCAT('\n(', Regex, ')\n')
FROM		#RuleRegex
WHERE		RuleNumber = 0

-- Regex checked in https://regexr.com/ because TSQL Regex sucks.
