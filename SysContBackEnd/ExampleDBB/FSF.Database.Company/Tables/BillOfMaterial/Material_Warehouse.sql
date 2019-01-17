CREATE TABLE [dbo].[Material_Warehouse]
(
	[Id]							UNIQUEIDENTIFIER	NOT NULL, 
	[Material_Id]					UNIQUEIDENTIFIER	NOT NULL,
	[Warehouse_Id]					UNIQUEIDENTIFIER	NOT NULL,
	[Quantity]						DECIMAL(18, 5)		NOT NULL, 
	[RowStatus]						int                 not null,
	[Locked]						BIT					NOT NULL DEFAULT 0,
	[Required]						BIT					NOT NULL DEFAULT 0,
	[Employee_Id]					uniqueidentifier	null,
	[CreatedBy]						uniqueidentifier	null,
	[CreatedDate]					datetime      null,
	[ModifiedBy]					uniqueidentifier     null,
	[ModifiedDate]					datetime             null, 
    CONSTRAINT [PK_Material_Warehouse] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_Material_Warehouse_Material] FOREIGN KEY ([Material_Id]) REFERENCES [Material]([Id]), 
    CONSTRAINT [FK_Material_Warehouse_Warehouse] FOREIGN KEY ([Warehouse_Id]) REFERENCES [Warehouse]([Id])
)
