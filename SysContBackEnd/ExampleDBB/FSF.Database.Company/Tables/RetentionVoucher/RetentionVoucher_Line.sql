CREATE TABLE [dbo].[RetentionVoucher_Line]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
	[Number]							NVARCHAR(200)		NULL, 
	[EmissionDate]						DATETIME			NULL, 
	[TaxAmount]							DECIMAL(18, 5)		NULL, 
	[TaxPorcentage]						DECIMAL(18, 5)		NULL, 
	[TotalTaxAmount]					DECIMAL(18, 5)		NULL, 
	[Tax_Retention_Id]					UNIQUEIDENTIFIER	NOT NULL, 
	[RetentionVoucher_Id]				UNIQUEIDENTIFIER	NOT NULL, 
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_RetentionVoucher_Line] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_RetentionVoucher_Line] FOREIGN KEY ([RetentionVoucher_Id]) REFERENCES [RetentionVoucher]([Id]) ON DELETE CASCADE, 
    CONSTRAINT [FK_RetentionVoucher_Line_TaxRetention] FOREIGN KEY ([Tax_Retention_Id]) REFERENCES [Tax_Retention]([Id]) 
)
