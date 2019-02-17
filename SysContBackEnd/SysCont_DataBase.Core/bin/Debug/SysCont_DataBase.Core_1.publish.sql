/*
Script de implementación para SysCont_Core

Una herramienta generó este código.
Los cambios realizados en este archivo podrían generar un comportamiento incorrecto y se perderán si
se vuelve a generar el código.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "SysCont_Core"
:setvar DefaultFilePrefix "SysCont_Core"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detectar el modo SQLCMD y deshabilitar la ejecución del script si no se admite el modo SQLCMD.
Para volver a habilitar el script después de habilitar el modo SQLCMD, ejecute lo siguiente:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'El modo SQLCMD debe estar habilitado para ejecutar correctamente este script.';
        SET NOEXEC ON;
    END


GO
USE [master];


GO

IF (DB_ID(N'$(DatabaseName)') IS NOT NULL) 
BEGIN
    ALTER DATABASE [$(DatabaseName)]
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [$(DatabaseName)];
END

GO
PRINT N'Creando $(DatabaseName)...'
GO
CREATE DATABASE [$(DatabaseName)]
    ON 
    PRIMARY(NAME = [$(DatabaseName)], FILENAME = N'$(DefaultDataPath)$(DefaultFilePrefix)_Primary.mdf')
    LOG ON (NAME = [$(DatabaseName)_log], FILENAME = N'$(DefaultLogPath)$(DefaultFilePrefix)_Primary.ldf') COLLATE SQL_Latin1_General_CP1_CI_AS
GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                NUMERIC_ROUNDABORT OFF,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                RECOVERY FULL,
                CURSOR_CLOSE_ON_COMMIT OFF,
                AUTO_CREATE_STATISTICS ON,
                AUTO_SHRINK OFF,
                AUTO_UPDATE_STATISTICS ON,
                RECURSIVE_TRIGGERS OFF 
            WITH ROLLBACK IMMEDIATE;
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CLOSE OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ALLOW_SNAPSHOT_ISOLATION OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET READ_COMMITTED_SNAPSHOT OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_UPDATE_STATISTICS_ASYNC OFF,
                PAGE_VERIFY NONE,
                DATE_CORRELATION_OPTIMIZATION OFF,
                DISABLE_BROKER,
                PARAMETERIZATION SIMPLE,
                SUPPLEMENTAL_LOGGING OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET TRUSTWORTHY OFF,
        DB_CHAINING OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'No se puede modificar la configuración de la base de datos. Debe ser un administrador del sistema para poder aplicar esta configuración.';
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET HONOR_BROKER_PRIORITY OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'No se puede modificar la configuración de la base de datos. Debe ser un administrador del sistema para poder aplicar esta configuración.';
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET FILESTREAM(NON_TRANSACTED_ACCESS = OFF),
                CONTAINMENT = NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF),
                MEMORY_OPTIMIZED_ELEVATE_TO_SNAPSHOT = OFF,
                DELAYED_DURABILITY = DISABLED 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF fulltextserviceproperty(N'IsFulltextInstalled') = 1
    EXECUTE sp_fulltext_database 'enable';


GO
PRINT N'Creando [dbo].[Company]...';


GO
CREATE TABLE [dbo].[Company] (
    [Id]               UNIQUEIDENTIFIER NOT NULL,
    [Name]             NVARCHAR (256)   NOT NULL,
    [Description]      NVARCHAR (MAX)   NULL,
    [ConnectionString] NVARCHAR (MAX)   NOT NULL,
    [DataProvider]     INT              NOT NULL,
    [RowStatus]        INT              NOT NULL,
    [Employee_Id]      UNIQUEIDENTIFIER NULL,
    [CreatedBy]        UNIQUEIDENTIFIER NULL,
    [CreatedDate]      DATETIME         NULL,
    [ModifiedBy]       UNIQUEIDENTIFIER NULL,
    [ModifiedDate]     DATETIME         NULL,
    [Picture]          NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[CompanyAllocation]...';


GO
CREATE TABLE [dbo].[CompanyAllocation] (
    [Id]            UNIQUEIDENTIFIER NOT NULL,
    [Membership_Id] UNIQUEIDENTIFIER NOT NULL,
    [Company_Id]    UNIQUEIDENTIFIER NOT NULL,
    [RowStatus]     INT              NOT NULL,
    [Employee_Id]   UNIQUEIDENTIFIER NULL,
    [CreatedBy]     UNIQUEIDENTIFIER NULL,
    [CreatedDate]   DATETIME         NULL,
    [ModifiedBy]    UNIQUEIDENTIFIER NULL,
    [ModifiedDate]  DATETIME         NULL,
    [Picture]       NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_CompanyAllocation] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Membership]...';


GO
CREATE TABLE [dbo].[Membership] (
    [Id]                         UNIQUEIDENTIFIER NOT NULL,
    [Name]                       NVARCHAR (50)    NOT NULL,
    [Username]                   NVARCHAR (50)    NULL,
    [Password]                   NVARCHAR (50)    NOT NULL,
    [Email]                      NVARCHAR (2500)  NOT NULL,
    [IsApproved]                 BIT              NOT NULL,
    [IsLockedOut]                BIT              NOT NULL,
    [LastLoginDate]              DATETIME         NULL,
    [LastPasswordChangedDate]    DATETIME         NULL,
    [LastLockoutDate]            DATETIME         NULL,
    [FailedPasswordAttemptCount] INT              NULL,
    [ResetPasswordToken]         NVARCHAR (100)   NULL,
    [TokenExpirationDate]        DATETIME         NULL,
    [RowStatus]                  INT              NOT NULL,
    [Employee_Id]                UNIQUEIDENTIFIER NULL,
    [CreatedBy]                  UNIQUEIDENTIFIER NULL,
    [CreatedDate]                DATETIME         NULL,
    [ModifiedBy]                 UNIQUEIDENTIFIER NULL,
    [ModifiedDate]               DATETIME         NULL,
    [Picture]                    NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Membership] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UC_Email] UNIQUE NONCLUSTERED ([Email] ASC)
);


GO
PRINT N'Creando [dbo].[FK_CompanyAllocation_Company]...';


GO
ALTER TABLE [dbo].[CompanyAllocation]
    ADD CONSTRAINT [FK_CompanyAllocation_Company] FOREIGN KEY ([Company_Id]) REFERENCES [dbo].[Company] ([Id]);


GO
PRINT N'Creando [dbo].[FK_CompanyAllocation_Membership]...';


GO
ALTER TABLE [dbo].[CompanyAllocation]
    ADD CONSTRAINT [FK_CompanyAllocation_Membership] FOREIGN KEY ([Membership_Id]) REFERENCES [dbo].[Membership] ([Id]);


GO
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

GO
DECLARE @VarDecimalSupported AS BIT;

SELECT @VarDecimalSupported = 0;

IF ((ServerProperty(N'EngineEdition') = 3)
    AND (((@@microsoftversion / power(2, 24) = 9)
          AND (@@microsoftversion & 0xffff >= 3024))
         OR ((@@microsoftversion / power(2, 24) = 10)
             AND (@@microsoftversion & 0xffff >= 1600))))
    SELECT @VarDecimalSupported = 1;

IF (@VarDecimalSupported > 0)
    BEGIN
        EXECUTE sp_db_vardecimal_storage_format N'$(DatabaseName)', 'ON';
    END


GO
PRINT N'Actualización completada.';


GO
