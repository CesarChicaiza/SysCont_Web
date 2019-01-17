CREATE PROCEDURE [dbo].[FSF_Module_InvestmentFund_CustomerPortfolio_Update]
			@id								varchar(max)
		   ,@currentBalance					decimal(18,5)
		   ,@currentUnits					decimal(18,5)
           ,@currentParticipation			decimal(18,5)
           ,@investmentFund_Portfolio_Id	varchar(max)
           ,@customer_Id					varchar(max)
           ,@rowStatus						int
           ,@assignedType					varchar(max)
           ,@assignedTo						varchar(max)
           ,@modifiedBy						varchar(max)
           ,@modifiedDate					datetime

AS

	UPDATE	[InvestmentFund_CustomerPortfolio]
	SET		[CurrentBalance]				=	@currentBalance
		   ,[CurrentUnits]					=	@currentUnits
           ,[CurrentParticipation]			=	@currentParticipation
           ,[InvestmentFund_Portfolio_Id]	=	@investmentFund_Portfolio_Id
           ,[Customer_Id]					=	@customer_Id
           ,[RowStatus]						=	@rowStatus
           ,[AssignedType]					=	@assignedType
           ,[AssignedTo]					=	@assignedTo
           ,[ModifiedBy]					=	@modifiedBy
           ,[ModifiedDate]					=	@modifiedDate
	WHERE	[Id]	=	@id
     
			




