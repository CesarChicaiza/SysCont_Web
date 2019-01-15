CREATE TABLE [dbo].[Workflow_Rule]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL,
	[EntityName]						NVARCHAR(MAX)		NOT NULL,
	[OnCreate]							BIT					NOT NULL, 
    [OnUpdate]							BIT					NOT NULL, 
    [OnDdelete]							BIT					NOT NULL, 
	[Workflow_Id]						UNIQUEIDENTIFIER	NOT NULL, 
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [FK_Workflow_Rule] FOREIGN KEY ([Workflow_Id]) REFERENCES [Workflow]([Id]), 
    CONSTRAINT [PK_Workflow_Rule] PRIMARY KEY ([Id]) 
)
