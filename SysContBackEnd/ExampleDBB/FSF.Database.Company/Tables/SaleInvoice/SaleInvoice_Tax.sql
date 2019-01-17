CREATE TABLE [dbo].[SaleInvoice_Tax]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
	[Name]								NVARCHAR(2000)		NOT NULL, 
	[Code]								NVARCHAR(20)		NOT NULL, 
	[PercentageCode]					NVARCHAR(50)		NOT NULL, 
	[Percentage]						DECIMAL(18, 5)		NOT NULL, 
	[TaxableAmount]						DECIMAL(18, 5)		NOT NULL, 
	[TaxAmount]							DECIMAL(18, 5)		NOT NULL, 
	[SaleInvoice_Id]					UNIQUEIDENTIFIER	NOT NULL, 
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
    CONSTRAINT [PK_SaleInvoice_Tax] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_SaleInvoiceTax_SaleInvoice] FOREIGN KEY ([SaleInvoice_Id]) REFERENCES [SaleInvoice]([Id]) ON DELETE CASCADE,
	CONSTRAINT [FK_SaleInvoiceTax_Tax] FOREIGN KEY ([Tax_Id]) REFERENCES [Tax]([Id])

)
