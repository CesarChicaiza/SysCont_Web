CREATE TRIGGER [FixedAssetOutput_AssignSequentialNumber]
ON [FixedAssetOutput]
AFTER INSERT
AS  
	BEGIN
			
			declare @max bigint
			declare @id varchar(max)

			select @id = [Id] from [Inserted]
			select @max = max(isnull([Sequential],0)) from [FixedAssetOutput]
		
			update [FixedAssetOutput] set [Sequential] = @max + 1 where [Id] = @id

		END  
GO
