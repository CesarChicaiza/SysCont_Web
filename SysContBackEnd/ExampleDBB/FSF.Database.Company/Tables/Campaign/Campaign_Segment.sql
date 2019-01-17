CREATE TABLE [dbo].[Campaign_Segment]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
    [Name]								NVARCHAR(50)		NULL, 
    [Entity_Id]							UNIQUEIDENTIFIER	NULL, 
    [RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 
    
	CONSTRAINT [PK_Campaign_Segment] PRIMARY KEY ([Id]), 
)
