CREATE PROCEDURE [dbo].[FSF_Module_InvestmentFund_Maturity_Get]
	@portfolioId varchar(max)
AS
	
	select *
    from [InvestmentFund_Maturity]
	where [Portafolio]= @portfolioId