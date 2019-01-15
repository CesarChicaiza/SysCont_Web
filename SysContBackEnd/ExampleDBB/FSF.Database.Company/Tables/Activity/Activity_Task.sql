CREATE TABLE [dbo].[Activity_Task]
(
	[Id]					UNIQUEIDENTIFIER	NOT NULL , 
    [Description]			NVARCHAR(MAX)		NULL, 
    [DueDate]				DATETIME			NULL, 
    [Responsible]			NVARCHAR(MAX)		NULL, 
    [Done]					BIT					NULL, 
    [Activity_Topic_Id]		UNIQUEIDENTIFIER	NULL, 
	[RowStatus]				INT                 NOT NULL,
	[Locked]				BIT					NOT NULL DEFAULT 0,
	[Required]				BIT					NOT NULL DEFAULT 0,
	[Employee_Id]			UNIQUEIDENTIFIER	NULL,
	[CreatedBy]				UNIQUEIDENTIFIER	NULL,
	[CreatedDate]			DATETIME			NULL,
	[ModifiedBy]			UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]			DATETIME			NULL, 
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_Activity_NextAction] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_ActivityTask_Activity] FOREIGN KEY ([Activity_Topic_Id]) REFERENCES [Activity_Topic]([Id])
)
