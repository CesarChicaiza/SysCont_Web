CREATE TABLE [dbo].[Tax]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL,
	[Code]								VARCHAR(100)		NOT NULL,
    [PercentageCode]                    VARCHAR(100)        NOT NULL,
	[Name]								VARCHAR(500)		NOT NULL,
	[Percentage]						DECIMAL(18, 5)		NOT NULL,
	[Tax_Type_Id]						UNIQUEIDENTIFIER	NOT NULL,
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_Tax] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_Tax_TaxType] FOREIGN KEY ([Tax_Type_Id]) REFERENCES [Tax_Type]([Id]) 

)
