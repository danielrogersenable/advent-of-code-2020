IF OBJECT_ID('tempdb.dbo.#Input', 'U') IS NOT NULL
BEGIN
	DROP TABLE #Input
END

IF OBJECT_ID('tempdb.dbo.#InitialSeating', 'U') IS NOT NULL
BEGIN
	DROP TABLE #InitialSeating
END

IF OBJECT_ID('tempdb.dbo.#IterationSeating', 'U') IS NOT NULL
BEGIN
	DROP TABLE #IterationSeating
END

IF OBJECT_ID('tempdb.dbo.#ConnectedSeats', 'U') IS NOT NULL
BEGIN
	DROP TABLE #ConnectedSeats
END

CREATE TABLE #Input (
	IndexId bigint not null IDENTITY(1,1),
	SeatRow nvarchar(max)
)

INSERT INTO #Input
VALUES
('LLLLLL.LLLLLLLLLLLL.LLLLLL.LLLLLLLLLLLL.LLLLLLLLLLLLL.LLLLLLLLLLLLLLLLLLLLLLLLL.LLLLLLLL.LLLLLLLLL'),
('LLLLLL.LLLLLLLLLLLL.LLLLLLL.LLLLL.LLLLL.LLLLLLLLLLLLLLLLLLLLL.LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL.LL'),
('LLLLLLLLLLLLL.LLLLLLLLLLLLL.LLLLL.LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL.LLLLLLLL.L.LLLLLL.LL.LLLLLL'),
('LLLLLLLLLLLLL.LLLLL.LLLLLLLLLLLLLLLLL.LLLLLLLLLL.LLLL.LLLLLLL.LLLLLLLLLLLLLLLLL.LLLLLLLL.LLLLLLLLL'),
('LLLLL..LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL.LLLLLLLL.LLLL.LLLLLLL.LLLLL.LL.LLLLLLLLLLLLLL.LL.LLLLLLLLL'),
('LLLLLL.LLLLL..LLLLL.LLLLLLL.LLLLL.LLLLLLLL.LLLLLLLLLLLLLLLLLLLLLLLLLLL.LLLLLLL.LLLLLLLLL.L.LLLLL.L'),
('LLLLLL.LLLLLL.LLL.L.LLLLLLL.LLLLL.LLLLL.LLLLLLLL.LLLL.LLLLLL..LLLLLLLL.LLLLLLLL.LLLLLLLLLLLLLL.LLL'),
('.LLLLLLLLLLLL.LLL.L.LLLLLLLLLLLLLLLLLLL.LLLLLLLL.LLLLLLLLLLLL.LLLLLL.L.L.LLLLLLLLLLLLL.L.LLLLLLLLL'),
('LLLLLL.LLLLLL.LLLLL.LLLLLLL..LLLLLLLLLL..LLLLLLL.LLLLLLLLLLLL.LLLLLLLL.LLLLLLLL.LLL.LLLL..LLLLLLLL'),
('..........LL....L..LL..L.....L...L....L............L.LL...L.......L.L.LL...L.L...L....L.L....LLL..'),
('LLLLLL.LLLLLL.LLLLL.LLLLLLL.LLL.L.LLLLL.LLLLLLLLLLLLLLLLLLLLL.LLLLLLLLLLLLL.LL..LLLLLLL.LLLLLLLLLL'),
('LLLLLLLLLLLLL.LLLLL.LLLLLLL.LLL.L.LLLLLLLLLLLLLL.LLLL.LLLLLLL.LLLLLLLL.LLLLLLLL.LLLLLLLLLLLLLL.LLL'),
('.LLLLL..LL.LL..LLL.LLLLLLLL.LLLLL.LLLLL.LLLLLLLLLLLLL.LLLLLLL.LLLLLLLLLLLLLLLLL.LLLLLLLLLLLLLLLLLL'),
('L.LLLL.LLL.LLLLLLLL.LLLLLLL.LLLLL.LLLLLLLLLLLLLLLLLLL.LLL.LLL.LLLLLLLL.LLLLLLLL.LLLLLLLLLLLLL.LLLL'),
('LLLLLL.LLLLLLLLLLLLLLLLLLLL.L.LLLLLLLLL.LLLLLLLLLLLLLLLLLLLLL.LLLLLL.L.LLLLLLLL.LLLLLLLL.LLLLLLLLL'),
('LLLLLL.LLLLLLLLLLLL.LLLLLLLLLLLLL.LLLLL.LLLLLLLL.LLLL.LLLLLLL.LLLLLL.L.LLLLLLLL.LLLLLLLL.LLLLLLLLL'),
('...LLLLL.......L.LL..L..LL...LL..L.....L...L...LLL.L.L.....L.L....L.L......LL..L.L.L..LL.L.....LL.'),
('LLLLLLLLLLL.L.LLL.LLLLLLLLL.LLLLLLLLLLL.LLLLLLLL.LLLL.LLLLLLLLLLLLLLLL.LLLLLL.L.LL.LLLLLLLLLLLLLLL'),
('LLLLLL.LLLLLL.LLLLL.LLLLLLL.LLLLL.LLLLL.LLLLLLLLLLLLL.LLL.LLL.LLLLLLLL.LLLLLLLL..LLLLLLLLLLLLLL.LL'),
('LLLLLL.LLLLLLLLLLLL.LLLLLLL.LLLLL.LLLLLLLLLLLLLLLLLLL.LLLLL.L.LLLLLLLLLLLLLLLLL.LLLLLLLL.LLLLLLLLL'),
('LLLLL..LL.L.LLLLLLL.LLLLLLL.LLLLL.LLLLLLL.LLLLLLLLLLL.LLLLLLLLLLLLLLLLLLLLLLL.L.LLLLLLLL.LLLLLLLLL'),
('LLLLLL.LLLLLL.LLLLL.LLLLLLL.LLLLLL.LLLL.LLLLLLLL.LLLL.LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL.L.LLLLLLLLL'),
('L.LLLL.LLLLLL.LLLLL.LLLLLLL.LLLLL.LLLLL.LLLLLLLL.LLLL.LLLL.LL.LLLLLLLLLLLLLLLLL.LLLLLLLL.LLLLLLLLL'),
('.LLLLL.LLLLLL.LLLLL.LLLLLLL.LLLLL.L.LLL.LLLLLLLL.LLL..LLLLLLL.LL.LLLLL.LLLLLLLLLLLLLLLLL.LLLLLLLLL'),
('LLLLLL.LLLLLL.LLLLL.LLLLLLLLLLLLLLLLLLLLLLLLLLLL.LLLL.LLLLLLLLLLLLLLLL.L.LLLLLL.LLLLLLLLLLLLLLLLL.'),
('L.LL..LLL.L.........L.L....L...LL.L......L..LL.......L.....L.LL.....L..L.L.....L.....L.L...L.L....'),
('LLLLLL.LLLLLLLLLLLL.LLLLLLL.LLLLL..LLLL..LLLLLLLLLLLL.LLLLLLL.LLLLLLLLLLLLLLLLLLLLLLLLLLLLLL.LLLLL'),
('LLL.L..LLLL.L.LLLLLLLLLLLLL.LLLLL.LLLLL.L.LLLLLLL.LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL..LLLLLLLL'),
('LLLLLL.LLLLLL.LLLL.LLLLLLLL.LLLLLLLLLLLLLLLLLLLL.LLLL.LLLLLLL..LLLLLLL.LLLLLLLLLLLLLLLLL.LLLLLLLLL'),
('LL.LLLLLLLLLLLLLLL..LLLLLLLLLLLL..LLLLLLLLL.LLLLLLLLL.LLLL.LLLLLLLLLLLLLLLLLLLLLLLLLLL.L.LLLLLLLLL'),
('LLLLLL..LLLLLLLLLLLLLLLLL.L.LLLLLLLLLLL.LLLLLLLL.LLLL.LLLLLLLLLLLLLLLL.LLLLLLLL.LLLLLLLL.LLLLLLLLL'),
('..L...L...L..L..LL...L..........L.....L......L....L.L..L.L.L..L.LL....L..L...L...L......L.....L..L'),
('LLLLLLLLLLLL..LLLLL.LLLLLLL.LLLLL.LLLLLLLLLLLLLLLLLLL.LL.LLLLLLLLLLLLL.L.LLLLLL.LLLLLLLL.LLLLLLLLL'),
('LLLLLLLLLLLLL.LLLLL.LLLLLLL.LLLLL.LLLLL.LLLLLLLL.LLLL.L.LLLLL.LLLLLLLLLLLLLLLLL..LLLLLLL.LLLLLLLLL'),
('LLLLLLLLLLLLL.LLLLLLLL.LLLL.LLLLL.LLLLLLLLLLLLLL.LLLL.LLLLLLLLL.LLLLLL.LLLLLL.LLLLLLLLLL.LLLLLLLLL'),
('LLLLLLLLLLLLL.LLLLL.LLLLLLLLLLLLL.LLLLLLLLLLLLLLLLLLLLLLLLLLL.LLL.LLLL.LLLLLLLL.LLLLL.LLLLLLLLLL.L'),
('LLLLLLLLLLLLL.L.LLL.LLLLLLL.LLLLL.LLLLL.LLLL.LLLLLLLL.LLLLLLLLLLLLLLLLLLLLL.LLL.LLLLLLLL.LLLLLLLLL'),
('LLLLLL.LLLLLLLLLLLL.LLLLLLL.LLLLL.LLLLL.LLLLLLLLLLLLL.LLLLLLL.LLLLLLLL.LLLLLLLL.LLLLLLL..LLLLLLLLL'),
('LLL..L..LLLL.LLL.L......L...LL.L..L.L...L...LL....L.L.L.L................L....L..L...L......LLL.L.'),
('LLLLLLLLLLLLL.LLLLLLLLLLLLL.LLLL..LLLLL.LLLLLLLL.LLLL.LLLLLLL.LLLLLLLL..LLLLLLL.LLLLLLLLLLLLLLLLLL'),
('LLLLLL.LLLLLL.LLLLLLLLLLLLLLLL.LLLLLLLL.LLLLLLLLLLLLLLLLLL.LL.LLLLLLLL.LLLLLL.LLLLLLLLLL.LLLLLLLLL'),
('.LLLLL.LLLLLL.LLLLL.LLLLLLLLLLLLL.LLLLLLLLLLLLLL.LLLL.LLLLLLL.LLLLLLLL.LLLLLLLL.LLLLLLLL.LLLL.LLLL'),
('LLLLLLLLLLLLL.LLLLLLLLLLLLL.LLLLLLLLLLL.LLLLLLLL.LLLLLLLLLLL..LLLLLLLL.LLLLLLLL.LLLLLLLL.L.LLLLLLL'),
('LLLLLLLLLLLLL.LLLLL.LLLLLLL.LLLLLLLLLLLLLLLLLLLL.LLLL.LLLLLLLLLLLLLLLL.LLLLL.LL.LLLLLLLLLLLLLLLLLL'),
('LLLLLL.LLLLLL.LLLLL.LLLL.LL.LLLLL.LLLLL.LLLLLLLL..LLL.LLLLL.L.LLLLLLLLLLLLLLLLL.LLL.LLLL.LLLLLLLLL'),
('LL.LLL.LLLLLL.LLLLL.LLLLLLLLLLLLL.LL.LLLLLLLLLLL.LLLLLLLLLLLL.LLLLLLLL.LLL.L.LL.LLLLLLLLLLL.LLLLLL'),
('LLLLLLLLLLLLL.LLLLL..LLLLLLLLLLLLLLLLLL.L.LLLLLL.LLLL.LLLLLLL.LLLLLLLLL.LLLLLLLLLLLLLLLL.LLLLLLLLL'),
('.LLLLL..L.L.L...L...L..LL.L.L.LL.L...L.L.L...................LL..L...L......L..L.........L.....LL.'),
('LLLL.LLLLLLLL.LLLLL.LLLLLLL.LLLLLL.LLLLLLLLLLLLL.LLLL.L.LLLLL.LLLLLLLLLLLLLLLLL.LLLLLLLL.LLLLLLLLL'),
('LLLLLL.LLLLLL.LLLLLL.L.LLLL.LLLLL.LLLLLLLLLLLLLL.LLLL.LLLLLLLLLLLLLLLL.LLLLLLLL.LLLL.LLL.LL..LLLL.'),
('.LLLLL.LLLLLLLLLLLL.LLLL.LLLLLLLL.LLLLLLLLLLLLLL.L.LLLL.LLLLLLLLLLLLLL.LLLLLLL..LLLLLLLL.LLLLLLLLL'),
('LLLLLL.LLLLLL.LLLLL.LLLLLLL.LLLL...LLLLL.LLLLLLL.LLLL.LLLLLL..LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL'),
('LLLLLLLLLLLLLLLLLLL.LLLLLLLLLLLLLLLLLLL.LLL.LLLLLLLLL.LLLLLLL.LLLLLLLL..L.LLLLL.LLLLLLLL.LLLLLLLLL'),
('LLLLLLLLLLLLL.LLLLLLLLLLLLL.LLLLLLLLLLL.LLLLLLLLLLLLL.LLLLLLL.LLLLLLLL.LLLLLLLL.LL.LLLLLLLLLLLLLL.'),
('LLL.LL.LLLLLL.LLLLL.LLLLLLL.LLLLLLLLLLL.LLLLLLLL.LLLLLLLLLLLLLLLLLLLLL.LLLLLLLLLLLLLLLLLLLLLLLLLLL'),
('LLLLLL.LLLLLL.LLLLLLLLLLLLL.LLLLLLLL.LLLLLLLL.LL.LLLL.LLLLLLL.LLLLLLLL.LLLLLLLLLLLLLLLLLLLLLLLLLLL'),
('LLLLLL.LLL..L.LLLLL.LLLLLLLLLLLLLLLLL.L.LLLLLLLLLLLLL.LLLLLLL.LLLLLLLL.LLLLLLLL.LLLLLLLL.LLLLLLLLL'),
('L.LL.L.L...L.LL.L.LLL...L.......LLL.L.LL..LLLL.L.L...L..LL.L..LL..L.L..LLLL.L.L..L.L....L....L...L'),
('LLLLLL.LLLLLLLLLLLL.LLLLLLL.LLLLL.LLLLL.LLLLLLLL.LLLL.LLLLLLL.LLLLLLLLLLLLLLLLL.LLL.LLLL.L.LLLLLLL'),
('LLLLLL.LLLLLLLLLLLLLLLLLLLL.LLLLL.LLLLLLLLLLLLLLLL.LL.LLLLLLLLLLLLLLLL.LLLLLLLLLLLLLLLLL.LLLLLLLLL'),
('LLLLLL.L.LLLL.LLLLL.LLL.LLL.LLLLLLLLLLLLL.LLLLLLLLLLL.LLLLLL..LLLLLLLL.LLLLLLLL.LLLLLLLL.LLLLLLLLL'),
('LLLL.LLLLLLLL.LLLLL..LLLLLLLLLLLL.LL.LL.LLLLLLLLLLLLL.LLLLLLL.LLLLLLLL.L.LLLLLL.LLLLLLLLLLLLLLLLLL'),
('LLLLLL.LLLLLLLLLLLLLLLLLLLL.LLLLLLLLLLL.LLLLLLLLLLLLL.LLLLLLL.LLLLLLLL.LLLLLLLL..LLLLLLL.LL.LLLLLL'),
('LLLLLL.LLLLLLLLLLLL.LLLLLLLLLLLLL.LLLL..LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL.LLLLLLLL.LLL.LLLLL'),
('L.L..L................L..LL.....LL...L............L....LL..LL.LLL.L.............L..L...L.....LLL..'),
('LLLLLLLLLLLLLLLL.LL.LLLLLLL.LLLLL.LLLLLLLLLLLLLLLLLLL.LLLLLLL.LLLLLLLLLLLLLLLLL.LLLLLLLL.LLLLLLLLL'),
('LLLLLL.LLLLL.LLLLLL.LLLLLLL.LLLLL.LLL.LLLLLLLLLL.LLLL.LLLLLLL.LLLLLLLL.LLLLLLLL.LLLLLLLL.LLLLLLLL.'),
('LLLLLL.LLLLLLLLLLLLLL.LLLLL.LLLLL.LL.LL.LLLLLLLL.LLLL.LLLLLLL.LL.LLLLL.LLLLLLLLLLLLLLLLL.LLLLLLLLL'),
('LLLL.LL.LLLLL.LLLLL.LLLLLLL.LLLLL.LLLLL.LLLLLLLL.LLLL.LLLLLLL.LLLLLLLLLLLLLLLLL.LLLLLLLL.LLLLLLLLL'),
('LLLLLL.LLLLL..LLLLL.LLLLLLL.LLLLLLLLLLLLLLLLLLLL.LLLL.LLLLLLL.LLL.LLLL.LLLLLL.L.LLLLLLLL.LLLLLLLLL'),
('L.L..L...LL.L.....LL..LL.L.....L.L..L....L..L.L...L.LLLL....L...LL......L..L....LL..L..L........LL'),
('LLLLLLLLLLLLLLLLLLL.LLLL.LL.LLLLLLLLLLL.LLLLLLLLLLLLL.LLLLLLLLLLLLLLLL.LLL.LLLL.LLLLLLLL.LLLLL.LLL'),
('LLLLLLLLLLLLL.LLLLL.LLLLLLL.LLLLLLLL.LL.LLLLLL.LLLLLL.LLLLLLL.LLLLLLLL.LLLLLLLLLLLLLLLLLLLLLLLLLLL'),
('LLLLLL.LLLLL.LLLLLL.LLLLLLL.LLLLLLLLLLL..LLLLLLL.L.LL.LLLLLLL.LLLLLLLL.LLLLLLLLLLLLLLLL..LLLLLLLLL'),
('LLLLLL.LLLLLLLLLLLL.LLLLLLL.LLLLL.LLLLL.LLLLLLLLLLLLLLLLLLLLL.LLLLLLLL.LLL.LLLL.LLLLLLLL.LLLLLLLLL'),
('LLLLLL.LLLLLLLLLLLLLLLLL.LL.LLLLL.LLLLLLLLLLLLLLLL.LLLLLLLLLL.LLLLLLLL.LLLLLLLL.LLLLLLLL.LLLLLLLLL'),
('LLLLLL.LLLL.L.LLLLLLLLLLLLL.LLLLLLLLL.L.LLLLLLLL.LLLL.LLLLLLL.LLLLLLLL.LLLLLLL..LLLLLLLL.LLLLLLLLL'),
('LLLLL..LLLL.L.LLLLL.LLLLLLLLLLLLL.LLLLL.LLLLLLLL.LLLLLLLLLLLL.LLLLLLLLLLLLLLLL..LLLLLLLL.LLLLLLLLL'),
('L.LLLLLLLLLLLLLLLLL.LLLLLLL.LL.LL.LLLLL.LLLLLLLLLLLLL.LL.LLLLLLLLLLLLLLLLLLLLLL.LLLLLLLL.LLLLLLLLL'),
('LL.L......L......L...L..LLL.....L.L..L.L...L......L..L..L.....L...LL.L.LL.L.LLL....L.LLL....L..L..'),
('LLLLLLLLLL.LLLLLLLLLL.LL.LL.LLLLLLLLLLL.L..LLLLL.LLLL.LLLLLLL.LLLLLLLL.LLLLLLLL.LLLLLLLL.LLLLLLLLL'),
('LLLLLL.LLLLLL.LLLLL.LLLLLLL.LLLLL.LLLLL.LLLLL.LL..LLL.LLLLLLL.LLLLLLLLL.LLLLLLL.LLLLLLLL.LLLLLLLLL'),
('LLLLLL..LL.LL.LLLLL.LLLLLLL.L.LLLLLLLLL.LLLLLLLL.LLLLLLLL.LLL.LLL.LLLL.LLLLLLLLLLLLLLLL..LLLLLLLLL'),
('LLLLLLLLLLL.LLLLLLL.LLL.LLLLLLLLL.LLLLL.LLLLLLLL.LLLLLL.LLLLLLLLLLLLLL.LLLLLLLL.LLLLLLLL.LLLLLLLLL'),
('LLLLLLLLLLL.L.LLLLL.LLLLLLL.LLLLL.LLLLL.LLLLLLLL.L.LLLLLLLLLLL.LLLLLLL.LLLLLLLL.LLLLLLLL.LLLLLLLLL'),
('LLLLLL.LLLLLL..LLLL.LLLLLLLLLLLLLLLL.LL.LLLL.LLL.LLLL.LLLLLLL.LLLLLLLL.LLLLLLLL.LLLLLLLL.LLLLLLLLL'),
('LLLLLLLLLLLLLLLLLLL.LLLLLLL.LLLLLLLLL.L.L.LLLLLL.LLLLLLLLLLLL.LLLLLLLLLLLLLLLLL.LLLLLLLL.LLLLLLLLL'),
('LLLLLL.LLLLLLLLLLLL.LLLLLLL.LLLLLLLLLLL.LLLLLLLLLL.LLLLLLLLLLLLLLLLLLL.LL.LLLLLLLLL.LLLLLLL.LLLLLL'),
('L..L.LL......LLL....LLLL.......L.L..L..L....LLLLL..LLLLL..L..L.L.L........LLL...LL.L......LLL.....'),
('LLLLLL.LLLLLLLLLLLLLLLLLLLL.LLLL..LLLLLLLLLLLLLLLLLLL.LLLLLLLLL.LL.LLL.LLLLLLLL.LLLLLLLL.LLLLLLLLL'),
('LLLLLL.LLLLLL.LLLLL.LLLLLLL.LLLLLLLLLLL.LLLLLLLL.LLLLLLLLLLLL.LLLLLLLL.LLLLLLLL.LLLLLLLL.LLLLLLLLL'),
('LLLLL.LLLL.LLLLLLLL..LLLLLL.LLLLL.LLLL...LLLLL.L.LLLL.LLLLLLL..LLLLLLLL.LLLLLLLLLLLLLLLL.LLLLLLLLL'),
('LLLLLLLLLLLLL.LLLLL.LLLLLLL.LLLLL.LLLLLL.LLLLLLLLLLLL.LLLLLLLLLLLLLLLLLL.LLLLLL.LLLLLLLL.LLLLL.LLL'),
('LLLLLLLLLLLLL.LLLLL.L.LLLLL.LLLLLLLLLLL.LLLLLLLLLL.LL.LLLLLLLLLL.LLLLL.LLLLLLLL.LLLLLLLLLLLLL.LLLL'),
('LLLLL.LLLLLLLLLLLLL.LLLLLLL.LLLLL.LLLLL.LLLLLLLL.LLLL.LLLLLLL.LLLLLLLLLLLLLLLLLLLLLLLLLL.LLLLLLLLL'),
('LLLLLL.LLLLLL.LLLLL.LLLLLLL.LLLLL.LLLLL.LLLLLLLL.LLLL.LLLLLLL.LLLLLLLL.LLLLLLLL.LLLLLLLL.LLLLLLLLL'),
('LLLLLL.LLLLLL.LLLLL.LLLLLLL.LLLLL.LLLLLLLLLLLLLLLLLLL.LLLLLLL.LLLLLLLL.L.LLLLLL.LLLLLLLLLLLLLLLLL.'),
('LLLLLLLLLLLLLLLLLLLLLLLLLLL.LLLLLLLLLLL.LLLLLLLL.LLLL.LLLLL.LLLLLLLLLLLLLLLLLLLLLLLLLLLL.LLLLLLLLL');

