CREATE TABLE [dbo].[InventoryTransfer]
(
	
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
   	[Sequential]						BIGINT				NULL, 
	[OutputDate]						DATETIME			NULL, 
	[OriginEmployee_Id]					UNIQUEIDENTIFIER	NOT NULL,
	[DestinyEmployee_Id]				UNIQUEIDENTIFIER	NOT NULL, 
	[OriginWarehouse_Id]				UNIQUEIDENTIFIER	NOT NULL,
	[DestinyWareHouse_Id]				UNIQUEIDENTIFIER	NOT NULL, 
	[InventoryTransfer_Reason_Id]		UNIQUEIDENTIFIER	NOT NULL, 
	[InventoryTransfer_Status_Id]		UNIQUEIDENTIFIER	NOT NULL, 
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 

    CONSTRAINT [PK_InventoryTransfer] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_InventoryTransfer_OriginEmployee] FOREIGN KEY ([OriginEmployee_Id]) REFERENCES [Employee]([Id]),
    CONSTRAINT [FK_InventoryTransfer_DestinyEmployee] FOREIGN KEY ([DestinyEmployee_Id]) REFERENCES [Employee]([Id]),
    CONSTRAINT [FK_InventoryTransfer_OriginWarehouse] FOREIGN KEY ([OriginWarehouse_Id]) REFERENCES [Warehouse]([Id]),
    CONSTRAINT [FK_InventoryTransfer_DestinyWarehouse] FOREIGN KEY ([DestinyWarehouse_Id]) REFERENCES [Warehouse]([Id]),
    CONSTRAINT [FK_InventoryTransfer_Status] FOREIGN KEY ([InventoryTransfer_Status_Id]) REFERENCES [InventoryTransfer_Status]([Id]),
    CONSTRAINT [FK_InventoryTransfer_Reason] FOREIGN KEY ([InventoryTransfer_Reason_Id]) REFERENCES [InventoryTransfer_Reason]([Id])
)
