CREATE TABLE [dbo].[Accounting_Period]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
    [Name]								NVARCHAR(100)		NULL, 
	[From]								DATE			NULL, 
    [To]								DATE			NULL, 
    [Opened]							BIT					NULL, 
    [Accounting_FiscalYear_Id]			UNIQUEIDENTIFIER	NOT NULL,
	[RowStatus]							INT                 NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL, 
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_Accounting_Period] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_Accounting_Period_FiscalYear] FOREIGN KEY ([Accounting_FiscalYear_Id]) REFERENCES [Accounting_FiscalYear]([Id]) 
)
