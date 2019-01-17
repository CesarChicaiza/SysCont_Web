CREATE TABLE [dbo].[Account_Level1]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL , 
    [Code]								NVARCHAR(50)		NOT NULL, 
    [Code2]								NVARCHAR(100)		NULL, 
    [Name]								NVARCHAR(250)		NOT NULL,
	[RowStatus]							INT                 NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL, 
    [Picture]							NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_Account_Level1] PRIMARY KEY ([Id]), 
)
