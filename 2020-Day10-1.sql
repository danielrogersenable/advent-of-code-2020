IF OBJECT_ID('tempdb.dbo.#Input', 'U') IS NOT NULL
BEGIN
	DROP TABLE #Input
END

CREATE TABLE #Input (
	IndexId bigint not null IDENTITY(1,1),
	Joltage bigint
)

INSERT INTO #Input
VALUES
(67),
(118),
(90),
(41),
(105),
(24),
(137),
(129),
(124),
(15),
(59),
(91),
(94),
(60),
(108),
(63),
(112),
(48),
(62),
(125),
(68),
(126),
(131),
(4),
(1),
(44),
(77),
(115),
(75),
(89),
(7),
(3),
(82),
(28),
(97),
(130),
(104),
(54),
(40),
(80),
(76),
(19),
(136),
(31),
(98),
(110),
(133),
(84),
(2),
(51),
(18),
(70),
(12),
(120),
(47),
(66),
(27),
(39),
(109),
(61),
(34),
(121),
(38),
(96),
(30),
(83),
(69),
(13),
(81),
(37),
(119),
(55),
(20),
(87),
(95),
(29),
(88),
(111),
(45),
(46),
(14),
(11),
(8),
(74),
(101),
(73),
(56),
(132),
(23);

INSERT INTO #Input (Joltage)
SELECT
	MAX(Joltage) + 3 AS Joltage
FROM
	#Input;

WITH Differences_CTE AS
(
	SELECT
		Joltage - LAG(Joltage, 1, 0) OVER (ORDER BY Joltage) AS Difference
	FROM
		#Input
)
SELECT
	SUM(CASE WHEN [Difference] = 1 THEN 1 ELSE 0 END)
	*
	(SUM(CASE WHEN [Difference] = 3 THEN 1 ELSE 0 END))
FROM
	Differences_CTE