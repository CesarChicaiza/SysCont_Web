﻿CREATE TABLE [dbo].[Company_EmissionPoint]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
    [Code]								NVARCHAR(2000)		NOT NULL, 
	[Name]								NVARCHAR(2000)		NOT NULL, 
	[InvoiceSequential]					BIGINT				NOT NULL DEFAULT 0, 
	[RemissionGuideSequential]			BIGINT				NOT NULL DEFAULT 0, 
	[RetentionVoucherSequential]		BIGINT				NOT NULL DEFAULT 0, 
	[Company_Place_Id]					UNIQUEIDENTIFIER	NOT NULL, 
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_Company_EmissionPoint] PRIMARY KEY ([Id]), 
	CONSTRAINT [FK_Company_EmissionPoint_CompanyPlace] FOREIGN KEY ([Company_Place_Id]) REFERENCES [Company_Place]([Id]), 
)