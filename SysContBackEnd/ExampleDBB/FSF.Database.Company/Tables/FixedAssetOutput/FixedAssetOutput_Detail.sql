CREATE TABLE [dbo].[FixedAssetOutput_Detail]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
	[BusinessItemVariation_Name]		NVARCHAR(150)		NULL, 
	[Quantity]							DECIMAL(18, 5)		NULL, 
	[FixedAssetOutput_Id]				UNIQUEIDENTIFIER	NOT NULL,
	[BusinessItemVariation_Id]			UNIQUEIDENTIFIER	NOT NULL, 
	[Comments]							NVARCHAR(500)		NULL,
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 

    CONSTRAINT [PK_FixedAssetOutput_Detail] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_FixedAssetOutput_Detail_InventoryIncome] FOREIGN KEY ([FixedAssetOutput_Id]) REFERENCES [FixedAssetOutput]([Id]),
    CONSTRAINT [FK_FixedAssetOutput_Detail_BusinessVariation] FOREIGN KEY ([BusinessItemVariation_Id]) REFERENCES [BusinessItemVariation]([Id])
)
