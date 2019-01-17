
CREATE TRIGGER [Manufacture_AssignSequentialNumber]
ON [Manufacture]
AFTER INSERT
AS  
	BEGIN
			
			declare @max bigint
			declare @id varchar(max)

			select @id = [Id] from [Inserted]
			select @max = max(isnull([Batch],0)) from [Manufacture]
		
			update [Manufacture] set [Batch] = @max + 1 where [Id] = @id

		END  
GO
