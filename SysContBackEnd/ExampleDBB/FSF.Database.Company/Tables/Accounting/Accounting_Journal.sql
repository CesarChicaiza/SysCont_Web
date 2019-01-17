CREATE TABLE [dbo].[Accounting_Journal]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
	[Account_Name]						NVARCHAR(200)		NULL,
	[Account_Id]						UNIQUEIDENTIFIER	NOT NULL,
	[Accounting_Period_Id]				UNIQUEIDENTIFIER	NOT NULL,  
	[CreditAmount]						DECIMAL(18,5)		NOT NULL,
	[DebitAmount]						DECIMAL(18,5)		NOT NULL,
	[RowStatus]							INT                 NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL, 
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_Accounting_Journal] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_Accounting_Journal_Period] FOREIGN KEY ([Accounting_Period_Id]) REFERENCES [Accounting_Period]([Id]), 
    CONSTRAINT [FK_Accounting_Journal_Account] FOREIGN KEY ([Account_Id]) REFERENCES [Account]([Id]) 
)
