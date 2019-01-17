

CREATE TRIGGER [BusinessOpportunity_AssignSequentialNumber]  
ON [BusinessOpportunity]
AFTER INSERT
AS  
	BEGIN
			
			declare @max bigint
			declare @id varchar(max)

			select @id = [Id] from [Inserted]
			select @max = max(isnull([Number],0)) from [BusinessOpportunity]
		
			update [BusinessOpportunity] set [Number] = @max + 1 where [Id] = @id

		END  
GO