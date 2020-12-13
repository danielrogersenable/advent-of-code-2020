IF OBJECT_ID('tempdb.dbo.#ColumnIndexTable', 'U') IS NOT NULL
BEGIN
	DROP TABLE #ColumnIndexTable
END

DECLARE @StartTime int = 1013728
DECLARE @BusString nvarchar(max) = '23,x,x,x,x,x,x,x,x,x,x,x,x,41,x,x,x,x,x,x,x,x,x,733,x,x,x,x,x,x,x,x,x,x,x,x,13,17,x,x,x,x,19,x,x,x,x,x,x,x,x,x,29,x,449,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,37';

WITH BusNumber_CTE AS
(
SELECT		TRY_CAST(value as int) as BusNumber
FROM		STRING_SPLIT(@BusString, ',')
WHERE		TRY_CAST(value as int) IS NOT NULL
)
SELECT		BusNumber,
			LEN(SUBSTRING(@BusString, 0, CHARINDEX(CAST(BusNumber as NVARCHAR(MAX)), @BusString) + 1))
			-
			LEN(REPLACE(SUBSTRING(@BusString, 0, CHARINDEX(CAST(BusNumber as NVARCHAR(MAX)), @BusString) + 1), ',', '')) AS ColumnIndex
INTO		#ColumnIndexTable
FROM		BusNumber_CTE

DECLARE @FirstModulo bigint,
		@SecondModulo bigint,
		@FirstRemainder bigint,
		@SecondRemainder bigint

DECLARE		Table_Cursor
CURSOR FOR	SELECT		BusNumber,
						(((BusNumber - ColumnIndex) % BusNumber) + BusNumber) % BusNumber AS Remainder
			FROM		#ColumnIndexTable

OPEN Table_Cursor
FETCH NEXT FROM Table_Cursor
INTO @FirstModulo, @FirstRemainder

	FETCH NEXT FROM Table_Cursor
	INTO @SecondModulo, @SecondRemainder

WHILE @@FETCH_STATUS = 0
BEGIN
	DECLARE @Result bigint = @FirstModulo + @FirstRemainder
	WHILE (@Result % @SecondModulo != @SecondRemainder)
	BEGIN
		SET @Result = @Result + @FirstModulo
	END

	SET @FirstModulo = @FirstModulo * @SecondModulo
	SET @FirstRemainder = @Result

	FETCH NEXT FROM Table_Cursor
	INTO @SecondModulo, @SecondRemainder
END

SELECT @FirstRemainder

CLOSE Table_Cursor
DEALLOCATE Table_Cursor