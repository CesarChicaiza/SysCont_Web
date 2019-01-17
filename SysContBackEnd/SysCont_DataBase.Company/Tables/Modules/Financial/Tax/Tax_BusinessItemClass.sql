CREATE TABLE [dbo].[Tax_BusinessItemClass]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL,
	[Tax_Id]							UNIQUEIDENTIFIER	NOT NULL,
	[BusinessItem_Class_Id]				UNIQUEIDENTIFIER	NOT NULL,
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [FK_Tax_BusinessItem_Tax] FOREIGN KEY ([Tax_Id]) REFERENCES [Tax]([Id]), 
    CONSTRAINT [PK_Tax_BusinessItem] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_Tax_BusinessItem_BusinessItem] FOREIGN KEY ([BusinessItem_Class_Id]) REFERENCES [BusinessItem_Class]([Id]) 
)
