--CREATE PROCEDURE [dbo].[FSF_Module_InvestmentFund_Transaction_Validation_Amount]
--	@Amount decimal,
--	@InvestmentFund_TransactionType_Id varchar(max),
--	@Customer_Id varchar(max),
--	@InvestmentFund_Portfolio_Id varchar(max)
--AS
	
--	--declare
--	declare @availableAmount decimal
--	declare @portfolioMinimumValue decimal


--	--set 
--	set @availableAmount		=	(	select	[Amount]				from	[InvestmentFund_CustomerPortfolio]	where [Customer_Id]= @Customer_Id and [InvestmentFund_Portfolio_Id] = @InvestmentFund_Portfolio_Id	)
--	set @portfolioMinimumValue	=	(	select	[MinimumRescueAmount]	from	[InvestmentFund_Portfolio]			where [Id]=@InvestmentFund_Portfolio_Id	)

--	--Verify if is a rescue transaction
--	IF @InvestmentFund_TransactionType_Id = '403238D2-8155-42E2-881B-7B26D49BBF6F'
--		BEGIN

--			--Verify Amounts
--			IF ( (@Amount < @availableAmount AND (@availableAmount - @Amount) > @portfolioMinimumValue)
--					OR
--				 (@Amount = @availableAmount)
--				)
--				BEGIN
--					select cast(1 as bit)
--				END
--			ELSE
--				BEGIN
--					select cast(0 as bit)
--				END 

--		END
--	ELSE
--		BEGIN 
--			select cast(1 as bit)
--		END




