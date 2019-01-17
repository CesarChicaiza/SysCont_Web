CREATE PROCEDURE [dbo].[Dashboard_Suscription_Count]
	@dateFrom	datetime,
	@dateTo		datetime
AS
	


select CASE WHEN b.RowStatus =1 THEN 'activos' ELSE 'inactivos' END , count(*) 
from sale a
left join Contract b on b.Sale_Id = a.Id
where b.validitystart between @dateFrom and @dateTo
group by b.RowStatus
