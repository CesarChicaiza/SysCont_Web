CREATE TABLE [dbo].[SaleInvoice_ProgressProcess]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
	[Contract_ProgressPaymentRule_Id]	UNIQUEIDENTIFIER	NOT NULL,
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_SaleInvoice_ProgressProcess] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_SaleInvoice_ProgressProcess] FOREIGN KEY ([Contract_ProgressPaymentRule_Id]) REFERENCES [Contract_ProgressPaymentRule]([Id]), 
)
