CREATE TABLE [dbo].[RemissionGuide_Line]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
	[Code1]								NVARCHAR(MAX)		NULL, 
	[Code2]								NVARCHAR(MAX)		NULL, 
	[Description]						NVARCHAR(MAX)		NULL, 
	[Quantity]							DECIMAL(18, 5)		NOT NULL, 
	[BusinessItemVariation_Id]			UNIQUEIDENTIFIER	NOT NULL, 
	[RemissionGuide_Id]					UNIQUEIDENTIFIER	NOT NULL, 
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_RemissionGuide_Line] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_RemissionGuide_Line] FOREIGN KEY ([RemissionGuide_Id]) REFERENCES [RemissionGuide]([Id]) ON DELETE CASCADE, 
    CONSTRAINT [FK_RemissionGuide_Line_BusinessItem] FOREIGN KEY ([BusinessItemVariation_Id]) REFERENCES [BusinessItemVariation]([Id]) 

)
