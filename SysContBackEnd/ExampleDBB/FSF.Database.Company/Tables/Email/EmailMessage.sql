CREATE TABLE [dbo].[EmailMessage]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
    [Subject]							NVARCHAR(300)		NOT NULL, 
    [Body]								NVARCHAR(MAX)		NOT NULL, 
	[SendDate]							DATETIME			NOT NULL, 
	[ExternalId]						UNIQUEIDENTIFIER	NULL,
	[EntityName]						NVARCHAR(1000)		NULL,
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_EmailMessage] PRIMARY KEY ([Id]),  
)
