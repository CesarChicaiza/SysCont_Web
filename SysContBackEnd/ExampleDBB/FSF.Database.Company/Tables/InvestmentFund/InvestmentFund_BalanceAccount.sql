CREATE TABLE [dbo].[InvestmentFund_BalanceAccount]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
    [Description]						NVARCHAR(50)		NULL, 
    [Month]								INT					NULL, 
    [Year]								INT					NULL, 

	[CustomerNumber]					NVARCHAR(50)		NULL,
	[CustomerName]						NVARCHAR(500)		NULL,
	[CustomerExecutive]					NVARCHAR(50)		NULL,
	
	[PreviousBalanceDate]				DATETIME			NULL, 
	[PreviousBalanceUnits]				DECIMAL(18, 5)		NULL DEFAULT 0,
	[PreviousBalanceUnitPrice]			DECIMAL(18, 5)		NULL DEFAULT 0,
	[PreviousBalanceAmount]				DECIMAL(18, 5)		NULL DEFAULT 0, 

	[CurrentDepositUnits]				DECIMAL(18, 5)		NULL DEFAULT 0, 
    [CurrentDepositAmount]				DECIMAL(18, 5)		NULL DEFAULT 0, 
	[CurrentDepositUnitPrice]			DECIMAL(18, 5)		NULL DEFAULT 0, 
	[CurrentRescueUnits]				DECIMAL(18, 5)		NULL DEFAULT 0, 
    [CurrentRescueAmount]				DECIMAL(18, 5)		NULL DEFAULT 0, 
    [CurrentRescueUnitPrice]			DECIMAL(18, 5)		NULL DEFAULT 0, 
	
	[CurrentBalanceDate]				DATETIME			NULL			 , 
    [CurrentBalanceUnits]				DECIMAL(18, 5)		NULL DEFAULT 0, 
	[CurrentBalanceUnitPrice]			DECIMAL(18, 5)		NULL DEFAULT 0, 
	[CurrentBalanceAmount]				DECIMAL(18, 5)		NULL DEFAULT 0, 
	
	[InterestCurrentPeriod]				DECIMAL(18, 5)		NULL DEFAULT 0,
	[InterestLastPeriod]				DECIMAL(18, 5)		NULL DEFAULT 0, 
	[IterestLastSixMonths]				DECIMAL(18, 5)		NULL DEFAULT 0, 
    [AnnualPerformance]					DECIMAL(18, 5)		NULL DEFAULT 0,

	[PortfolioPrice]					DECIMAL(18, 5)		NULL DEFAULT 0, 
	[PortfolioUnits]					DECIMAL(18, 5)		NULL DEFAULT 0, 
	[CustomerParticipation]				DECIMAL(18, 5)		NULL DEFAULT 0, 
	[PortfolioInvestorsCount]			DECIMAL(18, 5)		NULL DEFAULT 0, 
    [TaxIncome]							DECIMAL(18, 5)		NULL DEFAULT 0,
	[TaxIncomeAccumulated]				DECIMAL(18, 5)		NULL DEFAULT 0, 
	
	[InvestmentFund_Portfolio_Id]		UNIQUEIDENTIFIER	NULL, 
	[Customer_Id]						UNIQUEIDENTIFIER	NULL, 
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_InvestmentFundBalanceAccount] PRIMARY KEY ([Id]), 
	CONSTRAINT [FK_InvestmentFundBalanceBalanceAccount_Customer] FOREIGN KEY ([Customer_Id]) REFERENCES [Customer]([Id]), 
    CONSTRAINT [FK_InvestmentFundBalanceAccount_InvestmentFundPortfolioId] FOREIGN KEY ([InvestmentFund_Portfolio_Id]) REFERENCES [InvestmentFund_Portfolio]([Id]) 
)
