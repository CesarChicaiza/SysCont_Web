/*
Plantilla de script posterior a la implementación							
--------------------------------------------------------------------------------------
 Este archivo contiene instrucciones de SQL que se anexarán al script de compilación.		
 Use la sintaxis de SQLCMD para incluir un archivo en el script posterior a la implementación.			
 Ejemplo:      :r .\miArchivo.sql								
 Use la sintaxis de SQLCMD para hacer referencia a una variable en el script posterior a la implementación.		
 Ejemplo:      :setvar TableName miTabla							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
INSERT INTO [dbo].[Company]	(	[Id],									[Name],							[ConnectionString],						[DataProvider],		[RowStatus]	)	VALUES
							(	'839912FB-ED9B-4A6A-BAE2-16F9DF8EBE3F',	'Consult-Ye',					'Http://localhost:4200/login',			1,					1			)
								


INSERT INTO [dbo].[Membership]	(	[Id],									[Name],						[Username],		[Password],		[Email],										[IsApproved],	[IsLockedOut],	[LastLoginDate],	[LastPasswordChangedDate],	[LastLockoutDate],	[FailedPasswordAttemptCount],	[ResetPasswordToken],	[TokenExpirationDate],	[RowStatus]	)	VALUES
								(	'C2AC71C8-6E06-4415-B62A-55A4048E5D93',	'Cesar Chicaiza',			'cchicaiza',	'sa',			'cesar_chicaiza.7@hotmail.com',					1,				0,				null,				null,						null,				0,								null,					'2020-01-01',			1			)
												


INSERT INTO [dbo].[CompanyAllocation]	(	[Id],		[Membership_Id],						[Company_Id],							[RowStatus]	)	VALUES
										(	NEWID(),	'C2AC71C8-6E06-4415-B62A-55A4048E5D93',	'839912FB-ED9B-4A6A-BAE2-16F9DF8EBE3F',	1			)
GO
