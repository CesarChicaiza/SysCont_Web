CREATE TABLE [dbo].[Manufacture_Item]
(
	[Id]						INT					NOT NULL ,
	[Name]						NVARCHAR(200)		NULL, 
    [BusinessItemVariation_Id]	UNIQUEIDENTIFIER	NOT NULL, 
    [Manufacture_Id]			UNIQUEIDENTIFIER	NOT NULL, 
    [Quantity]					DECIMAL(18, 2)		NOT NULL,
	[RowStatus]					INT					NOT NULL,
	[Locked]					BIT					NOT NULL DEFAULT 0,
	[Required]					BIT					NOT NULL DEFAULT 0,
	[Employee_Id]				UNIQUEIDENTIFIER	NULL,
	[CreatedBy]					UNIQUEIDENTIFIER	NULL,
	[CreatedDate]				DATETIME			NULL,
	[ModifiedBy]				UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]				DATETIME			NULL,
    [Picture]					NVARCHAR(MAX)		NULL,
	CONSTRAINT [PK_ManufactureItem] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_ManufactureItem_Manufacture] FOREIGN KEY ([Manufacture_Id]) REFERENCES [Manufacture]([Id]),
    CONSTRAINT [FK_ManufactureItem_BusinessItemVariation] FOREIGN KEY ([BusinessItemVariation_Id]) REFERENCES [BusinessItemVariation]([Id])
)
