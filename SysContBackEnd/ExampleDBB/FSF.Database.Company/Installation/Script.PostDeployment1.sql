


--Core
:r .\Core_Catalogs.sql

:r .\Workflows/Customer_Welcome.sql




--:r .\TestData\InvestmentFund_TD.sql
--:r .\TestData\Analytica.sql

	DECLARE @ApplicationId			UNIQUEIDENTIFIER	=	'BD13290A-3862-4C97-B73A-708227CCA6D4';
	DECLARE @CoreSuperUserRoleId	UNIQUEIDENTIFIER	=	'A2E5F49A-BCC8-4031-B72C-8BD1A039658D';

-- ****************************************************************************************************************************************
--  ROLE
-- ****************************************************************************************************************************************

	INSERT INTO [dbo].[Role]	(	[Id],							[Name],					[Description],					[HomePage],												[IsMain],	[IsDefault],	[RowStatus]	)
						VALUES	(	@CoreSuperUserRoleId,			'System Administrator',	'Administrador del sistema',	'ListView/Index/6D5F552A-F0B5-458F-BF21-655044C26ED4',	1,			0,				1			)


				


-- ****************************************************************************************************************************************
--  Employee
-- ****************************************************************************************************************************************

	--Employee
	INSERT INTO [dbo].[Employee]	([Id],										[Name],				[Phone],		[Email],			[Appointment],				[Role_Id],				[Company_Place_Id],						[RowStatus]	) values
									('C2AC71C8-6E06-4415-B62A-55A4048E5D93',	'Administrador',	'0987654321',	'admin@gmail.com',	'Administrador Sistema',	@CoreSuperUserRoleId,	'5EE26B36-1000-4E03-AD68-4D890DD9E5B8',	1			)


--DECLARE @RoleParticipeId					UNIQUEIDENTIFIER	=	'61F0223F-631C-4825-AF3E-0D0E3D0C3279';
--DECLARE @RoleEjecutivoCuentaId				UNIQUEIDENTIFIER	=	'2DDF9CDF-6D87-40E2-BA05-0219D374D477';
--DECLARE @RoleAdministradorFidusuarioId		UNIQUEIDENTIFIER	=	'4556216A-148C-41E8-A5F3-249B072D6F46';



-- ****************************************************************************************************************************************
--  ROLE
-- ****************************************************************************************************************************************


--INSERT INTO [Role]	(	[Id],									[Name],							[Description],				[HomePage],												[IsMain],	[IsDefault],	[Application_Id],			[RowStatus]		)	VALUES			
	--						(	@RoleParticipeId,						'Partícipe',					'Inversor',					'ListView/Index/C34FF27F-26D3-49B0-BF58-14C832BD994F',	0,			0,				@ApplicationId,				1				)	,
	--						(	@RoleEjecutivoCuentaId,					'Ejecutivo de cuenta',			'Personal interno',			'ListView/Index/C34FF27F-26D3-49B0-BF58-14C832BD994Fx',	0,			0,				@ApplicationId,				1				)	,
	--						(	@RoleAdministradorFidusuarioId,			'Administrador fidusuario',		'Administrador interno',	'ListView/Index/C34FF27F-26D3-49B0-BF58-14C832BD994F',	0,			0,				@ApplicationId,				1				)


--asign permission for PARTICIPE
	--INSERT INTO [dbo].[Permission]	(	[Id],		[Create],	[Read],	[Write],	[Delete],	[Entity_Id],								[Role_Id],			[RowStatus]	)	VALUES
		--							(	newid(),	0,			1,		0,			0,			'c34ff27f-26d3-49b0-bf58-14c832bd994f',		@RoleParticipeId,	1			)	,	--InvestmentFund_Portfolio
			--						(	newid(),	0,			1,		0,			0,			'103A3C4B-D1F7-4F9C-9819-4C6E0C048A7A',		@RoleParticipeId,	1			)		--InvestmentFund_BalanceAccount
									--(	newid(),	0,			1,		0,			0,			'56BD5DF6-9B24-44D6-AC10-1B406A5D0892',		@RoleParticipeId,	1			)		--InvestmentFund_Transaction

