CREATE TABLE [dbo].[Tax_SupplierClass]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL,
	[Tax_Id]							UNIQUEIDENTIFIER	NOT NULL,
	[Supplier_Class_Id]					UNIQUEIDENTIFIER	NOT NULL,
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_Tax_SupplierClass] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_Tax_SupplierClass_Tax] FOREIGN KEY ([Tax_Id]) REFERENCES [Tax]([Id]), 
    CONSTRAINT [FK_Tax_SupplierClass_SupplierClass] FOREIGN KEY ([Supplier_Class_Id]) REFERENCES [Supplier_Class]([Id]) 
)
