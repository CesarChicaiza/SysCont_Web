CREATE PROCEDURE [dbo].[FSF_Module_InvestmentFund_CustomerPortfolio_Insert]
			@id								varchar(max)
		   ,@currentBalance					decimal(18,5)
           ,@currentUnits					decimal(18,5)
		   ,@currentParticipation			decimal(18,5)
           ,@investmentFund_Portfolio_Id	varchar(max)
           ,@customer_Id					varchar(max)
           ,@rowStatus						int
           ,@assignedType					varchar(max)
           ,@assignedTo						varchar(max)
           ,@createdBy						varchar(max)
           ,@createdDate					datetime
AS
	INSERT INTO [dbo].[InvestmentFund_CustomerPortfolio]
           ([Id]
           ,[CurrentBalance]
		   ,[CurrentUnits]
           ,[CurrentParticipation]
           ,[InvestmentFund_Portfolio_Id]
           ,[Customer_Id]
           ,[RowStatus]
           ,[AssignedType]
           ,[AssignedTo]
           ,[CreatedBy]
           ,[CreatedDate]
		   )
     VALUES(
			@id
           ,@currentBalance
		   ,@currentUnits
           ,@currentParticipation
           ,@investmentFund_Portfolio_Id
           ,@customer_Id
           ,@rowStatus
           ,@assignedType
           ,@assignedTo
           ,@createdBy
           ,@createdDate
		   )
