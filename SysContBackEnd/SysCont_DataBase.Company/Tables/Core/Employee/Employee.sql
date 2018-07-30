CREATE TABLE [dbo].[Employee]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
	[Name]								NVARCHAR(300)		NULL, 
	[Phone]								NVARCHAR(100)		NULL, 
	[Birth]								DATETIME			NULL, 
	[Email]								NVARCHAR(200)		NULL, 
	[Password]							NVARCHAR(200)		NULL, 
	[Appointment]						NVARCHAR(200)		NULL, 
	[Company_Place_Id]					UNIQUEIDENTIFIER	NULL,
	[Role_Id]							UNIQUEIDENTIFIER	 null,
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    CONSTRAINT [PK_Employee] PRIMARY KEY ([Id]),
)
