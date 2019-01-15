CREATE TABLE [dbo].[BusinessItem_AttributeOption]
(
	[Id]						UNIQUEIDENTIFIER	NOT NULL , 
    [Name]						NVARCHAR(200)		NULL, 
    [DisplayOrder]				INT					NULL, 
    [PriceAdjustment]			DECIMAL(18, 5)		NULL, 
	[IsPreSelected]				BIT					NULL, 
	[BusinessItem_Attribute_Id] UNIQUEIDENTIFIER	NULL, 
	[RowStatus]					INT                 NOT NULL,
	[Locked]					BIT					NOT NULL DEFAULT 0,
	[Required]					BIT					NOT NULL DEFAULT 0,
	[Employee_Id]				uniqueidentifier     null,
	[CreatedBy]					uniqueidentifier     null,
	[CreatedDate]				datetime             null,
	[ModifiedBy]				uniqueidentifier     null,
	[ModifiedDate]				datetime             null, 
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_BusinessItem_AttributeOption] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_BusinessItem_AttributeOption] FOREIGN KEY ([BusinessItem_Attribute_Id]) REFERENCES [BusinessItem_Attribute]([Id])
)
