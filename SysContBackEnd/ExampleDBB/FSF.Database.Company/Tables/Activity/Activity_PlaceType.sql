CREATE TABLE [dbo].[Activity_PlaceType]
(
	[Id]					UNIQUEIDENTIFIER	NOT NULL, 
    [Name]					NVARCHAR(MAX)		NULL, 
	[RowStatus]				INT                 NOT NULL,
	[Locked]				BIT					NOT NULL DEFAULT 0,
	[Required]				BIT					NOT NULL DEFAULT 0,
	[Employee_Id]			UNIQUEIDENTIFIER	NULL,
	[CreatedBy]				UNIQUEIDENTIFIER	NULL,
	[CreatedDate]			DATETIME			NULL,
	[ModifiedBy]			UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]			DATETIME			NULL, 
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_Activity_PlaceType] PRIMARY KEY ([Id]), 
)
