CREATE PROCEDURE [dbo].[Dashboard_Customer_ByProvince]
	@dateFrom	datetime,
	@dateTo		datetime
AS
	
select province.Name 'provincia', count(*) 'número de donantes'
from Customer customer
LEFT JOIN	[dbo].[Customer_Address] address on customer.Id = address.Customer_Id
LEFT JOIN	[dbo].[City] city on city.Id= address.City_Id
LEFT JOIN	[dbo].[State] province on province.Id = city.State_Id
where customer.CreatedDate between @dateFrom and @dateTo
group by province.Name
