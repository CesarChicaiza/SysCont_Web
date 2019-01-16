CREATE TABLE [dbo].[Contract_Type]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
    [Name]								NVARCHAR(500)		NULL, 
	[Title]								NVARCHAR(MAX)		NULL,
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_Contract_Type] PRIMARY KEY ([Id]) 
)
