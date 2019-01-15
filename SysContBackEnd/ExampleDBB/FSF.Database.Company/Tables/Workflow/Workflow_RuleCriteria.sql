CREATE TABLE [dbo].[Workflow_RuleCriteria]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
    [EntityField]						NVARCHAR(MAX)		NOT NULL, 
    [Comparator]						INT					NOT NULL, 
    [Value]								NVARCHAR(MAX)		NOT NULL, 
    [Workflow_Rule_Id]					UNIQUEIDENTIFIER	NOT NULL,
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 
 
    CONSTRAINT [PK_Workflow_RuleCriteria] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_Workflow_Rule_RuleCriteria] FOREIGN KEY ([Workflow_Rule_Id]) REFERENCES [Workflow_Rule]([Id]) 
)
