
IF TYPE_ID(N'CardTableType') IS NULL
BEGIN
	CREATE TYPE dbo.CardTableType
	AS TABLE
	(
		InputRowId bigint not null IDENTITY(1,1),
		CardValue int
	)
END