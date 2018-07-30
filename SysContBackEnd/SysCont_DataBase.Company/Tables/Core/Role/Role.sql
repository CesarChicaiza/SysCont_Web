CREATE TABLE [dbo].[Role]
(
	[Id]                   uniqueidentifier     not null,
	[Name]                 nvarchar(256)        not null,
	[Description]          nvarchar(max)        null,
	[HomePage]		       nvarchar(500)		null,
	[RowStatus]            int                  not null,
	[Locked]				BIT					NOT NULL DEFAULT 0,
	[CreatedBy]            uniqueidentifier     null,
	[CreatedDate]          datetime             null,
	[ModifiedBy]           uniqueidentifier     null,
	[ModifiedDate]         datetime             null, 
    CONSTRAINT [PK_Role] PRIMARY KEY ([Id])
)
