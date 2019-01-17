CREATE PROCEDURE [dbo].[Dashboard_Suscription_SumMoneyCollect]
	@dateFrom	datetime,
	@dateTo		datetime
AS
	
select CASE WHEN confirmed = 1 THEN 'Éxitoso' ELSE 'Fallido' END 'estado',
		sum(b.totalAmount) 'monto'
from 
SaleInvoicePayment a
left join saleinvoice  b on a.saleInvoice_Id = b.Id 
where a.[date] between @dateFrom and @dateTo
group by confirmed
