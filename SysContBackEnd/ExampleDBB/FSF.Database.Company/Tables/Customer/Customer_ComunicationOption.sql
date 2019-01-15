CREATE TABLE [dbo].[Customer_ComunicationOption]
(
	[Id]								UNIQUEIDENTIFIER					NOT NULL, 
    [IsValid]							BIT					NOT NULL, 
    [Value]								NVARCHAR(300)		NULL, 
    [CommunicationOptionType_Id]		UNIQUEIDENTIFIER	NULL, 
	[Customer_Id]						UNIQUEIDENTIFIER	NULL, 
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_Customer_ComunicationOption] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_Customer_ComunicationOption_Customer] FOREIGN KEY ([Customer_Id]) REFERENCES [Customer]([Id]), 
    CONSTRAINT [FK_Customer_ComunicationOption_CommunicationOptionType] FOREIGN KEY ([CommunicationOptionType_Id]) REFERENCES [CommunicationOptionType]([Id]) 
)
