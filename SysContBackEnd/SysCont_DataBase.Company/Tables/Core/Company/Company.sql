CREATE TABLE [dbo].[Company]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
    [LegalId]							NVARCHAR(50)		NULL ,
	[Name1]								NVARCHAR(2000)		NOT NULL, 
	[Name2]								NVARCHAR(2000)		NOT NULL, 
	[Address]							NVARCHAR(2000)		NOT NULL, 
	[Phone]								NVARCHAR(200)		NOT NULL, 
    [Image]								NVARCHAR(MAX)		NULL, 
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    CONSTRAINT [PK_Company] PRIMARY KEY ([Id]), 
)
