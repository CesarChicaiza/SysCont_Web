CREATE TABLE [dbo].[InvestmentFund_Valuation]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
	[Date]								DATETIME			NOT NULL, 
	[TotalPrice]						DECIMAL(18, 5)		NOT NULL, 
	[UnitPrice]							DECIMAL(18, 5)		NOT NULL, 
	[Units]								DECIMAL(18, 5)		NOT NULL,
	[AdministrativeCost]				DECIMAL(18, 5)		NOT NULL, 
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
    CONSTRAINT [PK_InvestmentFund_PortfolioChange] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_InvestmentFund_PortfolioChange_InvertmentFund_Portfolio_Id] FOREIGN KEY ([InvestmentFund_Portfolio_Id]) REFERENCES [InvestmentFund_Portfolio]([Id]) 
)
