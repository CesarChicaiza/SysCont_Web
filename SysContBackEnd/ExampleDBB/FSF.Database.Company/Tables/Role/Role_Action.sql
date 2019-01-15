CREATE TABLE [dbo].[Role_Action]
(
	[Id]					UNIQUEIDENTIFIER    not null,
	[Role_Id]				UNIQUEIDENTIFIER	null,
	[Role_Name]				nvarchar(256)       not null,
	[Action_Id]				UNIQUEIDENTIFIER	null,
	[RowStatus]				int                 not null,
	[Locked]				BIT					NOT NULL DEFAULT 0,
	[Required]				BIT					NOT NULL DEFAULT 0,
	[Employee_Id]           uniqueidentifier    null,
	[CreatedBy]				uniqueidentifier    null,
	[CreatedDate]			datetime            null,
	[ModifiedBy]			uniqueidentifier    null,
	[ModifiedDate]			datetime            null, 
    [Picture]				NVARCHAR(MAX)		NULL, 

    CONSTRAINT [PK_Role_Action] PRIMARY KEY ([Id])
)
