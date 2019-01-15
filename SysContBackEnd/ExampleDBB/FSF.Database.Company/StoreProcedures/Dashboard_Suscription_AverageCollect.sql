CREATE PROCEDURE [dbo].[Dashboard_Suscription_AverageCollect]
	@dateFrom	datetime,
	@dateTo		datetime
AS
	

	

select 'valor promedio individual', avg(Total) 'monto'
from Sale 
left join Contract on Sale.id = Contract.Sale_Id
where [contract].[ValidityStart] between @dateFrom and @dateTo