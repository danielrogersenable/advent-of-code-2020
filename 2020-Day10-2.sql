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
		ROW_NUMBER() OVER (ORDER BY Joltage) AS RowNumber,
		Joltage - LAG(Joltage, 1, 0) OVER (ORDER BY Joltage) AS Difference
	FROM
		#Input
),
-- Rationale
-- Each adaptor has a jump of either 1 or 3 jolts from the previous adaptor.
-- If an adaptor has a jump of 3 then it can't be removed (else the jump between adaptors would be more than 3)
-- Hence the only adaptors which can be removed are the ones with a jump of 1 ("consecutive adaptors")
-- Hence we can count the options by determining how many adaptors can be removed in each block of consecutive adaptors
-- The options are below:
--	n		Options L(n)	Notes
--	0		1				No choices
--	1		1				No choices - e.g. you have 1,4,5,8. Can't remove 5.
--	2		2				E.g. 1,4,5,6,9. Can remove either 5 or 6 (but not both)
--	3		4
--	4		7				E.g. 1,4,5,6,7,8,11. We must keep 4 and 8 (as there is a jump of 3 before or after).
--							Hence can choose to remove any of 5, 6 or 7 (but not all), giving 2^3 - 1 = 7 options
-- Above this, the formula for the number of options is recursively L(n) = 2L(n-1) - L(n-4).
-- To prove this, suppose you've found the count for L(n-1) and are adding an additional adaptor at the end.
-- If you are keeping this adaptor, then all choices for the remaining n-1 are valid, giving L(n-1)
-- If you are removing this, you can only do so if you are not also removing the last 2 before it as well
-- (as this would give a jump of more than 3).
-- So how many of the L(n-1) valid options have the last two being removed? 
-- The third from last must not be removed, since this would give an invalid combination.
-- Before that, any valid options are fine - this is L(n-4).
-- Inductively, we can prove L(n) = L(n-1) + L(n-2) + L(n-3) from this (verifying the base cases):
-- L(n) = L(n-1) + L(n-1) - L(n-3)
--		= L(n-1) + L(n-2) + L(n-3) + L(n-4)- L(n-4)
--		= L(n-1) + L(n-2) + L(n-3)
-- Hence this the "tribonacci sequence"
-- (You could probably derive this more straightforwardly, but this was a written voyage of discovery).
Options_CTE AS
(
	SELECT
		RowNumber - LAG(RowNumber, 1, 0) OVER (ORDER BY RowNumber) - 1 AS Options
	FROM
		Differences_CTE
	WHERE
		Difference = 3
)
-- Hack for not being able to do PRODUCT aggregation - take logs, sum and then exp again. Round since this isn't exact.
SELECT
	ROUND(EXP(SUM(LOG(CASE
		WHEN Options > 4 THEN 200000	-- Didn't get a nice non-recursive formula for this, and it wasn't needed.
		WHEN Options = 4 THEN 7
		WHEN Options = 3 THEN 4
		WHEN Options = 2 THEN 2
		ELSE 1
	END))),0)
FROM
	Options_CTE