CREATE PROCEDURE [dbo].[Dashboard_Suscription_Efectividad]
	@dateFrom	datetime,
	@dateTo		datetime
AS
	
SELECT	 CASE WHEN moneyCollect.confirmed = 1 THEN 'recaudado' ELSE 'no recaudado' END
		,sum(suscription.TotalAmount)		'monto'
		--,count(suscription.amount)		'número de donantes'
FROM [saleinvoicepayment]  moneyCollect
LEFT JOIN [saleinvoice] suscription on moneyCollect.[saleinvoice_id] = suscription.id
GROUP BY moneyCollect.confirmed
