CREATE TABLE [dbo].[BusinessItemVariation_Discount]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
    [Discount]							DECIMAL(18, 5)		NULL, 
    [Customer_Rating_Id]				UNIQUEIDENTIFIER	NULL, 
	[BusinessItemVariation_Id]			UNIQUEIDENTIFIER	NULL, 
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_usinessItemVariation_Discount] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_BusinessItemVariationDiscount_BusinessItemVariation] FOREIGN KEY ([BusinessItemVariation_Id]) REFERENCES [BusinessItemVariation]([Id]), 
    CONSTRAINT [FK_BusinessItemVariationDiscount_CustomerRating] FOREIGN KEY ([Customer_Rating_Id]) REFERENCES [Customer_Rating]([Id]) 
)
