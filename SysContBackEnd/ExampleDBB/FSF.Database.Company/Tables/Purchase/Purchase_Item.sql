CREATE TABLE [dbo].[Purchase_Item]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
	[BusinessItemVariation_Name]							NVARCHAR(100)				NULL, 
	[Quantity]							DECIMAL(18, 5)		NOT NULL, 
	[UnitDiscount]						DECIMAL(18, 5)		NULL,
	[UnitPrice]							DECIMAL(18, 5)		NULL,
	[TotalPrice]						DECIMAL(18, 5)		NULL,
	[Purchase_Id]						UNIQUEIDENTIFIER	NOT NULL, 
    [BusinessItemVariation_Id]			UNIQUEIDENTIFIER	NOT NULL, 
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 

    CONSTRAINT [PK_Purchase_Item] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_PurchaseItem_Purchase] FOREIGN KEY ([Purchase_Id]) REFERENCES [Purchase]([Id]), 
    CONSTRAINT [FK_PurchaseItem_Material] FOREIGN KEY ([BusinessItemVariation_Id]) REFERENCES [BusinessItemVariation]([Id])
)
