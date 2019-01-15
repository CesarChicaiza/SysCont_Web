CREATE TABLE [dbo].[Project_Storyboard]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
	[Name]								VARCHAR(500)		NULL, 
	[Project_Id]						UNIQUEIDENTIFIER	NOT NULL,
	[Project_Sprint_Id]					UNIQUEIDENTIFIER	NULL,
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_Project_Storyboard] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_Project_Storyboard] FOREIGN KEY ([Project_Id]) REFERENCES [Project]([Id]), 
    CONSTRAINT [FK_ProjectSprint_Storyboard] FOREIGN KEY ([Project_Sprint_Id]) REFERENCES [Project_Sprint]([Id]) 
)
