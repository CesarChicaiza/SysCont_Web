CREATE PROCEDURE [dbo].[FSF_Module_InvestmentFund_Transaction_Get]

 @customerId	varchar(max),
 @portfolioId	varchar(max),
 @sinceDate		datetime,
 @untilDate		datetime

AS
	SELECT *
    FROM [InvestmentFund_Transaction]
	WHERE       [Customer_Id] = @customerId
		and    [InvestmentFund_Portfolio_Id] = @portfolioId
				and	[Date] >= @sinceDate
				and	[Date] <= @untilDate

GO

