CREATE TABLE [dbo].[Permission]
(
	[Id]					UNIQUEIDENTIFIER NOT NULL, 
    [Create]				INT NULL, 
    [Read]					INT NULL, 
    [Write]					INT NULL, 
    [Delete]				INT NULL, 
    [Module_Id]				UNIQUEIDENTIFIER NULL,
	[Role_Id]				UNIQUEIDENTIFIER NULL, 
	[RowStatus]            int                  not null,
	[Locked]				BIT					NOT NULL DEFAULT 0,
	[CreatedBy]            uniqueidentifier     null,
	[CreatedDate]          datetime             null,
	[ModifiedBy]           uniqueidentifier     null,
	[ModifiedDate]         datetime             null, 
    CONSTRAINT [PK_Permission] PRIMARY KEY ([Id]),
	CONSTRAINT [FK_Permission_Module] FOREIGN KEY ([Module_Id]) REFERENCES [Module]([Id]),
    CONSTRAINT [FK_Permission_Role] FOREIGN KEY ([Role_Id]) REFERENCES [Role]([Id]) 
)
