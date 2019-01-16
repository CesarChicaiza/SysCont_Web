CREATE TABLE [dbo].[Sale]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
    [Date]								DATETIME			NOT NULL, 
	[Number]							BIGINT				NULL, 
	[Discount]							DECIMAL(18, 5)		NULL, 
	[Subtotal]							DECIMAL(18, 5)		NULL, 
	[Total]								DECIMAL(18, 5)		NULL, 
	[Tip]								DECIMAL(18, 5)		NULL,
	[Comments]							NVARCHAR(MAX)		NULL,		
	[Customer_Id]						UNIQUEIDENTIFIER	NOT NULL,
	[BusinessOpportunity_Id]			UNIQUEIDENTIFIER	NULL, 
	[Campaign_Id]						UNIQUEIDENTIFIER	NULL, 
	[Sale_Place_Id]						UNIQUEIDENTIFIER	NULL,
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_Sale] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Sales_Customer] FOREIGN KEY ([Customer_Id]) REFERENCES [Customer]([Id]),
	CONSTRAINT [FK_Sale_Sale_Place] FOREIGN KEY ([Sale_Place_Id]) REFERENCES [Sale_Place]([Id]), 
    CONSTRAINT [FK_Sale_Employee_Id] FOREIGN KEY ([Employee_Id]) REFERENCES [Employee]([Id]) 
)

