CREATE PROCEDURE [dbo].[FSF_Module_InvestmentFund_Valuation_Insert]
		    @id										varchar(max)
           ,@date									datetime				
           ,@totalPrice								decimal(18,5)
           ,@unitPrice								decimal(18,5)
           ,@units									decimal(18,5)
		   ,@administrativeCost						decimal(18,5)
           ,@investmentFund_Portfolio_Id			varchar(max)
           ,@rowStatus								int
           ,@assignedType							int
           ,@assignedTo								varchar(max)
           ,@createdBy								varchar(max)
           ,@createdDate							datetime

AS
INSERT INTO [dbo].[InvestmentFund_Valuation]	(	[Id],	[Date],	[TotalPrice],	[UnitPrice],	[Units],	[AdministrativeCost],	[InvestmentFund_Portfolio_Id],	[RowStatus],	[AssignedType],	[AssignedTo],	[CreatedBy],	[CreatedDate]	)	VALUES
												(	@id,	@date,	@totalPrice,	@unitPrice,		@units,		@administrativeCost,	 @investmentFund_Portfolio_Id,	@rowStatus,		@assignedType,	@assignedTo,	@createdBy,		@createdDate	)
