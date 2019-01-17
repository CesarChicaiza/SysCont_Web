CREATE TABLE [dbo].[BankAccount]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
	[Number]							NVARCHAR(2000)		NOT NULL, 
	[Total]								DECIMAL(18,2)		NOT NULL DEFAULT 0, 
	[Bank_Id]							UNIQUEIDENTIFIER	NOT	NULL, 
	[Company_Id]						UNIQUEIDENTIFIER	NOT NULL, 
	[BankAccount_Type_Id]				UNIQUEIDENTIFIER	NOT NULL, 
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture]							NVARCHAR(MAX)		NULL, 
    CONSTRAINT [PK_BankAccount] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_BankAccount_Company] FOREIGN KEY ([Company_Id]) REFERENCES [Company]([Id]), 
    CONSTRAINT [FK_BankAccount_Bank] FOREIGN KEY ([Bank_Id]) REFERENCES [Bank]([Id]), 
    CONSTRAINT [FK_BankAccount_BankAccountType] FOREIGN KEY ([BankAccount_Type_Id]) REFERENCES [BankAccount_Type]([Id]), 

)