DECLARE @GridSize int

SELECT @GridSize = MAX(IndexId) FROM #Input

-- Grid is a square, so can cheat slightly and use row index for column index too.
SELECT		I.IndexId as RowIndex,
			J.IndexId as ColumnIndex,
			(I.IndexId - 1) * @GridSize + J.IndexId as SeatNumber,
			SUBSTRING(I.SeatRow, J.IndexId, 1) as SeatType
INTO		#InitialSeating
FROM		#Input I
CROSS APPLY	#Input J;

CREATE NONCLUSTERED INDEX	ix_seatNumber_rowindex
ON							#InitialSeating (SeatNumber, RowIndex)
INCLUDE						(SeatType)

CREATE NONCLUSTERED INDEX	ix_rowindex_seatnumber
ON							#InitialSeating (RowIndex, SeatNumber)
INCLUDE						(SeatType)

CREATE NONCLUSTERED INDEX	ix_rowindex
ON							#InitialSeating (SeatNumber)
INCLUDE						(RowIndex, ColumnIndex, SeatType)

-- Create table of "connected" seats from the initial seat
CREATE TABLE #ConnectedSeats (
	InitialSeatNumber int,
	ConnectedSeatNumber int
)

-- Next seat vertically down
INSERT INTO	#ConnectedSeats
SELECT		Ini.SeatNumber as InitialSeatNumber,
			MIN(Sec.SeatNumber) as ConnectedSeatNumber
