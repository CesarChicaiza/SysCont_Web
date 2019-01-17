CREATE TABLE [dbo].[Project]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
    [Name]								VARCHAR(500)		NULL, 
	[Completed]							DECIMAL(4, 2)		NULL, 
	[Contract_Id]						UNIQUEIDENTIFIER	NULL, 
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_Project] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_Project_Contract] FOREIGN KEY ([Contract_Id]) REFERENCES [Contract]([Id]), 
)
