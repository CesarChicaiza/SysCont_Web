CREATE TRIGGER [Service_AssignSequentialNumber]
ON [Service]
AFTER INSERT
AS  
	BEGIN
			
			declare @max bigint
			declare @id varchar(max)

			select @id = [Id] from [Inserted]
			select @max = max(isnull([Number],0)) from [Service]
		
			update [Service] set [Number] = @max + 1 where [Id] = @id

		END  
GO
