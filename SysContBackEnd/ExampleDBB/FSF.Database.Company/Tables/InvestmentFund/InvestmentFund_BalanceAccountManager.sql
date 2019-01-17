CREATE TABLE [dbo].[InvestmentFund_BalanceAccountManager]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
    [Date]								DATETIME			NULL, 
    [Year]								INT					NULL, 
    [Month]								INT					NOT NULL,
    [InvestmentFund_Portfolio_Id]		UNIQUEIDENTIFIER	NOT NULL, 
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 
	 
    CONSTRAINT [PK_InvestmentFund_BalanceAccountManager] PRIMARY KEY ([Id]) 
)
