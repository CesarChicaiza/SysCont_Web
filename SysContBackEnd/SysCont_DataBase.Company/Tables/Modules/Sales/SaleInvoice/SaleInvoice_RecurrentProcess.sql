CREATE TABLE [dbo].[SaleInvoice_RecurrentProcess]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
    [Year]								INT					NULL, 
    [Month]								INT					NULL,
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_SaleInvoice_RecurrentProcess] PRIMARY KEY ([Id]), 

	UNIQUE ([Year], [Month])
)
