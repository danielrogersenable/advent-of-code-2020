IF OBJECT_ID('tempdb.dbo.#Input', 'U') IS NOT NULL
BEGIN
	DROP TABLE #Input
END

CREATE TABLE #Input (
	TreeLine nvarchar(max)
)

INSERT INTO #Input VALUES
('.#.#....##.......#..........#..'),
('...#...........##...#..#.......'),
('#.####......##.#...#......#.#..'),
('##.....#.#.#..#.#............#.'),
('##.....#....#.........#...##...'),
('###..#.....#....#..............'),
('..........#..#.#..#.#....#.....'),
('##.....#....#.#...#.##.........'),
('#...#......#....##....#..#.#...'),
('.##.##...#....##..#.#.....#...#'),
('.....#.#..........##.#........#'),
('.##..................#..#..##.#'),
('#.#..........##....#.####......'),
('.#......#.#......#.........#...'),
('#....#..##.##..##........#.#...'),
('##..#.##..#...#..####.#..#.....'),
('###....#.###.##...........##..#'),
('.....#.##.....##.#..#####....##'),
('....#.###....#..##....##...#...'),
('..###.#...##.....#.##..#..#.#..'),
('#...#..#..#.........#..#.......'),
('##..#.#.....#.#.#.......#...#.#'),
('...#...##.#........#...#.......'),
('..#..#.#..#...#...#...........#'),
('........#.....#......#...##....'),
('#........##.##.#.#...#...#.....'),
('####.......#.##.###.#....#.....'),
('...#...........#...#......#...#'),
('##...#...#............#.......#'),
('....#...........##.......#.....'),
('###......#.....#....#...#.#...#'),
('.....##..........#.......#.#...'),
('##.##.##...#......#....#.......'),
('##..#.#..#......#...#..#.......'),
('....#....##.##............####.'),
('..#.###..#.##.###..#.##.......#'),
('#.##..#.#.....#..#.....##......'),
('..##..#.....##.#.##........#...'),
('.#..#.#......#..#............#.'),
('.....#..#.#...#....#.##.#......'),
('.#...##.#..#.#...##...##..##...'),
('###............#.#..#..#...#...'),
('..#..##.####.#.....#.....##.###'),
('#....#.##..##....#..#...#.##.#.'),
('.....#.##.........##...##......'),
('.........####.#....#.#......#.#'),
('.........#.#..#...#.#..#.#....#'),
('.#.....#..##.##..##....#.......'),
('..........##......#.##.###....#'),
('.##...###..##.#...#........##..'),
('..............#.#....#.#.###.##'),
('..##.##.......#.#......##...#..'),
('.#.....#..##..#.###...#..#.##.#'),
('#.....#.#..#...#........#...#..'),
('.#......#....#.#.....###...#..#'),
('..##.#....#..##......#.....#...'),
('..#.#.##..#.....#.####..###....'),
('.........#......#..#...........'),
('..#........#.##.#.....##.##..#.'),
('.......#.........#....#...#.#..'),
('.##.....#.#....#.#.......#.....'),
('..........#.##........##...##..'),
('###..###.#.#..#..#####.##.#.##.'),
('..##..##.#.#...#..#.#.#......#.'),
('#..#..#..#..##..#.....#......#.'),
('..#....#.##..#......##.........'),
('..#.##......#...##.#......#....'),
('.......#..#.##.#.....#.........'),
('.......#.#.#.###...##......#...'),
('.....#.#..........#..#...#.....'),
('....##..........#..........##..'),
('..#......#.....#.##.#..#...#.#.'),
('....#.....#..#...#..#.#.##..###'),
('.####....#........#...#........'),
('...##.#.##.#..#...##...#.##....'),
('....#...#...#.#.#.#...#..#.....'),
('.....#...#.#.....#.#........##.'),
('..#.#.......###.#.....##.......'),
('......#.........##....#....#..#'),
('.............##.....##.........'),
('.........##...##.......#.....#.'),
('##.........#..........#.###..##'),
('...#.....#......#....#..##.....'),
('##..#...#...##.#.....#.#......#'),
('..#...##.#.......#.#......#.##.'),
('......#.......#.#...........#..'),
('..........#.....##............#'),
('#........#...#..#.......###.##.'),
('.##...........#.#........#.#.#.'),
('...#..##...#.#....#####.#......'),
('.....##...###...#..#.##...####.'),
('...#....#.....#..#.......#.....'),
('#....#....#...#..#..#.######..#'),
('#.###...........#......#...#..#'),
('.#.#.#.#..#....#....#...##.#...'),
('.#..#.........#.#....###...#...'),
('......#..##.##..........#....##'),
('.....#......##....##.....#...#.'),
('.#...#.#.#....##....#..#....#.#'),
('..................#..###.#..##.'),
('..#.........#......#....#..###.'),
('#.#.....#..#..#....###..###....'),
('..##..##.#..##........##...##..'),
('##..#........##..###..#.....#.#'),
('..#..###..#......#....#...#...#'),
('#..#.#..............##.#..#.#..'),
('.....####....#...####.....#.#..'),
('.....#....##.#......###........'),
('##.##...#.#.#.#.......#....##..'),
('.#......#...#.#....#..##.#.##.#'),
('#.#.##.#.#......#..##........##'),
('...##.....#.....#...#..###...#.'),
('........###.....#.....#...##..#'),
('.....#.##.##......#.#....#...#.'),
('.#....##.......#..#.####.......'),
('.#..#....#..........#......#.#.'),
('.#.##.##.....###.#.#...........'),
('.........#......#..##..........'),
('....#...##.#.#.#..#.#.........#'),
('..#.....#.##...#..#..#.###....#'),
('...#.##......#.....##....#.....'),
('###............#.#....#...#....'),
('.......#.....#..#.#.#....#..#.#'),
('...#......#.#..##..#....#...#.#'),
('............##........##..##...'),
('..#..#.##..#......###..#.......'),
('........#.........#............'),
('..#...#.#########.#...##..###..'),
('#....#......#.......#.#.....#..'),
('#.#..#....###.###....#...#.#...'),
('#...###.#.#.......#.##......#..'),
('.................#...#.#.#.....'),
('##....#...#........#....#.#..#.'),
('......#.....#...#..........#.#.'),
('##..........#...#..........#.##'),
('..#.#.##.#....#.#......#...##..'),
('.....#.......#..#.....#........'),
('#.##.#..##..#.......##.........'),
('....#......#..#..#.#...#.......'),
('...#....#................###...'),
('.##.....#.#....#.#..........##.'),
('...#..#....#.##.##......#......'),
('..#.#....#.......#.#..##.......'),
('....#.....#..........##.#.#####'),
('#.....................##..#..#.'),
('.###..#.##.......##.#...#..#...'),
('...###.......#..#...#......#..#'),
('#..#...#.#..#.#..#..#.##.......'),
('#...##.......#..#..#.##..###...'),
('......#....#.#.#........#.##..#'),
('..##..#....#....#..#.#..#......'),
('..##.#...#.#######..#...#.....#'),
('..#....#..#.........#..##......'),
('...#....#.#......#..#..#.#.....'),
('#..#....#........#.#..##....###'),
('#....#..##......##.##.....#.###'),
('...#.#..........#..#.#.#.#.##..'),
('......##..#.#..#.#....#....#...'),
('##....#....#..#..#.##......#...'),
('....#.#..##.#.#...###....##.#..'),
('...#.......##..#.......#...#...'),
('......##.......#..##.....#...#.'),
('...#.#...#...........#...#.....'),
('.#....#...#......##.##..###..#.'),
('.#..........#...#...#...##.##..'),
('.....###..#.....#..##....#.####'),
('..#.###..#..##..##.....#.#.....'),
('.............#.###...##.#.....#'),
('....###.......###.#.....#..#.#.'),
('........##.#.........#.....###.'),
('.....###.#..#.....#...#..#.....'),
('.#....#..##.#..#.#....#.......#'),
('........#......#.#..#.#..#...##'),
('...#.##.##......#..............'),
('.#.....##.#.....#..#......##...'),
('#..#..#.....#.....#.....###....'),
('.##...........#..#.##.....#....'),
('..#.#......#.#...#.##.#..#...##'),
('...#..........#.....#..........'),
('#.#.#.#.#...#....#...#.....##..'),
('#......##...#...#..........#.#.'),
('....##........#.#..............'),
('#..#.#.#..#........##......#.##'),
('........####...##.#.....#......'),
('....#........#.#..#..##..#.#...'),
('.#.....#..###...#..#.....#..#..'),
('#......###.#..#....#..#.#......'),
('....#.....##.##..#...#.#..##.#.'),
('..##..#...#.#......#....#...#.#'),
('#..##...##..#...###...#..#.....'),
('.......#.....#...........##....'),
('#..##....#........#....##..#.#.'),
('.#........#..##...###.#..#.....'),
('.#.#....#..##...#...##.#..###..'),
('#.........#.......#.....#.#....'),
('#..#.....#.#.###.#..#......#...'),
('....#..#.#....#..##..###....###'),
('###.##.#.#..#...........#.#.#..'),
('..##.#.......#......#..##....#.'),
('.....#.#.#.......##.......#...#'),
('...........#.##....##.##....#.#'),
('...#.......#..#.##..#......#..#'),
('#.#.#...#......##.#...........#'),
('##........#...........###.#..#.'),
('..........#.#.#....#.#..##.#.#.'),
('...#.#.#....#..........#..#....'),
('#.#....###.#.#..#.......###...#'),
('.#....#......#.#.#..#..#.......'),
('......##.............#....#.#.#'),
('.#..........#.........#.##.....'),
('##....#....##....#..#.......#..'),
('#.##.##.#..#..#.....#..#.##.#..'),
('.#..#.......##..#.....##.##....'),
('.......#..........#.#.##..#.##.'),
('....#.....#.#...##....##.......'),
('.......#.........#...##....##.#'),
('#.....#......#..........#...#..'),
('...#.#.......#.#..#....###..#..'),
('.....#.#.#.........#...........'),
('.#..###.#.#........#.#.........'),
('.........#..#......##...##....#'),
('...###..#.....##.....#.###....#'),
('.##...#...#........###.#..#....'),
('.##........#..#.###.######.##.#'),
('##.#...#.#....#..##.#....##....'),
('.......##.....##.#..###.#......'),
('..##...##........#.......#....#'),
('#..##...#.####...###......#...#'),
('.##.....#.##.#.#.....###.#..##.'),
('..###....#.#.###.#....#........'),
('....#..###..#...#....#..#..#.#.'),
('#.#.##....##...##.......#......'),
('.........#...#....#..#.........'),
('.............#...#..##.#.......'),
('...#.##.......#...#.#..##.##...'),
('.####.#.##..#.#......#.##...#.#'),
('.#..#.#.....#.................#'),
('..#.##..###....#...#......####.'),
('..##..##...........#....#...#..'),
('....#...#...#...#.......#....#.'),
('#.#...###...#...#.#...#....##.#'),
('......#...#.#.......#.....#...#'),
('....##...#.#.#....#....#.#....#'),
('.....#.....#...##..#...#....##.'),
('#.....#....#......##.##....#...'),
('...#.#....#...#....#.#....##..#'),
('...#.#..#...##....###..#.......'),
('...##......###...###.#...#..#..'),
('##.......#.......###.......#..#'),
('..##.##..###.#............#...#'),
('#.....##..#..##....##..#.......'),
('......#.#...#......#.....#.....'),
('#...........#....#..##.##.#....'),
('.......#..#......#...#....#...#'),
('.#...##...........#......#...#.'),
('#........#....##...###.#....#..'),
('.....#.......##.........#.##...'),
('.#.###..#....#..##.#..#.#..#...'),
('#.......#.##.#.#....#.#..#....#'),
('###.....#.#.......#..#......#.#'),
('#..#.#.......#.#..##..##.#.#...'),
('#..#.#.#.###........#.....#...#'),
('#.#.#..#..##.....#...........#.'),
('..#.#..#.....#...#...#...##....'),
('...#.##......#...##.#...#.#.#.#'),
('#..#.#.#.#.......####..........'),
('..#......#.#......##.###.....##'),
('..#...##..#.........##....#.##.'),
('##.##.##.#.#.....#..........##.'),
('.#.....###.#..#....#..#.###...#'),
('#...##.......###....#.#..#.....'),
('..#....##.........##.........##'),
('......#....#.##.......#........'),
('..#.#.#..#...#...#...##.#...#..'),
('......#..##.#.#.#...##...#.#.##'),
('#..#...##.#.....#...#.##.......'),
('..#..#.........##.#...#.##...##'),
('##.##.#....#.......#.##..#.....'),
('.....##...##.##...##.........##'),
('#......#...#.......#...#...#...'),
('...##...........#...#..#.......'),
('.#.##.#..#........#....#.......'),
('#.#...#..#......##...#.#.##....'),
('##........####..#.#...#.#.##.##'),
('#..#.#.##......##.#.#..#.......'),
('.....#.........#..#.####....#..'),
('......##..#....#...#.#....#....'),
('#...##........#.........#.....#'),
('.#.#...#.#.#..#............##.#'),
('.#..#....#....#.....#...#.....#'),
('..###...#..#.....#.##.###...#.#'),
('.#.###..#..#...#.#...#.#......#'),
('#...#####......###........##...'),
('.....#.....#..#.#....#..##.....'),
('....##...#.#.##.#####...#....#.'),
('.#.#.........##.#.......#..##..'),
('.#...#.#...#...#....#.#...##.#.'),
('.##...#..#.#..#......#.#.#..##.'),
('..#.....#..#.....##.....#......'),
('..#........#..##...#.......###.'),
('.#....#.......#....#....#..#...'),
('....#......#.#.#.........#.....'),
('..##...#.#.#...#.#........#....'),
('.#.....####...##.#..#...##.....'),
('...#.....#...#...#....#....#...'),
('.........#..#.#.....#..#.#..#..'),
('.........##...........#.......#'),
('......#..#.....##...#.##.#.....'),
('.#......##........##...#.#.##..'),
('.....#.#..##...........#..#..#.'),
('...#.......#...#.#..#.##..#.##.'),
('...#.......#.....#.#...#.##.#..'),
('#.....#.............##.#..####.'),
('.#...#......#...##.#....#.#....'),
('.##..##.##....#.#.....#.......#'),
('...#...#....#....##.#..#....##.'),
('..............##....#.......#.#'),
('.#.#.#...##..#..#...###.#..#...'),
('.#.#...#.#..#.#..#...######..#.'),
('........#......#.#..#.#....#...'),
('..###.....###.#.##....#...##...'),
('.##.#.....#.......##.......#...'),
('..#..##...#..........#.#....#.#')

DECLARE 
	@XValue int = 0,
	@CurrentTreeLine nvarchar(max),
	@TreeCount int = 0

DECLARE treeline_cursor CURSOR FOR (
	SELECT TreeLine FROM #Input
)

OPEN treeline_cursor

FETCH NEXT FROM treeline_cursor
INTO @CurrentTreeLine

DECLARE @TreeLength int = LEN(@CurrentTreeLine);

DECLARE @XIncrement int = 3;

FETCH NEXT FROM treeline_cursor
INTO @CurrentTreeLine

WHILE @@FETCH_STATUS = 0
BEGIN
	SET @XValue = (@XValue + @XIncrement) % @TreeLength
	PRINT @XValue

	IF (SUBSTRING(@CurrentTreeLine, @XValue + 1, 1) = '#')
	BEGIN
		SET @TreeCount = @TreeCount + 1
	END

	FETCH NEXT FROM treeline_cursor
	INTO @CurrentTreeLine
END

CLOSE treeline_cursor
DEALLOCATE treeline_cursor

SELECT @TreeCount


