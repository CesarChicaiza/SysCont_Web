﻿CREATE TABLE [dbo].[Purchase]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
    [Date]								DATETIME			NOT NULL, 
	[Sequential]							BIGINT				NULL, 
	[Purchase_Status_Id]				UNIQUEIDENTIFIER	NOT NULL, 
	[Subtotal]							DECIMAL(18, 5)		NULL, 
	--[Discount]							DECIMAL(18, 5)		NULL, 
	[Total]								DECIMAL(18, 5)		NULL, 
	[Supplier_Id]						UNIQUEIDENTIFIER	NOT NULL,
	[Company_Place_Id]					UNIQUEIDENTIFIER	NOT NULL, 
	[Sale_Id]							UNIQUEIDENTIFIER	NULL, 
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_Purchase] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Purchase_Supplier] FOREIGN KEY ([Supplier_Id]) REFERENCES [Supplier]([Id]),
	CONSTRAINT [FK_Purchase_CompanyPlace] FOREIGN KEY ([Company_Place_Id]) REFERENCES [Company_Place]([Id]),
    CONSTRAINT [FK_Purchase_PurchaseStatus] FOREIGN KEY ([Purchase_Status_Id]) REFERENCES [Purchase_Status]([Id]),
    CONSTRAINT [FK_Purchase_Sale] FOREIGN KEY ([Sale_Id]) REFERENCES [Sale]([Id]),
    CONSTRAINT [FK_Purchase_Employee_Id] FOREIGN KEY ([Employee_Id]) REFERENCES [Employee]([Id]) 
)
