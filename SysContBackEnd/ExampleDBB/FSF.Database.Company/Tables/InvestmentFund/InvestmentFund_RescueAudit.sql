CREATE TABLE [dbo].[InvestmentFund_RescueAudit]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
    [Date]								DATETIME			NOT NULL, 
    [RemovedUnits]						INT					NOT NULL, 
	[ApplyIcomeTax]						BIT					NOT NULL, 
	[IncomeTax]							DECIMAL(18, 5)		NOT NULL, 
	[TransactionDeposit_Id]				UNIQUEIDENTIFIER	NOT NULL, 
    [TransactionRescue_Id]				UNIQUEIDENTIFIER	NOT NULL, 
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 
    
	CONSTRAINT [PK_InvestmentFund_RescueAudit] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_InvestmentFund_RescueAudit_TransactionDeposit] FOREIGN KEY ([TransactionDeposit_Id]) REFERENCES [InvestmentFund_Transaction]([Id]), 
	
)
