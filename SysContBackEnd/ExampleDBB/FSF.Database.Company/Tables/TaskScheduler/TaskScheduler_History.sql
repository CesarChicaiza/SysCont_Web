CREATE TABLE [dbo].[TaskScheduler_History]
(
	[Id] UNIQUEIDENTIFIER NOT NULL, 
    [Start] DATETIME NULL, 
    [End] DATETIME NULL, 
	[TotalItems] BIGINT NULL, 
	[SuccessfulItems] BIGINT NULL, 
	[Failtems] BIGINT NULL, 
    [TaskScheduler_Id] UNIQUEIDENTIFIER NULL, 
    [TaskScheduler_Status_Id] UNIQUEIDENTIFIER NULL, 
    CONSTRAINT [PK_TaskScheduler_History] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_TaskScheduler_History] FOREIGN KEY ([TaskScheduler_Id]) REFERENCES [TaskScheduler]([Id]), 
    CONSTRAINT [FK_TaskSchedulerHistory_Status] FOREIGN KEY ([TaskScheduler_Status_Id]) REFERENCES [TaskScheduler_Status]([Id]) 
)
