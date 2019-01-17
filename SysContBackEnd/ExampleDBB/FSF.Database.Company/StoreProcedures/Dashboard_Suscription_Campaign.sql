CREATE PROCEDURE [dbo].[Dashboard_Suscription_Campaign]
	@dateFrom	datetime,
	@dateTo		datetime
AS
	

select b.Name 'campaña', count(*) 'donantes', SUM(a.total) 'monto'
from sale a
left join Campaign b on a.Campaign_Id = b.Id
left join contract c on c.Sale_Id = c.Id
where c.ValidityStart between @dateFrom and @dateTo
group by b.Name
order by 2 desc
