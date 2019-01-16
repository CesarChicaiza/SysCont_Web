CREATE TABLE [dbo].[InventoryTransfer_Detail]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
	[BusinessItemVariation_Name]		NVARCHAR(250)		NULL, 
	[Quantity]							DECIMAL(18, 5)		NULL, 
	[BusinessItemVariation_Id]			UNIQUEIDENTIFIER	NOT NULL,
	[InventoryTransfer_Id]				UNIQUEIDENTIFIER	NOT NULL,
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 

    CONSTRAINT [PK_InventoryTransfer_Detail] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_InventoryTransfer_Detail_BusinessItemVariation] FOREIGN KEY ([BusinessItemVariation_Id]) REFERENCES [BusinessItemVariation]([Id]),
    CONSTRAINT [FK_InventoryTransfer_Detail_InventoryTransfer] FOREIGN KEY ([InventoryTransfer_Id]) REFERENCES [InventoryTransfer]([Id]),
)
