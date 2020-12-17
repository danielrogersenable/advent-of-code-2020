IF OBJECT_ID('tempdb.dbo.#Input', 'U') IS NOT NULL
BEGIN
	DROP TABLE #Input
END

IF OBJECT_ID('tempdb.dbo.#InitialActiveStates', 'U') IS NOT NULL
BEGIN
	DROP TABLE #InitialActiveStates
END

CREATE TABLE #Input (
	IndexId bigint not null IDENTITY(1,1),
	CubeRow nvarchar(max)
)

INSERT INTO #Input
VALUES
('#####..#'),
('#..###.#'),
('###.....'),
('.#.#.#..'),
('##.#..#.'),
('######..'),
('.##..###'),
('###.####');

WITH CubeValues_CTE AS
(
SELECT		IndexId as RowId,
			1 AS ColumnId,
			CubeRow
FROM		#Input
UNION ALL
SELECT		RowId,
			ColumnId + 1 AS ColumnId,
			CV.CubeRow
FROM		#Input I
			INNER JOIN CubeValues_CTE CV ON I.IndexId = CV.RowId
			AND LEN(I.CubeRow) > ColumnId
),
InitialActiveStates_CTE AS
(
	SELECT		RowId,
				ColumnId,
				CASE
					WHEN SUBSTRING(CubeRow, ColumnId, 1) = '#'
					THEN 1
					ELSE 0
				END AS IsActive
	FROM		CubeValues_CTE
)
SELECT		0 AS IterationCount,
			RowId AS X,
			ColumnId AS Y,
			0 AS Z
INTO		#InitialActiveStates
FROM		InitialActiveStates_CTE
WHERE		IsActive = 1

DECLARE @MinX INT,
		@MinY INT,
		@MinZ INT,
		@MaxX INT,
		@MaxY INT,
		@MaxZ INT,
		@IterationCount INT = 0

WHILE @IterationCount <= 6
BEGIN
	SET @IterationCount = @IterationCount + 1;

	SELECT		@MaxX = MAX(X) + 1,
				@MaxY = MAX(Y) + 1,
				@MaxZ = MAX(Z) + 1,
				@MinX = MIN(X) - 1,
				@MinY = MIN(Y) - 1,
				@MinZ = MIN(Z) - 1
	FROM		#InitialActiveStates
	WHERE		IterationCount = @IterationCount - 1;

	WITH CubesToCheckX_CTE AS
	(
		SELECT	@MinX As X
		UNION ALL
		SELECT	X + 1
		FROM	CubesToCheckX_CTE
		WHERE	X < @MaxX
	),
	CubesToCheckY_CTE AS
	(
		SELECT	X,
				@MinY AS Y
		FROM	CubesToCheckX_CTE
		UNION ALL
		SELECT	X,
				Y + 1
		FROM	CubesToCheckY_CTE
		WHERE	Y < @MaxY
	),	CubesToCheck_CTE AS
	(
		SELECT	X,
				Y,
				@MinZ AS Z
		FROM	CubesToCheckY_CTE
		UNION ALL
		SELECT	X,
				Y,
				Z + 1
		FROM	CubesToCheck_CTE
		WHERE	Z < @MaxZ
	),
	CubesToCheckAndIfActive_CTE AS
	(
		SELECT	CTC.X,
				CTC.Y,
				CTC.Z,
				CASE
					WHEN IAS.X IS NOT NULL
					THEN 1
					ELSE 0
				END AS IsActive
		FROM	CubesToCheck_CTE CTC
		LEFT JOIN #InitialActiveStates IAS ON
		(
			CTC.X = IAS.X
			AND CTC.Y = IAS.Y
			AND CTC.Z = IAS.Z
			AND IAS.IterationCount = @IterationCount - 1
		)
		GROUP BY
			CTC.X,
			CTC.Y,
			CTC.Z,
			IAS.X
	),
	NeighbourCount_CTE AS
	(
		SELECT		CTC.X,
					CTC.Y,
					CTC.Z,
					CTC.IsActive,
					COUNT(*) as NeighbourCount
		FROM		CubesToCheckAndIfActive_CTE CTC
					INNER JOIN #InitialActiveStates IAS ON
					(
						IAS.IterationCount = @IterationCount - 1
						AND ABS(CTC.X - IAS.X) <= 1
						AND ABS(CTC.Y - IAS.Y) <= 1
						AND ABS(CTC.Z - IAS.Z) <= 1
						AND (CTC.X != IAS.X OR CTC.Y != IAS.Y OR CTC.Z != IAS.Z)
					)
		GROUP BY	CTC.X,
					CTC.Y,
					CTC.Z,
					CTC.IsActive
	)
	INSERT INTO		#InitialActiveStates (IterationCount, X, Y, Z)
	SELECT			@IterationCount,
					X,
					Y,
					Z
	FROM			NeighbourCount_CTE
	WHERE			IsActive = 1  AND (NeighbourCount = 2 OR NeighbourCount = 3)
					OR (IsActive = 0 AND NeighbourCount = 3)
END

--SELECT		IterationCount,
--			COUNT(*)
--FROM		#InitialActiveStates
--GROUP BY	IterationCount

SELECT		COUNT(*)
FROM		#InitialActiveStates
WHERE		IterationCount = 6