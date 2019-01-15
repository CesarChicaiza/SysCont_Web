CREATE PROCEDURE [dbo].[FSF_Module_InvestmentFund_Valuation_GetLast]
           @investmentFund_Portfolio_Id			varchar(max)

AS

	SELECT TOP 1 *
	FROM	[dbo].[InvestmentFund_Valuation]	
	WHERE	[InvestmentFund_Portfolio_Id] = @investmentFund_Portfolio_Id
		and	[RowStatus] =1
	ORDER BY	[Date] desc, [CreatedDate] desc