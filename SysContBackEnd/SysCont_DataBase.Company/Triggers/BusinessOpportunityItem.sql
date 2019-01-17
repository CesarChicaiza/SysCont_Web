CREATE TRIGGER [BusinessOpportunityItem_AssignSequentialNumber]  
ON [BusinessOpportunity_Item]
AFTER INSERT
AS  
	BEGIN
			
			declare @max bigint
			declare @id varchar(max)

			select @id = [Id] from [Inserted]
			select @max = max(isnull([Number],0)) from [BusinessOpportunity_Item]
		
			update [BusinessOpportunity_Item] set [Number] = @max + 1 where [Id] = @id

		END  
GO