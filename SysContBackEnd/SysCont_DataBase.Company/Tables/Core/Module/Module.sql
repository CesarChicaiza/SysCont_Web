CREATE TABLE [dbo].[Module]
(
	[Id]					UNIQUEIDENTIFIER NOT NULL , 
    [Name]					NVARCHAR(50) NOT NULL, 
    [Color]					NVARCHAR(25) NULL, 
    [Icon]					 NVARCHAR(50) NULL, 
    [HomePage]				NVARCHAR(MAX) NULL, 
	[RowStatus]            int                  not null,
	[Locked]				BIT					NOT NULL DEFAULT 0,
	[CreatedBy]            uniqueidentifier     null,
	[CreatedDate]          datetime             null,
	[ModifiedBy]           uniqueidentifier     null,
	[ModifiedDate]         datetime             null, 
    CONSTRAINT [PK_Module] PRIMARY KEY ([Id])
)
