CREATE TABLE [dbo].[Workflow_Action]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
    [Type]								INT					NOT NULL,	--1:task, 2:email, 3:fieldUpdate, 4:execute custom class
	[EmailTemplate_Id]					UNIQUEIDENTIFIER	NULL,
	[CustomClass]						NVARCHAR(MAX)		NULL,
	[Order]								INT					NOT NULL, 
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

    CONSTRAINT [PK_WorkflowAction] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_WorkflowAction_Rule] FOREIGN KEY ([Workflow_Rule_Id]) REFERENCES [Workflow_Rule]([Id]), 
    CONSTRAINT [FK_WorkflowAction_EmailTemplate] FOREIGN KEY ([EmailTemplate_Id]) REFERENCES [EmailTemplate]([Id]) 
)