FROM		#InitialSeating Ini
			INNER JOIN #InitialSeating Sec 
				ON Ini.ColumnIndex = Sec.ColumnIndex
				AND Ini.SeatNumber < Sec.SeatNumber
				AND Sec.SeatType = 'L'
WHERE		Ini.SeatType = 'L'
GROUP BY	Ini.SeatNumber

-- Next seat right
INSERT INTO	#ConnectedSeats
SELECT		Ini.SeatNumber as InitialSeatNumber,
			MIN(Sec.SeatNumber) as ConnectedSeatNumber
FROM		#InitialSeating Ini
			INNER JOIN #InitialSeating Sec 
				ON Ini.RowIndex = Sec.RowIndex
				AND Ini.SeatNumber < Sec.SeatNumber
				AND Sec.SeatType = 'L'
WHERE		Ini.SeatType = 'L'
GROUP BY	Ini.SeatNumber

-- Next seat right and down
INSERT INTO	#ConnectedSeats
SELECT		Ini.SeatNumber as InitialSeatNumber,
			MIN(Sec.SeatNumber) as ConnectedSeatNumber
FROM		#InitialSeating Ini
			INNER JOIN #InitialSeating Sec 
				ON Ini.RowIndex - Sec.RowIndex = Ini.ColumnIndex - Sec.ColumnIndex
				AND Ini.SeatNumber < Sec.SeatNumber
				AND Sec.SeatType = 'L'
