CREATE TABLE [dbo].[InventoryTransferDetail_Inventory]
(
	
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
	[BusinessItemVariation_Name]		NVARCHAR(250)		NULL, 
	[Inventory_Id]						UNIQUEIDENTIFIER	NOT NULL,
	[InventoryTransfer_Detail_Id]		UNIQUEIDENTIFIER	NOT NULL,
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 

    CONSTRAINT [PK_InventoryTransferDetail] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_InventoryTransferDetail_Detail] FOREIGN KEY ([InventoryTransfer_Detail_Id]) REFERENCES [InventoryTransfer_Detail]([Id]),
    CONSTRAINT [FK_InventoryTransferDetail_Inventory] FOREIGN KEY ([Inventory_Id]) REFERENCES [Inventory]([Id]),
)
