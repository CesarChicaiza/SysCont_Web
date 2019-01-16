CREATE TABLE [dbo].[Campaign]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
    [Name]								NVARCHAR(300)		NULL, 
    [FromDate]							DATETIME			NULL, 
    [ToDate]							DATETIME			NULL, 
    [Campaign_Type_Id]					UNIQUEIDENTIFIER	NULL, 
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_Campaign] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_Campaign_CampaignType] FOREIGN KEY ([Campaign_Type_Id]) REFERENCES [Campaign_Type]([Id]), 
)
