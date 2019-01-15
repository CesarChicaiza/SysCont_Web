CREATE PROCEDURE [dbo].[Dashboard_Suscription_Average]
	@dateFrom	datetime,
	@dateTo		datetime
AS
select AVG(Sale.Total)
from Sale
where Sale.CreatedDate between @dateFrom and @dateTo