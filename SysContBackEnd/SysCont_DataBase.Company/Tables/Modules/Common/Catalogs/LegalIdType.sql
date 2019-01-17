CREATE TABLE [dbo].[LegalIdType]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
	[Code]								NVARCHAR(10)		NULL, 
	[Name]								NVARCHAR(50)		NULL, 
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_CustomerLegalIdType] PRIMARY KEY ([Id]), 

)
