CREATE PROCEDURE [dbo].[FSF_Module_InvestmentFund_BalanceAccountItem_Insert]

	 @id								nvarchar(max)
	,@amount							decimal(18,5) 
	,@currentBalance					decimal(18,5)
	,@currentUnits						decimal(18,5)
	,@currentParticipation				decimal(18,5)
	,@portfolioTotalPrice				decimal(18,5)
	,@portfolioUnitPrice				decimal(18,5)
	,@portfolioUnits					decimal(18,5)
	,@date								datetime
	,@customer_Id						nvarchar(max)
	,@investmentFund_Portfolio_Id		nvarchar(max)
	,@investmentFund_TransactionType_Id	nvarchar(max)
	,@investmentFund_BalanceAccount_Id	nvarchar(max)
	,@rowStatus							int
    ,@assignedType						int
    ,@assignedTo						varchar(max)
    ,@createdBy							varchar(max)
    ,@createdDate						datetime
AS

				

INSERT INTO [dbo].[InvestmentFund_BalanceAccountItem]	(	[Id],	[Amount],	[CurrentBalance],	[CurrentUnits],			[CurrentParticipation],	[PortfolioTotalPrice],	[PortfolioUnitPrice],	[PortfolioUnits],	[Date],	[Customer_Id],	[InvestmentFund_Portfolio_Id],	[InvestmentFund_TransactionType_Id],[InvestmentFund_BalanceAccount_Id],	[RowStatus],	[AssignedType],	[AssignedTo],	[CreatedBy],[CreatedDate]	)	VALUES
														(	@id,	@amount,	@currentBalance,	@currentUnits,			@currentParticipation,	@portfolioTotalPrice,	@portfolioUnitPrice,	@portfolioUnits,	@date,	@customer_Id,	@investmentFund_Portfolio_Id,	@investmentFund_TransactionType_Id,	@investmentFund_BalanceAccount_Id,	@rowStatus,		@assignedType,	@assignedTo,	@createdBy,	@createdDate	)


--	BEGIN TRANSACTION 


--BEGIN TRY

--	SET LANGUAGE Spanish;

--	-- Declare
	
--	--Declare varibel for cursor
--	declare @tmp_portfolioId				varchar(max)
--	declare @tmp_customerId					varchar(max)
--	declare @tmp_amount						decimal
	
--	--declare varibles for header
--	declare @id								uniqueidentifier
--	declare @fullDate						datetime
--	declare @balanceAccountDescription		varchar(max)
--	declare @customerNumber					varchar(max)
--	declare @customerExecutive				varchar(max)
--	declare @previousBalanceDate			varchar(max)
--	declare @previousBalanceUnits			decimal
--	declare @previousBalanceUnitPrice		decimal
--	declare @previousBalanceAmount			decimal
--	declare @currentDepositUnits			decimal
--	declare @currentDepositAmount			decimal
--	declare @currentRescueUnits				int
--	declare @currentRescueAmount			decimal
--	declare @currentBalanceDate				varchar(max) 
--	declare @currentBalanceUnits			decimal
--	declare @currentBalanceUnitPrice		decimal
--	declare @currentBalanceAmount			decimal
--	declare @interestCurrentPeriod			decimal
--	declare @interestLastPeriod				decimal
--	declare @iterestLastSixMonths			decimal
--	declare @annualPerformance				decimal
--	declare	@portfolioPrice					decimal 
--	declare	@portfolioUnits					decimal
--	declare @portfolioUnitPrice				decimal
--	declare	@customerParticipation			decimal
--	declare	@portfolioInvestorsCount		decimal
--    declare	@taxIncome						decimal
--	declare	@taxIncomeAccumulated			decimal


--	-- Set	global values
--	set @fullDate					=	(	select datefromparts(@year, @month, 1)	)
--	set @balanceAccountDescription	=	(	select concat(datename(month, @month), ' ', @year ))
--	set @portfolioUnitPrice			=	(	select [UnitPrice] from	[InvestmentFund_Portfolio]	where [Id] = @portfolioId	)							
--	set @currentBalanceDate			=	(	select dateadd(s,-1,dateadd(mm, datediff(m,0,@fullDate)+1,0) )  )
--	set @portfolioPrice				=	(	select TotalPrice from [InvestmentFund_Portfolio] where id= @portfolioId)


--	DECLARE customerPortfolio_cursor CURSOR FOR
--		select	[InvestmentFund_Portfolio_Id], [Customer_Id], [Amount]
--		from	[InvestmentFund_CustomerPortfolio]
--		where	[InvestmentFund_Portfolio_Id] = @portfolioId
--			and [RowStatus]=1;

