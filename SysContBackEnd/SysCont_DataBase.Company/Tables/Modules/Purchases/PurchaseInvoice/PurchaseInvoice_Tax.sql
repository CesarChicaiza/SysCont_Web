CREATE TABLE [dbo].[PurchaseInvoice_Tax]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
	[Name]								NVARCHAR(2000)		NOT NULL, 
	[Code]								NVARCHAR(20)		NOT NULL, 
	[PercentageCode]					NVARCHAR(50)		NOT NULL, 
	[Percentage]						DECIMAL(18, 5)		NOT NULL, 
	[TaxableAmount]						DECIMAL(18, 5)		NOT NULL, 
	[TaxAmount]							DECIMAL(18, 5)		NOT NULL, 
	[PurchaseInvoice_Id]				UNIQUEIDENTIFIER	NOT NULL, 
	[Tax_Id]                            UNIQUEIDENTIFIER    NOT NULL, 
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_Purchase_Tax] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_PurchaseTax_PurchaseInvoice] FOREIGN KEY ([PurchaseInvoice_Id]) REFERENCES [PurchaseInvoice]([Id]) ON DELETE CASCADE,
	CONSTRAINT [FK_PurchaseTax_Tax] FOREIGN KEY ([Tax_Id]) REFERENCES [Tax]([Id])

)
