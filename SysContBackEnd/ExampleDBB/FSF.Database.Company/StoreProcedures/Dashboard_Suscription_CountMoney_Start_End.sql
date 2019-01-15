CREATE PROCEDURE [dbo].[Dashboard_Suscription_CountMoney_Start_End]
	@dateFrom	datetime,
	@dateTo		datetime
AS
	SELECT SUM(s.Total) 'Captados', (select sum(s1.Total) FROM Sale s1
									left join Contract c1 on c1.Sale_Id = s1.Id
									where  c1.CreatedDate between @dateFrom and @dateTo) 'Baja'
	FROM Sale s
	left join Contract c on c.Sale_Id = s.Id
	where  c.CreatedDate between @dateFrom and @dateTo
