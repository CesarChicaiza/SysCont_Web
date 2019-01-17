CREATE PROCEDURE [dbo].[Dashboard_Suscription_ByEmployee]
	@dateFrom	datetime,
	@dateTo		datetime
AS
	

	select top 10 b.Name 'captador', count(*) 'donantes', sum(a.Total) 'monto'
from sale a
left join Employee b on a.Employee_Id = b.id
left join Contract c on c.Sale_Id = a.Id
where name is not null  and c.ValidityStart between @dateFrom and @dateTo
group by b.Name
order by 2 desc
