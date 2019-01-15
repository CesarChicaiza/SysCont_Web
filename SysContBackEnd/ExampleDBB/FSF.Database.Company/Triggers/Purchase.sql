CREATE TRIGGER [Purchase_AssignSequentialNumber]  
ON [Purchase]
AFTER INSERT
AS  
	BEGIN
			
			declare @max bigint
			declare @id varchar(max)

			select @id = [Id] from [Inserted]
			select @max = max(isnull([Sequential],0)) from [Purchase]
		
			update [Purchase] set [Sequential] = @max + 1 where [Id] = @id

		END  
GO
