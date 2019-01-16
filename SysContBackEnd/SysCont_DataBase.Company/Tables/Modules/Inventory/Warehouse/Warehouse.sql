CREATE TABLE [dbo].[Warehouse]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
	[Name]								NVARCHAR(500)		NOT NULL, 
	[Description]						NVARCHAR(2000)		NOT NULL, 
	[Company_Place_Id]					UNIQUEIDENTIFIER	NOT NULL, 
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_WarehouseMaterials] PRIMARY KEY ([Id]), 
	CONSTRAINT [FK_WarehouseMaterials_CompanyPlace] FOREIGN KEY ([Company_Place_Id]) REFERENCES [Company_Place]([Id])
)
