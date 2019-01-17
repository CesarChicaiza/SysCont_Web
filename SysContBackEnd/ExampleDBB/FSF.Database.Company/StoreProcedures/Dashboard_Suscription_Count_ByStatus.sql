CREATE PROCEDURE [dbo].[Dashboard_Suscription_Count_ByStatus]
	@dateFrom	datetime,
	@dateTo		datetime
AS
	select cs.Name, COUNT(c.Contract_Status_Id) 'Cantidad'
	from Contract c, Contract_Status cs
	where c.Contract_Status_Id = cs.Id and
	c.CreatedDate between @dateFrom and @dateTo
	group by cs.Name
