CREATE TABLE [dbo].[Customer_Label]
(
	[Id]				UNIQUEIDENTIFIER	NOT NULL, 
	[Name]				NVARCHAR(300)		NOT NULL,
	[Customer_Id]		UNIQUEIDENTIFIER	NOT NULL,
	[RowStatus]			INT					NOT NULL,
	[Locked]			BIT					NOT NULL DEFAULT 0,
	[Required]			BIT					NOT NULL DEFAULT 0,
	[Employee_Id]		UNIQUEIDENTIFIER	NULL,
	[CreatedBy]			UNIQUEIDENTIFIER	NULL,
	[CreatedDate]		DATETIME			NULL,
	[ModifiedBy]		UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]		DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_Customer_Label] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_Customer_Label_Customer] FOREIGN KEY ([Customer_Id]) REFERENCES [Customer]([Id]), 

)
