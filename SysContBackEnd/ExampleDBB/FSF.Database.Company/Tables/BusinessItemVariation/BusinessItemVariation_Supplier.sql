CREATE TABLE [dbo].[BusinessItemVariation_Supplier]
(
	[Id]							UNIQUEIDENTIFIER	NOT NULL, 
    [SupplierCode]					NVARCHAR(300)		NOT NULL,
    [LastPurchaseDate]				DATETIME			NOT NULL, 
	[LastPurchasePrice]				DECIMAL(18, 5)		NOT NULL, 
	[BusinessItemVariation_Id]		UNIQUEIDENTIFIER	NOT NULL,
	[Supplier_Id]					UNIQUEIDENTIFIER	NOT NULL,
	[RowStatus]						int                 not null,
	[Locked]						BIT					NOT NULL DEFAULT 0,
	[Required]						BIT					NOT NULL DEFAULT 0,
	[Employee_Id]					uniqueidentifier	null,
	[CreatedBy]						uniqueidentifier	null,
	[CreatedDate]					datetime			null,
	[ModifiedBy]					uniqueidentifier    null,
	[ModifiedDate]					datetime            null, 
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_BusinessItemVariation_Supplier] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_BusinessItemVariation_Supplier_Material] FOREIGN KEY ([BusinessItemVariation_Id]) REFERENCES [BusinessItemVariation]([Id]), 
    CONSTRAINT [FK_BusinessItemVariation_Supplier_Supplier] FOREIGN KEY ([Supplier_Id]) REFERENCES [Supplier]([Id])
)
