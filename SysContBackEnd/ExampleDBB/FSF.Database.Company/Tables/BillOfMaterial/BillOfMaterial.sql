CREATE TABLE [dbo].[BillOfMaterial]
(
	[Id]							UNIQUEIDENTIFIER	NOT NULL, 
	[BusinessItemVariation_Name]	NVARCHAR(150)		NULL,
	[BusinessItemVariation_Id]		UNIQUEIDENTIFIER	NOT NULL,
	[RowStatus]						int                 not null,
	[Locked]						BIT					NOT NULL DEFAULT 0,
	[Required]						BIT					NOT NULL DEFAULT 0,
	[Employee_Id]					uniqueidentifier	null,
	[CreatedBy]						uniqueidentifier	null,
	[CreatedDate]					datetime			null,
	[ModifiedBy]					uniqueidentifier    null,
	[ModifiedDate]					datetime            null, 
    [Picture]						NVARCHAR(MAX)		NULL, 
    CONSTRAINT [PK_BillOfMaterial] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_BillOfMaterial_BusinessItem] FOREIGN KEY ([BusinessItemVariation_Id]) REFERENCES [BusinessItemVariation]([Id])
)
