CREATE TABLE [dbo].[TaskScheduler_Type]
(
	[Id] UNIQUEIDENTIFIER NOT NULL , 
    [Name] NVARCHAR(300) NOT NULL, 
    [ProgramName] NVARCHAR(MAX) NOT NULL, 
    CONSTRAINT [PK_TaskScheduler_Type] PRIMARY KEY ([Id])
)
