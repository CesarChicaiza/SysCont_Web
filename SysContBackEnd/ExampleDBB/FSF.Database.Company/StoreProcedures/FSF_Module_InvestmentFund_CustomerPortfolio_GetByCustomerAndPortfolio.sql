CREATE PROCEDURE [dbo].[FSF_Module_InvestmentFund_CustomerPortfolio_GetByCustomerAndPortfolio]
	@customerId		varchar(max),
	@portfolioId	varchar(max)
AS
	SELECT *
	  FROM [InvestmentFund_CustomerPortfolio]
	  WHERE [Customer_Id] =@customerId
		and [InvestmentFund_Portfolio_Id] = @portfolioId