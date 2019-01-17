CREATE TABLE [dbo].[UnitOfMeasure]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL , 
    [Name]								NVARCHAR(200)		NOT NULL, 
    [Abbreviation]						NVARCHAR(25)		NOT NULL, 
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_UnitOfMeasure] PRIMARY KEY ([Id]) 

)
