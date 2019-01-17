CREATE TABLE [dbo].[SaleInvoice_Line]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
	[Code1]								NVARCHAR(MAX)		NOT NULL, 
	[Code2]								NVARCHAR(MAX)		NULL, 
	[Description]						NVARCHAR(MAX)		NOT NULL, 
	[Quantity]							DECIMAL(18, 5)		NOT NULL, 
	[UnitPrice]							DECIMAL(18, 5)		NOT NULL, 
	[UnitDiscount]						DECIMAL(18, 5)		NOT NULL, 
	[TotalPrice]						DECIMAL(18, 5)		NOT NULL, --(Quantity x UnitPrice) - (Quanity x UnitDiscount)
	[BusinessItemVariation_Id]					UNIQUEIDENTIFIER	NOT NULL, 
	[SaleInvoice_Id]					UNIQUEIDENTIFIER	NOT NULL, 
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_SaleInvoice_Line] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_SaleInvoice_Line] FOREIGN KEY ([SaleInvoice_Id]) REFERENCES [SaleInvoice]([Id]) ON DELETE CASCADE, 
    CONSTRAINT [FK_SaleInvoice_Line_BusinessItem] FOREIGN KEY ([BusinessItemVariation_Id]) REFERENCES [BusinessItemVariation]([Id]) 
)
