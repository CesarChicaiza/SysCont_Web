CREATE TABLE [dbo].[CompanyAllocation]
(
	[Id]					UNIQUEIDENTIFIER	NOT NULL,
	[Membership_Id]			UNIQUEIDENTIFIER	NOT NULL,
	[Company_Id]			UNIQUEIDENTIFIER	NOT NULL,
	[RowStatus]				int                  not null,
	[Employee_Id]			uniqueidentifier     null,
	[CreatedBy]				uniqueidentifier     null,
    [CreatedDate]			datetime             null,
	[ModifiedBy]			uniqueidentifier     null,
	[ModifiedDate]			datetime             null, 
	[Picture]				nvarchar(max)        null,

    CONSTRAINT [PK_CompanyAllocation] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_CompanyAllocation_Company] FOREIGN KEY ([Company_Id]) REFERENCES [Company]([Id]), 
    CONSTRAINT [FK_CompanyAllocation_Membership] FOREIGN KEY ([Membership_Id]) REFERENCES [Membership]([Id]) 
)
