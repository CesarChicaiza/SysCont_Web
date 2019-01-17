CREATE TABLE [dbo].[AccountingEntry]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
    [Date]								DATETIME			NOT NULL, 
	[Description]						NVARCHAR(MAX)		NOT NULL, 
	[OriginDocumentType]				nvarchar(200)		NULL,
	[OriginDocumentId]					UNIQUEIDENTIFIER	NULL,
	[RowStatus]							INT                 NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL, 
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_AccountingEntry] PRIMARY KEY ([Id]) 
)
