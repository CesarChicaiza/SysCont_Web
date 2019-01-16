﻿CREATE TABLE [dbo].[Bank]
(
	[Id]					UNIQUEIDENTIFIER	NOT NULL, 
    [Code]					NVARCHAR(500)		NULL, 
	[Name]					NVARCHAR(500)		NULL, 
    [Country_Id]			UNIQUEIDENTIFIER	NULL, 
	[RowStatus]				INT                 NOT NULL,
	[Locked]				BIT					NOT NULL DEFAULT 0,
	[Required]				BIT					NOT NULL DEFAULT 0,
	[Employee_Id]			UNIQUEIDENTIFIER	NULL,
	[CreatedBy]				UNIQUEIDENTIFIER	NULL,
	[CreatedDate]			DATETIME			NULL,
	[ModifiedBy]			UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]			DATETIME			NULL, 
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_Bank] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_Bank_Country] FOREIGN KEY ([Country_Id]) REFERENCES [Country]([Id]) 
)
