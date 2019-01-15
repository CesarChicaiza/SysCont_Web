CREATE PROCEDURE [dbo].[FSF_Module_Subscription_MoneyCollect_Update]
			@id							nvarchar(max)
           ,@date						datetime
           ,@canCollect					bit
           ,@collectBankStatus			nvarchar(max)
           ,@collectBankStatusDetail	nvarchar(max)
           ,@retries					int
           ,@subscription_Id			nvarchar(max)
           ,@rowStatus					int
           ,@assignedTo					nvarchar(max)
           ,@modifiedBy					nvarchar(max)
           ,@modifiedDate				datetime

AS
	
	UPDATE [dbo].[Subscription_MoneyCollect]
	SET		
            [Date] = @date
           ,[CanCollect] = @canCollect
           ,[CollectBankStatus] = @collectBankStatus
           ,[CollectBankStatusDetail] = @collectBankStatusDetail
           ,[Retries] = @retries
           ,[Subscription_Id] = @subscription_Id
           ,[RowStatus] = @rowStatus
           ,[AssignedTo] = @assignedTo
           ,[ModifiedBy] = @modifiedBy
           ,[CreatedDate] = @modifiedDate
	WHERE
			[Id] = @id	