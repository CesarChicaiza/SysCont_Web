CREATE PROCEDURE [dbo].[FSF_Module_InvestmentFund_CustomerPortfolio_GetByPortfolio]
	@portfolioId	varchar(max)
AS
	SELECT *
	  FROM [InvestmentFund_CustomerPortfolio]
	  WHERE [InvestmentFund_Portfolio_Id] = @portfolioId