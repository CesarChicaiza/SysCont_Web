CREATE TABLE [dbo].[TaskScheduler_Status]
(
	[Id] UNIQUEIDENTIFIER NOT NULL, 
    [Name] NVARCHAR(500) NOT NULL, 
    CONSTRAINT [PK_TaskScheduler_Status] PRIMARY KEY ([Id]) 
)
