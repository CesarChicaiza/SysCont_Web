CREATE TABLE [dbo].[Tax_RetentionType]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL,
	[Name]								VARCHAR(100)		NOT NULL,
	[Code]								NVARCHAR(5)			NOT NULL,
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_Tax_RetentionType] PRIMARY KEY ([Id])
)
