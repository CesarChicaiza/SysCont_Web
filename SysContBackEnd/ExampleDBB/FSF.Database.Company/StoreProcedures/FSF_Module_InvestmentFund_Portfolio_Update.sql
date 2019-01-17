CREATE PROCEDURE [dbo].[FSF_Module_InvestmentFund_Portfolio_Update]

	   @id					nvarchar(max)
      ,@name				nvarchar(max)
      ,@bvqId				nvarchar(max)
      ,@code				nvarchar(max)
      ,@principalName		nvarchar(max)
      ,@principalId			nvarchar(max)
      ,@principalRuc		nvarchar(max)
      ,@status				nvarchar(max)
      ,@initUnitPrice		decimal(18,5)
      ,@totalPrice			decimal(18,5)
      ,@unitPrice			decimal(18,5)
      ,@units				decimal(18,5)
	  ,@incomeTaxExonerationMonths	decimal(18,5)
      ,@rowStatus			int
      ,@assignedType		int
      ,@assignedTo			nvarchar(max)
      ,@modifiedBy			nvarchar(max)
      ,@modifiedDate		datetime
AS
	

	UPDATE [InvestmentFund_Portfolio]
	   SET [Name]					=	@name
		  ,[BvqId]					=	@bvqId
		  ,[Code]					=	@code
		  ,[PrincipalName]			=	@principalName
		  ,[PrincipalId]			=	@principalId
		  ,[PrincipalRuc]			=	@principalRuc
		  ,[Status]					=	@status
		  ,[InitUnitPrice]			=	@initUnitPrice
		  ,[TotalPrice]				=	@totalPrice
		  ,[UnitPrice]				=	@unitPrice
		  ,[Units]					=	@units
		  ,[incomeTaxExonerationMonths]	=	@incomeTaxExonerationMonths
		  ,[RowStatus]				=	@rowStatus
		  ,[AssignedType]			=	@assignedType
		  ,[AssignedTo]				=	@assignedTo
		  ,[ModifiedBy]				=	@modifiedBy
		  ,[ModifiedDate]			=	@modifiedDate
	 WHERE [Id]	= @id
GO
