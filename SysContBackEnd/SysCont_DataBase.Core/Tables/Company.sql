CREATE TABLE [dbo].[Company]
(
	[Id]                   uniqueidentifier     not null,
	[Name]                 nvarchar(256)        not null,
	[Description]          nvarchar(max)        null,
	[ConnectionString]     nvarchar(max)        not null,
	[DataProvider]         int                  not null,
	[RowStatus]            int                  not null,
	[Employee_Id]          uniqueidentifier     null,
	[CreatedBy]            uniqueidentifier     null,
    [CreatedDate]          datetime             null,
	[ModifiedBy]           uniqueidentifier     null,
	[ModifiedDate]         datetime             null, 
	[Picture]			   nvarchar(max)        null,
    CONSTRAINT [PK_Company] PRIMARY KEY ([Id]), 
)
