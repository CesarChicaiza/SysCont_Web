CREATE TABLE [dbo].[Contract_TypeSection]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
    [Title]								NVARCHAR(MAX)		NULL,
	[Content]							NVARCHAR(MAX)		NULL,
	[Order]								INT					NULL,
	[Contract_Type_Id]					UNIQUEIDENTIFIER	NULL,
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [FK_ContractSecion_Type] FOREIGN KEY ([Contract_Type_Id]) REFERENCES [Contract_Type]([Id]), 
    CONSTRAINT [PK_Contract_TypeSection] PRIMARY KEY ([Id]) 
)
