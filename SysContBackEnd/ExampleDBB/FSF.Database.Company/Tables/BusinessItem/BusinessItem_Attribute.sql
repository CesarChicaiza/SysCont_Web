CREATE TABLE [dbo].[BusinessItem_Attribute]
(
	[Id]					UNIQUEIDENTIFIER NOT NULL , 
    [Name]					NVARCHAR(200) NULL, 
	[DisplayOrder]			INT NULL,
    [BusinessItem_Id]		UNIQUEIDENTIFIER NULL, 
	[RowStatus]				int                  not null,
	[Locked]				BIT					NOT NULL DEFAULT 0,
	[Required]				BIT					NOT NULL DEFAULT 0,
	[Employee_Id]           uniqueidentifier     null,
	[CreatedBy]            uniqueidentifier     null,
	[CreatedDate]          datetime             null,
	[ModifiedBy]           uniqueidentifier     null,
	[ModifiedDate]         datetime             null, 
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_BusinessItem_Attribute] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_BusinessItem_Attribute] FOREIGN KEY ([BusinessItem_Id]) REFERENCES [BusinessItem]([Id])
)
