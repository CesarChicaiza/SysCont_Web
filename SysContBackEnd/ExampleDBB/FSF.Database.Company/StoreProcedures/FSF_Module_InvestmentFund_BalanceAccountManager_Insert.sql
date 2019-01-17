CREATE PROCEDURE [dbo].[FSF_Module_InvestmentFund_BalanceAccountManager_Insert]
	@id				varchar(max),
	@year			int,
	@month			int,
	@portfolioId	varchar(max), 
	@rowStatus		int,
	@assignedType	int,
	@assignedTo		varchar(max),
	@createdBy		varchar(max),
	@createdDate	datetime

AS

INSERT INTO [dbo].[InvestmentFund_BalanceAccountManager]	(	[Id],	[Year],	[Month],	[InvestmentFund_Portfolio_Id],	[RowStatus],	[AssignedType],	[AssignedTo],	[CreatedBy],	[CreatedDate]	)	VALUES
															(	@id,	@year,	@month,		@portfolioId,					@rowStatus,		@assignedType,	@assignedTo,	@createdBy,		@createdDate	)
GO

