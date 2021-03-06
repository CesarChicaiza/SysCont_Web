﻿CREATE TABLE [dbo].[Sale_Item]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
	[Number]							BIGINT				NULL, 
	[Quantity]							DECIMAL(18, 5)		NOT NULL, 
	[UnitPrice]							DECIMAL(18, 5)		NULL DEFAULT 0, 
	[CustomerUnitDiscountPercentage]	DECIMAL(18, 5)		NULL DEFAULT 0,
	[SaleUnitDiscountPercentage]		DECIMAL(18, 5)		NULL DEFAULT 0, 
	[TotalUnitDiscountPercentage]		DECIMAL(18, 5)		NULL DEFAULT 0, 
	[TotalUnitDiscountAmount]			DECIMAL(18, 5)		NULL DEFAULT 0, 
	[DiscountedUnitPrice]				DECIMAL(18, 5)		NULL DEFAULT 0, 
	[TotalPrice]						DECIMAL(18, 5)		NULL DEFAULT 0,
	[Sale_Id]							UNIQUEIDENTIFIER	NULL, 
    [BusinessItemVariation_Id]					UNIQUEIDENTIFIER	NULL, 
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 

    CONSTRAINT [PK_Sale_Item] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_SaleItem_Sale] FOREIGN KEY ([Sale_Id]) REFERENCES [Sale]([Id]), 
    CONSTRAINT [FK_SaleItem_BusinessItemVariation] FOREIGN KEY ([BusinessItemVariation_Id]) REFERENCES [BusinessItemVariation]([Id]), 
)
