CREATE TABLE [dbo].[BusinessItem_Promotion]
(
	[Id] UNIQUEIDENTIFIER NOT NULL, 
    [Start] DATETIME NULL, 
    [End] DATETIME NULL, 
    [Type] INT NULL,  --type: 0-quantity, 1-percentage 
	[QuantityRequired] DECIMAL(18, 5) NULL, 
	[DiscountPercentage] DECIMAL(18, 5) NULL, 
	[QuantityGift] DECIMAL(18, 5) NULL, 
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_BusinessItem_Promotion] PRIMARY KEY ([Id]) 
)
