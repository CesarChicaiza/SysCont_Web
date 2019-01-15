CREATE TABLE [dbo].[PurchaseInvoice_Line]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
	[Code1]								NVARCHAR(MAX)		NULL, 
	--[Code2]								NVARCHAR(MAX)		NULL, 
	[Description]						NVARCHAR(MAX)		NULL, 
	[Quantity]							DECIMAL(18, 5)		NOT NULL, 
	[UnitPrice]							DECIMAL(18, 5)		NOT NULL, 
	[UnitDiscount]						DECIMAL(18, 5)		NOT NULL, 
	[TotalPrice]						DECIMAL(18, 5)		NULL, --(Quantity x UnitPrice) - (Quanity x UnitDiscount)
	[BusinessItemVariation_Id]			UNIQUEIDENTIFIER	NOT NULL, 
	[PurchaseInvoice_Id]				UNIQUEIDENTIFIER	NOT NULL, 
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_PurchaseInvoice_Line] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_PurchaseInvoice_Line] FOREIGN KEY ([PurchaseInvoice_Id]) REFERENCES [PurchaseInvoice]([Id]) ON DELETE CASCADE, 
    CONSTRAINT [FK_PurchaseInvoice_Line_BusinessItemVariation] FOREIGN KEY ([BusinessItemVariation_Id]) REFERENCES [BusinessItemVariation]([Id]) 
)
