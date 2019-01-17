CREATE TRIGGER [FixedAssetIncome_AssignSequentialNumber]
ON [FixedAssetIncome]
AFTER INSERT
AS  
	BEGIN
			
			declare @max bigint
			declare @id varchar(max)

			select @id = [Id] from [Inserted]
			select @max = max(isnull([Sequential],0)) from [FixedAssetIncome]
		
			update [FixedAssetIncome] set [Sequential] = @max + 1 where [Id] = @id

		END  
GO

