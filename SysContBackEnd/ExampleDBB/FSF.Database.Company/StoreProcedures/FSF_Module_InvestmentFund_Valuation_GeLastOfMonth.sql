CREATE PROCEDURE [dbo].[FSF_Module_InvestmentFund_Valuation_GeLastOfMonth]
           @investmentFund_Portfolio_Id			varchar(max),
		   @year								int,
		   @month								int

AS

		select top 1 * 
		   from InvestmentFund_Valuation
		   where	[InvestmentFund_Portfolio_Id] = @investmentFund_Portfolio_Id
				and DATEPART(year, [Date]) = @year
				and	DATEPART(month, [Date]) = @month
				and [RowStatus] = 1
			order by [Date] desc, [CreatedDate] desc
