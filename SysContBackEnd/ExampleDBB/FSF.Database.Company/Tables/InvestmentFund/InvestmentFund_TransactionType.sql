CREATE TABLE [dbo].[InvestmentFund_TransactionType]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
    [Name]								NVARCHAR(100)		NULL, 
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 

    CONSTRAINT [PK_InvestmentFund_TransactionType] PRIMARY KEY ([Id]) 
)
