CREATE TABLE [dbo].[Employee_Parent]
(
	[Id]					UNIQUEIDENTIFIER	NOT NULL, 
	[EmployeeId]			UNIQUEIDENTIFIER	NOT NULL, 
    [ParentId]				UNIQUEIDENTIFIER	NULL,
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_EmployeeParent] PRIMARY KEY ([Id]),
	CONSTRAINT [FK_EmployeeParent_Employee] FOREIGN KEY ([Employee_Id]) REFERENCES [Employee]([Id]),
	CONSTRAINT [FK_EmployeeParent_EmployeeId] FOREIGN KEY ([EmployeeId]) REFERENCES [Employee]([Id]),
	CONSTRAINT [FK_EmployeeParent_Parent] FOREIGN KEY ([ParentId]) REFERENCES [Employee]([Id])

)