WHERE		Ini.SeatType = 'L'
GROUP BY	Ini.SeatNumber

-- Next seat left and down
INSERT INTO	#ConnectedSeats
SELECT		Ini.SeatNumber as InitialSeatNumber,
			MIN(Sec.SeatNumber) as ConnectedSeatNumber
FROM		#InitialSeating Ini
			INNER JOIN #InitialSeating Sec 
				ON Ini.RowIndex - Sec.RowIndex = Sec.ColumnIndex - Ini.ColumnIndex
				AND Ini.SeatNumber < Sec.SeatNumber
				AND Sec.SeatType = 'L'
WHERE		Ini.SeatType = 'L'
GROUP BY	Ini.SeatNumber

-- Invert, since pairs are symmetric
INSERT INTO		#ConnectedSeats (InitialSeatNumber, ConnectedSeatNumber)
SELECT			ConnectedSeatNumber,
				InitialSeatNumber
FROM			#ConnectedSeats

DECLARE @HasStabilized INT = 0
DECLARE @CurrentIteration INT = 0;

SELECT		RowIndex,
			ColumnIndex,
			SeatNumber,
			SeatType,
			@CurrentIteration AS Iteration,
			0 AS NumberOfSurroundingFullSeats
INTO		#IterationSeating
FROM		#InitialSeating

