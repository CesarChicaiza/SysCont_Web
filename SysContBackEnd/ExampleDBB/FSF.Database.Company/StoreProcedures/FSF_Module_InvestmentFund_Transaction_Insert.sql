CREATE PROCEDURE [dbo].[FSF_Module_InvestmentFund_Transaction_Insert]
		    @id										varchar(max)
           ,@amount									decimal(18,5)				
           ,@currentBalance							decimal(18,5)
		   ,@currentUnits							decimal(18,5)
           ,@currentParticipation					decimal(18,5)
           ,@availableUnitsForRescue				int
		   ,@portfolioTotalPrice					decimal(18,5)
           ,@portfolioUnitPrice						decimal(18,5)
           ,@portfolioUnits							decimal(18,5)
		   ,@incomeTax								decimal(18,5)
           ,@date									datetime
           ,@customer_Id							varchar(max)
           ,@investmentFund_Portfolio_Id			varchar(max)
           ,@investmentFund_TransactionType_Id		varchar(max)
           ,@isSynchronized							bit
           ,@rowStatus								int
           ,@assignedType							int
           ,@assignedTo								varchar(max)
           ,@createdBy								varchar(max)
           ,@createdDate							datetime

AS
	INSERT INTO [dbo].[InvestmentFund_Transaction]
           ([Id]
           ,[Amount]
           ,[CurrentBalance]
		   ,[CurrentUnits]
           ,[CurrentParticipation]
		   ,[AvailableUnitsForRescue]
           ,[PortfolioTotalPrice]
           ,[PortfolioUnitPrice]
           ,[PortfolioUnits]
		   ,[IncomeTax]
           ,[Date]
           ,[Customer_Id]
           ,[InvestmentFund_Portfolio_Id]
           ,[InvestmentFund_TransactionType_Id]
           ,[IsSynchronized]
           ,[RowStatus]
           ,[AssignedType]
           ,[AssignedTo]
           ,[CreatedBy]
           ,[CreatedDate]
           )
     VALUES(   
			@id
           ,@amount
           ,@currentBalance
		   ,@currentUnits
           ,@currentParticipation
           ,@availableUnitsForRescue
		   ,@portfolioTotalPrice
           ,@portfolioUnitPrice
           ,@portfolioUnits
		   ,@incomeTax
           ,@date
           ,@customer_Id
           ,@investmentFund_Portfolio_Id
           ,@investmentFund_TransactionType_Id
           ,@isSynchronized
           ,@rowStatus
           ,@assignedType
           ,@assignedTo
           ,@createdBy
           ,@createdDate
		   )
GO

