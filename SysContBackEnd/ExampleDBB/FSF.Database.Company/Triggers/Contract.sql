

CREATE TRIGGER [Contract_AssignSequentialNumber]  
ON [Contract]
AFTER INSERT
AS  
	BEGIN
			
			declare @max bigint
			declare @id varchar(max)

			select @id = [Id] from [Inserted]
			select @max = max(isnull([Number],0)) from [Contract]
		
			update [Contract] set [Number] = @max + 1 where [Id] = @id

		END  
GO