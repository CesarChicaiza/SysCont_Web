﻿CREATE TABLE [dbo].[Supplier_PaymentOption]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
    [OwnerLegalId]						NVARCHAR(500)		NULL, 
	[OwnerName]							NVARCHAR(500)		NULL, 
	[Number]							NVARCHAR(50)		NULL, 
    [ExpirationDate]					DATETIME			NULL, 
	[Bank_Id]							UNIQUEIDENTIFIER	NULL, 
    [Payment_Subtype_Id]				UNIQUEIDENTIFIER	NULL, 
	[Supplier_Id]						UNIQUEIDENTIFIER	NOT NULL,
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_Supplier_PaymentOption] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_Supplier_PaymentOption_Bank] FOREIGN KEY ([Bank_Id]) REFERENCES [Bank]([Id]), 
    CONSTRAINT [FK_Supplier_PaymentOption_Supplier] FOREIGN KEY ([Supplier_Id]) REFERENCES [Supplier]([Id]), 
    CONSTRAINT [FK_Supplier_PaymentOption_Type] FOREIGN KEY ([Payment_Subtype_Id]) REFERENCES [Payment_Subtype]([Id]), 
)
