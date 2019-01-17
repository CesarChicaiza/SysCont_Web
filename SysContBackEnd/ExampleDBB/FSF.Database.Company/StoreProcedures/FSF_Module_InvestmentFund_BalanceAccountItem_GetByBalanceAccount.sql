CREATE PROCEDURE [dbo].[FSF_Module_InvestmentFund_BalanceAccountItem_GetByBalanceAccount]
	 @balanceAccountId			nvarchar(max)
AS

				


SELECT *
FROM(
	select *
	from(
		SELECT TOP 1 *
			FROM [dbo].[InvestmentFund_BalanceAccountItem]	
			WHERE [InvestmentFund_BalanceAccount_Id] = @balanceAccountId
				and InvestmentFund_TransactionType_Id = '37FBF241-09BA-4265-83C2-AE43B3B3858E'
			order by [date] desc
		) tbl

		UNION 

	SELECT *
	FROM [dbo].[InvestmentFund_BalanceAccountItem]	
	WHERE	[InvestmentFund_BalanceAccount_Id] =  @balanceAccountId
		and InvestmentFund_TransactionType_Id != '37FBF241-09BA-4265-83C2-AE43B3B3858E'

	) tblMain
	order by tblMain.[Date] desc