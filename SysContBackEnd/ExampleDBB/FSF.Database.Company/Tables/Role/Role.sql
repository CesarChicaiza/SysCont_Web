CREATE TABLE [dbo].[Role]
(
	[Id]                   uniqueidentifier     not null,
	[Name]                 nvarchar(256)        not null,
	[Description]          nvarchar(max)        null,
	[HomePage]		       nvarchar(500)		null,
	[IsMain]		       bit					null DEFAULT 0,
	[IsDefault]		       bit					null DEFAULT 0,
	[RowStatus]            int                  not null,
	[Locked]				BIT					NOT NULL DEFAULT 0,
	[Required]				BIT					NOT NULL DEFAULT 0,
	[Employee_Id]           uniqueidentifier     null,
	[CreatedBy]            uniqueidentifier     null,
	[CreatedDate]          datetime             null,
	[ModifiedBy]           uniqueidentifier     null,
	[ModifiedDate]         datetime             null, 
    [Picture] NVARCHAR(MAX) NULL, 

    CONSTRAINT [PK_Role] PRIMARY KEY ([Id])
)
