﻿CREATE TABLE [dbo].[PurchaseInvoicePayment]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
    [Date]								DATETIME			NOT NULL, 
	[OwnerLegalId]						NVARCHAR(MAX)		NULL,
	[OwnerName]							NVARCHAR(MAX)		NULL,
	[ExpirationDate]					DATE				NULL,
	[BankCode]							NVARCHAR(MAX)		NULL,
	[BankName]							NVARCHAR(MAX)		NULL,
	[Number]							NVARCHAR(MAX)		NULL,
	[SupplierLegalId]					NVARCHAR(MAX)		NULL,
	[SupplierName]						NVARCHAR(MAX)		NULL,
	[AutomaticDebit]					BIT					NOT NULL, 
	[Amount]							DECIMAL(18, 5)		NOT NULL, 
	[Confirmed]							BIT					NOT NULL,
	[Comment]							NVARCHAR(MAX)		NULL,
	[PurchaseInvoice_Id]				UNIQUEIDENTIFIER	NOT NULL,
	[Supplier_PaymentOption_Id]			UNIQUEIDENTIFIER	NOT NULL,
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_PurchaseInvoicePayment] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_PurchaseInvoicePayment_PurchaseInvoice] FOREIGN KEY ([PurchaseInvoice_Id]) REFERENCES [PurchaseInvoice]([Id]) ON DELETE CASCADE, 
    CONSTRAINT [FK_PurchaseInvoicePayment_CustomerPaymentOption] FOREIGN KEY ([Supplier_PaymentOption_Id]) REFERENCES [Supplier_PaymentOption]([Id]) 
)