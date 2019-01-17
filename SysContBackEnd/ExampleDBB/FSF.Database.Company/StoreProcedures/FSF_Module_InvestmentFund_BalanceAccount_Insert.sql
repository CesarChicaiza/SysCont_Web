CREATE PROCEDURE [dbo].[FSF_Module_InvestmentFund_BalanceAccount_Insert]

	@id								nvarchar(max),
	@description					nvarchar(max),
	@month							int,
	@year							int,
	@customerNumber					varchar(max),
	@customerExecutive				varchar(max),
	@previousBalanceDate			datetime = null,
	@previousBalanceUnits			decimal(18,5),
	@previousBalanceUnitPrice		decimal(18,5),
	@previousBalanceAmount			decimal(18,5),
	@currentDepositUnits			decimal(18,5),
	@currentDepositAmount			decimal(18,5),
	@currentDepositUnitPrice		decimal(18,5),
	@currentRescueUnits				decimal(18,5),
	@currentRescueAmount			decimal(18,5),
	@currentRescueUnitPrice			decimal(18,5),
	@currentBalanceDate				datetime,
	@currentBalanceUnits			decimal(18,5),
	@currentBalanceUnitPrice		decimal(18,5),
	@currentBalanceAmount			decimal(18,5),
	@interestCurrentPeriod			decimal(18,5),
	@interestLastPeriod				decimal(18,5),
	@iterestLastSixMonths			decimal(18,5),
	@annualPerformance				decimal(18,5),
	@portfolioPrice					decimal(18,5),
	@portfolioUnits					decimal(18,5),
	@customerParticipation			decimal(18,5),
	@portfolioInvestorsCount		decimal(18,5),
	@taxIncome						decimal(18,5),
	@taxIncomeAccumulated			decimal(18,5),
	@investmentFund_Portfolio_Id	varchar(max),
	@customer_Id					varchar(max),
	@rowStatus						int

AS

declare @number nvarchar(max)

set @number= (select [Number] from [Customer] where [Id] = @customer_Id)

		
INSERT INTO [dbo].[InvestmentFund_BalanceAccount]	(	[Id],	[Description],	[Month],	[Year],	[CustomerNumber],	[CustomerExecutive],	[PreviousBalanceDate],	[PreviousBalanceUnits],	[PreviousBalanceUnitPrice],	[PreviousBalanceAmount],	[CurrentDepositUnits],	[CurrentDepositAmount],	[CurrentDepositUnitPrice],		[CurrentRescueUnits],	[CurrentRescueAmount],	[CurrentRescueUnitPrice],	[CurrentBalanceDate],	[CurrentBalanceUnits],	[CurrentBalanceUnitPrice],	[CurrentBalanceAmount],	[InterestCurrentPeriod],	[InterestLastPeriod],	[IterestLastSixMonths],	[AnnualPerformance],	[PortfolioPrice],	[PortfolioUnits],	[CustomerParticipation],	[PortfolioInvestorsCount],	[TaxIncome],	[TaxIncomeAccumulated],	[InvestmentFund_Portfolio_Id],	[Customer_Id],	[RowStatus]	)	VALUES
													(	@id,	@description,	@month,		@year,	@number,			@customerExecutive,		@previousBalanceDate,	@previousBalanceUnits,	@previousBalanceUnitPrice,	@PreviousBalanceAmount,		@currentDepositUnits,	@currentDepositAmount,	@currentDepositUnitPrice,		@currentRescueUnits,	@CurrentRescueAmount,	@currentRescueUnitPrice,	@currentBalanceDate,	@CurrentBalanceUnits,	@currentBalanceUnitPrice,	@currentBalanceAmount,	@InterestCurrentPeriod,		@InterestLastPeriod,	@IterestLastSixMonths,	@annualPerformance,		@portfolioPrice,	@PortfolioUnits,	@customerParticipation,		@portfolioInvestorsCount,	@taxIncome,		@taxIncomeAccumulated,	@investmentFund_Portfolio_Id,   @customer_Id,	1			)                 		           	           	     
				
