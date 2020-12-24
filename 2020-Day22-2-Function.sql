CREATE OR ALTER PROCEDURE GetRecursiveWinner (@Player1Text nvarchar(max), @Player2Text nvarchar(max))
AS
BEGIN
	PRINT 'Begin'
	DECLARE		@FirstList TABLE (
		InputRowId bigint not null IDENTITY(1,1),
		CardValue int
	)

	DECLARE		@SecondList TABLE (
		InputRowId bigint not null IDENTITY(1,1),
		CardValue int
	)

	INSERT INTO		@FirstList
	SELECT		value
	FROM		STRING_SPLIT(@Player1Text, ',')

	INSERT INTO		@SecondList
	SELECT		value
	FROM		STRING_SPLIT(@Player2Text, ',')

	PRINT @Player1Text
	PRINT @Player2Text

	DECLARE @Player1Card int,
			@Player2Card int

	DECLARE @RecursionCount int = 1;

	WHILE (
		(SELECT COUNT(*) FROM @FirstList) > 0
		AND (SELECT COUNT(*) FROM @SecondList) > 0
	)
	BEGIN
		SET @RecursionCount = @RecursionCount + 1;
		PRINT 'Starting a round'
		SELECT		TOP 1
					@Player1Card = CardValue
		FROM		@FirstList
		ORDER BY	InputRowId

		SELECT		TOP 1
					@Player2Card = CardValue
		FROM		@SecondList
		ORDER BY	InputRowId

		DECLARE @FirstDeckLoggingList nvarchar(max),
				@SecondDeckLoggingList nvarchar(max)

		SELECT			@FirstDeckLoggingList = STRING_AGG(CardValue, ',') WITHIN GROUP (ORDER BY InputRowId)
		FROM			@FirstList

		SELECT			@SecondDeckLoggingList = STRING_AGG(CardValue, ',') WITHIN GROUP (ORDER BY InputRowId)
		FROM			@SecondList

		PRINT 'Current decks are'
		PRINT CONCAT('Player 1: ', @FirstDeckLoggingList);
		PRINT CONCAT('Player 2: ', @SecondDeckLoggingList);

		PRINT CONCAT(@Player1Card, ' plays ', @Player2Card);



		DELETE FROM		@FirstList
		WHERE			InputRowId = (
			SELECT		MIN(InputRowID)
			FROM		@FirstList
		)

		DELETE FROM		@SecondList
		WHERE			InputRowId = (
			SELECT		MIN(InputRowID)
			FROM		@SecondList
		)

		DECLARE @RemainingFirstCount int,
				@RemainingSecondCount int

		SELECT		@RemainingFirstCount = COUNT(*)
		FROM		@FirstList;

		SELECT		@RemainingSecondCount = COUNT(*)
		FROM		@SecondList

		DECLARE @IsPlayer1Winner int = 1;
		
		PRINT CONCAT('There are ', @RemainingFirstCount, ' cards remaining for player 1 and ', @RemainingSecondCount, ' cards for player 2.')

		IF(@RemainingFirstCount >= @Player1Card AND @RemainingSecondCount >= @Player2Card)
		BEGIN
				PRINT 'It is recursion time'
				DECLARE		@FirstSubList TABLE (
					InputRowId bigint not null IDENTITY(1,1),
					CardValue int
				)

				DECLARE		@SecondSubList TABLE (
					InputRowId bigint not null IDENTITY(1,1),
					CardValue int
				)

				DELETE FROM @FirstSubList

				DELETE FROM @SecondSubList

				INSERT INTO		@FirstSubList
				SELECT			TOP (@Player1Card) CardValue
				FROM			@FirstList
				ORDER BY		InputRowId

				INSERT INTO		@SecondSubList
				SELECT			TOP (@Player2Card) CardValue
				FROM			@SecondList
				ORDER BY		InputRowId

				DECLARE @ReturnStatement int;

				DECLARE		@Player1SubText nvarchar(max),
							@Player2SubText nvarchar(max)

				SET @Player1SubText = ''
				SET @Player2SubText = ''

				SELECT		@Player1SubText = STRING_AGG(CardValue, ',')  WITHIN GROUP (ORDER BY InputRowId)
				FROM		@FirstSubList

				SELECT		@Player2SubText = STRING_AGG(CardValue, ',')  WITHIN GROUP (ORDER BY InputRowId)
				FROM		@SecondSubList

				EXECUTE @ReturnStatement = GetRecursiveWinner @Player1SubText, @Player2SubText

				IF (@ReturnStatement = 2)
				BEGIN
					SET @IsPlayer1Winner = 0;
				END

		END
		ELSE
		BEGIN
			PRINT 'It is not recursion time'
			IF (@Player1Card < @Player2Card)
			BEGIN
				SET @IsPlayer1Winner = 0;
			END
		END

		IF (@IsPlayer1Winner = 1)
		BEGIN
			PRINT 'Player 1 wins'
			INSERT INTO @FirstList
			VALUES 
			(@Player1Card),
			(@Player2Card)
		END
		ELSE
		BEGIN
			PRINT 'Player 2 wins'
			INSERT INTO @SecondList
			VALUES 
			(@Player2Card),
			(@Player1Card)
		END

		IF (@RecursionCount > 1000)
		BEGIN
			-- Crude cutting short of infinite recursion
			DELETE FROM @SecondList
		END
	END

	SELECT		*
	FROM		@FirstList

	DECLARE @WinningDeck nvarchar(max);

	IF ((SELECT COUNT(*) FROM @SecondList) > 0)
	BEGIN
		PRINT 'Player 2 has won the game'

		SELECT			@WinningDeck = STRING_AGG(CardValue, ',') WITHIN GROUP (ORDER BY InputRowId)
		FROM			@SecondList

		PRINT @WinningDeck;

		--SELECT		*
		--FROM		@SecondList

		RETURN 2
	END
	ELSE
	BEGIN
		PRINT 'Player 1 has won the game'

		SELECT			@WinningDeck = STRING_AGG(CardValue, ',') WITHIN GROUP (ORDER BY InputRowId)
		FROM			@FirstList

		PRINT @WinningDeck;

		--SELECT		*
		--FROM		@FirstList

		RETURN 1
	END
END

