CREATE PROCEDURE [dbo].[FSF_Module_Subscription_Subscription_Update]

		    @id										nvarchar(max)
           ,@amount									decimal(18,2)
           ,@start									datetime
           ,@end									datetime
           ,@comments								nvarchar(max)
           ,@subscription_Recurrence_Id				nvarchar(max)
           ,@customer_Id							nvarchar(max)
           ,@payment_Method_Id						nvarchar(max)
           ,@subscription_DesactivatedReason_Id		nvarchar(max)
           ,@rowStatus								int
           ,@assignedTo								nvarchar(max)
           ,@modifiedBy								nvarchar(max)
           ,@modifiedDate							datetime

AS

	UPDATE [dbo].[Subscription]
	SET 
			    [Amount] = @amount
			   ,[Start] = @start
			   ,[End] = @end
			   ,[Comments] = @comments
			   ,[Subscription_Recurrence_Id] = @subscription_Recurrence_Id
			   ,[Customer_Id] = @customer_Id
			   ,[Payment_Method_Id] = @payment_Method_Id
			   ,[Subscription_DesactivatedReason_Id] = @subscription_DesactivatedReason_Id
			   ,[RowStatus] = @rowStatus
			   ,[AssignedTo] = @assignedTo
			   ,[ModifiedBy] = @modifiedBy
			   ,[ModifiedDate] = @modifiedDate
	WHERE
			  [Id] = @Id
			