CREATE TABLE [dbo].[City]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
    [Name]								NVARCHAR(500)		NULL, 
    [State_Id]							UNIQUEIDENTIFIER	NULL, 
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_City] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_City_State] FOREIGN KEY ([State_Id]) REFERENCES [State]([Id]), 
    CONSTRAINT [FK_City_Employee] FOREIGN KEY ([Employee_Id]) REFERENCES [Employee]([Id]) 
)
