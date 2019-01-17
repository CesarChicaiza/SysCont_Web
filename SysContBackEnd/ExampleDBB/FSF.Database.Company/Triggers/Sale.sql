

CREATE TRIGGER [Sale_AssignSequentialNumber]  
ON [Sale]
AFTER INSERT
AS  
	BEGIN
			
			declare @max bigint
			declare @id varchar(max)

			select @id = [Id] from [Inserted]
			select @max = max(isnull([Number],0)) from [Sale]
		
			update [Sale] set [Number] = @max + 1 where [Id] = @id

		END  
GO