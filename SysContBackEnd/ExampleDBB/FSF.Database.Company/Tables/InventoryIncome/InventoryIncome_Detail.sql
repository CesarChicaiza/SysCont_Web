CREATE TABLE [dbo].[InventoryIncome_Detail]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
	[BusinessItemVariation_Name]		NVARCHAR(150)		NULL, 
	[Quantity]							DECIMAL(18, 5)		NULL, 
	[InventoryIncome_Id]				UNIQUEIDENTIFIER	NOT NULL,
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

    CONSTRAINT [PK_InventoryIncome_Detail] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_InventoryIncome_Detail_InventoryIncome] FOREIGN KEY ([InventoryIncome_Id]) REFERENCES [InventoryIncome]([Id]),
    CONSTRAINT [FK_InventoryIncome_Detail_BusinessVariation] FOREIGN KEY ([BusinessItemVariation_Id]) REFERENCES [BusinessItemVariation]([Id])
)
