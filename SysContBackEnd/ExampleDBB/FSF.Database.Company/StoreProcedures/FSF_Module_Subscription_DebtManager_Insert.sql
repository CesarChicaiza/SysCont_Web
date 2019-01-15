CREATE PROCEDURE [dbo].[FSF_Module_Subscription_DebtManager_Insert]
			@id										nvarchar(max)
           ,@year									int
           ,@month									int
           ,@debtDate								datetime
           ,@rowStatus								int
           ,@assignedTo								nvarchar(max)
           ,@createdBy								nvarchar(max)
           ,@createdDate							datetime

AS


INSERT INTO [dbo].[Subscription_DebtManager]
			(
			[Id] 
		   ,[Year] 
		   ,[Month]
		   ,[DebtDate]           
		   ,[RowStatus]
           ,[AssignedTo]
           ,[CreatedBy]
           ,[CreatedDate]
		   )
     VALUES
           (
		    @id
           ,@year
           ,@month
           ,@debtDate
           ,@rowStatus
           ,@assignedTo
           ,@createdBy
           ,@createdDate
		   )