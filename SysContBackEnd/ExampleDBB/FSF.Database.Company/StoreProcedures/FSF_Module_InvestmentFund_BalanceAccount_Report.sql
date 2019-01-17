CREATE PROCEDURE [dbo].[FSF_Module_InvestmentFund_BalanceAccount_Report]
	@id nvarchar(max)
AS
	select   [InvestmentFund_BalanceAccount].[Id]									'InvestmentFund_BalanceAccount_Id'
            ,[InvestmentFund_BalanceAccount].[Description]							'InvestmentFund_BalanceAccount_Description'
            ,[InvestmentFund_BalanceAccount].[Month]								'InvestmentFund_BalanceAccount_Month'
            ,[InvestmentFund_BalanceAccount].[Year]									'InvestmentFund_BalanceAccount_Year'
			,[InvestmentFund_BalanceAccount].[CustomerNumber]						'InvestmentFund_BalanceAccount_CustomerNumber'	
			,[InvestmentFund_BalanceAccount].[CustomerExecutive]					'InvestmentFund_BalanceAccount_CustomerExecutive'			
            ,[InvestmentFund_BalanceAccount].[PreviousBalanceDate]					'InvestmentFund_BalanceAccount_PreviousBalanceDate'
			,isnull([InvestmentFund_BalanceAccount].[PreviousBalanceUnits]		,0)	'InvestmentFund_BalanceAccount_PreviousBalanceUnits'
			,isnull([InvestmentFund_BalanceAccount].[PreviousBalanceUnitPrice]	,0)	'InvestmentFund_BalanceAccount_PreviousBalanceUnitPrice'
			,isnull([InvestmentFund_BalanceAccount].[PreviousBalanceAmount]		,0)	'InvestmentFund_BalanceAccount_PreviousBalanceAmount'
            ,isnull([InvestmentFund_BalanceAccount].[CurrentDepositUnits]		,0)	'InvestmentFund_BalanceAccount_CurrentDepositUnits'
            ,isnull([InvestmentFund_BalanceAccount].[CurrentDepositAmount]		,0)	'InvestmentFund_BalanceAccount_CurrentDepositAmount'
            ,isnull([InvestmentFund_BalanceAccount].[CurrentRescueUnits]		,0)	'InvestmentFund_BalanceAccount_CurrentRescueUnits'
			,isnull([InvestmentFund_BalanceAccount].[CurrentRescueAmount]		,0)	'InvestmentFund_BalanceAccount_CurrentRescueAmount'
            ,[InvestmentFund_BalanceAccount].[CurrentBalanceDate]					'InvestmentFund_BalanceAccount_CurrentBalanceDate'
			,isnull([InvestmentFund_BalanceAccount].[CurrentBalanceUnits]		,0)	'InvestmentFund_BalanceAccount_CurrentBalanceUnits'
			,isnull([InvestmentFund_BalanceAccount].[CurrentBalanceUnitPrice]	,0)	'InvestmentFund_BalanceAccount_CurrentBalanceUnitPrice'
            ,isnull([InvestmentFund_BalanceAccount].[CurrentBalanceAmount]		,0)	'InvestmentFund_BalanceAccount_CurrentBalanceAmount'
            ,isnull([InvestmentFund_BalanceAccount].[InterestCurrentPeriod]		,0)	'InvestmentFund_BalanceAccount_InterestCurrentPeriod'
            ,isnull([InvestmentFund_BalanceAccount].[InterestLastPeriod]		,0)	'InvestmentFund_BalanceAccount_InterestLastPeriod'
            ,isnull([InvestmentFund_BalanceAccount].[IterestLastSixMonths]		,0)	'InvestmentFund_BalanceAccount_IterestLastSixMonths'
			,isnull([InvestmentFund_BalanceAccount].[AnnualPerformance]			,0)	'InvestmentFund_BalanceAccount_AnnualPerformance'
			,isnull([InvestmentFund_BalanceAccount].[PortfolioPrice]			,0)	'InvestmentFund_BalanceAccount_PortfolioPrice'
			,isnull([InvestmentFund_BalanceAccount].[PortfolioUnits]			,0)	'InvestmentFund_BalanceAccount_PortfolioUnits'
			,isnull([InvestmentFund_BalanceAccount].[CustomerParticipation]		,0)	'InvestmentFund_BalanceAccount_CustomerParticipation'
			,isnull([InvestmentFund_BalanceAccount].[PortfolioInvestorsCount]	,0)	'InvestmentFund_BalanceAccount_PortfolioInvestorsCount'
			,isnull([InvestmentFund_BalanceAccount].[TaxIncome]					,0)	'InvestmentFund_BalanceAccount_TaxIncome'
            ,isnull([InvestmentFund_BalanceAccount].[TaxIncomeAccumulated]		,0)	'InvestmentFund_BalanceAccount_TaxIncomeAccumulated'
            ,[InvestmentFund_BalanceAccount].[InvestmentFund_Portfolio_Id]			'InvestmentFund_BalanceAccount_InvestmentFund_Portfolio_Id'
            ,[InvestmentFund_BalanceAccount].[Customer_Id]							'InvestmentFund_BalanceAccount_Customer_Id'
			--
	        ,[InvestmentFund_BalanceAccountItem].[Id]								'InvestmentFund_BalanceAccountItem_Id'
            ,isnull([InvestmentFund_BalanceAccountItem].[Amount]				,0)	'InvestmentFund_BalanceAccountItem_Amount'
            ,isnull([InvestmentFund_BalanceAccountItem].[CurrentBalance]		,0)	'InvestmentFund_BalanceAccountItem_CurrentBalance'
            ,isnull([InvestmentFund_BalanceAccountItem].[CurrentParticipation]	,0)	'InvestmentFund_BalanceAccountItem_CurrentParticipation'
            ,isnull([InvestmentFund_BalanceAccountItem].[PortfolioTotalPrice]	,0)	'InvestmentFund_BalanceAccountItem_PortfolioTotalPrice'
            ,isnull([InvestmentFund_BalanceAccountItem].[PortfolioUnitPrice]	,0)	'InvestmentFund_BalanceAccountItem_PortfolioUnitPrice'
            ,isnull([InvestmentFund_BalanceAccountItem].[PortfolioUnits]		,0)	'InvestmentFund_BalanceAccountItem_PortfolioUnits'
            ,[InvestmentFund_BalanceAccountItem].[Date]								'InvestmentFund_BalanceAccountItem_Date'
            ,[InvestmentFund_BalanceAccountItem].[Customer_Id]						'InvestmentFund_BalanceAccountItem_Customer_Id'
            ,[InvestmentFund_BalanceAccountItem].[InvestmentFund_Portfolio_Id]		'InvestmentFund_BalanceAccountItem_InvestmentFund_Portfolio_Id'
            ,[InvestmentFund_BalanceAccountItem].[InvestmentFund_BalanceAccount_Id]  'InvestmentFund_BalanceAccountItem_InvestmentFund_BalanceAccount_Id'
            --
			,[InvestmentFund_TransactionType].[Name]								'InvestmentFund_TransactionType_Name'
			--

	from [InvestmentFund_BalanceAccountItem]
    right join	[InvestmentFund_BalanceAccount]		on	[InvestmentFund_BalanceAccountItem].[InvestmentFund_BalanceAccount_Id]	=	[InvestmentFund_BalanceAccount].[Id]
	right join	[InvestmentFund_TransactionType]	on	[InvestmentFund_BalanceAccountItem].[InvestmentFund_TransactionType_Id]	=	[InvestmentFund_TransactionType].[Id]
    
	where [InvestmentFund_BalanceAccount].[Id] = @id
	order by [InvestmentFund_BalanceAccountItem].[Date] desc