CREATE PROCEDURE [dbo].[Dashboard_Suscription_Available]
	@dateFrom	datetime,
	@dateTo		datetime
AS

select  CASE WHEN RowStatus = 1 THEN 'activos' ELSE 'inactivos' END 
		,count(*) 
from Contract
group by RowStatus 


