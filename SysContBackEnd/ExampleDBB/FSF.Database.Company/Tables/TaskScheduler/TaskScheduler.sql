CREATE TABLE [dbo].[TaskScheduler]
(
	[Id] UNIQUEIDENTIFIER NOT NULL , 
    [Name] NVARCHAR(1000) NOT NULL, 
    [TaskScheduler_Type_Id] UNIQUEIDENTIFIER NULL, 
    [PlannedStart] NCHAR(10) NULL, 
    CONSTRAINT [PK_System_TaskScheduler] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_TaskScheduler_Type] FOREIGN KEY ([TaskScheduler_Type_Id]) REFERENCES [TaskScheduler_Type]([Id])
)
