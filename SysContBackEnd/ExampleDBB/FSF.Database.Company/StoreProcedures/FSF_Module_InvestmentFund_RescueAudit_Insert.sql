CREATE PROCEDURE [dbo].[FSF_Module_InvestmentFund_RescueAudit_Insert]
		     @id										varchar(max)
            ,@date										datetime
            ,@removedUnits								int
			,@applyIcomeTax								bit
			,@icomeTax									decimal(18,5)
			,@transactionDeposit_Id						varchar(max)
			,@transactionRescue_Id						varchar(max)


AS

		INSERT INTO [dbo].[InvestmentFund_RescueAudit]	(   [Id],   [Date], [RemovedUnits], [ApplyIcomeTax],    [IcomeTax], [TransactionDeposit_Id],    [TransactionRescue_Id]  ) VALUES
														(   @id,    @date, @removedUnits,	@applyIcomeTax,     @icomeTax, @transactionDeposit_Id,     @transactionRescue_Id	) 
              
GO

