CREATE TABLE [dbo].[Permission]
(
	[Id] UNIQUEIDENTIFIER NOT NULL, 
    [Create] INT NULL, 
    [Read] INT NULL, 
    [Write] INT NULL, 
    [Delete] INT NULL, 
    [Entity_Id] UNIQUEIDENTIFIER NULL,
	[Role_Id]				UNIQUEIDENTIFIER NULL, 
	[RowStatus]            int                  not null,
	[Locked]				BIT					NOT NULL DEFAULT 0,
	[Required]				BIT					NOT NULL DEFAULT 0,
	[Employee_Id]           uniqueidentifier     null,
	[CreatedBy]            uniqueidentifier     null,
	[CreatedDate]          datetime             null,
	[ModifiedBy]           uniqueidentifier     null,
	[ModifiedDate]         datetime             null, 
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_RolePermission] PRIMARY KEY ([Id]),
	CONSTRAINT [UC_Entity_Role] UNIQUE ([Entity_Id], [Role_Id]),
    CONSTRAINT [FK_RolePermission_Role] FOREIGN KEY ([Role_Id]) REFERENCES [Role]([Id]) 
)
