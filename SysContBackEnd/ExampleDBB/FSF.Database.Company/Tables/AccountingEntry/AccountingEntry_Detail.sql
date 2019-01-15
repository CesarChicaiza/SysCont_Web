CREATE TABLE [dbo].[AccountingEntry_Detail]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
	[CreditAmount]						DECIMAL(18,5)		NOT NULL,
	[DebitAmount]						DECIMAL(18,5)		NOT NULL,
	[Account_Id]						UNIQUEIDENTIFIER	NOT NULL,
	[AccountingEntry_Id]				UNIQUEIDENTIFIER	NOT NULL,  
	[RowStatus]							INT                 NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL, 
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_Accounting_EntryDetail] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_Accounting_EntryDetail_Entry] FOREIGN KEY ([AccountingEntry_Id]) REFERENCES [AccountingEntry]([Id]), 
    CONSTRAINT [FK_Accounting_EntryDetail_Account] FOREIGN KEY ([Account_Id]) REFERENCES [Account]([Id]) 
)
