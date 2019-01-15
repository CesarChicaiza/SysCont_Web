CREATE TABLE [dbo].[Company_Place]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
    [Code]								NVARCHAR(2000)		NOT NULL, 
	[Name]								NVARCHAR(2000)		NOT NULL, 
	[Address]							NVARCHAR(MAX)		NULL, 
	[Phone]								NVARCHAR(500)		NULL, 
	[Company_Id]						UNIQUEIDENTIFIER	NULL, 
	[City_Id]							UNIQUEIDENTIFIER	NULL, 
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_Company_Place] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_CompanyPlace_Company] FOREIGN KEY ([Company_Id]) REFERENCES [Company]([Id]), 
    CONSTRAINT [FK_CompanyPlace_City] FOREIGN KEY ([City_Id]) REFERENCES [City]([Id]) 
)
