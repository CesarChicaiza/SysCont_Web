CREATE PROCEDURE [dbo].[FSF_Module_InvestmentFund_Transaction_GetCurrentMonth]

 @customerId	varchar(max),
 @portfolioId	varchar(max),
 @date			datetime
           
AS
	SELECT *
    FROM [InvestmentFund_Transaction]
	WHERE       [Customer_Id] = @customerId
		and    [InvestmentFund_Portfolio_Id] = @portfolioId
				and    [Date] >= @date
   ORDER BY [Date] DESC
GO

