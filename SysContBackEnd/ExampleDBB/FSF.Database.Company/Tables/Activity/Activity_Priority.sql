CREATE TABLE [dbo].[Activity_Priority]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
	[Number]							INT					NOT NULL DEFAULT 0,
    [Name]								NVARCHAR(500)		NOT NULL, 
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 
	CONSTRAINT [PK_ActivityPriority] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_ActivityPriority_Employee] FOREIGN KEY ([Employee_Id]) REFERENCES [Employee]([Id]) 
)
