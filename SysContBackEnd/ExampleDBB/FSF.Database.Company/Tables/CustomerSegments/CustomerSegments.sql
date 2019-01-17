CREATE TABLE [dbo].[CustomerSegments]
(
	[Id]					UNIQUEIDENTIFIER	NOT NULL, 
	[Name]					NVARCHAR(500)		NULL, 
	[Ammount]				DECIMAL(18,5)		NULL DEFAULT 0, 
	[Date]					DATETIME			NULL, 
	[GenderList]			NVARCHAR(500)		NULL, 
	[CitiesList]			NVARCHAR(max)		NULL, 
	[LanguagesList]			NVARCHAR(1000)		NULL, 
	[OpportunityStateList]	NVARCHAR(500)		NULL, 
	[ContractStateList]		NVARCHAR(1000)		NULL, 
	[RowStatus]				INT                 NOT NULL,
	[Locked]				BIT					NOT NULL DEFAULT 0,
	[Required]				BIT					NOT NULL DEFAULT 0,
	[Employee_Id]			UNIQUEIDENTIFIER	NULL,
	[CreatedBy]				UNIQUEIDENTIFIER	NULL,
	[CreatedDate]			DATETIME			NULL,
	[ModifiedBy]			UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]			DATETIME			NULL, 
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_CustomerSegments] PRIMARY KEY ([Id])
)
