CREATE TABLE [dbo].[InvestmentFund_CustomerPortfolio]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
    [CurrentBalance]					DECIMAL(18, 5)		NOT NULL, 
	[CurrentUnits]						DECIMAL(18, 5)		NOT NULL, 
	[CurrentParticipation]				DECIMAL(18, 5)		NOT NULL, 
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
    CONSTRAINT [PK_InvestmentFundInvestorPortfolio] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_InvestmentFundCustomerPortfolio_InvestmentFundPortfolio] FOREIGN KEY ([InvestmentFund_Portfolio_Id]) REFERENCES [InvestmentFund_Portfolio]([Id]), 
    CONSTRAINT [FK_InvestmentFundCustomerPortfolio_Customer] FOREIGN KEY ([Customer_Id]) REFERENCES [Customer]([Id]) 
)
