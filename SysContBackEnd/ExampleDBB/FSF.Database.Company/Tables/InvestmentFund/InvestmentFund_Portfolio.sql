CREATE TABLE [dbo].[InvestmentFund_Portfolio]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL , 
    [Name]								NVARCHAR(50)		NULL,
    [BvqId]								NVARCHAR(50)		NULL, 
	[Code]								NVARCHAR(50)		NULL, 
    [PrincipalName]						NVARCHAR(50)		NULL,	--Nombre del comitente
	[PrincipalId]						NVARCHAR(50)		NULL,	--Id del comitente
	[PrincipalRuc]						NVARCHAR(50)		NULL,	--Ruc del comitente
	[Status]							NVARCHAR(50)		NULL,
	[InitUnitPrice]						DECIMAL(18, 5)		NULL,
	[TotalPrice]						DECIMAL(18, 5)		NULL, 
    [UnitPrice]							DECIMAL(18, 5)		NULL,
	[Units]								DECIMAL(18, 5)		NULL,
	[IncomeTaxExonerationMonths]		INT					NOT NULL,
	[StartDate]							DATETIME			NOT NULL,  
	[AnnualPercentageAdministrativeCost]DECIMAL(18, 5)		NOT NULL,  
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_InvestmentFundPortfolio]	PRIMARY KEY ([Id]) 
)
