CREATE PROCEDURE [dbo].[FSF_Module_Subscription_MoneyCollect_Insert]
			@id							nvarchar(max)
           ,@date						datetime
           ,@canCollect					bit
           ,@collectBankStatus			nvarchar(max)
           ,@collectBankStatusDetail	nvarchar(max)
           ,@retries					int
           ,@subscription_Id			nvarchar(max)
           ,@rowStatus					int
           ,@assignedTo					nvarchar(max)
           ,@createdBy					nvarchar(max)
           ,@createdDate				datetime

AS
	
	INSERT INTO [dbo].[Subscription_MoneyCollect]
           ([Id]
           ,[Date]
           ,[CanCollect]
           ,[CollectBankStatus]
           ,[CollectBankStatusDetail]
           ,[Retries]
           ,[Subscription_Id]
           ,[RowStatus]
           ,[AssignedTo]
           ,[CreatedBy]
           ,[CreatedDate]
			)
     VALUES
           (
 		    @id	
           ,@date
           ,@canCollect
           ,@collectBankStatus
           ,@collectBankStatusDetail
           ,@retries
           ,@subscription_Id
           ,@rowStatus
           ,@assignedTo
           ,@createdBy
           ,@createdDate
		   )
GO