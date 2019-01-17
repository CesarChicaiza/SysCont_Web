CREATE TABLE [dbo].[BusinessItemVariation_Picture]
(
	[Id]								UNIQUEIDENTIFIER NOT NULL , 
    [Name]								NVARCHAR(200) NULL, 
	[DisplayOrder]						int NULL, 
    [BusinessItemVariation_Id]			UNIQUEIDENTIFIER NULL, 
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_BusinessItemVariation_Picture] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_BusinessItemVariation_Picture] FOREIGN KEY ([BusinessItemVariation_Id]) REFERENCES [BusinessItemVariation]([Id])
)
