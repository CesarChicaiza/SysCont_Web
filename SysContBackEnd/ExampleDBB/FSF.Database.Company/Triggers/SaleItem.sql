CREATE TRIGGER [SaleItem_AssignSequentialNumber]
ON [Sale_Item]
AFTER INSERT
AS  
	BEGIN
			
			declare @max bigint
			declare @id varchar(max)

			select @id = [Id] from [Inserted]
			select @max = max(isnull([Number],0)) from [Sale_Item]
		
			update [Sale_Item] set [Number] = @max + 1 where [Id] = @id

		END  
GO
