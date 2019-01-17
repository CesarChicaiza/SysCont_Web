CREATE TRIGGER [InventoryIncome_AssignSequentialNumber]
ON [InventoryIncome]
AFTER INSERT
AS  
	BEGIN
			
			declare @max bigint
			declare @id varchar(max)

			select @id = [Id] from [Inserted]
			select @max = max(isnull([Sequential],0)) from [InventoryIncome]
		
			update [InventoryIncome] set [Sequential] = @max + 1 where [Id] = @id

		END  
GO
