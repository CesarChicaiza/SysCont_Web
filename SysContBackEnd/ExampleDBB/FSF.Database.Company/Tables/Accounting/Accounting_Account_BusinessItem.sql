CREATE TABLE [dbo].[Accounting_Account_BusinessItem]
(
	[Id] UNIQUEIDENTIFIER NOT NULL, 
    [BusinessItem_Id] UNIQUEIDENTIFIER NULL, 
    [Account_Id] UNIQUEIDENTIFIER NULL, 
	--Type
    CONSTRAINT [PK_Accounting_Account_BusinessItem] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_Accounting_AccountBusinessItem_BusinessItem] FOREIGN KEY ([BusinessItem_Id]) REFERENCES [BusinessItem]([Id]),
	CONSTRAINT [FK_Accounting_AccountBusinessItem_Account] FOREIGN KEY ([Account_Id]) REFERENCES [Account]([Id])  
)
