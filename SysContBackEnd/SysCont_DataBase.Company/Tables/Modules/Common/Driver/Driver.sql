CREATE TABLE [dbo].[Driver]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
	[Name]								NVARCHAR(500)		NULL, 
	[Phone]								NVARCHAR(50)		NULL,
    [LegalIdType_Id]					UNIQUEIDENTIFIER	NULL, 
	[LegalId]							NVARCHAR(50)		NULL, 
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_Driver] PRIMARY KEY ([Id]) 
)
