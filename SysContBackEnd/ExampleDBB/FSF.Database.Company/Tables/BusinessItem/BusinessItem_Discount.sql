CREATE TABLE [dbo].[BusinessItem_Discount]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
    [Discount]							DECIMAL(18, 5)		NULL, 
    [Customer_Rating_Id]				UNIQUEIDENTIFIER	NULL, 
	[BusinessItem_Id]					UNIQUEIDENTIFIER	NULL, 
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_BusinessItem_Discount] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_BusinessItemDiscount_BusinessItem] FOREIGN KEY ([BusinessItem_Id]) REFERENCES [BusinessItem]([Id]), 
    CONSTRAINT [FK_BusinessItemDiscount_CustomerRating] FOREIGN KEY ([Customer_Rating_Id]) REFERENCES [Customer_Rating]([Id]) 
)
