CREATE TABLE [dbo].[BusinessItemAccountConfiguration]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL , 
    [Name]								NVARCHAR(500)		NULL,
	[BusinessItem_Id]					uniqueidentifier	Not null,
	[Account_Id]						uniqueidentifier	Not null,
	[Entity_Id]							uniqueidentifier	null,
    [TableName]							NVARCHAR(250)		NOT NULL,
	[Debit]								BIT					NOT NULL DEFAULT 0,
	[Credit]							BIT					NOT NULL DEFAULT 0,
	[RowStatus]							INT                 NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL, 
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_BusinessItemAccountConfiguration] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_BusinessItemAccount_BusinessItem] FOREIGN KEY ([BusinessItem_Id]) REFERENCES [BusinessItem]([Id]), 
    CONSTRAINT [FK_BusinessItemAccount_Account] FOREIGN KEY ([Account_Id]) REFERENCES [Account]([Id]), 

)
