CREATE TABLE [dbo].[BusinessItem_Category]
(
	[Id]					UNIQUEIDENTIFIER	NOT NULL, 
    [Name]					NVARCHAR(300)		NULL, 
	[RowStatus]				INT                 NOT NULL,
	[Locked]				BIT					NOT NULL DEFAULT 0,
	[Required]				BIT					NOT NULL DEFAULT 0,
	[Employee_Id]           uniqueidentifier     null,
	[CreatedBy]            uniqueidentifier     null,
	[CreatedDate]          datetime             null,
	[ModifiedBy]           uniqueidentifier     null,
	[ModifiedDate]         datetime             null, 
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_BusinessItem_Category] PRIMARY KEY ([Id]) 
)
