CREATE PROCEDURE [dbo].[Dashboard_Suscription_CountMoneyCollect]
	@dateFrom	datetime,
	@dateTo		datetime
AS
	
select CASE WHEN confirmed = 1 THEN 'Éxitoso' ELSE 'Fallido' END 'estado',
		COUNT(*) 'número de transacciones'
from 
saleinvoicepayment
where [date] between @dateFrom and @dateTo
group by confirmed
