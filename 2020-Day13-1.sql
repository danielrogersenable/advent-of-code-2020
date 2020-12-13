DECLARE @StartTime int = 1013728
DECLARE @BusString nvarchar(max) = '23,x,x,x,x,x,x,x,x,x,x,x,x,41,x,x,x,x,x,x,x,x,x,733,x,x,x,x,x,x,x,x,x,x,x,x,13,17,x,x,x,x,19,x,x,x,x,x,x,x,x,x,29,x,449,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,37';

WITH BusNumber_CTE AS
(
SELECT		TRY_CAST(value as int) as BusNumber
FROM		STRING_SPLIT(@BusString, ',')
WHERE		TRY_CAST(value as int) IS NOT NULL
),
WaitTime_CTE AS
(
SELECT		BusNumber,
			BusNumber - (@StartTime % BusNumber) as WaitTime
FROM		BusNumber_CTE
)
SELECT		BusNumber * WaitTime
FROM		WaitTime_CTE
WHERE		WaitTime = (SELECT MIN(WaitTime) FROM WaitTime_CTE)