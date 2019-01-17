CREATE TABLE [dbo].[Tax_CustomerClass]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL,
	[Tax_Id]							UNIQUEIDENTIFIER	NOT NULL,
	[Customer_Class_Id]					UNIQUEIDENTIFIER	NOT NULL,
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_Tax_CustomerClass] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_Tax_CustomerClass_Tax] FOREIGN KEY ([Tax_Id]) REFERENCES [Tax]([Id]), 
    CONSTRAINT [FK_Tax_CustomerClass_CustomerClass] FOREIGN KEY ([Customer_Class_Id]) REFERENCES [Customer_Class]([Id]) 
)
