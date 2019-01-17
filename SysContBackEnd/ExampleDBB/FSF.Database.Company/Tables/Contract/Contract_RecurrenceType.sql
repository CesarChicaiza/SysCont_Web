CREATE TABLE [dbo].[Contract_RecurrenceType]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
	[Name]								NVARCHAR(250)		NOT NULL,
	[Months]							INT					NOT NULL,
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_Contract_RecurrenceType] PRIMARY KEY ([Id])
)