CREATE NONCLUSTERED INDEX	ix_Iteration
ON							#IterationSeating (Iteration, RowIndex, ColumnIndex)

WHILE(@HasStabilized = 0)
BEGIN
	SELECT @CurrentIteration;

	WITH Surrounding_SeatTE AS (
		SELECT			Cur.SeatNumber,
						@CurrentIteration AS Iteration,
						COUNT(*) AS NumberOfSurroundingFullSeats
		FROM			#IterationSeating Cur
		INNER JOIN		#ConnectedSeats ConSeat 
						ON Cur.SeatNumber = ConSeat.InitialSeatNumber
		INNER JOIN		#IterationSeating Con 
						ON Con.SeatNumber = ConSeat.ConnectedSeatNumber AND Cur.Iteration = Con.Iteration
						AND Con.SeatType = '#'
		WHERE			Cur.Iteration = @CurrentIteration
		GROUP BY		Cur.SeatNumber
	)
	INSERT INTO		#IterationSeating
	SELECT			It.RowIndex,
					It.ColumnIndex,
					It.SeatNumber,
					CASE
						WHEN It.SeatType = 'L' AND SeatTE.NumberOfSurroundingFullSeats IS NULL
						THEN '#'
						WHEN It.SeatType = '#' AND SeatTE.NumberOfSurroundingFullSeats >= 5
						THEN 'L'
						ELSE It.SeatType
					END AS SeatType,
					@CurrentIteration + 1 AS Iteration,
					CASE
						WHEN SeatTE.NumberOfSurroundingFullSeats IS NULL
						THEN 0
						ELSE SeatTE.NumberOfSurroundingFullSeats
					END AS NumberOfSurroundingFullSeats
	FROM			#IterationSeating It
	LEFT JOIN		Surrounding_SeatTE SeatTE ON It.SeatNumber = SeatTE.SeatNumber
	WHERE			It.Iteration = @CurrentIteration;

	SET @CurrentIteration = @CurrentIteration + 1

	IF ((
		SELECT		COUNT(*)
		FROM		#IterationSeating ItSeat
					INNER JOIN #IterationSeating PreviousItSeat ON ItSeat.Iteration = @CurrentIteration
																AND ItSeat.Iteration = PreviousItSeat.Iteration + 1
																AND	ItSeat.ColumnIndex = PreviousItSeat.ColumnIndex
																AND	ItSeat.RowIndex = PreviousItSeat.RowIndex
																AND ItSeat.SeatType != PreviousItSeat.SeatType) = 0)
	BEGIN
		SET @HasStabilized = 1
	END
END

SELECT		COUNT(*)
FROM		#IterationSeating
WHERE		Iteration = @CurrentIteration
			AND SeatType = '#'