--	OPEN customerPortfolio_cursor;
--	FETCH NEXT FROM customerPortfolio_cursor INTO @tmp_portfolioId, @tmp_customerId, @tmp_amount;  

--	WHILE @@FETCH_STATUS = 0  
--	BEGIN   

--			set @id = (	newid() )
	
			
--			--........................................................................................................................................................
--			--1. Add administrative cost to kardex
--			--........................................................................................................................................................

--				print  'administrative cost'

--				declare @administrationCost	decimal
--				declare @newCurrentBalance	decimal

				 
--				set @administrationCost = 	@tmp_amount * 0.01
--				set @newCurrentBalance	=	(	select	top 1	[Amount]
--												from	[InvestmentFund_CustomerPortfolio]
--												where	[Customer_Id] = @tmp_customerId
--													and	[InvestmentFund_Portfolio_Id] = @tmp_portfolioId
--											) - @administrationCost
								

--				--Create transaction
--				insert into [InvestmentFund_Transaction]	(	[Id],		[Amount],				[CurrentBalance],	[CurrentParticipation],	[PortfolioTotalPrice],						[PortfolioUnitPrice],	[PortfolioUnits],													[Date],					[Customer_Id],	[InvestmentFund_Portfolio_Id],	[InvestmentFund_TransactionType_Id],	[RowStatus]	)
--												select top 1	NEWID(),	@administrationCost,	@newCurrentBalance,	[CurrentParticipation],	[PortfolioTotalPrice]-@administrationCost,	[PortfolioUnitPrice],	([PortfolioTotalPrice]-@administrationCost)/[PortfolioUnitPrice],	@currentBalanceDate,	[Customer_Id],	[InvestmentFund_Portfolio_Id],	'5CB0E11A-5F32-4449-8507-89ECA27F2146',	[RowStatus]	
--														from	[InvestmentFund_Transaction]
--														where	[Customer_Id] = @tmp_customerId
--															and	[InvestmentFund_Portfolio_Id] = @tmp_portfolioId
--														order by [Date] desc	

--				--Update portfilio amount
--				update	[InvestmentFund_Portfolio] 
--				set		[TotalPrice] = [TotalPrice] - @administrationCost
--				where	[Id] = @tmp_portfolioId
		
--				--Update custmomer amount
--				update	[InvestmentFund_CustomerPortfolio]
--				set		[Amount] = [Amount] -  @administrationCost
--				where	[Customer_Id] = @tmp_customerId 
--					and	[InvestmentFund_Portfolio_Id] = @tmp_portfolioId
											


--			--........................................................................................................................................................
--			--2. Add tax income
--			--........................................................................................................................................................
		
--				print 'Add tax income'

--				declare @incomeTax	decimal

--				set @incomeTax			= ( @tmp_amount - @administrationCost ) * 0.10
--				set @newCurrentBalance	=	@newCurrentBalance - @incomeTax


--				--Create transaction
--				insert into [InvestmentFund_Transaction]	(	[Id],		[Amount],	[CurrentBalance],	[CurrentParticipation],	[PortfolioTotalPrice],				[PortfolioUnitPrice],	[PortfolioUnits],											[Date],					[Customer_Id],	[InvestmentFund_Portfolio_Id],	[InvestmentFund_TransactionType_Id],	[RowStatus]	)
--												select top 1	NEWID(),	@incomeTax,	@newCurrentBalance,	[CurrentParticipation],	[PortfolioTotalPrice]-@incomeTax,	[PortfolioUnitPrice],	([PortfolioTotalPrice]-@incomeTax)/[PortfolioUnitPrice],	@currentBalanceDate,	[Customer_Id],	[InvestmentFund_Portfolio_Id],	'4DF610D4-DE0C-4285-A11B-51B82EA2441B',	[RowStatus]	
--														from	[InvestmentFund_Transaction]
--														where	[Customer_Id] = @tmp_customerId
--															and	[InvestmentFund_Portfolio_Id] = @tmp_portfolioId
--														order by [Date] desc	

	
--				--Update portfilio amount
--				update	[InvestmentFund_Portfolio] 
--				set		[TotalPrice] = [TotalPrice] - @incomeTax
--				where	[Id] = @tmp_portfolioId
		
--				--Update custmomer amount
--				update	[InvestmentFund_CustomerPortfolio]
--				set		[Amount] = [Amount] -  @incomeTax
--				where	[Customer_Id] = @tmp_customerId 
--					and	[InvestmentFund_Portfolio_Id] = @tmp_portfolioId


--			--........................................................................................................................................................
--			--3. Get Customer information
--			-- --........................................................................................................................................................
		
