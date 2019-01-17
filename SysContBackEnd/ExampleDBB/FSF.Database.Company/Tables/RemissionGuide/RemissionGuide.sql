CREATE TABLE [dbo].[RemissionGuide]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
	[Batch]								NVARCHAR(100)		NULL,
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
	--Driver
	[Driver_Id]							UNIQUEIDENTIFIER	NOT NULL, 
	[DepartureAddress]					NVARCHAR(MAX)		NULL,
	[DepartureDate]						DATE				NOT NULL,
	[ArriveDate]						DATE				NULL, 
	[VehiculeId]						NVARCHAR(50)		NULL, 

	--Document
	[Number]							NVARCHAR(MAX)		NULL,
	[DocumentNumber]					AS CONCAT( ISNULL([CompanyPlaceCode],''), '-', ISNULL([CompanyPointOfSaleCode],'') ,'-', ISNULL( [Number], '')),  --Calculado 001-001-000000001

	--Custommer
	[ReceiverName]						NVARCHAR(MAX)		NULL, 
	[ReceiverLegalId]					NVARCHAR(MAX)		NULL, 
	[ReceiverBillingAddress]			NVARCHAR(MAX)		NULL,
	[TransferReason]					NVARCHAR(MAX)		NULL,

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
	[InventoryTransfer_Id]				UNIQUEIDENTIFIER	NULL, 
	[InventoryOutput_Id]				UNIQUEIDENTIFIER	NULL, 
	[Company_EmissionPoint_Id]			UNIQUEIDENTIFIER	NOT NULL,
	--[SaleInvoice_Id]					UNIQUEIDENTIFIER	NULL,
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
    CONSTRAINT [PK_RemissionGuide] PRIMARY KEY ([Id]),
	CONSTRAINT [FK_RemissionGuide_InventoryOutput] FOREIGN KEY ([InventoryOutput_Id]) REFERENCES [InventoryOutput]([Id]), 
	CONSTRAINT [FK_RemissionGuide_InventoryTransfer] FOREIGN KEY ([InventoryTransfer_Id]) REFERENCES [InventoryTransfer]([Id]), 
	CONSTRAINT [FK_RemissionGuide_Driver] FOREIGN KEY ([Driver_Id]) REFERENCES [Driver]([Id]), 
	--CONSTRAINT [FK_RemissionGuide_SaleInvoice] FOREIGN KEY ([SaleInvoice_Id]) REFERENCES [SaleInvoice]([Id]), 
    CONSTRAINT [FK_RemissionGuide_Company_EmissionPoint] FOREIGN KEY ([Company_EmissionPoint_Id]) REFERENCES [Company_EmissionPoint]([Id]) 
)
