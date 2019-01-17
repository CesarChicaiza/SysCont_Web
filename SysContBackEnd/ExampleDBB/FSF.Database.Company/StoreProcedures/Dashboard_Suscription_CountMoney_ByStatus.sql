CREATE PROCEDURE [dbo].[Dashboard_Suscription_CountMoney_ByStatus]
	@dateFrom	datetime,
	@dateTo		datetime
AS
	select cs.Name, sum(s.Total) 'Monto'
	from Sale s, Contract c, Contract_Status cs
	where c.Contract_Status_Id = cs.Id and s.Id = c.Sale_Id 
	and	c.CreatedDate between @dateFrom and @dateTo
	group by cs.Name
