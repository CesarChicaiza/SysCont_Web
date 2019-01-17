CREATE PROCEDURE [dbo].[Dashboard_Suscription_MoneyCollect]
	@dateFrom	datetime,
	@dateTo		datetime
AS
	
SELECT	 campaign.Name			'campaña'
		,sum(suscription.totalAmount)	'monto recaudado'
		,count(suscription.id)		'donantes activos'
FROM [SaleInvoicePayment]  moneyCollect
	LEFT JOIN [SaleInvoice]	suscription	on	moneyCollect.[SaleInvoice_Id] = suscription.[Id]
	left join [Sale] sale on suscription.sale_id = sale.id
	LEFT JOIN [Campaign]		campaign	on	campaign.[Id] = sale.[Campaign_Id]	
WHERE campaign.name is not null
--and moneyCollect.[Date] between @dateFrom and @dateTo
GROUP BY campaign.Name