--				select @customerNumber =[Customer].[Number], @customerExecutive =[Employee].[Name] 
--				from [Customer]
--				left join	[Employee]	on	[Customer].[Employee_Id] = [Employee].[Id]
--				where [Customer].[Id] = @tmp_customerId

				
--			--........................................................................................................................................................
--			--4. Get info of the previous month
--			--........................................................................................................................................................

--				print 'Get info of the previous month'

--				select top 1 @previousBalanceDate		=	[CurrentBalanceDate],
--							 @previousBalanceUnits		=	[CurrentBalanceUnits],
--							 @previousBalanceUnitPrice	=	[CurrentBalanceUnitPrice],
--							 @previousBalanceAmount		=	[CurrentBalanceAmount],
--							 @interestLastPeriod		=	[InterestCurrentPeriod]
--				from	[InvestmentFund_BalanceAccount] 
--				where	[Customer_Id] = @tmp_customerId 
--					and	[InvestmentFund_Portfolio_Id] = @portfolioId 
--					and datefromparts([Year], [Month], 1) = dateadd(month, -1, @fullDate)
			

--			--........................................................................................................................................................
--			--5. Totalize deposits
--			--........................................................................................................................................................
	
	
--				print 'Totalize deposits'

--				select  @currentDepositUnits	= sum(Amount) / @portfolioUnitPrice   	
--				from	[InvestmentFund_Transaction]	
--				where	[InvestmentFund_TransactionType_Id] = 'F14BB615-DE0C-4DCB-92F1-790810407EA0' 
--					and	[Customer_Id] = @tmp_customerId 
--					and [InvestmentFund_Portfolio_Id] = @tmp_portfolioId
--					and month([Date])= @month
--					and year([Date])=@year
				


--				select	@currentDepositAmount	=	sum([Amount])	
--				from	[InvestmentFund_Transaction]	
--				where	[InvestmentFund_TransactionType_Id] = 'F14BB615-DE0C-4DCB-92F1-790810407EA0' 
--					and	[Customer_Id] = @tmp_customerId 
--					and [InvestmentFund_Portfolio_Id] = @tmp_portfolioId
--					and month([Date])= @month
--					and year([Date])=@year


--			--........................................................................................................................................................
--			--6. Totalize rescues	
--			--........................................................................................................................................................					
		
--				print 'Totalize rescues'

--				select	@currentRescueUnits		=	sum(Amount) / @portfolioUnitPrice    
--				from	[InvestmentFund_Transaction]	
--				where	[InvestmentFund_TransactionType_Id] = '403238D2-8155-42E2-881B-7B26D49BBF6F' 
--					and	[Customer_Id] = @tmp_customerId 
--					and [InvestmentFund_Portfolio_Id] = @tmp_portfolioId
--					and month([Date])= @month
--					and year([Date])=@year
									
		
--				select	@currentRescueAmount	=	sum([Amount])	
--				from	[InvestmentFund_Transaction]	
--				where	[InvestmentFund_TransactionType_Id] = '403238D2-8155-42E2-881B-7B26D49BBF6F' 
--					and	[Customer_Id] = @tmp_customerId 
--					and [InvestmentFund_Portfolio_Id] = @tmp_portfolioId
--					and month([Date])= @month
--					and year([Date])=@year


--			--........................................................................................................................................................
--			--7. Build current values
--			--........................................................................................................................................................					
				
--				select top 1	@currentBalanceUnits		=	[PortfolioUnits] * [CurrentParticipation],
--								@currentBalanceUnitPrice	=	[PortfolioUnitPrice],
--								@currentBalanceAmount		=	[CurrentBalance],
--								@customerParticipation		=	[CurrentParticipation]
--				from [InvestmentFund_Transaction]
--				where	[Customer_Id]					=	@tmp_customerId
--					and	[InvestmentFund_Portfolio_Id]	=	@tmp_portfolioId
--				order by [Date] desc


--			--........................................................................................................................................................
--			--8. Calculate interest
--			--........................................................................................................................................................

--				print 'Calculate interest'

--				--Current period
--				set @interestCurrentPeriod =	(	@tmp_amount - @currentDepositAmount - @currentRescueAmount	) * 100 / (	@currentDepositAmount - @currentRescueAmount	)

--				--Last period
--				select	@interestLastPeriod		=	isnull(sum([InterestCurrentPeriod]),0)
--				from	[InvestmentFund_BalanceAccount] 
--				where	[Customer_Id] = @tmp_customerId 
--					and	[InvestmentFund_Portfolio_Id] = @portfolioId 
--					and datefromparts([Year], [Month], 1) >  dateadd(month, -1, @fullDate)
			
