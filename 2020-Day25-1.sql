DECLARE @SubjectKey bigint = 7

DECLARE @ModuloValue bigint = 20201227;

DECLARE @CardTarget bigint = 10943862;

DECLARE @CardPowerCount bigint = 1;

DECLARE @CardCurrentValue bigint = 7;

WHILE (@CardCurrentValue != @CardTarget)
BEGIN
	SET @CardPowerCount = @CardPowerCount + 1;

	SET @CardCurrentValue = (@CardCurrentValue * @SubjectKey) % @ModuloValue
END

SELECT @CardPowerCount

DECLARE @DoorTarget bigint = 12721030;

DECLARE @DoorPowerCount bigint = 1;

DECLARE @DoorCurrentValue bigint = 7;

WHILE (@DoorCurrentValue != @DoorTarget)
BEGIN
	SET @DoorPowerCount = @DoorPowerCount + 1;

	SET @DoorCurrentValue = (@DoorCurrentValue * @SubjectKey) % @ModuloValue
END

SELECT @DoorPowerCount

DECLARE @PowerCount bigint = (@DoorPowerCount * @CardPowerCount) % (@ModuloValue - 1);

-- Did this on Wolfram Alpha - could have done it more intelligently but decided not to.
SELECT POWER(7, @DoorPowerCount * @CardPowerCount % (@ModuloValue - 1)) % @ModuloValue