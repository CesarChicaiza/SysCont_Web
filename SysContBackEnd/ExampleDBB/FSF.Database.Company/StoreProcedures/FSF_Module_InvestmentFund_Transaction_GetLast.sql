CREATE PROCEDURE [dbo].[FSF_Module_InvestmentFund_Transaction_GetLast]
 @customerId	varchar(max),
 @portfolioId	varchar(max)

AS
	SELECT *
    FROM [InvestmentFund_Transaction]
	WHERE       [Customer_Id] = @customerId
		and    [InvestmentFund_Portfolio_Id] = @portfolioId
   ORDER BY [Date] DESC
GO