--				--Last 6 months
--				select	@iterestLastSixMonths		=	isnull(sum([InterestCurrentPeriod]),0)
--				from	[InvestmentFund_BalanceAccount] 
--				where	[Customer_Id] = @tmp_customerId 
--					and	[InvestmentFund_Portfolio_Id] = @portfolioId 
--					and datefromparts([Year], [Month], 1) > dateadd(month, -6, @fullDate)
			
--				--Last 12 months
--				select	@iterestLastSixMonths		=	isnull(sum([InterestCurrentPeriod]),0)
--				from	[InvestmentFund_BalanceAccount] 
--				where	[Customer_Id] = @tmp_customerId 
--					and	[InvestmentFund_Portfolio_Id] = @portfolioId 
--					and datefromparts([Year], [Month], 1) >  dateadd(month, -12, @fullDate)
			
	

--			--........................................................................................................................................................
--			--9. Create header
--			----........................................................................................................................................................

--				print 'Create header'
		
--				INSERT INTO [dbo].[InvestmentFund_BalanceAccount](	[Id],		[Description]	           ,[Month],	[Year],	[CustomerNumber],	[CustomerExecutive],	[PreviousBalanceDate],	[PreviousBalanceUnits],	[PreviousBalanceUnitPrice],	[PreviousBalanceAmount],	[CurrentDepositUnits],	[CurrentDepositAmount],	[CurrentRescueUnits],	[CurrentRescueAmount],	[CurrentBalanceDate],	[CurrentBalanceUnits],	[CurrentBalanceUnitPrice],	[CurrentBalanceAmount],	[InterestCurrentPeriod],	[InterestLastPeriod],	[IterestLastSixMonths],	[AnnualPerformance],	[PortfolioPrice],	[PortfolioUnits],	[CustomerParticipation],	[PortfolioInvestorsCount],	[TaxIncome],	[TaxIncomeAccumulated],	[InvestmentFund_Portfolio_Id],	[Customer_Id],		[RowStatus]	)	VALUES
--																(	@id,	@balanceAccountDescription,	@month,		@year,	@customerNumber,	@customerExecutive,		@previousBalanceDate,	@previousBalanceUnits,	@previousBalanceUnitPrice,	@PreviousBalanceAmount,		@currentDepositUnits,	@currentDepositAmount,	@currentRescueUnits,	@CurrentRescueAmount,	@currentBalanceDate,	@CurrentBalanceUnits,	@currentBalanceUnitPrice,	@currentBalanceAmount,	@InterestCurrentPeriod,		@InterestLastPeriod,	@IterestLastSixMonths,	@annualPerformance,		@portfolioPrice,	@PortfolioUnits,	@customerParticipation,		@portfolioInvestorsCount,	@taxIncome,		@taxIncomeAccumulated,	@tmp_portfolioId,			    @tmp_customerId,	1			)                 		           	           	     
				


--			--........................................................................................................................................................
--			--10. Create detail
--			--........................................................................................................................................................

--				insert into	[InvestmentFund_BalanceAccountItem]	(	[Id],	[Amount],	[CurrentBalance],	[CurrentParticipation],	[PortfolioTotalPrice],	[PortfolioUnitPrice],	[PortfolioUnits],	[Date],	[Customer_Id],	[InvestmentFund_Portfolio_Id],	[InvestmentFund_TransactionType_Id],	[InvestmentFund_BalanceAccount_Id],	[RowStatus]	)
--															select	[Id],	[Amount],	[CurrentBalance],	[CurrentParticipation],	[PortfolioTotalPrice],	[PortfolioUnitPrice],	[PortfolioUnits],	[Date],	[Customer_Id],	[InvestmentFund_Portfolio_Id],	[InvestmentFund_TransactionType_Id],	@id,								[RowStatus]	
--															from	[InvestmentFund_Transaction]	
--															where	[InvestmentFund_Portfolio_Id] = @tmp_portfolioId
--																and	[Customer_Id] = @tmp_customerId
--																and month([Date])= @month
--																and year([Date])=@year
--															order by [Date] desc



--				FETCH NEXT FROM customerPortfolio_cursor INTO @tmp_portfolioId, @tmp_customerId, @tmp_amount; 
--			END

--			CLOSE customerPortfolio_cursor;  
--			DEALLOCATE customerPortfolio_cursor;


--			COMMIT TRANSACTION 

--END TRY
--BEGIN CATCH
--		ROLLBACK TRANSACTION 
--		select ERROR_MESSAGE()

--END CATCH