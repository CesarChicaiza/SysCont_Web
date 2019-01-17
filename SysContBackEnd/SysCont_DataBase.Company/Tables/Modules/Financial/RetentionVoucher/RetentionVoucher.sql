CREATE TABLE [dbo].[RetentionVoucher]
(
	
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
	[Date]								DATE				NOT NULL, 
	[AuthorizationDate]					DATE				NULL, 
	--Company
	[CompanyLegalId]					NVARCHAR(MAX)		NULL, 
	[CompanyName1]						NVARCHAR(MAX)		NULL, 
	[CompanyName2]						NVARCHAR(MAX)		NULL, 
	[CompanyTaxPayerId]					NVARCHAR(MAX)		NULL, 
	[CompanyAddress]					NVARCHAR(MAX)		NULL, 
	[CompanyPhone]						NVARCHAR(MAX)		NULL, 
	[CompanyAccountingRequired]			NVARCHAR(100)		NULL, 
	--Company_Place
	[CompanyPlaceCode]					NVARCHAR(MAX)		NULL, 
	[CompanyPlaceAddress]				NVARCHAR(MAX)		NULL, 
	[CompanyPlacePhone]					NVARCHAR(MAX)		NULL, 
	[CompanyPointOfSaleCode]			NVARCHAR(MAX)		NULL, 
	--Document
	[Number]							NVARCHAR(MAX)		NULL,
	[DocumentNumber]					AS CONCAT( ISNULL([CompanyPlaceCode],''), '-', ISNULL([CompanyPointOfSaleCode],'') ,'-', ISNULL( [Number], '')),  --Calculado 001-001-000000001

	--Custommer
	[SupplierName]						NVARCHAR(MAX)		NULL, 
	[SupplierLegalId]					NVARCHAR(MAX)		NULL, 

	--Informative fields
	[Informative1]						NVARCHAR(MAX)		NULL, 
	[Informative2]						NVARCHAR(MAX)		NULL, 
	[Informative3]						NVARCHAR(MAX)		NULL, 
	[Informative4]						NVARCHAR(MAX)		NULL, 
	[Informative5]						NVARCHAR(MAX)		NULL, 
	[Informative6]						NVARCHAR(MAX)		NULL, 
	[Informative7]						NVARCHAR(MAX)		NULL, 
	[Informative8]						NVARCHAR(MAX)		NULL, 
	[Informative9]						NVARCHAR(MAX)		NULL, 
	[Informative10]						NVARCHAR(MAX)		NULL, 
	[Company_EmissionPoint_Id]			UNIQUEIDENTIFIER	NOT NULL,
	[PurchaseInvoice_Id]				UNIQUEIDENTIFIER	NOT NULL,
	[Xml]								NVARCHAR(MAX)		NULL, 
	[KeyAccess]							NVARCHAR(50)		NULL,
	[VoucherStatus]						NVARCHAR(50)		NULL,
	[VoucherMessages]					NVARCHAR(MAX)		NULL,
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture]							NVARCHAR(MAX)		NULL, 
    CONSTRAINT [PK_RetentionVoucher] PRIMARY KEY ([Id]),
	CONSTRAINT [FK_RemissionGuide_PurchaseInvoice] FOREIGN KEY ([PurchaseInvoice_Id]) REFERENCES [PurchaseInvoice]([Id]), 
    CONSTRAINT [FK_RetentionVoucher_Company_EmissionPoint] FOREIGN KEY ([Company_EmissionPoint_Id]) REFERENCES [Company_EmissionPoint]([Id]) 
)
