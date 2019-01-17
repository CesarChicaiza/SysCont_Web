CREATE TRIGGER [InventoryOutput_AssignSequentialNumber]
ON [InventoryOutput]
AFTER INSERT
AS  
	BEGIN
			
			declare @max bigint
			declare @id varchar(max)

			select @id = [Id] from [Inserted]
			select @max = max(isnull([Sequential],0)) from [InventoryOutput]
		
			update [InventoryOutput] set [Sequential] = @max + 1 where [Id] = @id

		END  
GO
