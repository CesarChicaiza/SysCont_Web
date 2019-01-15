CREATE TABLE [dbo].[Contract_ProgressPaymentRule]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
	[AdvancePercentage]					DECIMAL(4, 2)		NOT NULL, 
	[InvoicePercentage]					DECIMAL(4, 2)		NOT NULL, 
	[Contract_Id]						UNIQUEIDENTIFIER	NOT NULL,
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_Contract_ProgressPaymentRule] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_Contract_ProgressPaymentRule] FOREIGN KEY ([Contract_Id]) REFERENCES [Contract]([Id]), 
)
