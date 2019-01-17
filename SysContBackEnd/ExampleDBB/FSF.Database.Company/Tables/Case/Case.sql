CREATE TABLE [dbo].[Case]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
    [Type]								NVARCHAR(300)		NULL, 
    [Subject]							NVARCHAR(500)		NULL, 
    [Messagge]							NVARCHAR(MAX)		NULL, 
    [Status]							NVARCHAR(30)		NULL, 
    [Customer_Id]						UNIQUEIDENTIFIER	NULL, 
	[Customer_Contact_Id]				UNIQUEIDENTIFIER	NULL, 
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_Case] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_Case_Customer] FOREIGN KEY ([Customer_Id]) REFERENCES [Customer]([Id]),
    CONSTRAINT [FK_Case_CustomerContact] FOREIGN KEY ([Customer_Contact_Id]) REFERENCES [Customer_Contact]([Id])
)
