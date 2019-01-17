CREATE TRIGGER [InventoryTransfer_AssignSequentialNumber]
ON [InventoryTransfer]
AFTER INSERT
AS  
	BEGIN
			
			declare @max bigint
			declare @id varchar(max)

			select @id = [Id] from [Inserted]
			select @max = max(isnull([Sequential],0)) from [InventoryTransfer]
		
			update [InventoryTransfer] set [Sequential] = @max + 1 where [Id] = @id

		END  
GO
