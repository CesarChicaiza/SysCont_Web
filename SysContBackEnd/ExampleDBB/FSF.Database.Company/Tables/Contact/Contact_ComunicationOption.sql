CREATE TABLE [dbo].[Contact_ComunicationOption]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
    [IsValid]							BIT					NOT NULL, 
    [Value]								NVARCHAR(300)		NULL, 
    [CommunicationOptionType_Id]		UNIQUEIDENTIFIER	NULL, 
	[Contact_Id]						UNIQUEIDENTIFIER	NULL, 
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_Contact_ComunicationOption] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_Contact_ComunicationOption_Contact] FOREIGN KEY ([Contact_Id]) REFERENCES [Contact]([Id]), 
    CONSTRAINT [FK_Contact_ComunicationOption_ComunicationOptionType] FOREIGN KEY ([CommunicationOptionType_Id]) REFERENCES [CommunicationOptionType]([Id]) 
)
