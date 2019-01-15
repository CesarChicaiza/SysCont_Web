CREATE TABLE [dbo].[FixedAssetIncome_Detail]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
	[BusinessItemVariation_Name]		NVARCHAR(150)		NULL, 
	[Quantity]							DECIMAL(18, 5)		NULL, 
	[FixedAssetIncome_Id]				UNIQUEIDENTIFIER	NOT NULL,
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

    CONSTRAINT [PK_FixedAssetIncome_Detail] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_FixedAssetIncome_Detail_FixedAssetIncome] FOREIGN KEY ([FixedAssetIncome_Id]) REFERENCES [FixedAssetIncome]([Id]),
    CONSTRAINT [FK_FixedAssetIncome_Detail_BusinessVariation] FOREIGN KEY ([BusinessItemVariation_Id]) REFERENCES [BusinessItemVariation]([Id])
)
