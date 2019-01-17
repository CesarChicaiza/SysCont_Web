CREATE PROCEDURE [dbo].[Dashboard_Suscription_Count_Start_End]
	@dateFrom	datetime,
	@dateTo		datetime
AS
	select COUNT(c.ValidityStart) 'Captados' , COUNT(c.RealEnd) 'Baja'
	from Contract c
	where c.CreatedDate between @dateFrom and @dateTo
