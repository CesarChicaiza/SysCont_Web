CREATE TABLE [dbo].[Report_Field]
(
	[Id]					UNIQUEIDENTIFIER	NOT NULL, 
    [Report_Id]				UNIQUEIDENTIFIER	NOT NULL, 
    [EntityId]				UNIQUEIDENTIFIER	NULL, 
	[Sequential]			NVARCHAR(500)		NULL, 
    [ParentId]				UNIQUEIDENTIFIER	NULL, 
	[ParentSequential]		NVARCHAR(500)		NULL, 
	[Type]					INT                 NOT NULL DEFAULT 0,
	[RowStatus]				INT                 NOT NULL,
	[Locked]				BIT					NOT NULL DEFAULT 0,
	[Required]				BIT					NOT NULL DEFAULT 0,
	[Employee_Id]			UNIQUEIDENTIFIER	NULL,
	[CreatedBy]				UNIQUEIDENTIFIER	NULL,
	[CreatedDate]			DATETIME			NULL,
	[ModifiedBy]			UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]			DATETIME			NULL, 
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_Report_Field] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_ReportField_Report] FOREIGN KEY ([Report_Id]) REFERENCES [Report]([Id])

)
