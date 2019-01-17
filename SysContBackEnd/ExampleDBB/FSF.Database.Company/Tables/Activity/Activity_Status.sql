CREATE TABLE [dbo].[Activity_Status]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
    [Name]								NVARCHAR(500)		NULL, 
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 
	CONSTRAINT [PK_ActivityStatus] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_ActivityStatus_Employee] FOREIGN KEY ([Employee_Id]) REFERENCES [Employee]([Id])
)
