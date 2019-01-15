CREATE PROCEDURE [dbo].[FSF_Module_InvestmentFund_Portfolio_Get]

	@id varchar(max)
AS
	
	SELECT *
  FROM  [InvestmentFund_Portfolio]
  WHERE [Id] = @id