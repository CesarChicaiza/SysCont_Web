/*
Script de implementación para SysCont_Company

Una herramienta generó este código.
Los cambios realizados en este archivo podrían generar un comportamiento incorrecto y se perderán si
se vuelve a generar el código.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "SysCont_Company"
:setvar DefaultFilePrefix "SysCont_Company"
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
PRINT N'Creando [dbo].[Account]...';


GO
CREATE TABLE [dbo].[Account] (
    [Id] INT NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Account_Type]...';


GO
CREATE TABLE [dbo].[Account_Type] (
    [Id] INT NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Activity]...';


GO
CREATE TABLE [dbo].[Activity] (
    [Id]                    UNIQUEIDENTIFIER NOT NULL,
    [Subject]               NVARCHAR (500)   NULL,
    [ScheduleDateFrom]      DATETIME         NULL,
    [ScheduleDateTo]        DATETIME         NULL,
    [RealDateFrom]          DATETIME         NULL,
    [RealDateTo]            DATETIME         NULL,
    [Place]                 NVARCHAR (MAX)   NULL,
    [Activity_Status_Id]    UNIQUEIDENTIFIER NULL,
    [Activity_Priority_Id]  UNIQUEIDENTIFIER NULL,
    [Activity_Type_Id]      UNIQUEIDENTIFIER NULL,
    [Activity_PlaceType_Id] UNIQUEIDENTIFIER NULL,
    [Entity_Id]             UNIQUEIDENTIFIER NULL,
    [ExternalId]            UNIQUEIDENTIFIER NULL,
    [ExternalName]          NVARCHAR (MAX)   NULL,
    [Comments]              NVARCHAR (MAX)   NULL,
    [RowStatus]             INT              NOT NULL,
    [Locked]                BIT              NOT NULL,
    [Required]              BIT              NOT NULL,
    [Employee_Id]           UNIQUEIDENTIFIER NULL,
    [CreatedBy]             UNIQUEIDENTIFIER NULL,
    [CreatedDate]           DATETIME         NULL,
    [ModifiedBy]            UNIQUEIDENTIFIER NULL,
    [ModifiedDate]          DATETIME         NULL,
    [Picture]               NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Activity] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Activity_Participant]...';


GO
CREATE TABLE [dbo].[Activity_Participant] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Mandatory]    BIT              NULL,
    [Activity_Id]  UNIQUEIDENTIFIER NULL,
    [Entity_Id]    UNIQUEIDENTIFIER NULL,
    [ExternalId]   UNIQUEIDENTIFIER NULL,
    [Attendance]   BIT              NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Activity_Participant] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Activity_PlaceType]...';


GO
CREATE TABLE [dbo].[Activity_PlaceType] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Name]         NVARCHAR (MAX)   NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Activity_PlaceType] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Activity_Priority]...';


GO
CREATE TABLE [dbo].[Activity_Priority] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Number]       INT              NOT NULL,
    [Name]         NVARCHAR (500)   NOT NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_ActivityPriority] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Activity_Status]...';


GO
CREATE TABLE [dbo].[Activity_Status] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Name]         NVARCHAR (500)   NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_ActivityStatus] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Activity_Task]...';


GO
CREATE TABLE [dbo].[Activity_Task] (
    [Id]                UNIQUEIDENTIFIER NOT NULL,
    [Description]       NVARCHAR (MAX)   NULL,
    [DueDate]           DATETIME         NULL,
    [Responsible]       NVARCHAR (MAX)   NULL,
    [Done]              BIT              NULL,
    [Activity_Topic_Id] UNIQUEIDENTIFIER NULL,
    [RowStatus]         INT              NOT NULL,
    [Locked]            BIT              NOT NULL,
    [Required]          BIT              NOT NULL,
    [Employee_Id]       UNIQUEIDENTIFIER NULL,
    [CreatedBy]         UNIQUEIDENTIFIER NULL,
    [CreatedDate]       DATETIME         NULL,
    [ModifiedBy]        UNIQUEIDENTIFIER NULL,
    [ModifiedDate]      DATETIME         NULL,
    [Picture]           NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Activity_NextAction] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Activity_Topic]...';


GO
CREATE TABLE [dbo].[Activity_Topic] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Name]         NVARCHAR (MAX)   NULL,
    [Description]  NVARCHAR (MAX)   NULL,
    [Accomplished] BIT              NULL,
    [Successful]   BIT              NULL,
    [Comments]     NVARCHAR (MAX)   NULL,
    [Activity_Id]  UNIQUEIDENTIFIER NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Activity_Topic] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Activity_Type]...';


GO
CREATE TABLE [dbo].[Activity_Type] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Name]         NVARCHAR (200)   NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[AddressType]...';


GO
CREATE TABLE [dbo].[AddressType] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Name]         NVARCHAR (500)   NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_AddressType] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Bank]...';


GO
CREATE TABLE [dbo].[Bank] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Code]         NVARCHAR (500)   NULL,
    [Name]         NVARCHAR (500)   NULL,
    [Country_Id]   UNIQUEIDENTIFIER NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Bank] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[BankAccount]...';


GO
CREATE TABLE [dbo].[BankAccount] (
    [Id]                  UNIQUEIDENTIFIER NOT NULL,
    [Number]              NVARCHAR (2000)  NOT NULL,
    [Total]               DECIMAL (18, 2)  NOT NULL,
    [Bank_Id]             UNIQUEIDENTIFIER NOT NULL,
    [Company_Id]          UNIQUEIDENTIFIER NOT NULL,
    [BankAccount_Type_Id] UNIQUEIDENTIFIER NOT NULL,
    [RowStatus]           INT              NOT NULL,
    [Locked]              BIT              NOT NULL,
    [Required]            BIT              NOT NULL,
    [Employee_Id]         UNIQUEIDENTIFIER NULL,
    [CreatedBy]           UNIQUEIDENTIFIER NULL,
    [CreatedDate]         DATETIME         NULL,
    [ModifiedBy]          UNIQUEIDENTIFIER NULL,
    [ModifiedDate]        DATETIME         NULL,
    [Picture]             NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_BankAccount] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[BankAccount_Movement]...';


GO
CREATE TABLE [dbo].[BankAccount_Movement] (
    [Id]                           UNIQUEIDENTIFIER NOT NULL,
    [Sequential]                   BIGINT           NULL,
    [BankAccount_Movement_Type_Id] UNIQUEIDENTIFIER NOT NULL,
    [BankAccount_Id]               UNIQUEIDENTIFIER NOT NULL,
    [ResponsibleEmployee_Id]       UNIQUEIDENTIFIER NOT NULL,
    [TransactionDate]              DATE             NOT NULL,
    [Amount]                       DECIMAL (18, 2)  NOT NULL,
    [Bank_Id]                      UNIQUEIDENTIFIER NOT NULL,
    [VoucherNumber]                NVARCHAR (500)   NULL,
    [CheckNumber]                  NVARCHAR (500)   NULL,
    [RowStatus]                    INT              NOT NULL,
    [Locked]                       BIT              NOT NULL,
    [Required]                     BIT              NOT NULL,
    [Employee_Id]                  UNIQUEIDENTIFIER NULL,
    [CreatedBy]                    UNIQUEIDENTIFIER NULL,
    [CreatedDate]                  DATETIME         NULL,
    [ModifiedBy]                   UNIQUEIDENTIFIER NULL,
    [ModifiedDate]                 DATETIME         NULL,
    [Picture]                      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_BankAccountMovement] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[BankAccount_Movement_Type]...';


GO
CREATE TABLE [dbo].[BankAccount_Movement_Type] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Name]         NVARCHAR (150)   NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_BankAccountMovement_Type] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[BankAccount_Type]...';


GO
CREATE TABLE [dbo].[BankAccount_Type] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Name]         NVARCHAR (150)   NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_BankAccount_Type] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[BusinessItem]...';


GO
CREATE TABLE [dbo].[BusinessItem] (
    [Id]                       UNIQUEIDENTIFIER NOT NULL,
    [Name]                     NVARCHAR (300)   NULL,
    [ShortDescription]         NVARCHAR (MAX)   NULL,
    [FullDescription]          NVARCHAR (MAX)   NULL,
    [Code]                     NVARCHAR (300)   NULL,
    [EcommercePublished]       BIT              NULL,
    [EcommerceShowOnHomePage]  BIT              NULL,
    [CanBuy]                   BIT              NOT NULL,
    [CanSell]                  BIT              NOT NULL,
    [CanManufacture]           BIT              NOT NULL,
    [CanConsume]               BIT              NOT NULL,
    [BusinessItem_Category_Id] UNIQUEIDENTIFIER NOT NULL,
    [BusinessItem_Type_Id]     UNIQUEIDENTIFIER NOT NULL,
    [BusinessItem_Class_Id]    UNIQUEIDENTIFIER NOT NULL,
    [Warranty]                 NVARCHAR (MAX)   NULL,
    [RowStatus]                INT              NOT NULL,
    [Locked]                   BIT              NOT NULL,
    [Required]                 BIT              NOT NULL,
    [Employee_Id]              UNIQUEIDENTIFIER NULL,
    [CreatedBy]                UNIQUEIDENTIFIER NULL,
    [CreatedDate]              DATETIME         NULL,
    [ModifiedBy]               UNIQUEIDENTIFIER NULL,
    [ModifiedDate]             DATETIME         NULL,
    [Picture]                  NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_BusinessItem] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[BusinessItem_Category]...';


GO
CREATE TABLE [dbo].[BusinessItem_Category] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Name]         NVARCHAR (300)   NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_BusinessItem_Category] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[BusinessItem_Class]...';


GO
CREATE TABLE [dbo].[BusinessItem_Class] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Name]         VARCHAR (500)    NOT NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_BusinessItem_Class] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[BusinessItem_Discount]...';


GO
CREATE TABLE [dbo].[BusinessItem_Discount] (
    [Id]                 UNIQUEIDENTIFIER NOT NULL,
    [Discount]           DECIMAL (18, 5)  NULL,
    [Customer_Rating_Id] UNIQUEIDENTIFIER NULL,
    [BusinessItem_Id]    UNIQUEIDENTIFIER NULL,
    [RowStatus]          INT              NOT NULL,
    [Locked]             BIT              NOT NULL,
    [Required]           BIT              NOT NULL,
    [Employee_Id]        UNIQUEIDENTIFIER NULL,
    [CreatedBy]          UNIQUEIDENTIFIER NULL,
    [CreatedDate]        DATETIME         NULL,
    [ModifiedBy]         UNIQUEIDENTIFIER NULL,
    [ModifiedDate]       DATETIME         NULL,
    [Picture]            NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_BusinessItem_Discount] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[BusinessItem_Promotion]...';


GO
CREATE TABLE [dbo].[BusinessItem_Promotion] (
    [Id]                 UNIQUEIDENTIFIER NOT NULL,
    [Start]              DATETIME         NULL,
    [End]                DATETIME         NULL,
    [Type]               INT              NULL,
    [QuantityRequired]   DECIMAL (18, 5)  NULL,
    [DiscountPercentage] DECIMAL (18, 5)  NULL,
    [QuantityGift]       DECIMAL (18, 5)  NULL,
    [RowStatus]          INT              NOT NULL,
    [Locked]             BIT              NOT NULL,
    [Required]           BIT              NOT NULL,
    [Employee_Id]        UNIQUEIDENTIFIER NULL,
    [CreatedBy]          UNIQUEIDENTIFIER NULL,
    [CreatedDate]        DATETIME         NULL,
    [ModifiedBy]         UNIQUEIDENTIFIER NULL,
    [ModifiedDate]       DATETIME         NULL,
    [Picture]            NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_BusinessItem_Promotion] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[BusinessItem_Type]...';


GO
CREATE TABLE [dbo].[BusinessItem_Type] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Name]         NVARCHAR (200)   NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_BusinessItem_Type] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[BusinessItemVariation]...';


GO
CREATE TABLE [dbo].[BusinessItemVariation] (
    [Id]                      UNIQUEIDENTIFIER NOT NULL,
    [Name]                    NVARCHAR (300)   NOT NULL,
    [Price]                   DECIMAL (18, 5)  NOT NULL,
    [ShortDescription]        NVARCHAR (MAX)   NULL,
    [FullDescription]         NVARCHAR (MAX)   NULL,
    [Code]                    NVARCHAR (300)   NOT NULL,
    [EcommercePublished]      BIT              NULL,
    [EcommerceShowOnHomePage] BIT              NULL,
    [Stock]                   DECIMAL (18, 5)  NOT NULL,
    [BusinessItem_Id]         UNIQUEIDENTIFIER NOT NULL,
    [UnitOfMeasure_Id]        UNIQUEIDENTIFIER NULL,
    [RowStatus]               INT              NOT NULL,
    [Locked]                  BIT              NOT NULL,
    [Required]                BIT              NOT NULL,
    [Employee_Id]             UNIQUEIDENTIFIER NULL,
    [CreatedBy]               UNIQUEIDENTIFIER NULL,
    [CreatedDate]             DATETIME         NULL,
    [ModifiedBy]              UNIQUEIDENTIFIER NULL,
    [ModifiedDate]            DATETIME         NULL,
    [Picture]                 NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_BusinessItemVariation] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[BusinessItemVariation_Discount]...';


GO
CREATE TABLE [dbo].[BusinessItemVariation_Discount] (
    [Id]                       UNIQUEIDENTIFIER NOT NULL,
    [Discount]                 DECIMAL (18, 5)  NULL,
    [Customer_Rating_Id]       UNIQUEIDENTIFIER NULL,
    [BusinessItemVariation_Id] UNIQUEIDENTIFIER NULL,
    [RowStatus]                INT              NOT NULL,
    [Locked]                   BIT              NOT NULL,
    [Required]                 BIT              NOT NULL,
    [Employee_Id]              UNIQUEIDENTIFIER NULL,
    [CreatedBy]                UNIQUEIDENTIFIER NULL,
    [CreatedDate]              DATETIME         NULL,
    [ModifiedBy]               UNIQUEIDENTIFIER NULL,
    [ModifiedDate]             DATETIME         NULL,
    [Picture]                  NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_usinessItemVariation_Discount] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[BusinessOpportunity]...';


GO
CREATE TABLE [dbo].[BusinessOpportunity] (
    [Id]                                UNIQUEIDENTIFIER NOT NULL,
    [Date]                              DATETIME         NOT NULL,
    [DateClosing]                       DATETIME         NOT NULL,
    [Number]                            BIGINT           NULL,
    [Description]                       NVARCHAR (500)   NOT NULL,
    [Discount]                          DECIMAL (18, 5)  NULL,
    [Subtotal]                          DECIMAL (18, 5)  NULL,
    [Total]                             DECIMAL (18, 5)  NULL,
    [BusinessOpportunity_State_Id]      UNIQUEIDENTIFIER NULL,
    [BusinessOpportunity_LossReason_Id] UNIQUEIDENTIFIER NULL,
    [ImplementationTime]                NVARCHAR (MAX)   NULL,
    [Comments]                          NVARCHAR (MAX)   NULL,
    [Customer_Id]                       UNIQUEIDENTIFIER NOT NULL,
    [Campaign_Id]                       UNIQUEIDENTIFIER NULL,
    [SourceChannel_Id]                  UNIQUEIDENTIFIER NULL,
    [Customer_Contact_Id]               UNIQUEIDENTIFIER NULL,
    [RowStatus]                         INT              NOT NULL,
    [Locked]                            BIT              NOT NULL,
    [Required]                          BIT              NOT NULL,
    [Employee_Id]                       UNIQUEIDENTIFIER NULL,
    [CreatedBy]                         UNIQUEIDENTIFIER NULL,
    [CreatedDate]                       DATETIME         NULL,
    [ModifiedBy]                        UNIQUEIDENTIFIER NULL,
    [ModifiedDate]                      DATETIME         NULL,
    [Picture]                           NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_BusinessOpportunity] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[BusinessOpportunity_Item]...';


GO
CREATE TABLE [dbo].[BusinessOpportunity_Item] (
    [Id]                             UNIQUEIDENTIFIER NOT NULL,
    [Number]                         BIGINT           NULL,
    [Description]                    NVARCHAR (MAX)   NULL,
    [Name]                           NVARCHAR (MAX)   NULL,
    [FullDescription]                NVARCHAR (MAX)   NULL,
    [Quantity]                       DECIMAL (18, 5)  NOT NULL,
    [UnitPrice]                      DECIMAL (18, 5)  NULL,
    [CustomerUnitDiscountPercentage] DECIMAL (18, 5)  NULL,
    [SaleUnitDiscountPercentage]     DECIMAL (18, 5)  NULL,
    [TotalUnitDiscountPercentage]    DECIMAL (18, 5)  NULL,
    [TotalUnitDiscountAmount]        DECIMAL (18, 5)  NULL,
    [DiscountedUnitPrice]            DECIMAL (18, 5)  NULL,
    [TotalPrice]                     DECIMAL (18, 5)  NULL,
    [BusinessOpportunity_Id]         UNIQUEIDENTIFIER NULL,
    [BusinessItemVariation_Id]       UNIQUEIDENTIFIER NULL,
    [RowStatus]                      INT              NOT NULL,
    [Locked]                         BIT              NOT NULL,
    [Required]                       BIT              NOT NULL,
    [Employee_Id]                    UNIQUEIDENTIFIER NULL,
    [CreatedBy]                      UNIQUEIDENTIFIER NULL,
    [CreatedDate]                    DATETIME         NULL,
    [ModifiedBy]                     UNIQUEIDENTIFIER NULL,
    [ModifiedDate]                   DATETIME         NULL,
    [Picture]                        NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_BusinessOpportunity_Item] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[BusinessOpportunity_LossReason]...';


GO
CREATE TABLE [dbo].[BusinessOpportunity_LossReason] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Name]         NVARCHAR (500)   NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_BusinessOpportunity_LossReason] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[BusinessOpportunity_State]...';


GO
CREATE TABLE [dbo].[BusinessOpportunity_State] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Name]         NVARCHAR (500)   NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_BusinessOpportunity_State] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Campaign]...';


GO
CREATE TABLE [dbo].[Campaign] (
    [Id]               UNIQUEIDENTIFIER NOT NULL,
    [Name]             NVARCHAR (300)   NULL,
    [FromDate]         DATETIME         NULL,
    [ToDate]           DATETIME         NULL,
    [Campaign_Type_Id] UNIQUEIDENTIFIER NULL,
    [RowStatus]        INT              NOT NULL,
    [Locked]           BIT              NOT NULL,
    [Required]         BIT              NOT NULL,
    [Employee_Id]      UNIQUEIDENTIFIER NULL,
    [CreatedBy]        UNIQUEIDENTIFIER NULL,
    [CreatedDate]      DATETIME         NULL,
    [ModifiedBy]       UNIQUEIDENTIFIER NULL,
    [ModifiedDate]     DATETIME         NULL,
    [Picture]          NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Campaign] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Campaign_MassEmail]...';


GO
CREATE TABLE [dbo].[Campaign_MassEmail] (
    [Id]                        UNIQUEIDENTIFIER NOT NULL,
    [Total]                     DATETIME         NULL,
    [Date]                      DATETIME         NULL,
    [Opens]                     INT              NULL,
    [Clicks]                    INT              NULL,
    [Rebounds]                  INT              NULL,
    [Delivers]                  INT              NULL,
    [Active]                    BIT              NULL,
    [Email_Template_Id]         UNIQUEIDENTIFIER NULL,
    [Campaign_ScheduleEmail_Id] UNIQUEIDENTIFIER NULL,
    [Campaign_Id]               UNIQUEIDENTIFIER NULL,
    [Campaign_Segment_Id]       UNIQUEIDENTIFIER NULL,
    [RowStatus]                 INT              NOT NULL,
    [Locked]                    BIT              NOT NULL,
    [Required]                  BIT              NOT NULL,
    [Employee_Id]               UNIQUEIDENTIFIER NULL,
    [CreatedBy]                 UNIQUEIDENTIFIER NULL,
    [CreatedDate]               DATETIME         NULL,
    [ModifiedBy]                UNIQUEIDENTIFIER NULL,
    [ModifiedDate]              DATETIME         NULL,
    [Picture]                   NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Campaign_MassEmail] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Campaign_ScheduleEmail]...';


GO
CREATE TABLE [dbo].[Campaign_ScheduleEmail] (
    [Id]                        UNIQUEIDENTIFIER NOT NULL,
    [Since]                     DATETIME         NULL,
    [To]                        DATETIME         NULL,
    [Status]                    INT              NULL,
    [Email_Template_Id]         UNIQUEIDENTIFIER NULL,
    [Campaign_ScheduleEmail_Id] UNIQUEIDENTIFIER NULL,
    [Campaign_Id]               UNIQUEIDENTIFIER NULL,
    [Campaign_Segment_Id]       UNIQUEIDENTIFIER NULL,
    [RowStatus]                 INT              NOT NULL,
    [Locked]                    BIT              NOT NULL,
    [Required]                  BIT              NOT NULL,
    [Employee_Id]               UNIQUEIDENTIFIER NULL,
    [CreatedBy]                 UNIQUEIDENTIFIER NULL,
    [CreatedDate]               DATETIME         NULL,
    [ModifiedBy]                UNIQUEIDENTIFIER NULL,
    [ModifiedDate]              DATETIME         NULL,
    [Picture]                   NVARCHAR (MAX)   NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Campaign_Segment]...';


GO
CREATE TABLE [dbo].[Campaign_Segment] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Name]         NVARCHAR (50)    NULL,
    [Entity_Id]    UNIQUEIDENTIFIER NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Campaign_Segment] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Campaign_Type]...';


GO
CREATE TABLE [dbo].[Campaign_Type] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Name]         NVARCHAR (500)   NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Campaign_Type] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[City]...';


GO
CREATE TABLE [dbo].[City] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Name]         NVARCHAR (500)   NULL,
    [State_Id]     UNIQUEIDENTIFIER NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[CommunicationOptionType]...';


GO
CREATE TABLE [dbo].[CommunicationOptionType] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Name]         NVARCHAR (500)   NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_CommunicationOptionType] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Company]...';


GO
CREATE TABLE [dbo].[Company] (
    [Id]                 UNIQUEIDENTIFIER NOT NULL,
    [LegalId]            NVARCHAR (50)    NULL,
    [Name1]              NVARCHAR (2000)  NOT NULL,
    [Name2]              NVARCHAR (2000)  NOT NULL,
    [Address]            NVARCHAR (2000)  NOT NULL,
    [Phone]              NVARCHAR (200)   NOT NULL,
    [SignatureName]      NVARCHAR (500)   NULL,
    [SignatureKey]       NVARCHAR (500)   NULL,
    [AccountingRequired] NVARCHAR (500)   NOT NULL,
    [SpecialContributor] NVARCHAR (500)   NULL,
    [CurrencyCode]       NVARCHAR (500)   NULL,
    [CurrencyName]       NVARCHAR (500)   NULL,
    [WebSite]            NVARCHAR (500)   NULL,
    [Host]               NVARCHAR (300)   NULL,
    [SmtpHost]           NVARCHAR (500)   NULL,
    [SmtpPort]           INT              NULL,
    [SmtpEnableSsl]      BIT              NULL,
    [Image]              NVARCHAR (MAX)   NULL,
    [MainActivity]       NVARCHAR (MAX)   NOT NULL,
    [TaxPayerId]         NVARCHAR (100)   NOT NULL,
    [Currency_Id]        UNIQUEIDENTIFIER NOT NULL,
    [RowStatus]          INT              NOT NULL,
    [Locked]             BIT              NOT NULL,
    [Required]           BIT              NOT NULL,
    [Employee_Id]        UNIQUEIDENTIFIER NULL,
    [CreatedBy]          UNIQUEIDENTIFIER NULL,
    [CreatedDate]        DATETIME         NULL,
    [ModifiedBy]         UNIQUEIDENTIFIER NULL,
    [ModifiedDate]       DATETIME         NULL,
    [Picture]            NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Company_EmissionPoint]...';


GO
CREATE TABLE [dbo].[Company_EmissionPoint] (
    [Id]                         UNIQUEIDENTIFIER NOT NULL,
    [Code]                       NVARCHAR (2000)  NOT NULL,
    [Name]                       NVARCHAR (2000)  NOT NULL,
    [InvoiceSequential]          BIGINT           NOT NULL,
    [RemissionGuideSequential]   BIGINT           NOT NULL,
    [RetentionVoucherSequential] BIGINT           NOT NULL,
    [Company_Place_Id]           UNIQUEIDENTIFIER NOT NULL,
    [RowStatus]                  INT              NOT NULL,
    [Locked]                     BIT              NOT NULL,
    [Required]                   BIT              NOT NULL,
    [Employee_Id]                UNIQUEIDENTIFIER NULL,
    [CreatedBy]                  UNIQUEIDENTIFIER NULL,
    [CreatedDate]                DATETIME         NULL,
    [ModifiedBy]                 UNIQUEIDENTIFIER NULL,
    [ModifiedDate]               DATETIME         NULL,
    [Picture]                    NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Company_EmissionPoint] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Company_Place]...';


GO
CREATE TABLE [dbo].[Company_Place] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Code]         NVARCHAR (2000)  NOT NULL,
    [Name]         NVARCHAR (2000)  NOT NULL,
    [Address]      NVARCHAR (MAX)   NULL,
    [Phone]        NVARCHAR (500)   NULL,
    [Company_Id]   UNIQUEIDENTIFIER NULL,
    [City_Id]      UNIQUEIDENTIFIER NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Company_Place] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Contact]...';


GO
CREATE TABLE [dbo].[Contact] (
    [Id]                UNIQUEIDENTIFIER NOT NULL,
    [LegalId]           NVARCHAR (50)    NULL,
    [Photo]             NVARCHAR (MAX)   NULL,
    [Salutation_Id]     UNIQUEIDENTIFIER NULL,
    [Gender_Id]         UNIQUEIDENTIFIER NULL,
    [FirstName]         NVARCHAR (300)   NULL,
    [LastName]          NVARCHAR (300)   NULL,
    [Birth]             DATETIME         NULL,
    [Email]             NVARCHAR (1000)  NULL,
    [Phone1]            NVARCHAR (1000)  NULL,
    [Phone2]            NVARCHAR (1000)  NULL,
    [Phone3]            NVARCHAR (1000)  NULL,
    [DoNotCall]         BIT              NULL,
    [DoNotEmail]        BIT              NULL,
    [DoNotSMS]          BIT              NULL,
    [LastActivity]      DATETIME         NULL,
    [Description]       VARCHAR (MAX)    NULL,
    [Ocupation_Id]      UNIQUEIDENTIFIER NULL,
    [SourceChannel_Id]  UNIQUEIDENTIFIER NULL,
    [Contact_Rating_Id] UNIQUEIDENTIFIER NULL,
    [Language_Id]       UNIQUEIDENTIFIER NULL,
    [RowStatus]         INT              NOT NULL,
    [Locked]            BIT              NOT NULL,
    [Required]          BIT              NOT NULL,
    [Employee_Id]       UNIQUEIDENTIFIER NULL,
    [CreatedBy]         UNIQUEIDENTIFIER NULL,
    [CreatedDate]       DATETIME         NULL,
    [ModifiedBy]        UNIQUEIDENTIFIER NULL,
    [ModifiedDate]      DATETIME         NULL,
    [Picture]           NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Contact_Address]...';


GO
CREATE TABLE [dbo].[Contact_Address] (
    [Id]             UNIQUEIDENTIFIER NOT NULL,
    [Address]        NVARCHAR (500)   NOT NULL,
    [PostalCode]     NVARCHAR (50)    NULL,
    [Reference]      NVARCHAR (50)    NULL,
    [Coordinates]    NVARCHAR (100)   NULL,
    [City_Id]        UNIQUEIDENTIFIER NULL,
    [AddressType_Id] UNIQUEIDENTIFIER NULL,
    [Contact_Id]     UNIQUEIDENTIFIER NULL,
    [RowStatus]      INT              NOT NULL,
    [Locked]         BIT              NOT NULL,
    [Required]       BIT              NOT NULL,
    [Employee_Id]    UNIQUEIDENTIFIER NULL,
    [CreatedBy]      UNIQUEIDENTIFIER NULL,
    [CreatedDate]    DATETIME         NULL,
    [ModifiedBy]     UNIQUEIDENTIFIER NULL,
    [ModifiedDate]   DATETIME         NULL,
    [Picture]        NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Contact_Address] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Contact_ComunicationOption]...';


GO
CREATE TABLE [dbo].[Contact_ComunicationOption] (
    [Id]                         UNIQUEIDENTIFIER NOT NULL,
    [IsValid]                    BIT              NOT NULL,
    [Value]                      NVARCHAR (300)   NULL,
    [CommunicationOptionType_Id] UNIQUEIDENTIFIER NULL,
    [Contact_Id]                 UNIQUEIDENTIFIER NULL,
    [RowStatus]                  INT              NOT NULL,
    [Locked]                     BIT              NOT NULL,
    [Required]                   BIT              NOT NULL,
    [Employee_Id]                UNIQUEIDENTIFIER NULL,
    [CreatedBy]                  UNIQUEIDENTIFIER NULL,
    [CreatedDate]                DATETIME         NULL,
    [ModifiedBy]                 UNIQUEIDENTIFIER NULL,
    [ModifiedDate]               DATETIME         NULL,
    [Picture]                    NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Contact_ComunicationOption] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Contact_Department]...';


GO
CREATE TABLE [dbo].[Contact_Department] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Name]         NVARCHAR (500)   NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Contact_Department] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Contact_Rating]...';


GO
CREATE TABLE [dbo].[Contact_Rating] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Name]         NVARCHAR (500)   NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Contact_Rating] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Contract]...';


GO
CREATE TABLE [dbo].[Contract] (
    [Id]                    UNIQUEIDENTIFIER NOT NULL,
    [Number]                BIGINT           NULL,
    [PhysicalNumber]        NVARCHAR (100)   NULL,
    [SignCustomerName]      NVARCHAR (500)   NULL,
    [SignCompanyName]       NVARCHAR (500)   NULL,
    [SigningDate]           DATE             NULL,
    [ValidityStart]         DATE             NULL,
    [ValidityEnd]           DATE             NULL,
    [RealEnd]               DATE             NULL,
    [Contract_EndReason_Id] UNIQUEIDENTIFIER NULL,
    [Contract_Status_Id]    UNIQUEIDENTIFIER NULL,
    [Contract_Type_Id]      UNIQUEIDENTIFIER NOT NULL,
    [Sale_Id]               UNIQUEIDENTIFIER NULL,
    [RowStatus]             INT              NOT NULL,
    [Locked]                BIT              NOT NULL,
    [Required]              BIT              NOT NULL,
    [Employee_Id]           UNIQUEIDENTIFIER NULL,
    [CreatedBy]             UNIQUEIDENTIFIER NULL,
    [CreatedDate]           DATETIME         NULL,
    [ModifiedBy]            UNIQUEIDENTIFIER NULL,
    [ModifiedDate]          DATETIME         NULL,
    [Picture]               NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Contract] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Contract_EndReason]...';


GO
CREATE TABLE [dbo].[Contract_EndReason] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Name]         NVARCHAR (1000)  NOT NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Contract_EndReason] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Contract_ProgressPaymentRule]...';


GO
CREATE TABLE [dbo].[Contract_ProgressPaymentRule] (
    [Id]                UNIQUEIDENTIFIER NOT NULL,
    [AdvancePercentage] DECIMAL (4, 2)   NOT NULL,
    [InvoicePercentage] DECIMAL (4, 2)   NOT NULL,
    [Contract_Id]       UNIQUEIDENTIFIER NOT NULL,
    [RowStatus]         INT              NOT NULL,
    [Locked]            BIT              NOT NULL,
    [Required]          BIT              NOT NULL,
    [Employee_Id]       UNIQUEIDENTIFIER NULL,
    [CreatedBy]         UNIQUEIDENTIFIER NULL,
    [CreatedDate]       DATETIME         NULL,
    [ModifiedBy]        UNIQUEIDENTIFIER NULL,
    [ModifiedDate]      DATETIME         NULL,
    [Picture]           NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Contract_ProgressPaymentRule] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Contract_RecurrenceType]...';


GO
CREATE TABLE [dbo].[Contract_RecurrenceType] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Name]         NVARCHAR (250)   NOT NULL,
    [Months]       INT              NOT NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Contract_RecurrenceType] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Contract_RecurringPaymentRule]...';


GO
CREATE TABLE [dbo].[Contract_RecurringPaymentRule] (
    [Id]                         UNIQUEIDENTIFIER NOT NULL,
    [Start]                      DATE             NOT NULL,
    [End]                        DATE             NULL,
    [Contract_Id]                UNIQUEIDENTIFIER NOT NULL,
    [Contract_RecurrenceType_Id] UNIQUEIDENTIFIER NOT NULL,
    [Customer_PaymentOption_Id]  UNIQUEIDENTIFIER NOT NULL,
    [RowStatus]                  INT              NOT NULL,
    [Locked]                     BIT              NOT NULL,
    [Required]                   BIT              NOT NULL,
    [Employee_Id]                UNIQUEIDENTIFIER NULL,
    [CreatedBy]                  UNIQUEIDENTIFIER NULL,
    [CreatedDate]                DATETIME         NULL,
    [ModifiedBy]                 UNIQUEIDENTIFIER NULL,
    [ModifiedDate]               DATETIME         NULL,
    [Picture]                    NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Contract_RecurringPaymentRule] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Contract_Status]...';


GO
CREATE TABLE [dbo].[Contract_Status] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Name]         NVARCHAR (500)   NOT NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Contract_Status] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Contract_Type]...';


GO
CREATE TABLE [dbo].[Contract_Type] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Name]         NVARCHAR (500)   NULL,
    [Title]        NVARCHAR (MAX)   NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Contract_Type] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Contract_TypeSection]...';


GO
CREATE TABLE [dbo].[Contract_TypeSection] (
    [Id]               UNIQUEIDENTIFIER NOT NULL,
    [Title]            NVARCHAR (MAX)   NULL,
    [Content]          NVARCHAR (MAX)   NULL,
    [Order]            INT              NULL,
    [Contract_Type_Id] UNIQUEIDENTIFIER NULL,
    [RowStatus]        INT              NOT NULL,
    [Locked]           BIT              NOT NULL,
    [Required]         BIT              NOT NULL,
    [Employee_Id]      UNIQUEIDENTIFIER NULL,
    [CreatedBy]        UNIQUEIDENTIFIER NULL,
    [CreatedDate]      DATETIME         NULL,
    [ModifiedBy]       UNIQUEIDENTIFIER NULL,
    [ModifiedDate]     DATETIME         NULL,
    [Picture]          NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Contract_TypeSection] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Country]...';


GO
CREATE TABLE [dbo].[Country] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Name]         NVARCHAR (500)   NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Currency]...';


GO
CREATE TABLE [dbo].[Currency] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Code]         NVARCHAR (50)    NOT NULL,
    [Name]         NVARCHAR (50)    NOT NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Currency] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Customer]...';


GO
CREATE TABLE [dbo].[Customer] (
    [Id]                           UNIQUEIDENTIFIER NOT NULL,
    [Parent_Id]                    UNIQUEIDENTIFIER NULL,
    [LegalIdType_Id]               UNIQUEIDENTIFIER NULL,
    [LegalId]                      NVARCHAR (50)    NULL,
    [Photo]                        NVARCHAR (MAX)   NULL,
    [Salutation_Id]                UNIQUEIDENTIFIER NULL,
    [Gender_Id]                    UNIQUEIDENTIFIER NULL,
    [Name1]                        NVARCHAR (300)   NULL,
    [Name2]                        NVARCHAR (300)   NULL,
    [Birth]                        DATETIME         NULL,
    [Email]                        NVARCHAR (1000)  NULL,
    [Phone1]                       NVARCHAR (1000)  NULL,
    [Phone2]                       NVARCHAR (1000)  NULL,
    [Phone3]                       NVARCHAR (1000)  NULL,
    [DoNotCall]                    BIT              NULL,
    [DoNotEmail]                   BIT              NULL,
    [DoNotSMS]                     BIT              NULL,
    [LastActivity]                 DATETIME         NULL,
    [Description]                  VARCHAR (MAX)    NULL,
    [Territory_Id]                 UNIQUEIDENTIFIER NULL,
    [Industry_Id]                  UNIQUEIDENTIFIER NULL,
    [Customer_Type_Id]             UNIQUEIDENTIFIER NULL,
    [Customer_RelationshipType_Id] UNIQUEIDENTIFIER NULL,
    [SourceChannel_Id]             UNIQUEIDENTIFIER NULL,
    [Campaign_Id]                  UNIQUEIDENTIFIER NULL,
    [Language_Id]                  UNIQUEIDENTIFIER NULL,
    [Customer_Rating_Id]           UNIQUEIDENTIFIER NOT NULL,
    [Customer_Class_Id]            UNIQUEIDENTIFIER NOT NULL,
    [RowStatus]                    INT              NOT NULL,
    [Locked]                       BIT              NOT NULL,
    [Required]                     BIT              NOT NULL,
    [Employee_Id]                  UNIQUEIDENTIFIER NULL,
    [CreatedBy]                    UNIQUEIDENTIFIER NULL,
    [CreatedDate]                  DATETIME         NULL,
    [ModifiedBy]                   UNIQUEIDENTIFIER NULL,
    [ModifiedDate]                 DATETIME         NULL,
    [Picture]                      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Customer_Address]...';


GO
CREATE TABLE [dbo].[Customer_Address] (
    [Id]             UNIQUEIDENTIFIER NOT NULL,
    [Address]        NVARCHAR (500)   NOT NULL,
    [PostalCode]     NVARCHAR (50)    NULL,
    [Reference]      NVARCHAR (MAX)   NULL,
    [Shipping]       BIT              NOT NULL,
    [Billing]        BIT              NOT NULL,
    [Coordinates]    NVARCHAR (100)   NULL,
    [City_Id]        UNIQUEIDENTIFIER NULL,
    [AddressType_Id] UNIQUEIDENTIFIER NULL,
    [Customer_Id]    UNIQUEIDENTIFIER NULL,
    [RowStatus]      INT              NOT NULL,
    [Locked]         BIT              NOT NULL,
    [Required]       BIT              NOT NULL,
    [Employee_Id]    UNIQUEIDENTIFIER NULL,
    [CreatedBy]      UNIQUEIDENTIFIER NULL,
    [CreatedDate]    DATETIME         NULL,
    [ModifiedBy]     UNIQUEIDENTIFIER NULL,
    [ModifiedDate]   DATETIME         NULL,
    [Picture]        NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Customer_Address] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Customer_Class]...';


GO
CREATE TABLE [dbo].[Customer_Class] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Name]         VARCHAR (500)    NOT NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Customer_Class] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Customer_ComunicationOption]...';


GO
CREATE TABLE [dbo].[Customer_ComunicationOption] (
    [Id]                         UNIQUEIDENTIFIER NOT NULL,
    [IsValid]                    BIT              NOT NULL,
    [Value]                      NVARCHAR (300)   NULL,
    [CommunicationOptionType_Id] UNIQUEIDENTIFIER NULL,
    [Customer_Id]                UNIQUEIDENTIFIER NULL,
    [RowStatus]                  INT              NOT NULL,
    [Locked]                     BIT              NOT NULL,
    [Required]                   BIT              NOT NULL,
    [Employee_Id]                UNIQUEIDENTIFIER NULL,
    [CreatedBy]                  UNIQUEIDENTIFIER NULL,
    [CreatedDate]                DATETIME         NULL,
    [ModifiedBy]                 UNIQUEIDENTIFIER NULL,
    [ModifiedDate]               DATETIME         NULL,
    [Picture]                    NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Customer_ComunicationOption] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Customer_Contact]...';


GO
CREATE TABLE [dbo].[Customer_Contact] (
    [Id]                    UNIQUEIDENTIFIER NOT NULL,
    [Contact_Department_Id] UNIQUEIDENTIFIER NULL,
    [JobTitle]              NVARCHAR (50)    NULL,
    [Name]                  NVARCHAR (250)   NULL,
    [Influencer]            BIT              NULL,
    [DecisionMaker]         BIT              NULL,
    [Start]                 DATETIME         NULL,
    [End]                   DATETIME         NULL,
    [Main]                  BIT              NOT NULL,
    [Customer_Id]           UNIQUEIDENTIFIER NOT NULL,
    [Contact_Id]            UNIQUEIDENTIFIER NOT NULL,
    [RowStatus]             INT              NOT NULL,
    [Locked]                BIT              NOT NULL,
    [Required]              BIT              NOT NULL,
    [Employee_Id]           UNIQUEIDENTIFIER NULL,
    [CreatedBy]             UNIQUEIDENTIFIER NULL,
    [CreatedDate]           DATETIME         NULL,
    [ModifiedBy]            UNIQUEIDENTIFIER NULL,
    [ModifiedDate]          DATETIME         NULL,
    [Picture]               NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_CustomerContact] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Customer_Label]...';


GO
CREATE TABLE [dbo].[Customer_Label] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Name]         NVARCHAR (300)   NOT NULL,
    [Customer_Id]  UNIQUEIDENTIFIER NOT NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Customer_Label] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Customer_PaymentOption]...';


GO
CREATE TABLE [dbo].[Customer_PaymentOption] (
    [Id]                 UNIQUEIDENTIFIER NOT NULL,
    [OwnerLegalId]       NVARCHAR (500)   NULL,
    [OwnerName]          NVARCHAR (500)   NULL,
    [Number]             NVARCHAR (50)    NULL,
    [ExpirationDate]     DATETIME         NULL,
    [Bank_Id]            UNIQUEIDENTIFIER NULL,
    [Payment_Subtype_Id] UNIQUEIDENTIFIER NULL,
    [Customer_Id]        UNIQUEIDENTIFIER NULL,
    [RowStatus]          INT              NOT NULL,
    [Locked]             BIT              NOT NULL,
    [Required]           BIT              NOT NULL,
    [Employee_Id]        UNIQUEIDENTIFIER NULL,
    [CreatedBy]          UNIQUEIDENTIFIER NULL,
    [CreatedDate]        DATETIME         NULL,
    [ModifiedBy]         UNIQUEIDENTIFIER NULL,
    [ModifiedDate]       DATETIME         NULL,
    [Picture]            NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Customer_PaymentOption] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Customer_Rating]...';


GO
CREATE TABLE [dbo].[Customer_Rating] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Name]         NVARCHAR (500)   NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Customer_Rating] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Customer_RelationshipType]...';


GO
CREATE TABLE [dbo].[Customer_RelationshipType] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Name]         NVARCHAR (500)   NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Customer_RelationshipType] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Customer_Type]...';


GO
CREATE TABLE [dbo].[Customer_Type] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Name]         NVARCHAR (500)   NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_CustomerType] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[CustomerSegments]...';


GO
CREATE TABLE [dbo].[CustomerSegments] (
    [Id]                   UNIQUEIDENTIFIER NOT NULL,
    [Name]                 NVARCHAR (500)   NULL,
    [Ammount]              DECIMAL (18, 5)  NULL,
    [Date]                 DATETIME         NULL,
    [GenderList]           NVARCHAR (500)   NULL,
    [CitiesList]           NVARCHAR (MAX)   NULL,
    [LanguagesList]        NVARCHAR (1000)  NULL,
    [OpportunityStateList] NVARCHAR (500)   NULL,
    [ContractStateList]    NVARCHAR (1000)  NULL,
    [RowStatus]            INT              NOT NULL,
    [Locked]               BIT              NOT NULL,
    [Required]             BIT              NOT NULL,
    [Employee_Id]          UNIQUEIDENTIFIER NULL,
    [CreatedBy]            UNIQUEIDENTIFIER NULL,
    [CreatedDate]          DATETIME         NULL,
    [ModifiedBy]           UNIQUEIDENTIFIER NULL,
    [ModifiedDate]         DATETIME         NULL,
    [Picture]              NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_CustomerSegments] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Driver]...';


GO
CREATE TABLE [dbo].[Driver] (
    [Id]             UNIQUEIDENTIFIER NOT NULL,
    [Name]           NVARCHAR (500)   NULL,
    [Phone]          NVARCHAR (50)    NULL,
    [LegalIdType_Id] UNIQUEIDENTIFIER NULL,
    [LegalId]        NVARCHAR (50)    NULL,
    [RowStatus]      INT              NOT NULL,
    [Locked]         BIT              NOT NULL,
    [Required]       BIT              NOT NULL,
    [Employee_Id]    UNIQUEIDENTIFIER NULL,
    [CreatedBy]      UNIQUEIDENTIFIER NULL,
    [CreatedDate]    DATETIME         NULL,
    [ModifiedBy]     UNIQUEIDENTIFIER NULL,
    [ModifiedDate]   DATETIME         NULL,
    [Picture]        NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Driver] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Employee]...';


GO
CREATE TABLE [dbo].[Employee] (
    [Id]                       UNIQUEIDENTIFIER NOT NULL,
    [Name]                     NVARCHAR (300)   NULL,
    [Phone]                    NVARCHAR (100)   NULL,
    [Birth]                    DATETIME         NULL,
    [Email]                    NVARCHAR (200)   NULL,
    [Password]                 NVARCHAR (200)   NULL,
    [Appointment]              NVARCHAR (200)   NULL,
    [Company_Place_Id]         UNIQUEIDENTIFIER NULL,
    [Company_EmissionPoint_Id] UNIQUEIDENTIFIER NULL,
    [Role_Id]                  UNIQUEIDENTIFIER NULL,
    [RowStatus]                INT              NOT NULL,
    [Locked]                   BIT              NOT NULL,
    [Required]                 BIT              NOT NULL,
    [Employee_Id]              UNIQUEIDENTIFIER NULL,
    [CreatedBy]                UNIQUEIDENTIFIER NULL,
    [CreatedDate]              DATETIME         NULL,
    [ModifiedBy]               UNIQUEIDENTIFIER NULL,
    [ModifiedDate]             DATETIME         NULL,
    [Picture]                  NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Employee_Parent]...';


GO
CREATE TABLE [dbo].[Employee_Parent] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [EmployeeId]   UNIQUEIDENTIFIER NOT NULL,
    [ParentId]     UNIQUEIDENTIFIER NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_EmployeeParent] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Factory]...';


GO
CREATE TABLE [dbo].[Factory] (
    [Id]               UNIQUEIDENTIFIER NOT NULL,
    [Name]             NVARCHAR (500)   NOT NULL,
    [Description]      NVARCHAR (2000)  NOT NULL,
    [Company_Place_Id] UNIQUEIDENTIFIER NOT NULL,
    [RowStatus]        INT              NOT NULL,
    [Locked]           BIT              NOT NULL,
    [Required]         BIT              NOT NULL,
    [Employee_Id]      UNIQUEIDENTIFIER NULL,
    [CreatedBy]        UNIQUEIDENTIFIER NULL,
    [CreatedDate]      DATETIME         NULL,
    [ModifiedBy]       UNIQUEIDENTIFIER NULL,
    [ModifiedDate]     DATETIME         NULL,
    [Picture]          NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_ProductionCenter] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Gender]...';


GO
CREATE TABLE [dbo].[Gender] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Name]         NVARCHAR (500)   NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Industry]...';


GO
CREATE TABLE [dbo].[Industry] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Name]         NVARCHAR (500)   NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Industry] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Inventory]...';


GO
CREATE TABLE [dbo].[Inventory] (
    [Id]                         UNIQUEIDENTIFIER NOT NULL,
    [BusinessItemVariation_Name] NVARCHAR (150)   NULL,
    [AdmissionDate]              DATETIME         NOT NULL,
    [BusinessItemVariation_Id]   UNIQUEIDENTIFIER NOT NULL,
    [Cost]                       DECIMAL (18, 5)  NULL,
    [SalePrice]                  DECIMAL (18, 5)  NULL,
    [InventoryIncome_Id]         UNIQUEIDENTIFIER NOT NULL,
    [InventoryOutput_Id]         UNIQUEIDENTIFIER NULL,
    [Warehouse_Id]               UNIQUEIDENTIFIER NOT NULL,
    [Manufacture_Id]             UNIQUEIDENTIFIER NULL,
    [SaleInvoice_Id]             UNIQUEIDENTIFIER NULL,
    [Serial]                     NVARCHAR (200)   NULL,
    [Location]                   NVARCHAR (300)   NULL,
    [ExpirationDate]             DATETIME         NULL,
    [Inventory_Status_Id]        UNIQUEIDENTIFIER NOT NULL,
    [RowStatus]                  INT              NOT NULL,
    [Locked]                     BIT              NOT NULL,
    [Required]                   BIT              NOT NULL,
    [Employee_Id]                UNIQUEIDENTIFIER NULL,
    [CreatedBy]                  UNIQUEIDENTIFIER NULL,
    [CreatedDate]                DATETIME         NULL,
    [ModifiedBy]                 UNIQUEIDENTIFIER NULL,
    [ModifiedDate]               DATETIME         NULL,
    [Picture]                    NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Inventory] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Inventory_Status]...';


GO
CREATE TABLE [dbo].[Inventory_Status] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Name]         NVARCHAR (150)   NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Inventory_Status] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[InventoryIncome]...';


GO
CREATE TABLE [dbo].[InventoryIncome] (
    [Id]                   UNIQUEIDENTIFIER NOT NULL,
    [TransactionDate]      DATETIME         NOT NULL,
    [Sequential]           BIGINT           NULL,
    [Purchase_Id]          UNIQUEIDENTIFIER NULL,
    [InventoryTransfer_Id] UNIQUEIDENTIFIER NULL,
    [Warehouse_Id]         UNIQUEIDENTIFIER NOT NULL,
    [RowStatus]            INT              NOT NULL,
    [Locked]               BIT              NOT NULL,
    [Required]             BIT              NOT NULL,
    [Employee_Id]          UNIQUEIDENTIFIER NULL,
    [CreatedBy]            UNIQUEIDENTIFIER NULL,
    [CreatedDate]          DATETIME         NULL,
    [ModifiedBy]           UNIQUEIDENTIFIER NULL,
    [ModifiedDate]         DATETIME         NULL,
    [Picture]              NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Income] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[InventoryIncome_Detail]...';


GO
CREATE TABLE [dbo].[InventoryIncome_Detail] (
    [Id]                         UNIQUEIDENTIFIER NOT NULL,
    [BusinessItemVariation_Name] NVARCHAR (150)   NULL,
    [Quantity]                   DECIMAL (18, 5)  NULL,
    [InventoryIncome_Id]         UNIQUEIDENTIFIER NOT NULL,
    [BusinessItemVariation_Id]   UNIQUEIDENTIFIER NOT NULL,
    [Comments]                   NVARCHAR (500)   NULL,
    [RowStatus]                  INT              NOT NULL,
    [Locked]                     BIT              NOT NULL,
    [Required]                   BIT              NOT NULL,
    [Employee_Id]                UNIQUEIDENTIFIER NULL,
    [CreatedBy]                  UNIQUEIDENTIFIER NULL,
    [CreatedDate]                DATETIME         NULL,
    [ModifiedBy]                 UNIQUEIDENTIFIER NULL,
    [ModifiedDate]               DATETIME         NULL,
    [Picture]                    NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_InventoryIncome_Detail] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[InventoryOutput]...';


GO
CREATE TABLE [dbo].[InventoryOutput] (
    [Id]              UNIQUEIDENTIFIER NOT NULL,
    [TransactionDate] DATETIME         NOT NULL,
    [Sequential]      BIGINT           NULL,
    [SaleInvoice_Id]  UNIQUEIDENTIFIER NULL,
    [Warehouse_Id]    UNIQUEIDENTIFIER NOT NULL,
    [RowStatus]       INT              NOT NULL,
    [Locked]          BIT              NOT NULL,
    [Required]        BIT              NOT NULL,
    [Employee_Id]     UNIQUEIDENTIFIER NULL,
    [CreatedBy]       UNIQUEIDENTIFIER NULL,
    [CreatedDate]     DATETIME         NULL,
    [ModifiedBy]      UNIQUEIDENTIFIER NULL,
    [ModifiedDate]    DATETIME         NULL,
    [Picture]         NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Output] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[InventoryOutput_Detail]...';


GO
CREATE TABLE [dbo].[InventoryOutput_Detail] (
    [Id]                         UNIQUEIDENTIFIER NOT NULL,
    [BusinessItemVariation_Name] NVARCHAR (150)   NULL,
    [Quantity]                   DECIMAL (18, 5)  NULL,
    [InventoryOutput_Id]         UNIQUEIDENTIFIER NOT NULL,
    [BusinessItemVariation_Id]   UNIQUEIDENTIFIER NOT NULL,
    [Comments]                   NVARCHAR (500)   NULL,
    [RowStatus]                  INT              NOT NULL,
    [Locked]                     BIT              NOT NULL,
    [Required]                   BIT              NOT NULL,
    [Employee_Id]                UNIQUEIDENTIFIER NULL,
    [CreatedBy]                  UNIQUEIDENTIFIER NULL,
    [CreatedDate]                DATETIME         NULL,
    [ModifiedBy]                 UNIQUEIDENTIFIER NULL,
    [ModifiedDate]               DATETIME         NULL,
    [Picture]                    NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_InventoryOutput_Detail] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[InventoryOutputDetail_Inventory]...';


GO
CREATE TABLE [dbo].[InventoryOutputDetail_Inventory] (
    [Id]                         UNIQUEIDENTIFIER NOT NULL,
    [BusinessItemVariation_Name] NVARCHAR (250)   NULL,
    [Inventory_Id]               UNIQUEIDENTIFIER NOT NULL,
    [InventoryOutput_Detail_Id]  UNIQUEIDENTIFIER NOT NULL,
    [RowStatus]                  INT              NOT NULL,
    [Locked]                     BIT              NOT NULL,
    [Required]                   BIT              NOT NULL,
    [Employee_Id]                UNIQUEIDENTIFIER NULL,
    [CreatedBy]                  UNIQUEIDENTIFIER NULL,
    [CreatedDate]                DATETIME         NULL,
    [ModifiedBy]                 UNIQUEIDENTIFIER NULL,
    [ModifiedDate]               DATETIME         NULL,
    [Picture]                    NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_InventoryOutputDetail] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[InventoryTransfer]...';


GO
CREATE TABLE [dbo].[InventoryTransfer] (
    [Id]                          UNIQUEIDENTIFIER NOT NULL,
    [Sequential]                  BIGINT           NULL,
    [OutputDate]                  DATETIME         NULL,
    [OriginEmployee_Id]           UNIQUEIDENTIFIER NOT NULL,
    [DestinyEmployee_Id]          UNIQUEIDENTIFIER NOT NULL,
    [OriginWarehouse_Id]          UNIQUEIDENTIFIER NOT NULL,
    [DestinyWareHouse_Id]         UNIQUEIDENTIFIER NOT NULL,
    [InventoryTransfer_Reason_Id] UNIQUEIDENTIFIER NOT NULL,
    [InventoryTransfer_Status_Id] UNIQUEIDENTIFIER NOT NULL,
    [RowStatus]                   INT              NOT NULL,
    [Locked]                      BIT              NOT NULL,
    [Required]                    BIT              NOT NULL,
    [Employee_Id]                 UNIQUEIDENTIFIER NULL,
    [CreatedBy]                   UNIQUEIDENTIFIER NULL,
    [CreatedDate]                 DATETIME         NULL,
    [ModifiedBy]                  UNIQUEIDENTIFIER NULL,
    [ModifiedDate]                DATETIME         NULL,
    [Picture]                     NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_InventoryTransfer] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[InventoryTransfer_Detail]...';


GO
CREATE TABLE [dbo].[InventoryTransfer_Detail] (
    [Id]                         UNIQUEIDENTIFIER NOT NULL,
    [BusinessItemVariation_Name] NVARCHAR (250)   NULL,
    [Quantity]                   DECIMAL (18, 5)  NULL,
    [BusinessItemVariation_Id]   UNIQUEIDENTIFIER NOT NULL,
    [InventoryTransfer_Id]       UNIQUEIDENTIFIER NOT NULL,
    [RowStatus]                  INT              NOT NULL,
    [Locked]                     BIT              NOT NULL,
    [Required]                   BIT              NOT NULL,
    [Employee_Id]                UNIQUEIDENTIFIER NULL,
    [CreatedBy]                  UNIQUEIDENTIFIER NULL,
    [CreatedDate]                DATETIME         NULL,
    [ModifiedBy]                 UNIQUEIDENTIFIER NULL,
    [ModifiedDate]               DATETIME         NULL,
    [Picture]                    NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_InventoryTransfer_Detail] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[InventoryTransfer_Reason]...';


GO
CREATE TABLE [dbo].[InventoryTransfer_Reason] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Name]         NVARCHAR (150)   NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_InventoryTransfer_Reason] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[InventoryTransfer_Status]...';


GO
CREATE TABLE [dbo].[InventoryTransfer_Status] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Name]         NVARCHAR (150)   NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_InventoryTransfer_Status] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[InventoryTransferDetail_Inventory]...';


GO
CREATE TABLE [dbo].[InventoryTransferDetail_Inventory] (
    [Id]                          UNIQUEIDENTIFIER NOT NULL,
    [BusinessItemVariation_Name]  NVARCHAR (250)   NULL,
    [Inventory_Id]                UNIQUEIDENTIFIER NOT NULL,
    [InventoryTransfer_Detail_Id] UNIQUEIDENTIFIER NOT NULL,
    [RowStatus]                   INT              NOT NULL,
    [Locked]                      BIT              NOT NULL,
    [Required]                    BIT              NOT NULL,
    [Employee_Id]                 UNIQUEIDENTIFIER NULL,
    [CreatedBy]                   UNIQUEIDENTIFIER NULL,
    [CreatedDate]                 DATETIME         NULL,
    [ModifiedBy]                  UNIQUEIDENTIFIER NULL,
    [ModifiedDate]                DATETIME         NULL,
    [Picture]                     NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_InventoryTransferDetail] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Language]...';


GO
CREATE TABLE [dbo].[Language] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Name]         NVARCHAR (509)   NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Language] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[LegalIdType]...';


GO
CREATE TABLE [dbo].[LegalIdType] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Code]         NVARCHAR (10)    NULL,
    [Name]         NVARCHAR (50)    NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_CustomerLegalIdType] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Manufacture]...';


GO
CREATE TABLE [dbo].[Manufacture] (
    [Id]                       UNIQUEIDENTIFIER NOT NULL,
    [BusinessItemVariation_Id] UNIQUEIDENTIFIER NOT NULL,
    [Quantity]                 DECIMAL (18, 5)  NOT NULL,
    [UnitOfMeasure_Id]         UNIQUEIDENTIFIER NULL,
    [Batch]                    BIGINT           NULL,
    [Date]                     DATETIME         NULL,
    [StartDate]                DATETIME         NULL,
    [EndDate]                  DATETIME         NULL,
    [Warehouse_Id]             UNIQUEIDENTIFIER NOT NULL,
    [Project_Id]               UNIQUEIDENTIFIER NOT NULL,
    [ResponsableEmployee_Id]   UNIQUEIDENTIFIER NOT NULL,
    [Manufacture_Status_Id]    UNIQUEIDENTIFIER NOT NULL,
    [Factory_Id]               UNIQUEIDENTIFIER NOT NULL,
    [RowStatus]                INT              NOT NULL,
    [Locked]                   BIT              NOT NULL,
    [Required]                 BIT              NOT NULL,
    [Employee_Id]              UNIQUEIDENTIFIER NULL,
    [CreatedBy]                UNIQUEIDENTIFIER NULL,
    [CreatedDate]              DATETIME         NULL,
    [ModifiedBy]               UNIQUEIDENTIFIER NULL,
    [ModifiedDate]             DATETIME         NULL,
    [Picture]                  NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Manufacture] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Manufacture_Item]...';


GO
CREATE TABLE [dbo].[Manufacture_Item] (
    [Id]                       INT              NOT NULL,
    [Name]                     NVARCHAR (200)   NULL,
    [BusinessItemVariation_Id] UNIQUEIDENTIFIER NOT NULL,
    [Manufacture_Id]           UNIQUEIDENTIFIER NOT NULL,
    [Quantity]                 DECIMAL (18, 2)  NOT NULL,
    [RowStatus]                INT              NOT NULL,
    [Locked]                   BIT              NOT NULL,
    [Required]                 BIT              NOT NULL,
    [Employee_Id]              UNIQUEIDENTIFIER NULL,
    [CreatedBy]                UNIQUEIDENTIFIER NULL,
    [CreatedDate]              DATETIME         NULL,
    [ModifiedBy]               UNIQUEIDENTIFIER NULL,
    [ModifiedDate]             DATETIME         NULL,
    [Picture]                  NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_ManufactureItem] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Manufacture_Status]...';


GO
CREATE TABLE [dbo].[Manufacture_Status] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Name]         NVARCHAR (MAX)   NOT NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Manufacture_Status] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[MassiveEmail]...';


GO
CREATE TABLE [dbo].[MassiveEmail] (
    [Id]                    UNIQUEIDENTIFIER NOT NULL,
    [Name]                  NVARCHAR (500)   NULL,
    [CustomerSegments_Id]   UNIQUEIDENTIFIER NOT NULL,
    [MassiveEmail_State_Id] UNIQUEIDENTIFIER NOT NULL,
    [Subject]               NVARCHAR (500)   NULL,
    [Title]                 NVARCHAR (500)   NULL,
    [Image]                 NVARCHAR (MAX)   NULL,
    [Text]                  NVARCHAR (1000)  NULL,
    [Signature]             NVARCHAR (500)   NULL,
    [SendDate]              DATETIME         NULL,
    [Received]              INT              NULL,
    [Read]                  INT              NULL,
    [Opened]                INT              NULL,
    [Rejected]              INT              NULL,
    [RowStatus]             INT              NOT NULL,
    [Locked]                BIT              NOT NULL,
    [Required]              BIT              NOT NULL,
    [Employee_Id]           UNIQUEIDENTIFIER NULL,
    [CreatedBy]             UNIQUEIDENTIFIER NULL,
    [CreatedDate]           DATETIME         NULL,
    [ModifiedBy]            UNIQUEIDENTIFIER NULL,
    [ModifiedDate]          DATETIME         NULL,
    [Picture]               NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_MassiveEmail] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[MassiveEmail_State]...';


GO
CREATE TABLE [dbo].[MassiveEmail_State] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Name]         NVARCHAR (500)   NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_MassiveEmail_State] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Module]...';


GO
CREATE TABLE [dbo].[Module] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Name]         NVARCHAR (50)    NOT NULL,
    [Color]        NVARCHAR (25)    NULL,
    [Icon]         NVARCHAR (50)    NULL,
    [HomePage]     NVARCHAR (MAX)   NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    CONSTRAINT [PK_Module] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Ocupation]...';


GO
CREATE TABLE [dbo].[Ocupation] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Name]         NVARCHAR (509)   NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Ocupation] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Payment_Subtype]...';


GO
CREATE TABLE [dbo].[Payment_Subtype] (
    [Id]              UNIQUEIDENTIFIER NOT NULL,
    [Name]            NVARCHAR (500)   NULL,
    [Payment_Type_Id] UNIQUEIDENTIFIER NULL,
    [RowStatus]       INT              NOT NULL,
    [Locked]          BIT              NOT NULL,
    [Required]        BIT              NOT NULL,
    [Employee_Id]     UNIQUEIDENTIFIER NULL,
    [CreatedBy]       UNIQUEIDENTIFIER NULL,
    [CreatedDate]     DATETIME         NULL,
    [ModifiedBy]      UNIQUEIDENTIFIER NULL,
    [ModifiedDate]    DATETIME         NULL,
    [Picture]         NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Payment_Subtype] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Payment_Type]...';


GO
CREATE TABLE [dbo].[Payment_Type] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Name]         NVARCHAR (500)   NULL,
    [Code]         NVARCHAR (5)     NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Payment_Type] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Permission]...';


GO
CREATE TABLE [dbo].[Permission] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Create]       INT              NULL,
    [Read]         INT              NULL,
    [Write]        INT              NULL,
    [Delete]       INT              NULL,
    [Entity_Id]    UNIQUEIDENTIFIER NULL,
    [Role_Id]      UNIQUEIDENTIFIER NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_RolePermission] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UC_Entity_Role] UNIQUE NONCLUSTERED ([Entity_Id] ASC, [Role_Id] ASC)
);


GO
PRINT N'Creando [dbo].[Product]...';


GO
CREATE TABLE [dbo].[Product] (
    [Id] INT NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Purchase]...';


GO
CREATE TABLE [dbo].[Purchase] (
    [Id]                 UNIQUEIDENTIFIER NOT NULL,
    [Date]               DATETIME         NOT NULL,
    [Sequential]         BIGINT           NULL,
    [Purchase_Status_Id] UNIQUEIDENTIFIER NOT NULL,
    [Subtotal]           DECIMAL (18, 5)  NULL,
    [Total]              DECIMAL (18, 5)  NULL,
    [Supplier_Id]        UNIQUEIDENTIFIER NOT NULL,
    [Company_Place_Id]   UNIQUEIDENTIFIER NOT NULL,
    [Sale_Id]            UNIQUEIDENTIFIER NULL,
    [RowStatus]          INT              NOT NULL,
    [Locked]             BIT              NOT NULL,
    [Required]           BIT              NOT NULL,
    [Employee_Id]        UNIQUEIDENTIFIER NULL,
    [CreatedBy]          UNIQUEIDENTIFIER NULL,
    [CreatedDate]        DATETIME         NULL,
    [ModifiedBy]         UNIQUEIDENTIFIER NULL,
    [ModifiedDate]       DATETIME         NULL,
    [Picture]            NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Purchase] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Purchase_Item]...';


GO
CREATE TABLE [dbo].[Purchase_Item] (
    [Id]                         UNIQUEIDENTIFIER NOT NULL,
    [BusinessItemVariation_Name] NVARCHAR (100)   NULL,
    [Quantity]                   DECIMAL (18, 5)  NOT NULL,
    [UnitDiscount]               DECIMAL (18, 5)  NULL,
    [UnitPrice]                  DECIMAL (18, 5)  NULL,
    [TotalPrice]                 DECIMAL (18, 5)  NULL,
    [Purchase_Id]                UNIQUEIDENTIFIER NOT NULL,
    [BusinessItemVariation_Id]   UNIQUEIDENTIFIER NOT NULL,
    [RowStatus]                  INT              NOT NULL,
    [Locked]                     BIT              NOT NULL,
    [Required]                   BIT              NOT NULL,
    [Employee_Id]                UNIQUEIDENTIFIER NULL,
    [CreatedBy]                  UNIQUEIDENTIFIER NULL,
    [CreatedDate]                DATETIME         NULL,
    [ModifiedBy]                 UNIQUEIDENTIFIER NULL,
    [ModifiedDate]               DATETIME         NULL,
    [Picture]                    NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Purchase_Item] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Purchase_Status]...';


GO
CREATE TABLE [dbo].[Purchase_Status] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Name]         NVARCHAR (150)   NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Purchase_Status] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[PurchaseInvoice]...';


GO
CREATE TABLE [dbo].[PurchaseInvoice] (
    [Id]                      UNIQUEIDENTIFIER NOT NULL,
    [Batch]                   NVARCHAR (100)   NULL,
    [Date]                    DATE             NOT NULL,
    [TotalAmountWithoutTaxes] DECIMAL (18, 5)  NOT NULL,
    [DiscountAmount]          DECIMAL (18, 5)  NOT NULL,
    [TaxAmount]               DECIMAL (18, 5)  NOT NULL,
    [TipAmount]               DECIMAL (18, 5)  NOT NULL,
    [TotalAmount]             DECIMAL (18, 5)  NOT NULL,
    [CurrencyCode]            NVARCHAR (MAX)   NULL,
    [CurrencyName]            NVARCHAR (MAX)   NULL,
    [SupplierName]            NVARCHAR (MAX)   NULL,
    [SupplierLegalIdTypeCode] NVARCHAR (MAX)   NULL,
    [SupplierLegalId]         NVARCHAR (MAX)   NULL,
    [SupplierAddress]         NVARCHAR (MAX)   NULL,
    [SupplierPhone]           NVARCHAR (MAX)   NULL,
    [SupplierEmail]           NVARCHAR (MAX)   NULL,
    [Number]                  NVARCHAR (MAX)   NULL,
    [DocumentNumber]          NVARCHAR (MAX)   NULL,
    [Informative1]            NVARCHAR (MAX)   NULL,
    [Informative2]            NVARCHAR (MAX)   NULL,
    [Informative3]            NVARCHAR (MAX)   NULL,
    [Informative4]            NVARCHAR (MAX)   NULL,
    [Informative5]            NVARCHAR (MAX)   NULL,
    [Informative6]            NVARCHAR (MAX)   NULL,
    [Informative7]            NVARCHAR (MAX)   NULL,
    [Informative8]            NVARCHAR (MAX)   NULL,
    [Informative9]            NVARCHAR (MAX)   NULL,
    [Informative10]           NVARCHAR (MAX)   NULL,
    [Informative11]           NVARCHAR (MAX)   NULL,
    [Informative12]           NVARCHAR (MAX)   NULL,
    [Informative13]           NVARCHAR (MAX)   NULL,
    [Informative14]           NVARCHAR (MAX)   NULL,
    [Informative15]           NVARCHAR (MAX)   NULL,
    [Purchase_Id]             UNIQUEIDENTIFIER NOT NULL,
    [RowStatus]               INT              NOT NULL,
    [Locked]                  BIT              NOT NULL,
    [Required]                BIT              NOT NULL,
    [Employee_Id]             UNIQUEIDENTIFIER NULL,
    [CreatedBy]               UNIQUEIDENTIFIER NULL,
    [CreatedDate]             DATETIME         NULL,
    [ModifiedBy]              UNIQUEIDENTIFIER NULL,
    [ModifiedDate]            DATETIME         NULL,
    [Picture]                 NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_PurchaseInvoice] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[PurchaseInvoice_Line]...';


GO
CREATE TABLE [dbo].[PurchaseInvoice_Line] (
    [Id]                       UNIQUEIDENTIFIER NOT NULL,
    [Code1]                    NVARCHAR (MAX)   NULL,
    [Description]              NVARCHAR (MAX)   NULL,
    [Quantity]                 DECIMAL (18, 5)  NOT NULL,
    [UnitPrice]                DECIMAL (18, 5)  NOT NULL,
    [UnitDiscount]             DECIMAL (18, 5)  NOT NULL,
    [TotalPrice]               DECIMAL (18, 5)  NULL,
    [BusinessItemVariation_Id] UNIQUEIDENTIFIER NOT NULL,
    [PurchaseInvoice_Id]       UNIQUEIDENTIFIER NOT NULL,
    [RowStatus]                INT              NOT NULL,
    [Locked]                   BIT              NOT NULL,
    [Required]                 BIT              NOT NULL,
    [Employee_Id]              UNIQUEIDENTIFIER NULL,
    [CreatedBy]                UNIQUEIDENTIFIER NULL,
    [CreatedDate]              DATETIME         NULL,
    [ModifiedBy]               UNIQUEIDENTIFIER NULL,
    [ModifiedDate]             DATETIME         NULL,
    [Picture]                  NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_PurchaseInvoice_Line] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[PurchaseInvoice_LineTax]...';


GO
CREATE TABLE [dbo].[PurchaseInvoice_LineTax] (
    [Id]                      UNIQUEIDENTIFIER NOT NULL,
    [Name]                    NVARCHAR (2000)  NOT NULL,
    [Code]                    NVARCHAR (20)    NOT NULL,
    [PercentageCode]          NVARCHAR (50)    NOT NULL,
    [Percentage]              DECIMAL (18, 5)  NOT NULL,
    [TaxableAmount]           DECIMAL (18, 5)  NOT NULL,
    [TaxAmount]               DECIMAL (18, 5)  NOT NULL,
    [PurchaseInvoice_Line_Id] UNIQUEIDENTIFIER NOT NULL,
    [Tax_Id]                  UNIQUEIDENTIFIER NOT NULL,
    [RowStatus]               INT              NOT NULL,
    [Locked]                  BIT              NOT NULL,
    [Required]                BIT              NOT NULL,
    [Employee_Id]             UNIQUEIDENTIFIER NULL,
    [CreatedBy]               UNIQUEIDENTIFIER NULL,
    [CreatedDate]             DATETIME         NULL,
    [ModifiedBy]              UNIQUEIDENTIFIER NULL,
    [ModifiedDate]            DATETIME         NULL,
    [Picture]                 NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_PurchaseInvoice_LineTax] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[PurchaseInvoice_Tax]...';


GO
CREATE TABLE [dbo].[PurchaseInvoice_Tax] (
    [Id]                 UNIQUEIDENTIFIER NOT NULL,
    [Name]               NVARCHAR (2000)  NOT NULL,
    [Code]               NVARCHAR (20)    NOT NULL,
    [PercentageCode]     NVARCHAR (50)    NOT NULL,
    [Percentage]         DECIMAL (18, 5)  NOT NULL,
    [TaxableAmount]      DECIMAL (18, 5)  NOT NULL,
    [TaxAmount]          DECIMAL (18, 5)  NOT NULL,
    [PurchaseInvoice_Id] UNIQUEIDENTIFIER NOT NULL,
    [Tax_Id]             UNIQUEIDENTIFIER NOT NULL,
    [RowStatus]          INT              NOT NULL,
    [Locked]             BIT              NOT NULL,
    [Required]           BIT              NOT NULL,
    [Employee_Id]        UNIQUEIDENTIFIER NULL,
    [CreatedBy]          UNIQUEIDENTIFIER NULL,
    [CreatedDate]        DATETIME         NULL,
    [ModifiedBy]         UNIQUEIDENTIFIER NULL,
    [ModifiedDate]       DATETIME         NULL,
    [Picture]            NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Purchase_Tax] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[PurchaseInvoicePayment]...';


GO
CREATE TABLE [dbo].[PurchaseInvoicePayment] (
    [Id]                        UNIQUEIDENTIFIER NOT NULL,
    [Date]                      DATETIME         NOT NULL,
    [OwnerLegalId]              NVARCHAR (MAX)   NULL,
    [OwnerName]                 NVARCHAR (MAX)   NULL,
    [ExpirationDate]            DATE             NULL,
    [BankCode]                  NVARCHAR (MAX)   NULL,
    [BankName]                  NVARCHAR (MAX)   NULL,
    [Number]                    NVARCHAR (MAX)   NULL,
    [SupplierLegalId]           NVARCHAR (MAX)   NULL,
    [SupplierName]              NVARCHAR (MAX)   NULL,
    [AutomaticDebit]            BIT              NOT NULL,
    [Amount]                    DECIMAL (18, 5)  NOT NULL,
    [Confirmed]                 BIT              NOT NULL,
    [Comment]                   NVARCHAR (MAX)   NULL,
    [PurchaseInvoice_Id]        UNIQUEIDENTIFIER NOT NULL,
    [Supplier_PaymentOption_Id] UNIQUEIDENTIFIER NOT NULL,
    [RowStatus]                 INT              NOT NULL,
    [Locked]                    BIT              NOT NULL,
    [Required]                  BIT              NOT NULL,
    [Employee_Id]               UNIQUEIDENTIFIER NULL,
    [CreatedBy]                 UNIQUEIDENTIFIER NULL,
    [CreatedDate]               DATETIME         NULL,
    [ModifiedBy]                UNIQUEIDENTIFIER NULL,
    [ModifiedDate]              DATETIME         NULL,
    [Picture]                   NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_PurchaseInvoicePayment] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[RemissionGuide]...';


GO
CREATE TABLE [dbo].[RemissionGuide] (
    [Id]                        UNIQUEIDENTIFIER NOT NULL,
    [Batch]                     NVARCHAR (100)   NULL,
    [Date]                      DATE             NOT NULL,
    [AuthorizationDate]         DATE             NULL,
    [CompanyLegalId]            NVARCHAR (MAX)   NULL,
    [CompanyName1]              NVARCHAR (MAX)   NULL,
    [CompanyName2]              NVARCHAR (MAX)   NULL,
    [CompanyTaxPayerId]         NVARCHAR (MAX)   NULL,
    [CompanyAddress]            NVARCHAR (MAX)   NULL,
    [CompanyPhone]              NVARCHAR (MAX)   NULL,
    [CompanyAccountingRequired] NVARCHAR (100)   NULL,
    [CompanyPlaceCode]          NVARCHAR (MAX)   NULL,
    [CompanyPlaceAddress]       NVARCHAR (MAX)   NULL,
    [CompanyPlacePhone]         NVARCHAR (MAX)   NULL,
    [CompanyPointOfSaleCode]    NVARCHAR (MAX)   NULL,
    [Driver_Id]                 UNIQUEIDENTIFIER NOT NULL,
    [DepartureAddress]          NVARCHAR (MAX)   NULL,
    [DepartureDate]             DATE             NOT NULL,
    [ArriveDate]                DATE             NULL,
    [VehiculeId]                NVARCHAR (50)    NULL,
    [Number]                    NVARCHAR (MAX)   NULL,
    [DocumentNumber]            AS               CONCAT(ISNULL([CompanyPlaceCode], ''), '-', ISNULL([CompanyPointOfSaleCode], ''), '-', ISNULL([Number], '')),
    [ReceiverName]              NVARCHAR (MAX)   NULL,
    [ReceiverLegalId]           NVARCHAR (MAX)   NULL,
    [ReceiverBillingAddress]    NVARCHAR (MAX)   NULL,
    [TransferReason]            NVARCHAR (MAX)   NULL,
    [Informative1]              NVARCHAR (MAX)   NULL,
    [Informative2]              NVARCHAR (MAX)   NULL,
    [Informative3]              NVARCHAR (MAX)   NULL,
    [Informative4]              NVARCHAR (MAX)   NULL,
    [Informative5]              NVARCHAR (MAX)   NULL,
    [Informative6]              NVARCHAR (MAX)   NULL,
    [Informative7]              NVARCHAR (MAX)   NULL,
    [Informative8]              NVARCHAR (MAX)   NULL,
    [Informative9]              NVARCHAR (MAX)   NULL,
    [Informative10]             NVARCHAR (MAX)   NULL,
    [InventoryTransfer_Id]      UNIQUEIDENTIFIER NULL,
    [InventoryOutput_Id]        UNIQUEIDENTIFIER NULL,
    [Company_EmissionPoint_Id]  UNIQUEIDENTIFIER NOT NULL,
    [Xml]                       NVARCHAR (MAX)   NULL,
    [KeyAccess]                 NVARCHAR (50)    NULL,
    [VoucherStatus]             NVARCHAR (50)    NULL,
    [VoucherMessages]           NVARCHAR (MAX)   NULL,
    [RowStatus]                 INT              NOT NULL,
    [Locked]                    BIT              NOT NULL,
    [Required]                  BIT              NOT NULL,
    [Employee_Id]               UNIQUEIDENTIFIER NULL,
    [CreatedBy]                 UNIQUEIDENTIFIER NULL,
    [CreatedDate]               DATETIME         NULL,
    [ModifiedBy]                UNIQUEIDENTIFIER NULL,
    [ModifiedDate]              DATETIME         NULL,
    [Picture]                   NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_RemissionGuide] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[RemissionGuide_Line]...';


GO
CREATE TABLE [dbo].[RemissionGuide_Line] (
    [Id]                       UNIQUEIDENTIFIER NOT NULL,
    [Code1]                    NVARCHAR (MAX)   NULL,
    [Code2]                    NVARCHAR (MAX)   NULL,
    [Description]              NVARCHAR (MAX)   NULL,
    [Quantity]                 DECIMAL (18, 5)  NOT NULL,
    [BusinessItemVariation_Id] UNIQUEIDENTIFIER NOT NULL,
    [RemissionGuide_Id]        UNIQUEIDENTIFIER NOT NULL,
    [RowStatus]                INT              NOT NULL,
    [Locked]                   BIT              NOT NULL,
    [Required]                 BIT              NOT NULL,
    [Employee_Id]              UNIQUEIDENTIFIER NULL,
    [CreatedBy]                UNIQUEIDENTIFIER NULL,
    [CreatedDate]              DATETIME         NULL,
    [ModifiedBy]               UNIQUEIDENTIFIER NULL,
    [ModifiedDate]             DATETIME         NULL,
    [Picture]                  NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_RemissionGuide_Line] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[RetentionVoucher]...';


GO
CREATE TABLE [dbo].[RetentionVoucher] (
    [Id]                        UNIQUEIDENTIFIER NOT NULL,
    [Date]                      DATE             NOT NULL,
    [AuthorizationDate]         DATE             NULL,
    [CompanyLegalId]            NVARCHAR (MAX)   NULL,
    [CompanyName1]              NVARCHAR (MAX)   NULL,
    [CompanyName2]              NVARCHAR (MAX)   NULL,
    [CompanyTaxPayerId]         NVARCHAR (MAX)   NULL,
    [CompanyAddress]            NVARCHAR (MAX)   NULL,
    [CompanyPhone]              NVARCHAR (MAX)   NULL,
    [CompanyAccountingRequired] NVARCHAR (100)   NULL,
    [CompanyPlaceCode]          NVARCHAR (MAX)   NULL,
    [CompanyPlaceAddress]       NVARCHAR (MAX)   NULL,
    [CompanyPlacePhone]         NVARCHAR (MAX)   NULL,
    [CompanyPointOfSaleCode]    NVARCHAR (MAX)   NULL,
    [Number]                    NVARCHAR (MAX)   NULL,
    [DocumentNumber]            AS               CONCAT(ISNULL([CompanyPlaceCode], ''), '-', ISNULL([CompanyPointOfSaleCode], ''), '-', ISNULL([Number], '')),
    [SupplierName]              NVARCHAR (MAX)   NULL,
    [SupplierLegalId]           NVARCHAR (MAX)   NULL,
    [Informative1]              NVARCHAR (MAX)   NULL,
    [Informative2]              NVARCHAR (MAX)   NULL,
    [Informative3]              NVARCHAR (MAX)   NULL,
    [Informative4]              NVARCHAR (MAX)   NULL,
    [Informative5]              NVARCHAR (MAX)   NULL,
    [Informative6]              NVARCHAR (MAX)   NULL,
    [Informative7]              NVARCHAR (MAX)   NULL,
    [Informative8]              NVARCHAR (MAX)   NULL,
    [Informative9]              NVARCHAR (MAX)   NULL,
    [Informative10]             NVARCHAR (MAX)   NULL,
    [Company_EmissionPoint_Id]  UNIQUEIDENTIFIER NOT NULL,
    [PurchaseInvoice_Id]        UNIQUEIDENTIFIER NOT NULL,
    [Xml]                       NVARCHAR (MAX)   NULL,
    [KeyAccess]                 NVARCHAR (50)    NULL,
    [VoucherStatus]             NVARCHAR (50)    NULL,
    [VoucherMessages]           NVARCHAR (MAX)   NULL,
    [RowStatus]                 INT              NOT NULL,
    [Locked]                    BIT              NOT NULL,
    [Required]                  BIT              NOT NULL,
    [Employee_Id]               UNIQUEIDENTIFIER NULL,
    [CreatedBy]                 UNIQUEIDENTIFIER NULL,
    [CreatedDate]               DATETIME         NULL,
    [ModifiedBy]                UNIQUEIDENTIFIER NULL,
    [ModifiedDate]              DATETIME         NULL,
    [Picture]                   NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_RetentionVoucher] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[RetentionVoucher_Line]...';


GO
CREATE TABLE [dbo].[RetentionVoucher_Line] (
    [Id]                  UNIQUEIDENTIFIER NOT NULL,
    [Number]              NVARCHAR (200)   NULL,
    [EmissionDate]        DATETIME         NULL,
    [TaxAmount]           DECIMAL (18, 5)  NULL,
    [TaxPorcentage]       DECIMAL (18, 5)  NULL,
    [TotalTaxAmount]      DECIMAL (18, 5)  NULL,
    [Tax_Retention_Id]    UNIQUEIDENTIFIER NOT NULL,
    [RetentionVoucher_Id] UNIQUEIDENTIFIER NOT NULL,
    [RowStatus]           INT              NOT NULL,
    [Locked]              BIT              NOT NULL,
    [Required]            BIT              NOT NULL,
    [Employee_Id]         UNIQUEIDENTIFIER NULL,
    [CreatedBy]           UNIQUEIDENTIFIER NULL,
    [CreatedDate]         DATETIME         NULL,
    [ModifiedBy]          UNIQUEIDENTIFIER NULL,
    [ModifiedDate]        DATETIME         NULL,
    [Picture]             NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_RetentionVoucher_Line] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Role]...';


GO
CREATE TABLE [dbo].[Role] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Name]         NVARCHAR (256)   NOT NULL,
    [Description]  NVARCHAR (MAX)   NULL,
    [HomePage]     NVARCHAR (500)   NULL,
    [IsMain]       BIT              NULL,
    [IsDefault]    BIT              NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Role_Action]...';


GO
CREATE TABLE [dbo].[Role_Action] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Role_Id]      UNIQUEIDENTIFIER NULL,
    [Role_Name]    NVARCHAR (256)   NOT NULL,
    [Action_Id]    UNIQUEIDENTIFIER NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Role_Action] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Sale]...';


GO
CREATE TABLE [dbo].[Sale] (
    [Id]                     UNIQUEIDENTIFIER NOT NULL,
    [Date]                   DATETIME         NOT NULL,
    [Number]                 BIGINT           NULL,
    [Discount]               DECIMAL (18, 5)  NULL,
    [Subtotal]               DECIMAL (18, 5)  NULL,
    [Total]                  DECIMAL (18, 5)  NULL,
    [Tip]                    DECIMAL (18, 5)  NULL,
    [Comments]               NVARCHAR (MAX)   NULL,
    [Customer_Id]            UNIQUEIDENTIFIER NOT NULL,
    [BusinessOpportunity_Id] UNIQUEIDENTIFIER NULL,
    [Campaign_Id]            UNIQUEIDENTIFIER NULL,
    [Sale_Place_Id]          UNIQUEIDENTIFIER NULL,
    [RowStatus]              INT              NOT NULL,
    [Locked]                 BIT              NOT NULL,
    [Required]               BIT              NOT NULL,
    [Employee_Id]            UNIQUEIDENTIFIER NULL,
    [CreatedBy]              UNIQUEIDENTIFIER NULL,
    [CreatedDate]            DATETIME         NULL,
    [ModifiedBy]             UNIQUEIDENTIFIER NULL,
    [ModifiedDate]           DATETIME         NULL,
    [Picture]                NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Sale] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Sale_Item]...';


GO
CREATE TABLE [dbo].[Sale_Item] (
    [Id]                             UNIQUEIDENTIFIER NOT NULL,
    [Number]                         BIGINT           NULL,
    [Quantity]                       DECIMAL (18, 5)  NOT NULL,
    [UnitPrice]                      DECIMAL (18, 5)  NULL,
    [CustomerUnitDiscountPercentage] DECIMAL (18, 5)  NULL,
    [SaleUnitDiscountPercentage]     DECIMAL (18, 5)  NULL,
    [TotalUnitDiscountPercentage]    DECIMAL (18, 5)  NULL,
    [TotalUnitDiscountAmount]        DECIMAL (18, 5)  NULL,
    [DiscountedUnitPrice]            DECIMAL (18, 5)  NULL,
    [TotalPrice]                     DECIMAL (18, 5)  NULL,
    [Sale_Id]                        UNIQUEIDENTIFIER NULL,
    [BusinessItemVariation_Id]       UNIQUEIDENTIFIER NULL,
    [RowStatus]                      INT              NOT NULL,
    [Locked]                         BIT              NOT NULL,
    [Required]                       BIT              NOT NULL,
    [Employee_Id]                    UNIQUEIDENTIFIER NULL,
    [CreatedBy]                      UNIQUEIDENTIFIER NULL,
    [CreatedDate]                    DATETIME         NULL,
    [ModifiedBy]                     UNIQUEIDENTIFIER NULL,
    [ModifiedDate]                   DATETIME         NULL,
    [Picture]                        NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Sale_Item] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Sale_Place]...';


GO
CREATE TABLE [dbo].[Sale_Place] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Name]         NVARCHAR (500)   NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Sale_Place] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[SaleInvoice]...';


GO
CREATE TABLE [dbo].[SaleInvoice] (
    [Id]                              UNIQUEIDENTIFIER NOT NULL,
    [Batch]                           NVARCHAR (100)   NULL,
    [Date]                            DATE             NOT NULL,
    [TotalAmountWithoutTaxes]         DECIMAL (18, 5)  NOT NULL,
    [DiscountAmount]                  DECIMAL (18, 5)  NOT NULL,
    [TaxAmount]                       DECIMAL (18, 5)  NOT NULL,
    [TipAmount]                       DECIMAL (18, 5)  NOT NULL,
    [TotalAmount]                     DECIMAL (18, 5)  NOT NULL,
    [CurrencyCode]                    NVARCHAR (MAX)   NULL,
    [CurrencyName]                    NVARCHAR (MAX)   NULL,
    [CustomerName]                    NVARCHAR (MAX)   NULL,
    [CustomerLegalIdTypeCode]         NVARCHAR (MAX)   NULL,
    [CustomerLegalId]                 NVARCHAR (MAX)   NULL,
    [CustomerBillingAddress]          NVARCHAR (MAX)   NULL,
    [CustomerShippingAddress]         NVARCHAR (MAX)   NULL,
    [CustomerPhone]                   NVARCHAR (MAX)   NULL,
    [CustomerEmail]                   NVARCHAR (MAX)   NULL,
    [Number]                          NVARCHAR (MAX)   NULL,
    [DocumentNumber]                  AS               CONCAT(ISNULL([CompanyPlaceCode], ''), '-', ISNULL([CompanyPointOfSaleCode], ''), '-', ISNULL([Number], '')),
    [CompanyLegalId]                  NVARCHAR (MAX)   NULL,
    [CompanyName1]                    NVARCHAR (MAX)   NULL,
    [CompanyName2]                    NVARCHAR (MAX)   NULL,
    [CompanyTaxPayerId]               NVARCHAR (MAX)   NULL,
    [CompanyAddress]                  NVARCHAR (MAX)   NULL,
    [CompanyPhone]                    NVARCHAR (MAX)   NULL,
    [CompanyAccountingRequired]       NVARCHAR (100)   NULL,
    [CompanyPlaceCode]                NVARCHAR (MAX)   NULL,
    [CompanyPlaceAddress]             NVARCHAR (MAX)   NULL,
    [CompanyPlacePhone]               NVARCHAR (MAX)   NULL,
    [CompanyPointOfSaleCode]          NVARCHAR (MAX)   NULL,
    [ContractNumber]                  BIGINT           NULL,
    [ContractPhysicalNumber]          NVARCHAR (MAX)   NULL,
    [Informative1]                    NVARCHAR (MAX)   NULL,
    [Informative2]                    NVARCHAR (MAX)   NULL,
    [Informative3]                    NVARCHAR (MAX)   NULL,
    [Informative4]                    NVARCHAR (MAX)   NULL,
    [Informative5]                    NVARCHAR (MAX)   NULL,
    [Informative6]                    NVARCHAR (MAX)   NULL,
    [Informative7]                    NVARCHAR (MAX)   NULL,
    [Informative8]                    NVARCHAR (MAX)   NULL,
    [Informative9]                    NVARCHAR (MAX)   NULL,
    [Informative10]                   NVARCHAR (MAX)   NULL,
    [Informative11]                   NVARCHAR (MAX)   NULL,
    [Informative12]                   NVARCHAR (MAX)   NULL,
    [Informative13]                   NVARCHAR (MAX)   NULL,
    [Informative14]                   NVARCHAR (MAX)   NULL,
    [Informative15]                   NVARCHAR (MAX)   NULL,
    [Sale_Id]                         UNIQUEIDENTIFIER NOT NULL,
    [SaleInvoice_RecurrentProcess_Id] UNIQUEIDENTIFIER NULL,
    [Company_EmissionPoint_Id]        UNIQUEIDENTIFIER NOT NULL,
    [Xml]                             NVARCHAR (MAX)   NULL,
    [KeyAccess]                       NVARCHAR (50)    NULL,
    [VoucherStatus]                   NVARCHAR (50)    NULL,
    [VoucherMessages]                 NVARCHAR (MAX)   NULL,
    [AuthorizationDate]               DATE             NULL,
    [RowStatus]                       INT              NOT NULL,
    [Locked]                          BIT              NOT NULL,
    [Required]                        BIT              NOT NULL,
    [Employee_Id]                     UNIQUEIDENTIFIER NULL,
    [CreatedBy]                       UNIQUEIDENTIFIER NULL,
    [CreatedDate]                     DATETIME         NULL,
    [ModifiedBy]                      UNIQUEIDENTIFIER NULL,
    [ModifiedDate]                    DATETIME         NULL,
    [Picture]                         NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[SaleInvoice_Line]...';


GO
CREATE TABLE [dbo].[SaleInvoice_Line] (
    [Id]                       UNIQUEIDENTIFIER NOT NULL,
    [Code1]                    NVARCHAR (MAX)   NOT NULL,
    [Code2]                    NVARCHAR (MAX)   NULL,
    [Description]              NVARCHAR (MAX)   NOT NULL,
    [Quantity]                 DECIMAL (18, 5)  NOT NULL,
    [UnitPrice]                DECIMAL (18, 5)  NOT NULL,
    [UnitDiscount]             DECIMAL (18, 5)  NOT NULL,
    [TotalPrice]               DECIMAL (18, 5)  NOT NULL,
    [BusinessItemVariation_Id] UNIQUEIDENTIFIER NOT NULL,
    [SaleInvoice_Id]           UNIQUEIDENTIFIER NOT NULL,
    [RowStatus]                INT              NOT NULL,
    [Locked]                   BIT              NOT NULL,
    [Required]                 BIT              NOT NULL,
    [Employee_Id]              UNIQUEIDENTIFIER NULL,
    [CreatedBy]                UNIQUEIDENTIFIER NULL,
    [CreatedDate]              DATETIME         NULL,
    [ModifiedBy]               UNIQUEIDENTIFIER NULL,
    [ModifiedDate]             DATETIME         NULL,
    [Picture]                  NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_SaleInvoice_Line] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[SaleInvoice_LineTax]...';


GO
CREATE TABLE [dbo].[SaleInvoice_LineTax] (
    [Id]                  UNIQUEIDENTIFIER NOT NULL,
    [Name]                NVARCHAR (2000)  NOT NULL,
    [Code]                NVARCHAR (20)    NOT NULL,
    [PercentageCode]      NVARCHAR (50)    NOT NULL,
    [Percentage]          DECIMAL (18, 5)  NOT NULL,
    [TaxableAmount]       DECIMAL (18, 5)  NOT NULL,
    [TaxAmount]           DECIMAL (18, 5)  NOT NULL,
    [SaleInvoice_Line_Id] UNIQUEIDENTIFIER NOT NULL,
    [Tax_Id]              UNIQUEIDENTIFIER NOT NULL,
    [RowStatus]           INT              NOT NULL,
    [Locked]              BIT              NOT NULL,
    [Required]            BIT              NOT NULL,
    [Employee_Id]         UNIQUEIDENTIFIER NULL,
    [CreatedBy]           UNIQUEIDENTIFIER NULL,
    [CreatedDate]         DATETIME         NULL,
    [ModifiedBy]          UNIQUEIDENTIFIER NULL,
    [ModifiedDate]        DATETIME         NULL,
    [Picture]             NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_SaleInvoice_LineTax] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[SaleInvoice_ProgressProcess]...';


GO
CREATE TABLE [dbo].[SaleInvoice_ProgressProcess] (
    [Id]                              UNIQUEIDENTIFIER NOT NULL,
    [Contract_ProgressPaymentRule_Id] UNIQUEIDENTIFIER NOT NULL,
    [RowStatus]                       INT              NOT NULL,
    [Locked]                          BIT              NOT NULL,
    [Required]                        BIT              NOT NULL,
    [Employee_Id]                     UNIQUEIDENTIFIER NULL,
    [CreatedBy]                       UNIQUEIDENTIFIER NULL,
    [CreatedDate]                     DATETIME         NULL,
    [ModifiedBy]                      UNIQUEIDENTIFIER NULL,
    [ModifiedDate]                    DATETIME         NULL,
    [Picture]                         NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_SaleInvoice_ProgressProcess] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[SaleInvoice_RecurrentProcess]...';


GO
CREATE TABLE [dbo].[SaleInvoice_RecurrentProcess] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Year]         INT              NULL,
    [Month]        INT              NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_SaleInvoice_RecurrentProcess] PRIMARY KEY CLUSTERED ([Id] ASC),
    UNIQUE NONCLUSTERED ([Year] ASC, [Month] ASC)
);


GO
PRINT N'Creando [dbo].[SaleInvoice_Tax]...';


GO
CREATE TABLE [dbo].[SaleInvoice_Tax] (
    [Id]             UNIQUEIDENTIFIER NOT NULL,
    [Name]           NVARCHAR (2000)  NOT NULL,
    [Code]           NVARCHAR (20)    NOT NULL,
    [PercentageCode] NVARCHAR (50)    NOT NULL,
    [Percentage]     DECIMAL (18, 5)  NOT NULL,
    [TaxableAmount]  DECIMAL (18, 5)  NOT NULL,
    [TaxAmount]      DECIMAL (18, 5)  NOT NULL,
    [SaleInvoice_Id] UNIQUEIDENTIFIER NOT NULL,
    [Tax_Id]         UNIQUEIDENTIFIER NOT NULL,
    [RowStatus]      INT              NOT NULL,
    [Locked]         BIT              NOT NULL,
    [Required]       BIT              NOT NULL,
    [Employee_Id]    UNIQUEIDENTIFIER NULL,
    [CreatedBy]      UNIQUEIDENTIFIER NULL,
    [CreatedDate]    DATETIME         NULL,
    [ModifiedBy]     UNIQUEIDENTIFIER NULL,
    [ModifiedDate]   DATETIME         NULL,
    [Picture]        NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_SaleInvoice_Tax] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[SaleInvoicePayment]...';


GO
CREATE TABLE [dbo].[SaleInvoicePayment] (
    [Id]                        UNIQUEIDENTIFIER NOT NULL,
    [Date]                      DATETIME         NOT NULL,
    [OwnerLegalId]              NVARCHAR (MAX)   NULL,
    [OwnerName]                 NVARCHAR (MAX)   NULL,
    [ExpirationDate]            DATE             NULL,
    [BankCode]                  NVARCHAR (MAX)   NULL,
    [BankName]                  NVARCHAR (MAX)   NULL,
    [Number]                    NVARCHAR (MAX)   NULL,
    [CustomerLegalId]           NVARCHAR (MAX)   NULL,
    [CustomerName]              NVARCHAR (MAX)   NULL,
    [AutomaticDebit]            BIT              NOT NULL,
    [Amount]                    DECIMAL (18, 5)  NOT NULL,
    [Confirmed]                 BIT              NOT NULL,
    [Comment]                   NVARCHAR (MAX)   NULL,
    [SaleInvoice_Id]            UNIQUEIDENTIFIER NOT NULL,
    [Customer_PaymentOption_Id] UNIQUEIDENTIFIER NULL,
    [RowStatus]                 INT              NOT NULL,
    [Locked]                    BIT              NOT NULL,
    [Required]                  BIT              NOT NULL,
    [Employee_Id]               UNIQUEIDENTIFIER NULL,
    [CreatedBy]                 UNIQUEIDENTIFIER NULL,
    [CreatedDate]               DATETIME         NULL,
    [ModifiedBy]                UNIQUEIDENTIFIER NULL,
    [ModifiedDate]              DATETIME         NULL,
    [Picture]                   NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_SaleInvoicePayment] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Salutation]...';


GO
CREATE TABLE [dbo].[Salutation] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Name]         NVARCHAR (500)   NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_PersonSalutation] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Service]...';


GO
CREATE TABLE [dbo].[Service] (
    [Id]                  UNIQUEIDENTIFIER NOT NULL,
    [Number]              BIGINT           NULL,
    [Service_Type_Id]     UNIQUEIDENTIFIER NOT NULL,
    [RequestDate]         DATETIME         NULL,
    [ResolutionDate]      DATETIME         NULL,
    [Problem]             NVARCHAR (2000)  NULL,
    [Resolution]          NVARCHAR (2000)  NULL,
    [Service_Status_Id]   UNIQUEIDENTIFIER NOT NULL,
    [Contract_Id]         UNIQUEIDENTIFIER NULL,
    [Service_Priority_Id] UNIQUEIDENTIFIER NOT NULL,
    [Customer_Id]         UNIQUEIDENTIFIER NOT NULL,
    [Contact_Id]          UNIQUEIDENTIFIER NULL,
    [SaleInvoice_Line_Id] UNIQUEIDENTIFIER NULL,
    [RowStatus]           INT              NOT NULL,
    [Locked]              BIT              NOT NULL,
    [Required]            BIT              NOT NULL,
    [Employee_Id]         UNIQUEIDENTIFIER NULL,
    [CreatedBy]           UNIQUEIDENTIFIER NULL,
    [CreatedDate]         DATETIME         NULL,
    [ModifiedBy]          UNIQUEIDENTIFIER NULL,
    [ModifiedDate]        DATETIME         NULL,
    [Picture]             NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Service_Comment]...';


GO
CREATE TABLE [dbo].[Service_Comment] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Date]         DATETIME         NULL,
    [Text]         NVARCHAR (1000)  NULL,
    [Service_Id]   UNIQUEIDENTIFIER NOT NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_ServiceComment] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Service_Priority]...';


GO
CREATE TABLE [dbo].[Service_Priority] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Name]         NVARCHAR (500)   NULL,
    [Score]        INT              NOT NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_ServicePriority] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Service_Status]...';


GO
CREATE TABLE [dbo].[Service_Status] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Name]         NVARCHAR (500)   NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_ServiceStatus] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Service_Type]...';


GO
CREATE TABLE [dbo].[Service_Type] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Name]         NVARCHAR (500)   NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_ServiceType] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[SourceChannel]...';


GO
CREATE TABLE [dbo].[SourceChannel] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Name]         NVARCHAR (500)   NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_SoruceChannel] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[State]...';


GO
CREATE TABLE [dbo].[State] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Name]         NVARCHAR (500)   NULL,
    [Country_Id]   UNIQUEIDENTIFIER NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Supplier]...';


GO
CREATE TABLE [dbo].[Supplier] (
    [Id]             UNIQUEIDENTIFIER NOT NULL,
    [Name1]          NVARCHAR (500)   NULL,
    [Name2]          NVARCHAR (500)   NULL,
    [Phone]          NVARCHAR (50)    NULL,
    [Email]          NVARCHAR (200)   NULL,
    [Address]        NVARCHAR (500)   NULL,
    [Code]           NVARCHAR (500)   NULL,
    [LegalIdType_Id] UNIQUEIDENTIFIER NULL,
    [LegalId]        NVARCHAR (50)    NULL,
    [RowStatus]      INT              NOT NULL,
    [Locked]         BIT              NOT NULL,
    [Required]       BIT              NOT NULL,
    [Employee_Id]    UNIQUEIDENTIFIER NULL,
    [CreatedBy]      UNIQUEIDENTIFIER NULL,
    [CreatedDate]    DATETIME         NULL,
    [ModifiedBy]     UNIQUEIDENTIFIER NULL,
    [ModifiedDate]   DATETIME         NULL,
    [Picture]        NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Supplier_Class]...';


GO
CREATE TABLE [dbo].[Supplier_Class] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Name]         VARCHAR (500)    NOT NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Supplier_Class] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Supplier_PaymentOption]...';


GO
CREATE TABLE [dbo].[Supplier_PaymentOption] (
    [Id]                 UNIQUEIDENTIFIER NOT NULL,
    [OwnerLegalId]       NVARCHAR (500)   NULL,
    [OwnerName]          NVARCHAR (500)   NULL,
    [Number]             NVARCHAR (50)    NULL,
    [ExpirationDate]     DATETIME         NULL,
    [Bank_Id]            UNIQUEIDENTIFIER NULL,
    [Payment_Subtype_Id] UNIQUEIDENTIFIER NULL,
    [Supplier_Id]        UNIQUEIDENTIFIER NOT NULL,
    [RowStatus]          INT              NOT NULL,
    [Locked]             BIT              NOT NULL,
    [Required]           BIT              NOT NULL,
    [Employee_Id]        UNIQUEIDENTIFIER NULL,
    [CreatedBy]          UNIQUEIDENTIFIER NULL,
    [CreatedDate]        DATETIME         NULL,
    [ModifiedBy]         UNIQUEIDENTIFIER NULL,
    [ModifiedDate]       DATETIME         NULL,
    [Picture]            NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Supplier_PaymentOption] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Tax]...';


GO
CREATE TABLE [dbo].[Tax] (
    [Id]             UNIQUEIDENTIFIER NOT NULL,
    [Code]           VARCHAR (100)    NOT NULL,
    [PercentageCode] VARCHAR (100)    NOT NULL,
    [Name]           VARCHAR (500)    NOT NULL,
    [Percentage]     DECIMAL (18, 5)  NOT NULL,
    [Tax_Type_Id]    UNIQUEIDENTIFIER NOT NULL,
    [RowStatus]      INT              NOT NULL,
    [Locked]         BIT              NOT NULL,
    [Required]       BIT              NOT NULL,
    [Employee_Id]    UNIQUEIDENTIFIER NULL,
    [CreatedBy]      UNIQUEIDENTIFIER NULL,
    [CreatedDate]    DATETIME         NULL,
    [ModifiedBy]     UNIQUEIDENTIFIER NULL,
    [ModifiedDate]   DATETIME         NULL,
    [Picture]        NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Tax] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Tax_BusinessItemClass]...';


GO
CREATE TABLE [dbo].[Tax_BusinessItemClass] (
    [Id]                    UNIQUEIDENTIFIER NOT NULL,
    [Tax_Id]                UNIQUEIDENTIFIER NOT NULL,
    [BusinessItem_Class_Id] UNIQUEIDENTIFIER NOT NULL,
    [RowStatus]             INT              NOT NULL,
    [Locked]                BIT              NOT NULL,
    [Required]              BIT              NOT NULL,
    [Employee_Id]           UNIQUEIDENTIFIER NULL,
    [CreatedBy]             UNIQUEIDENTIFIER NULL,
    [CreatedDate]           DATETIME         NULL,
    [ModifiedBy]            UNIQUEIDENTIFIER NULL,
    [ModifiedDate]          DATETIME         NULL,
    [Picture]               NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Tax_BusinessItem] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Tax_CustomerClass]...';


GO
CREATE TABLE [dbo].[Tax_CustomerClass] (
    [Id]                UNIQUEIDENTIFIER NOT NULL,
    [Tax_Id]            UNIQUEIDENTIFIER NOT NULL,
    [Customer_Class_Id] UNIQUEIDENTIFIER NOT NULL,
    [RowStatus]         INT              NOT NULL,
    [Locked]            BIT              NOT NULL,
    [Required]          BIT              NOT NULL,
    [Employee_Id]       UNIQUEIDENTIFIER NULL,
    [CreatedBy]         UNIQUEIDENTIFIER NULL,
    [CreatedDate]       DATETIME         NULL,
    [ModifiedBy]        UNIQUEIDENTIFIER NULL,
    [ModifiedDate]      DATETIME         NULL,
    [Picture]           NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Tax_CustomerClass] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Tax_Retention]...';


GO
CREATE TABLE [dbo].[Tax_Retention] (
    [Id]                   UNIQUEIDENTIFIER NOT NULL,
    [Code]                 VARCHAR (100)    NOT NULL,
    [Name]                 VARCHAR (500)    NOT NULL,
    [Percentage]           DECIMAL (18, 5)  NOT NULL,
    [Tax_RetentionType_Id] UNIQUEIDENTIFIER NOT NULL,
    [RowStatus]            INT              NOT NULL,
    [Locked]               BIT              NOT NULL,
    [Required]             BIT              NOT NULL,
    [Employee_Id]          UNIQUEIDENTIFIER NULL,
    [CreatedBy]            UNIQUEIDENTIFIER NULL,
    [CreatedDate]          DATETIME         NULL,
    [ModifiedBy]           UNIQUEIDENTIFIER NULL,
    [ModifiedDate]         DATETIME         NULL,
    [Picture]              NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Tax_Retention] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Tax_RetentionType]...';


GO
CREATE TABLE [dbo].[Tax_RetentionType] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Name]         VARCHAR (100)    NOT NULL,
    [Code]         NVARCHAR (5)     NOT NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Tax_RetentionType] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Tax_SupplierClass]...';


GO
CREATE TABLE [dbo].[Tax_SupplierClass] (
    [Id]                UNIQUEIDENTIFIER NOT NULL,
    [Tax_Id]            UNIQUEIDENTIFIER NOT NULL,
    [Supplier_Class_Id] UNIQUEIDENTIFIER NOT NULL,
    [RowStatus]         INT              NOT NULL,
    [Locked]            BIT              NOT NULL,
    [Required]          BIT              NOT NULL,
    [Employee_Id]       UNIQUEIDENTIFIER NULL,
    [CreatedBy]         UNIQUEIDENTIFIER NULL,
    [CreatedDate]       DATETIME         NULL,
    [ModifiedBy]        UNIQUEIDENTIFIER NULL,
    [ModifiedDate]      DATETIME         NULL,
    [Picture]           NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Tax_SupplierClass] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Tax_Type]...';


GO
CREATE TABLE [dbo].[Tax_Type] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Name]         VARCHAR (500)    NOT NULL,
    [Code]         NVARCHAR (5)     NOT NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Tax_Type] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Territory]...';


GO
CREATE TABLE [dbo].[Territory] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Name]         NVARCHAR (1000)  NOT NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[UnitOfMeasure]...';


GO
CREATE TABLE [dbo].[UnitOfMeasure] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Name]         NVARCHAR (200)   NOT NULL,
    [Abbreviation] NVARCHAR (25)    NOT NULL,
    [RowStatus]    INT              NOT NULL,
    [Locked]       BIT              NOT NULL,
    [Required]     BIT              NOT NULL,
    [Employee_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [CreatedDate]  DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [Picture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_UnitOfMeasure] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Warehouse]...';


GO
CREATE TABLE [dbo].[Warehouse] (
    [Id]               UNIQUEIDENTIFIER NOT NULL,
    [Name]             NVARCHAR (500)   NOT NULL,
    [Description]      NVARCHAR (2000)  NOT NULL,
    [Company_Place_Id] UNIQUEIDENTIFIER NOT NULL,
    [RowStatus]        INT              NOT NULL,
    [Locked]           BIT              NOT NULL,
    [Required]         BIT              NOT NULL,
    [Employee_Id]      UNIQUEIDENTIFIER NULL,
    [CreatedBy]        UNIQUEIDENTIFIER NULL,
    [CreatedDate]      DATETIME         NULL,
    [ModifiedBy]       UNIQUEIDENTIFIER NULL,
    [ModifiedDate]     DATETIME         NULL,
    [Picture]          NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_WarehouseMaterials] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando restricción sin nombre en [dbo].[Activity]...';


GO
ALTER TABLE [dbo].[Activity]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Activity]...';


GO
ALTER TABLE [dbo].[Activity]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Activity_Participant]...';


GO
ALTER TABLE [dbo].[Activity_Participant]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Activity_Participant]...';


GO
ALTER TABLE [dbo].[Activity_Participant]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Activity_PlaceType]...';


GO
ALTER TABLE [dbo].[Activity_PlaceType]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Activity_PlaceType]...';


GO
ALTER TABLE [dbo].[Activity_PlaceType]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Activity_Priority]...';


GO
ALTER TABLE [dbo].[Activity_Priority]
    ADD DEFAULT 0 FOR [Number];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Activity_Priority]...';


GO
ALTER TABLE [dbo].[Activity_Priority]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Activity_Priority]...';


GO
ALTER TABLE [dbo].[Activity_Priority]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Activity_Status]...';


GO
ALTER TABLE [dbo].[Activity_Status]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Activity_Status]...';


GO
ALTER TABLE [dbo].[Activity_Status]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Activity_Task]...';


GO
ALTER TABLE [dbo].[Activity_Task]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Activity_Task]...';


GO
ALTER TABLE [dbo].[Activity_Task]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Activity_Topic]...';


GO
ALTER TABLE [dbo].[Activity_Topic]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Activity_Topic]...';


GO
ALTER TABLE [dbo].[Activity_Topic]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Activity_Type]...';


GO
ALTER TABLE [dbo].[Activity_Type]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Activity_Type]...';


GO
ALTER TABLE [dbo].[Activity_Type]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[AddressType]...';


GO
ALTER TABLE [dbo].[AddressType]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[AddressType]...';


GO
ALTER TABLE [dbo].[AddressType]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Bank]...';


GO
ALTER TABLE [dbo].[Bank]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Bank]...';


GO
ALTER TABLE [dbo].[Bank]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[BankAccount]...';


GO
ALTER TABLE [dbo].[BankAccount]
    ADD DEFAULT 0 FOR [Total];


GO
PRINT N'Creando restricción sin nombre en [dbo].[BankAccount]...';


GO
ALTER TABLE [dbo].[BankAccount]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[BankAccount]...';


GO
ALTER TABLE [dbo].[BankAccount]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[BankAccount_Movement]...';


GO
ALTER TABLE [dbo].[BankAccount_Movement]
    ADD DEFAULT 0 FOR [Amount];


GO
PRINT N'Creando restricción sin nombre en [dbo].[BankAccount_Movement]...';


GO
ALTER TABLE [dbo].[BankAccount_Movement]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[BankAccount_Movement]...';


GO
ALTER TABLE [dbo].[BankAccount_Movement]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[BankAccount_Movement_Type]...';


GO
ALTER TABLE [dbo].[BankAccount_Movement_Type]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[BankAccount_Movement_Type]...';


GO
ALTER TABLE [dbo].[BankAccount_Movement_Type]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[BankAccount_Type]...';


GO
ALTER TABLE [dbo].[BankAccount_Type]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[BankAccount_Type]...';


GO
ALTER TABLE [dbo].[BankAccount_Type]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[BusinessItem]...';


GO
ALTER TABLE [dbo].[BusinessItem]
    ADD DEFAULT 0 FOR [CanBuy];


GO
PRINT N'Creando restricción sin nombre en [dbo].[BusinessItem]...';


GO
ALTER TABLE [dbo].[BusinessItem]
    ADD DEFAULT 0 FOR [CanSell];


GO
PRINT N'Creando restricción sin nombre en [dbo].[BusinessItem]...';


GO
ALTER TABLE [dbo].[BusinessItem]
    ADD DEFAULT 0 FOR [CanManufacture];


GO
PRINT N'Creando restricción sin nombre en [dbo].[BusinessItem]...';


GO
ALTER TABLE [dbo].[BusinessItem]
    ADD DEFAULT 0 FOR [CanConsume];


GO
PRINT N'Creando restricción sin nombre en [dbo].[BusinessItem]...';


GO
ALTER TABLE [dbo].[BusinessItem]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[BusinessItem]...';


GO
ALTER TABLE [dbo].[BusinessItem]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[BusinessItem_Category]...';


GO
ALTER TABLE [dbo].[BusinessItem_Category]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[BusinessItem_Category]...';


GO
ALTER TABLE [dbo].[BusinessItem_Category]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[BusinessItem_Class]...';


GO
ALTER TABLE [dbo].[BusinessItem_Class]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[BusinessItem_Class]...';


GO
ALTER TABLE [dbo].[BusinessItem_Class]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[BusinessItem_Discount]...';


GO
ALTER TABLE [dbo].[BusinessItem_Discount]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[BusinessItem_Discount]...';


GO
ALTER TABLE [dbo].[BusinessItem_Discount]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[BusinessItem_Promotion]...';


GO
ALTER TABLE [dbo].[BusinessItem_Promotion]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[BusinessItem_Promotion]...';


GO
ALTER TABLE [dbo].[BusinessItem_Promotion]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[BusinessItem_Type]...';


GO
ALTER TABLE [dbo].[BusinessItem_Type]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[BusinessItem_Type]...';


GO
ALTER TABLE [dbo].[BusinessItem_Type]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[BusinessItemVariation]...';


GO
ALTER TABLE [dbo].[BusinessItemVariation]
    ADD DEFAULT 0 FOR [Stock];


GO
PRINT N'Creando restricción sin nombre en [dbo].[BusinessItemVariation]...';


GO
ALTER TABLE [dbo].[BusinessItemVariation]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[BusinessItemVariation]...';


GO
ALTER TABLE [dbo].[BusinessItemVariation]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[BusinessItemVariation_Discount]...';


GO
ALTER TABLE [dbo].[BusinessItemVariation_Discount]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[BusinessItemVariation_Discount]...';


GO
ALTER TABLE [dbo].[BusinessItemVariation_Discount]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[BusinessOpportunity]...';


GO
ALTER TABLE [dbo].[BusinessOpportunity]
    ADD DEFAULT '' FOR [Description];


GO
PRINT N'Creando restricción sin nombre en [dbo].[BusinessOpportunity]...';


GO
ALTER TABLE [dbo].[BusinessOpportunity]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[BusinessOpportunity]...';


GO
ALTER TABLE [dbo].[BusinessOpportunity]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[BusinessOpportunity_Item]...';


GO
ALTER TABLE [dbo].[BusinessOpportunity_Item]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[BusinessOpportunity_Item]...';


GO
ALTER TABLE [dbo].[BusinessOpportunity_Item]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[BusinessOpportunity_LossReason]...';


GO
ALTER TABLE [dbo].[BusinessOpportunity_LossReason]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[BusinessOpportunity_LossReason]...';


GO
ALTER TABLE [dbo].[BusinessOpportunity_LossReason]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[BusinessOpportunity_State]...';


GO
ALTER TABLE [dbo].[BusinessOpportunity_State]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[BusinessOpportunity_State]...';


GO
ALTER TABLE [dbo].[BusinessOpportunity_State]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Campaign]...';


GO
ALTER TABLE [dbo].[Campaign]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Campaign]...';


GO
ALTER TABLE [dbo].[Campaign]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Campaign_MassEmail]...';


GO
ALTER TABLE [dbo].[Campaign_MassEmail]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Campaign_MassEmail]...';


GO
ALTER TABLE [dbo].[Campaign_MassEmail]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Campaign_ScheduleEmail]...';


GO
ALTER TABLE [dbo].[Campaign_ScheduleEmail]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Campaign_ScheduleEmail]...';


GO
ALTER TABLE [dbo].[Campaign_ScheduleEmail]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Campaign_Segment]...';


GO
ALTER TABLE [dbo].[Campaign_Segment]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Campaign_Segment]...';


GO
ALTER TABLE [dbo].[Campaign_Segment]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Campaign_Type]...';


GO
ALTER TABLE [dbo].[Campaign_Type]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Campaign_Type]...';


GO
ALTER TABLE [dbo].[Campaign_Type]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[City]...';


GO
ALTER TABLE [dbo].[City]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[City]...';


GO
ALTER TABLE [dbo].[City]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[CommunicationOptionType]...';


GO
ALTER TABLE [dbo].[CommunicationOptionType]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[CommunicationOptionType]...';


GO
ALTER TABLE [dbo].[CommunicationOptionType]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Company]...';


GO
ALTER TABLE [dbo].[Company]
    ADD DEFAULT 0 FOR [SmtpEnableSsl];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Company]...';


GO
ALTER TABLE [dbo].[Company]
    ADD DEFAULT '' FOR [MainActivity];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Company]...';


GO
ALTER TABLE [dbo].[Company]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Company]...';


GO
ALTER TABLE [dbo].[Company]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Company_EmissionPoint]...';


GO
ALTER TABLE [dbo].[Company_EmissionPoint]
    ADD DEFAULT 0 FOR [InvoiceSequential];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Company_EmissionPoint]...';


GO
ALTER TABLE [dbo].[Company_EmissionPoint]
    ADD DEFAULT 0 FOR [RemissionGuideSequential];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Company_EmissionPoint]...';


GO
ALTER TABLE [dbo].[Company_EmissionPoint]
    ADD DEFAULT 0 FOR [RetentionVoucherSequential];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Company_EmissionPoint]...';


GO
ALTER TABLE [dbo].[Company_EmissionPoint]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Company_EmissionPoint]...';


GO
ALTER TABLE [dbo].[Company_EmissionPoint]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Company_Place]...';


GO
ALTER TABLE [dbo].[Company_Place]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Company_Place]...';


GO
ALTER TABLE [dbo].[Company_Place]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Contact]...';


GO
ALTER TABLE [dbo].[Contact]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Contact]...';


GO
ALTER TABLE [dbo].[Contact]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Contact_Address]...';


GO
ALTER TABLE [dbo].[Contact_Address]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Contact_Address]...';


GO
ALTER TABLE [dbo].[Contact_Address]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Contact_ComunicationOption]...';


GO
ALTER TABLE [dbo].[Contact_ComunicationOption]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Contact_ComunicationOption]...';


GO
ALTER TABLE [dbo].[Contact_ComunicationOption]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Contact_Department]...';


GO
ALTER TABLE [dbo].[Contact_Department]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Contact_Department]...';


GO
ALTER TABLE [dbo].[Contact_Department]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Contact_Rating]...';


GO
ALTER TABLE [dbo].[Contact_Rating]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Contact_Rating]...';


GO
ALTER TABLE [dbo].[Contact_Rating]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Contract]...';


GO
ALTER TABLE [dbo].[Contract]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Contract]...';


GO
ALTER TABLE [dbo].[Contract]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Contract_EndReason]...';


GO
ALTER TABLE [dbo].[Contract_EndReason]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Contract_EndReason]...';


GO
ALTER TABLE [dbo].[Contract_EndReason]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Contract_ProgressPaymentRule]...';


GO
ALTER TABLE [dbo].[Contract_ProgressPaymentRule]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Contract_ProgressPaymentRule]...';


GO
ALTER TABLE [dbo].[Contract_ProgressPaymentRule]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Contract_RecurrenceType]...';


GO
ALTER TABLE [dbo].[Contract_RecurrenceType]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Contract_RecurrenceType]...';


GO
ALTER TABLE [dbo].[Contract_RecurrenceType]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Contract_RecurringPaymentRule]...';


GO
ALTER TABLE [dbo].[Contract_RecurringPaymentRule]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Contract_RecurringPaymentRule]...';


GO
ALTER TABLE [dbo].[Contract_RecurringPaymentRule]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Contract_Status]...';


GO
ALTER TABLE [dbo].[Contract_Status]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Contract_Status]...';


GO
ALTER TABLE [dbo].[Contract_Status]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Contract_Type]...';


GO
ALTER TABLE [dbo].[Contract_Type]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Contract_Type]...';


GO
ALTER TABLE [dbo].[Contract_Type]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Contract_TypeSection]...';


GO
ALTER TABLE [dbo].[Contract_TypeSection]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Contract_TypeSection]...';


GO
ALTER TABLE [dbo].[Contract_TypeSection]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Country]...';


GO
ALTER TABLE [dbo].[Country]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Country]...';


GO
ALTER TABLE [dbo].[Country]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Currency]...';


GO
ALTER TABLE [dbo].[Currency]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Currency]...';


GO
ALTER TABLE [dbo].[Currency]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Customer]...';


GO
ALTER TABLE [dbo].[Customer]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Customer]...';


GO
ALTER TABLE [dbo].[Customer]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Customer_Address]...';


GO
ALTER TABLE [dbo].[Customer_Address]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Customer_Address]...';


GO
ALTER TABLE [dbo].[Customer_Address]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Customer_Class]...';


GO
ALTER TABLE [dbo].[Customer_Class]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Customer_Class]...';


GO
ALTER TABLE [dbo].[Customer_Class]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Customer_ComunicationOption]...';


GO
ALTER TABLE [dbo].[Customer_ComunicationOption]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Customer_ComunicationOption]...';


GO
ALTER TABLE [dbo].[Customer_ComunicationOption]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Customer_Contact]...';


GO
ALTER TABLE [dbo].[Customer_Contact]
    ADD DEFAULT 0 FOR [Main];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Customer_Contact]...';


GO
ALTER TABLE [dbo].[Customer_Contact]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Customer_Contact]...';


GO
ALTER TABLE [dbo].[Customer_Contact]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Customer_Label]...';


GO
ALTER TABLE [dbo].[Customer_Label]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Customer_Label]...';


GO
ALTER TABLE [dbo].[Customer_Label]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Customer_PaymentOption]...';


GO
ALTER TABLE [dbo].[Customer_PaymentOption]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Customer_PaymentOption]...';


GO
ALTER TABLE [dbo].[Customer_PaymentOption]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Customer_Rating]...';


GO
ALTER TABLE [dbo].[Customer_Rating]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Customer_Rating]...';


GO
ALTER TABLE [dbo].[Customer_Rating]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Customer_RelationshipType]...';


GO
ALTER TABLE [dbo].[Customer_RelationshipType]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Customer_RelationshipType]...';


GO
ALTER TABLE [dbo].[Customer_RelationshipType]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Customer_Type]...';


GO
ALTER TABLE [dbo].[Customer_Type]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Customer_Type]...';


GO
ALTER TABLE [dbo].[Customer_Type]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[CustomerSegments]...';


GO
ALTER TABLE [dbo].[CustomerSegments]
    ADD DEFAULT 0 FOR [Ammount];


GO
PRINT N'Creando restricción sin nombre en [dbo].[CustomerSegments]...';


GO
ALTER TABLE [dbo].[CustomerSegments]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[CustomerSegments]...';


GO
ALTER TABLE [dbo].[CustomerSegments]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Driver]...';


GO
ALTER TABLE [dbo].[Driver]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Driver]...';


GO
ALTER TABLE [dbo].[Driver]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Employee]...';


GO
ALTER TABLE [dbo].[Employee]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Employee]...';


GO
ALTER TABLE [dbo].[Employee]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Employee_Parent]...';


GO
ALTER TABLE [dbo].[Employee_Parent]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Employee_Parent]...';


GO
ALTER TABLE [dbo].[Employee_Parent]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Factory]...';


GO
ALTER TABLE [dbo].[Factory]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Factory]...';


GO
ALTER TABLE [dbo].[Factory]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Gender]...';


GO
ALTER TABLE [dbo].[Gender]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Gender]...';


GO
ALTER TABLE [dbo].[Gender]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Industry]...';


GO
ALTER TABLE [dbo].[Industry]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Industry]...';


GO
ALTER TABLE [dbo].[Industry]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Inventory]...';


GO
ALTER TABLE [dbo].[Inventory]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Inventory]...';


GO
ALTER TABLE [dbo].[Inventory]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Inventory_Status]...';


GO
ALTER TABLE [dbo].[Inventory_Status]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Inventory_Status]...';


GO
ALTER TABLE [dbo].[Inventory_Status]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[InventoryIncome]...';


GO
ALTER TABLE [dbo].[InventoryIncome]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[InventoryIncome]...';


GO
ALTER TABLE [dbo].[InventoryIncome]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[InventoryIncome_Detail]...';


GO
ALTER TABLE [dbo].[InventoryIncome_Detail]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[InventoryIncome_Detail]...';


GO
ALTER TABLE [dbo].[InventoryIncome_Detail]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[InventoryOutput]...';


GO
ALTER TABLE [dbo].[InventoryOutput]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[InventoryOutput]...';


GO
ALTER TABLE [dbo].[InventoryOutput]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[InventoryOutput_Detail]...';


GO
ALTER TABLE [dbo].[InventoryOutput_Detail]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[InventoryOutput_Detail]...';


GO
ALTER TABLE [dbo].[InventoryOutput_Detail]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[InventoryOutputDetail_Inventory]...';


GO
ALTER TABLE [dbo].[InventoryOutputDetail_Inventory]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[InventoryOutputDetail_Inventory]...';


GO
ALTER TABLE [dbo].[InventoryOutputDetail_Inventory]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[InventoryTransfer]...';


GO
ALTER TABLE [dbo].[InventoryTransfer]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[InventoryTransfer]...';


GO
ALTER TABLE [dbo].[InventoryTransfer]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[InventoryTransfer_Detail]...';


GO
ALTER TABLE [dbo].[InventoryTransfer_Detail]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[InventoryTransfer_Detail]...';


GO
ALTER TABLE [dbo].[InventoryTransfer_Detail]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[InventoryTransfer_Reason]...';


GO
ALTER TABLE [dbo].[InventoryTransfer_Reason]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[InventoryTransfer_Reason]...';


GO
ALTER TABLE [dbo].[InventoryTransfer_Reason]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[InventoryTransfer_Status]...';


GO
ALTER TABLE [dbo].[InventoryTransfer_Status]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[InventoryTransfer_Status]...';


GO
ALTER TABLE [dbo].[InventoryTransfer_Status]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[InventoryTransferDetail_Inventory]...';


GO
ALTER TABLE [dbo].[InventoryTransferDetail_Inventory]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[InventoryTransferDetail_Inventory]...';


GO
ALTER TABLE [dbo].[InventoryTransferDetail_Inventory]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Language]...';


GO
ALTER TABLE [dbo].[Language]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Language]...';


GO
ALTER TABLE [dbo].[Language]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[LegalIdType]...';


GO
ALTER TABLE [dbo].[LegalIdType]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[LegalIdType]...';


GO
ALTER TABLE [dbo].[LegalIdType]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Manufacture]...';


GO
ALTER TABLE [dbo].[Manufacture]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Manufacture]...';


GO
ALTER TABLE [dbo].[Manufacture]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Manufacture_Item]...';


GO
ALTER TABLE [dbo].[Manufacture_Item]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Manufacture_Item]...';


GO
ALTER TABLE [dbo].[Manufacture_Item]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Manufacture_Status]...';


GO
ALTER TABLE [dbo].[Manufacture_Status]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Manufacture_Status]...';


GO
ALTER TABLE [dbo].[Manufacture_Status]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[MassiveEmail]...';


GO
ALTER TABLE [dbo].[MassiveEmail]
    ADD DEFAULT 0 FOR [Received];


GO
PRINT N'Creando restricción sin nombre en [dbo].[MassiveEmail]...';


GO
ALTER TABLE [dbo].[MassiveEmail]
    ADD DEFAULT 0 FOR [Read];


GO
PRINT N'Creando restricción sin nombre en [dbo].[MassiveEmail]...';


GO
ALTER TABLE [dbo].[MassiveEmail]
    ADD DEFAULT 0 FOR [Opened];


GO
PRINT N'Creando restricción sin nombre en [dbo].[MassiveEmail]...';


GO
ALTER TABLE [dbo].[MassiveEmail]
    ADD DEFAULT 0 FOR [Rejected];


GO
PRINT N'Creando restricción sin nombre en [dbo].[MassiveEmail]...';


GO
ALTER TABLE [dbo].[MassiveEmail]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[MassiveEmail]...';


GO
ALTER TABLE [dbo].[MassiveEmail]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[MassiveEmail_State]...';


GO
ALTER TABLE [dbo].[MassiveEmail_State]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[MassiveEmail_State]...';


GO
ALTER TABLE [dbo].[MassiveEmail_State]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Module]...';


GO
ALTER TABLE [dbo].[Module]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Ocupation]...';


GO
ALTER TABLE [dbo].[Ocupation]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Ocupation]...';


GO
ALTER TABLE [dbo].[Ocupation]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Payment_Subtype]...';


GO
ALTER TABLE [dbo].[Payment_Subtype]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Payment_Subtype]...';


GO
ALTER TABLE [dbo].[Payment_Subtype]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Payment_Type]...';


GO
ALTER TABLE [dbo].[Payment_Type]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Payment_Type]...';


GO
ALTER TABLE [dbo].[Payment_Type]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Permission]...';


GO
ALTER TABLE [dbo].[Permission]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Permission]...';


GO
ALTER TABLE [dbo].[Permission]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Purchase]...';


GO
ALTER TABLE [dbo].[Purchase]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Purchase]...';


GO
ALTER TABLE [dbo].[Purchase]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Purchase_Item]...';


GO
ALTER TABLE [dbo].[Purchase_Item]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Purchase_Item]...';


GO
ALTER TABLE [dbo].[Purchase_Item]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Purchase_Status]...';


GO
ALTER TABLE [dbo].[Purchase_Status]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Purchase_Status]...';


GO
ALTER TABLE [dbo].[Purchase_Status]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[PurchaseInvoice]...';


GO
ALTER TABLE [dbo].[PurchaseInvoice]
    ADD DEFAULT 0 FOR [TotalAmountWithoutTaxes];


GO
PRINT N'Creando restricción sin nombre en [dbo].[PurchaseInvoice]...';


GO
ALTER TABLE [dbo].[PurchaseInvoice]
    ADD DEFAULT 0 FOR [DiscountAmount];


GO
PRINT N'Creando restricción sin nombre en [dbo].[PurchaseInvoice]...';


GO
ALTER TABLE [dbo].[PurchaseInvoice]
    ADD DEFAULT 0 FOR [TaxAmount];


GO
PRINT N'Creando restricción sin nombre en [dbo].[PurchaseInvoice]...';


GO
ALTER TABLE [dbo].[PurchaseInvoice]
    ADD DEFAULT 0 FOR [TipAmount];


GO
PRINT N'Creando restricción sin nombre en [dbo].[PurchaseInvoice]...';


GO
ALTER TABLE [dbo].[PurchaseInvoice]
    ADD DEFAULT 0 FOR [TotalAmount];


GO
PRINT N'Creando restricción sin nombre en [dbo].[PurchaseInvoice]...';


GO
ALTER TABLE [dbo].[PurchaseInvoice]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[PurchaseInvoice]...';


GO
ALTER TABLE [dbo].[PurchaseInvoice]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[PurchaseInvoice_Line]...';


GO
ALTER TABLE [dbo].[PurchaseInvoice_Line]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[PurchaseInvoice_Line]...';


GO
ALTER TABLE [dbo].[PurchaseInvoice_Line]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[PurchaseInvoice_LineTax]...';


GO
ALTER TABLE [dbo].[PurchaseInvoice_LineTax]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[PurchaseInvoice_LineTax]...';


GO
ALTER TABLE [dbo].[PurchaseInvoice_LineTax]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[PurchaseInvoice_Tax]...';


GO
ALTER TABLE [dbo].[PurchaseInvoice_Tax]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[PurchaseInvoice_Tax]...';


GO
ALTER TABLE [dbo].[PurchaseInvoice_Tax]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[PurchaseInvoicePayment]...';


GO
ALTER TABLE [dbo].[PurchaseInvoicePayment]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[PurchaseInvoicePayment]...';


GO
ALTER TABLE [dbo].[PurchaseInvoicePayment]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[RemissionGuide]...';


GO
ALTER TABLE [dbo].[RemissionGuide]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[RemissionGuide]...';


GO
ALTER TABLE [dbo].[RemissionGuide]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[RemissionGuide_Line]...';


GO
ALTER TABLE [dbo].[RemissionGuide_Line]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[RemissionGuide_Line]...';


GO
ALTER TABLE [dbo].[RemissionGuide_Line]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[RetentionVoucher]...';


GO
ALTER TABLE [dbo].[RetentionVoucher]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[RetentionVoucher]...';


GO
ALTER TABLE [dbo].[RetentionVoucher]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[RetentionVoucher_Line]...';


GO
ALTER TABLE [dbo].[RetentionVoucher_Line]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[RetentionVoucher_Line]...';


GO
ALTER TABLE [dbo].[RetentionVoucher_Line]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Role]...';


GO
ALTER TABLE [dbo].[Role]
    ADD DEFAULT 0 FOR [IsMain];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Role]...';


GO
ALTER TABLE [dbo].[Role]
    ADD DEFAULT 0 FOR [IsDefault];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Role]...';


GO
ALTER TABLE [dbo].[Role]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Role]...';


GO
ALTER TABLE [dbo].[Role]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Role_Action]...';


GO
ALTER TABLE [dbo].[Role_Action]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Role_Action]...';


GO
ALTER TABLE [dbo].[Role_Action]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Sale]...';


GO
ALTER TABLE [dbo].[Sale]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Sale]...';


GO
ALTER TABLE [dbo].[Sale]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Sale_Item]...';


GO
ALTER TABLE [dbo].[Sale_Item]
    ADD DEFAULT 0 FOR [UnitPrice];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Sale_Item]...';


GO
ALTER TABLE [dbo].[Sale_Item]
    ADD DEFAULT 0 FOR [CustomerUnitDiscountPercentage];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Sale_Item]...';


GO
ALTER TABLE [dbo].[Sale_Item]
    ADD DEFAULT 0 FOR [SaleUnitDiscountPercentage];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Sale_Item]...';


GO
ALTER TABLE [dbo].[Sale_Item]
    ADD DEFAULT 0 FOR [TotalUnitDiscountPercentage];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Sale_Item]...';


GO
ALTER TABLE [dbo].[Sale_Item]
    ADD DEFAULT 0 FOR [TotalUnitDiscountAmount];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Sale_Item]...';


GO
ALTER TABLE [dbo].[Sale_Item]
    ADD DEFAULT 0 FOR [DiscountedUnitPrice];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Sale_Item]...';


GO
ALTER TABLE [dbo].[Sale_Item]
    ADD DEFAULT 0 FOR [TotalPrice];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Sale_Item]...';


GO
ALTER TABLE [dbo].[Sale_Item]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Sale_Item]...';


GO
ALTER TABLE [dbo].[Sale_Item]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Sale_Place]...';


GO
ALTER TABLE [dbo].[Sale_Place]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Sale_Place]...';


GO
ALTER TABLE [dbo].[Sale_Place]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[SaleInvoice]...';


GO
ALTER TABLE [dbo].[SaleInvoice]
    ADD DEFAULT 0 FOR [TotalAmountWithoutTaxes];


GO
PRINT N'Creando restricción sin nombre en [dbo].[SaleInvoice]...';


GO
ALTER TABLE [dbo].[SaleInvoice]
    ADD DEFAULT 0 FOR [DiscountAmount];


GO
PRINT N'Creando restricción sin nombre en [dbo].[SaleInvoice]...';


GO
ALTER TABLE [dbo].[SaleInvoice]
    ADD DEFAULT 0 FOR [TaxAmount];


GO
PRINT N'Creando restricción sin nombre en [dbo].[SaleInvoice]...';


GO
ALTER TABLE [dbo].[SaleInvoice]
    ADD DEFAULT 0 FOR [TipAmount];


GO
PRINT N'Creando restricción sin nombre en [dbo].[SaleInvoice]...';


GO
ALTER TABLE [dbo].[SaleInvoice]
    ADD DEFAULT 0 FOR [TotalAmount];


GO
PRINT N'Creando restricción sin nombre en [dbo].[SaleInvoice]...';


GO
ALTER TABLE [dbo].[SaleInvoice]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[SaleInvoice]...';


GO
ALTER TABLE [dbo].[SaleInvoice]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[SaleInvoice_Line]...';


GO
ALTER TABLE [dbo].[SaleInvoice_Line]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[SaleInvoice_Line]...';


GO
ALTER TABLE [dbo].[SaleInvoice_Line]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[SaleInvoice_LineTax]...';


GO
ALTER TABLE [dbo].[SaleInvoice_LineTax]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[SaleInvoice_LineTax]...';


GO
ALTER TABLE [dbo].[SaleInvoice_LineTax]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[SaleInvoice_ProgressProcess]...';


GO
ALTER TABLE [dbo].[SaleInvoice_ProgressProcess]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[SaleInvoice_ProgressProcess]...';


GO
ALTER TABLE [dbo].[SaleInvoice_ProgressProcess]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[SaleInvoice_RecurrentProcess]...';


GO
ALTER TABLE [dbo].[SaleInvoice_RecurrentProcess]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[SaleInvoice_RecurrentProcess]...';


GO
ALTER TABLE [dbo].[SaleInvoice_RecurrentProcess]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[SaleInvoice_Tax]...';


GO
ALTER TABLE [dbo].[SaleInvoice_Tax]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[SaleInvoice_Tax]...';


GO
ALTER TABLE [dbo].[SaleInvoice_Tax]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[SaleInvoicePayment]...';


GO
ALTER TABLE [dbo].[SaleInvoicePayment]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[SaleInvoicePayment]...';


GO
ALTER TABLE [dbo].[SaleInvoicePayment]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Salutation]...';


GO
ALTER TABLE [dbo].[Salutation]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Salutation]...';


GO
ALTER TABLE [dbo].[Salutation]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Service]...';


GO
ALTER TABLE [dbo].[Service]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Service]...';


GO
ALTER TABLE [dbo].[Service]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Service_Comment]...';


GO
ALTER TABLE [dbo].[Service_Comment]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Service_Comment]...';


GO
ALTER TABLE [dbo].[Service_Comment]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Service_Priority]...';


GO
ALTER TABLE [dbo].[Service_Priority]
    ADD DEFAULT 0 FOR [Score];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Service_Priority]...';


GO
ALTER TABLE [dbo].[Service_Priority]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Service_Priority]...';


GO
ALTER TABLE [dbo].[Service_Priority]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Service_Status]...';


GO
ALTER TABLE [dbo].[Service_Status]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Service_Status]...';


GO
ALTER TABLE [dbo].[Service_Status]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Service_Type]...';


GO
ALTER TABLE [dbo].[Service_Type]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Service_Type]...';


GO
ALTER TABLE [dbo].[Service_Type]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[SourceChannel]...';


GO
ALTER TABLE [dbo].[SourceChannel]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[SourceChannel]...';


GO
ALTER TABLE [dbo].[SourceChannel]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[State]...';


GO
ALTER TABLE [dbo].[State]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[State]...';


GO
ALTER TABLE [dbo].[State]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Supplier]...';


GO
ALTER TABLE [dbo].[Supplier]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Supplier]...';


GO
ALTER TABLE [dbo].[Supplier]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Supplier_Class]...';


GO
ALTER TABLE [dbo].[Supplier_Class]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Supplier_Class]...';


GO
ALTER TABLE [dbo].[Supplier_Class]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Supplier_PaymentOption]...';


GO
ALTER TABLE [dbo].[Supplier_PaymentOption]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Supplier_PaymentOption]...';


GO
ALTER TABLE [dbo].[Supplier_PaymentOption]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Tax]...';


GO
ALTER TABLE [dbo].[Tax]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Tax]...';


GO
ALTER TABLE [dbo].[Tax]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Tax_BusinessItemClass]...';


GO
ALTER TABLE [dbo].[Tax_BusinessItemClass]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Tax_BusinessItemClass]...';


GO
ALTER TABLE [dbo].[Tax_BusinessItemClass]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Tax_CustomerClass]...';


GO
ALTER TABLE [dbo].[Tax_CustomerClass]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Tax_CustomerClass]...';


GO
ALTER TABLE [dbo].[Tax_CustomerClass]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Tax_Retention]...';


GO
ALTER TABLE [dbo].[Tax_Retention]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Tax_Retention]...';


GO
ALTER TABLE [dbo].[Tax_Retention]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Tax_RetentionType]...';


GO
ALTER TABLE [dbo].[Tax_RetentionType]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Tax_RetentionType]...';


GO
ALTER TABLE [dbo].[Tax_RetentionType]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Tax_SupplierClass]...';


GO
ALTER TABLE [dbo].[Tax_SupplierClass]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Tax_SupplierClass]...';


GO
ALTER TABLE [dbo].[Tax_SupplierClass]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Tax_Type]...';


GO
ALTER TABLE [dbo].[Tax_Type]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Tax_Type]...';


GO
ALTER TABLE [dbo].[Tax_Type]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Territory]...';


GO
ALTER TABLE [dbo].[Territory]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Territory]...';


GO
ALTER TABLE [dbo].[Territory]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[UnitOfMeasure]...';


GO
ALTER TABLE [dbo].[UnitOfMeasure]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[UnitOfMeasure]...';


GO
ALTER TABLE [dbo].[UnitOfMeasure]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Warehouse]...';


GO
ALTER TABLE [dbo].[Warehouse]
    ADD DEFAULT 0 FOR [Locked];


GO
PRINT N'Creando restricción sin nombre en [dbo].[Warehouse]...';


GO
ALTER TABLE [dbo].[Warehouse]
    ADD DEFAULT 0 FOR [Required];


GO
PRINT N'Creando [dbo].[FK_Activity_Priority]...';


GO
ALTER TABLE [dbo].[Activity]
    ADD CONSTRAINT [FK_Activity_Priority] FOREIGN KEY ([Activity_Priority_Id]) REFERENCES [dbo].[Activity_Priority] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Activity_Status]...';


GO
ALTER TABLE [dbo].[Activity]
    ADD CONSTRAINT [FK_Activity_Status] FOREIGN KEY ([Activity_Status_Id]) REFERENCES [dbo].[Activity_Status] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Activity_Type]...';


GO
ALTER TABLE [dbo].[Activity]
    ADD CONSTRAINT [FK_Activity_Type] FOREIGN KEY ([Activity_Type_Id]) REFERENCES [dbo].[Activity_Type] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Activity_PlaceType]...';


GO
ALTER TABLE [dbo].[Activity]
    ADD CONSTRAINT [FK_Activity_PlaceType] FOREIGN KEY ([Activity_PlaceType_Id]) REFERENCES [dbo].[Activity_PlaceType] ([Id]);


GO
PRINT N'Creando [dbo].[FK_ActivityParticipant_Activity]...';


GO
ALTER TABLE [dbo].[Activity_Participant]
    ADD CONSTRAINT [FK_ActivityParticipant_Activity] FOREIGN KEY ([Activity_Id]) REFERENCES [dbo].[Activity] ([Id]);


GO
PRINT N'Creando [dbo].[FK_ActivityPriority_Employee]...';


GO
ALTER TABLE [dbo].[Activity_Priority]
    ADD CONSTRAINT [FK_ActivityPriority_Employee] FOREIGN KEY ([Employee_Id]) REFERENCES [dbo].[Employee] ([Id]);


GO
PRINT N'Creando [dbo].[FK_ActivityStatus_Employee]...';


GO
ALTER TABLE [dbo].[Activity_Status]
    ADD CONSTRAINT [FK_ActivityStatus_Employee] FOREIGN KEY ([Employee_Id]) REFERENCES [dbo].[Employee] ([Id]);


GO
PRINT N'Creando [dbo].[FK_ActivityTask_Activity]...';


GO
ALTER TABLE [dbo].[Activity_Task]
    ADD CONSTRAINT [FK_ActivityTask_Activity] FOREIGN KEY ([Activity_Topic_Id]) REFERENCES [dbo].[Activity_Topic] ([Id]);


GO
PRINT N'Creando [dbo].[FK_ActivityTopic_Topic]...';


GO
ALTER TABLE [dbo].[Activity_Topic]
    ADD CONSTRAINT [FK_ActivityTopic_Topic] FOREIGN KEY ([Activity_Id]) REFERENCES [dbo].[Activity] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Bank_Country]...';


GO
ALTER TABLE [dbo].[Bank]
    ADD CONSTRAINT [FK_Bank_Country] FOREIGN KEY ([Country_Id]) REFERENCES [dbo].[Country] ([Id]);


GO
PRINT N'Creando [dbo].[FK_BankAccount_Company]...';


GO
ALTER TABLE [dbo].[BankAccount]
    ADD CONSTRAINT [FK_BankAccount_Company] FOREIGN KEY ([Company_Id]) REFERENCES [dbo].[Company] ([Id]);


GO
PRINT N'Creando [dbo].[FK_BankAccount_Bank]...';


GO
ALTER TABLE [dbo].[BankAccount]
    ADD CONSTRAINT [FK_BankAccount_Bank] FOREIGN KEY ([Bank_Id]) REFERENCES [dbo].[Bank] ([Id]);


GO
PRINT N'Creando [dbo].[FK_BankAccount_BankAccountType]...';


GO
ALTER TABLE [dbo].[BankAccount]
    ADD CONSTRAINT [FK_BankAccount_BankAccountType] FOREIGN KEY ([BankAccount_Type_Id]) REFERENCES [dbo].[BankAccount_Type] ([Id]);


GO
PRINT N'Creando [dbo].[FK_BankAccountMovement_BankAccount]...';


GO
ALTER TABLE [dbo].[BankAccount_Movement]
    ADD CONSTRAINT [FK_BankAccountMovement_BankAccount] FOREIGN KEY ([BankAccount_Id]) REFERENCES [dbo].[BankAccount] ([Id]);


GO
PRINT N'Creando [dbo].[FK_BankAccountMovement_BankAccountMovement]...';


GO
ALTER TABLE [dbo].[BankAccount_Movement]
    ADD CONSTRAINT [FK_BankAccountMovement_BankAccountMovement] FOREIGN KEY ([BankAccount_Movement_Type_Id]) REFERENCES [dbo].[BankAccount_Movement_Type] ([Id]);


GO
PRINT N'Creando [dbo].[FK_BankAccountMovement_Employee]...';


GO
ALTER TABLE [dbo].[BankAccount_Movement]
    ADD CONSTRAINT [FK_BankAccountMovement_Employee] FOREIGN KEY ([ResponsibleEmployee_Id]) REFERENCES [dbo].[Employee] ([Id]);


GO
PRINT N'Creando [dbo].[FK_BankAccountMovement_Bank]...';


GO
ALTER TABLE [dbo].[BankAccount_Movement]
    ADD CONSTRAINT [FK_BankAccountMovement_Bank] FOREIGN KEY ([Bank_Id]) REFERENCES [dbo].[Bank] ([Id]);


GO
PRINT N'Creando [dbo].[FK_BusinessItem_Category]...';


GO
ALTER TABLE [dbo].[BusinessItem]
    ADD CONSTRAINT [FK_BusinessItem_Category] FOREIGN KEY ([BusinessItem_Category_Id]) REFERENCES [dbo].[BusinessItem_Category] ([Id]);


GO
PRINT N'Creando [dbo].[FK_BusinessItem_Type]...';


GO
ALTER TABLE [dbo].[BusinessItem]
    ADD CONSTRAINT [FK_BusinessItem_Type] FOREIGN KEY ([BusinessItem_Type_Id]) REFERENCES [dbo].[BusinessItem_Type] ([Id]);


GO
PRINT N'Creando [dbo].[FK_BusinessItem_Class]...';


GO
ALTER TABLE [dbo].[BusinessItem]
    ADD CONSTRAINT [FK_BusinessItem_Class] FOREIGN KEY ([BusinessItem_Class_Id]) REFERENCES [dbo].[BusinessItem_Class] ([Id]);


GO
PRINT N'Creando [dbo].[FK_BusinessItemDiscount_BusinessItem]...';


GO
ALTER TABLE [dbo].[BusinessItem_Discount]
    ADD CONSTRAINT [FK_BusinessItemDiscount_BusinessItem] FOREIGN KEY ([BusinessItem_Id]) REFERENCES [dbo].[BusinessItem] ([Id]);


GO
PRINT N'Creando [dbo].[FK_BusinessItemDiscount_CustomerRating]...';


GO
ALTER TABLE [dbo].[BusinessItem_Discount]
    ADD CONSTRAINT [FK_BusinessItemDiscount_CustomerRating] FOREIGN KEY ([Customer_Rating_Id]) REFERENCES [dbo].[Customer_Rating] ([Id]);


GO
PRINT N'Creando [dbo].[FK_BusinessItemVariation_BusinessItem]...';


GO
ALTER TABLE [dbo].[BusinessItemVariation]
    ADD CONSTRAINT [FK_BusinessItemVariation_BusinessItem] FOREIGN KEY ([BusinessItem_Id]) REFERENCES [dbo].[BusinessItem] ([Id]);


GO
PRINT N'Creando [dbo].[FK_BusinessItem_UnitOfMeasure]...';


GO
ALTER TABLE [dbo].[BusinessItemVariation]
    ADD CONSTRAINT [FK_BusinessItem_UnitOfMeasure] FOREIGN KEY ([UnitOfMeasure_Id]) REFERENCES [dbo].[UnitOfMeasure] ([Id]);


GO
PRINT N'Creando [dbo].[FK_BusinessItemVariationDiscount_BusinessItemVariation]...';


GO
ALTER TABLE [dbo].[BusinessItemVariation_Discount]
    ADD CONSTRAINT [FK_BusinessItemVariationDiscount_BusinessItemVariation] FOREIGN KEY ([BusinessItemVariation_Id]) REFERENCES [dbo].[BusinessItemVariation] ([Id]);


GO
PRINT N'Creando [dbo].[FK_BusinessItemVariationDiscount_CustomerRating]...';


GO
ALTER TABLE [dbo].[BusinessItemVariation_Discount]
    ADD CONSTRAINT [FK_BusinessItemVariationDiscount_CustomerRating] FOREIGN KEY ([Customer_Rating_Id]) REFERENCES [dbo].[Customer_Rating] ([Id]);


GO
PRINT N'Creando [dbo].[FK_BusinessOpportunity_Customer]...';


GO
ALTER TABLE [dbo].[BusinessOpportunity]
    ADD CONSTRAINT [FK_BusinessOpportunity_Customer] FOREIGN KEY ([Customer_Id]) REFERENCES [dbo].[Customer] ([Id]);


GO
PRINT N'Creando [dbo].[FK_BusinessOpportunity_Campaign]...';


GO
ALTER TABLE [dbo].[BusinessOpportunity]
    ADD CONSTRAINT [FK_BusinessOpportunity_Campaign] FOREIGN KEY ([Campaign_Id]) REFERENCES [dbo].[Campaign] ([Id]);


GO
PRINT N'Creando [dbo].[FK_BusinessOpportunity_Employee_Id]...';


GO
ALTER TABLE [dbo].[BusinessOpportunity]
    ADD CONSTRAINT [FK_BusinessOpportunity_Employee_Id] FOREIGN KEY ([Employee_Id]) REFERENCES [dbo].[Employee] ([Id]);


GO
PRINT N'Creando [dbo].[FK_BusinessOpportunity_State_Id]...';


GO
ALTER TABLE [dbo].[BusinessOpportunity]
    ADD CONSTRAINT [FK_BusinessOpportunity_State_Id] FOREIGN KEY ([BusinessOpportunity_State_Id]) REFERENCES [dbo].[BusinessOpportunity_State] ([Id]);


GO
PRINT N'Creando [dbo].[FK_BusinessOpportunity_LossReason_Id]...';


GO
ALTER TABLE [dbo].[BusinessOpportunity]
    ADD CONSTRAINT [FK_BusinessOpportunity_LossReason_Id] FOREIGN KEY ([BusinessOpportunity_LossReason_Id]) REFERENCES [dbo].[BusinessOpportunity_LossReason] ([Id]);


GO
PRINT N'Creando [dbo].[FK_BusinessOpportunity_SourceChannel_Id]...';


GO
ALTER TABLE [dbo].[BusinessOpportunity]
    ADD CONSTRAINT [FK_BusinessOpportunity_SourceChannel_Id] FOREIGN KEY ([SourceChannel_Id]) REFERENCES [dbo].[SourceChannel] ([Id]);


GO
PRINT N'Creando [dbo].[FK_BusinessOpportunity_Customer_Contact]...';


GO
ALTER TABLE [dbo].[BusinessOpportunity]
    ADD CONSTRAINT [FK_BusinessOpportunity_Customer_Contact] FOREIGN KEY ([Customer_Contact_Id]) REFERENCES [dbo].[Customer_Contact] ([Id]);


GO
PRINT N'Creando [dbo].[FK_BusinessOpportunityItem_BusinessOpportunity]...';


GO
ALTER TABLE [dbo].[BusinessOpportunity_Item]
    ADD CONSTRAINT [FK_BusinessOpportunityItem_BusinessOpportunity] FOREIGN KEY ([BusinessOpportunity_Id]) REFERENCES [dbo].[BusinessOpportunity] ([Id]);


GO
PRINT N'Creando [dbo].[FK_BusinessOpportunityItem_BusinessItemVariation]...';


GO
ALTER TABLE [dbo].[BusinessOpportunity_Item]
    ADD CONSTRAINT [FK_BusinessOpportunityItem_BusinessItemVariation] FOREIGN KEY ([BusinessItemVariation_Id]) REFERENCES [dbo].[BusinessItemVariation] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Campaign_CampaignType]...';


GO
ALTER TABLE [dbo].[Campaign]
    ADD CONSTRAINT [FK_Campaign_CampaignType] FOREIGN KEY ([Campaign_Type_Id]) REFERENCES [dbo].[Campaign_Type] ([Id]);


GO
PRINT N'Creando [dbo].[FK_CampaignMassEmail_CampaignScheduleEmail]...';


GO
ALTER TABLE [dbo].[Campaign_MassEmail]
    ADD CONSTRAINT [FK_CampaignMassEmail_CampaignScheduleEmail] FOREIGN KEY ([Campaign_ScheduleEmail_Id]) REFERENCES [dbo].[Campaign_ScheduleEmail] ([Id]);


GO
PRINT N'Creando [dbo].[FK_CampaignMassEmail_Campaign]...';


GO
ALTER TABLE [dbo].[Campaign_MassEmail]
    ADD CONSTRAINT [FK_CampaignMassEmail_Campaign] FOREIGN KEY ([Campaign_Id]) REFERENCES [dbo].[Campaign] ([Id]);


GO
PRINT N'Creando [dbo].[FK_CampaignMassEmail_Segment]...';


GO
ALTER TABLE [dbo].[Campaign_MassEmail]
    ADD CONSTRAINT [FK_CampaignMassEmail_Segment] FOREIGN KEY ([Campaign_Segment_Id]) REFERENCES [dbo].[Campaign_Segment] ([Id]);


GO
PRINT N'Creando [dbo].[FK_City_State]...';


GO
ALTER TABLE [dbo].[City]
    ADD CONSTRAINT [FK_City_State] FOREIGN KEY ([State_Id]) REFERENCES [dbo].[State] ([Id]);


GO
PRINT N'Creando [dbo].[FK_City_Employee]...';


GO
ALTER TABLE [dbo].[City]
    ADD CONSTRAINT [FK_City_Employee] FOREIGN KEY ([Employee_Id]) REFERENCES [dbo].[Employee] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Company_Currency]...';


GO
ALTER TABLE [dbo].[Company]
    ADD CONSTRAINT [FK_Company_Currency] FOREIGN KEY ([Currency_Id]) REFERENCES [dbo].[Currency] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Company_EmissionPoint_CompanyPlace]...';


GO
ALTER TABLE [dbo].[Company_EmissionPoint]
    ADD CONSTRAINT [FK_Company_EmissionPoint_CompanyPlace] FOREIGN KEY ([Company_Place_Id]) REFERENCES [dbo].[Company_Place] ([Id]);


GO
PRINT N'Creando [dbo].[FK_CompanyPlace_Company]...';


GO
ALTER TABLE [dbo].[Company_Place]
    ADD CONSTRAINT [FK_CompanyPlace_Company] FOREIGN KEY ([Company_Id]) REFERENCES [dbo].[Company] ([Id]);


GO
PRINT N'Creando [dbo].[FK_CompanyPlace_City]...';


GO
ALTER TABLE [dbo].[Company_Place]
    ADD CONSTRAINT [FK_CompanyPlace_City] FOREIGN KEY ([City_Id]) REFERENCES [dbo].[City] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Contact_Salutation]...';


GO
ALTER TABLE [dbo].[Contact]
    ADD CONSTRAINT [FK_Contact_Salutation] FOREIGN KEY ([Salutation_Id]) REFERENCES [dbo].[Salutation] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Contact_Gender]...';


GO
ALTER TABLE [dbo].[Contact]
    ADD CONSTRAINT [FK_Contact_Gender] FOREIGN KEY ([Gender_Id]) REFERENCES [dbo].[Gender] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Contact_Ocupation]...';


GO
ALTER TABLE [dbo].[Contact]
    ADD CONSTRAINT [FK_Contact_Ocupation] FOREIGN KEY ([Ocupation_Id]) REFERENCES [dbo].[Ocupation] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Contact_Source]...';


GO
ALTER TABLE [dbo].[Contact]
    ADD CONSTRAINT [FK_Contact_Source] FOREIGN KEY ([SourceChannel_Id]) REFERENCES [dbo].[SourceChannel] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Contact_Language]...';


GO
ALTER TABLE [dbo].[Contact]
    ADD CONSTRAINT [FK_Contact_Language] FOREIGN KEY ([Language_Id]) REFERENCES [dbo].[Language] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Contact_Rating]...';


GO
ALTER TABLE [dbo].[Contact]
    ADD CONSTRAINT [FK_Contact_Rating] FOREIGN KEY ([Contact_Rating_Id]) REFERENCES [dbo].[Contact_Rating] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Contact_Address_City]...';


GO
ALTER TABLE [dbo].[Contact_Address]
    ADD CONSTRAINT [FK_Contact_Address_City] FOREIGN KEY ([City_Id]) REFERENCES [dbo].[City] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Contact_Address_AddressType]...';


GO
ALTER TABLE [dbo].[Contact_Address]
    ADD CONSTRAINT [FK_Contact_Address_AddressType] FOREIGN KEY ([AddressType_Id]) REFERENCES [dbo].[AddressType] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Contact_Address_Contact]...';


GO
ALTER TABLE [dbo].[Contact_Address]
    ADD CONSTRAINT [FK_Contact_Address_Contact] FOREIGN KEY ([Contact_Id]) REFERENCES [dbo].[Contact] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Contact_ComunicationOption_Contact]...';


GO
ALTER TABLE [dbo].[Contact_ComunicationOption]
    ADD CONSTRAINT [FK_Contact_ComunicationOption_Contact] FOREIGN KEY ([Contact_Id]) REFERENCES [dbo].[Contact] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Contact_ComunicationOption_ComunicationOptionType]...';


GO
ALTER TABLE [dbo].[Contact_ComunicationOption]
    ADD CONSTRAINT [FK_Contact_ComunicationOption_ComunicationOptionType] FOREIGN KEY ([CommunicationOptionType_Id]) REFERENCES [dbo].[CommunicationOptionType] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Contract_Type]...';


GO
ALTER TABLE [dbo].[Contract]
    ADD CONSTRAINT [FK_Contract_Type] FOREIGN KEY ([Contract_Type_Id]) REFERENCES [dbo].[Contract_Type] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Contract_Sale]...';


GO
ALTER TABLE [dbo].[Contract]
    ADD CONSTRAINT [FK_Contract_Sale] FOREIGN KEY ([Sale_Id]) REFERENCES [dbo].[Sale] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Contract_Status]...';


GO
ALTER TABLE [dbo].[Contract]
    ADD CONSTRAINT [FK_Contract_Status] FOREIGN KEY ([Contract_Status_Id]) REFERENCES [dbo].[Contract_Status] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Contract_EndReason]...';


GO
ALTER TABLE [dbo].[Contract]
    ADD CONSTRAINT [FK_Contract_EndReason] FOREIGN KEY ([Contract_EndReason_Id]) REFERENCES [dbo].[Contract_EndReason] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Contract_ProgressPaymentRule]...';


GO
ALTER TABLE [dbo].[Contract_ProgressPaymentRule]
    ADD CONSTRAINT [FK_Contract_ProgressPaymentRule] FOREIGN KEY ([Contract_Id]) REFERENCES [dbo].[Contract] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Contract_RecurringPaymentRule]...';


GO
ALTER TABLE [dbo].[Contract_RecurringPaymentRule]
    ADD CONSTRAINT [FK_Contract_RecurringPaymentRule] FOREIGN KEY ([Contract_Id]) REFERENCES [dbo].[Contract] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Contract_RecurringPaymentRule_Type]...';


GO
ALTER TABLE [dbo].[Contract_RecurringPaymentRule]
    ADD CONSTRAINT [FK_Contract_RecurringPaymentRule_Type] FOREIGN KEY ([Contract_RecurrenceType_Id]) REFERENCES [dbo].[Contract_RecurrenceType] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Contract_RecurringPaymentRule_CustomerPaymentOption]...';


GO
ALTER TABLE [dbo].[Contract_RecurringPaymentRule]
    ADD CONSTRAINT [FK_Contract_RecurringPaymentRule_CustomerPaymentOption] FOREIGN KEY ([Customer_PaymentOption_Id]) REFERENCES [dbo].[Customer_PaymentOption] ([Id]);


GO
PRINT N'Creando [dbo].[FK_ContractSecion_Type]...';


GO
ALTER TABLE [dbo].[Contract_TypeSection]
    ADD CONSTRAINT [FK_ContractSecion_Type] FOREIGN KEY ([Contract_Type_Id]) REFERENCES [dbo].[Contract_Type] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Country_Employee]...';


GO
ALTER TABLE [dbo].[Country]
    ADD CONSTRAINT [FK_Country_Employee] FOREIGN KEY ([Employee_Id]) REFERENCES [dbo].[Employee] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Customer_CustomerType]...';


GO
ALTER TABLE [dbo].[Customer]
    ADD CONSTRAINT [FK_Customer_CustomerType] FOREIGN KEY ([Customer_Type_Id]) REFERENCES [dbo].[Customer_Type] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Customer_Customer]...';


GO
ALTER TABLE [dbo].[Customer]
    ADD CONSTRAINT [FK_Customer_Customer] FOREIGN KEY ([Parent_Id]) REFERENCES [dbo].[Customer] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Customer_Industry]...';


GO
ALTER TABLE [dbo].[Customer]
    ADD CONSTRAINT [FK_Customer_Industry] FOREIGN KEY ([Industry_Id]) REFERENCES [dbo].[Industry] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Customer_CustomerRelationship]...';


GO
ALTER TABLE [dbo].[Customer]
    ADD CONSTRAINT [FK_Customer_CustomerRelationship] FOREIGN KEY ([Customer_RelationshipType_Id]) REFERENCES [dbo].[Customer_RelationshipType] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Customer_SourceChannel]...';


GO
ALTER TABLE [dbo].[Customer]
    ADD CONSTRAINT [FK_Customer_SourceChannel] FOREIGN KEY ([SourceChannel_Id]) REFERENCES [dbo].[SourceChannel] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Customer_Campaign]...';


GO
ALTER TABLE [dbo].[Customer]
    ADD CONSTRAINT [FK_Customer_Campaign] FOREIGN KEY ([Campaign_Id]) REFERENCES [dbo].[Campaign] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Customer_Language]...';


GO
ALTER TABLE [dbo].[Customer]
    ADD CONSTRAINT [FK_Customer_Language] FOREIGN KEY ([Language_Id]) REFERENCES [dbo].[Language] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Customer_Gender]...';


GO
ALTER TABLE [dbo].[Customer]
    ADD CONSTRAINT [FK_Customer_Gender] FOREIGN KEY ([Gender_Id]) REFERENCES [dbo].[Gender] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Customer_Salutation]...';


GO
ALTER TABLE [dbo].[Customer]
    ADD CONSTRAINT [FK_Customer_Salutation] FOREIGN KEY ([Salutation_Id]) REFERENCES [dbo].[Salutation] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Customer_Employee]...';


GO
ALTER TABLE [dbo].[Customer]
    ADD CONSTRAINT [FK_Customer_Employee] FOREIGN KEY ([Employee_Id]) REFERENCES [dbo].[Employee] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Customer_Territory]...';


GO
ALTER TABLE [dbo].[Customer]
    ADD CONSTRAINT [FK_Customer_Territory] FOREIGN KEY ([Territory_Id]) REFERENCES [dbo].[Territory] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Customer_LegalIdType]...';


GO
ALTER TABLE [dbo].[Customer]
    ADD CONSTRAINT [FK_Customer_LegalIdType] FOREIGN KEY ([LegalIdType_Id]) REFERENCES [dbo].[LegalIdType] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Customer_Rating]...';


GO
ALTER TABLE [dbo].[Customer]
    ADD CONSTRAINT [FK_Customer_Rating] FOREIGN KEY ([Customer_Rating_Id]) REFERENCES [dbo].[Customer_Rating] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Customer_Class]...';


GO
ALTER TABLE [dbo].[Customer]
    ADD CONSTRAINT [FK_Customer_Class] FOREIGN KEY ([Customer_Class_Id]) REFERENCES [dbo].[Customer_Class] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Customer_Address_City]...';


GO
ALTER TABLE [dbo].[Customer_Address]
    ADD CONSTRAINT [FK_Customer_Address_City] FOREIGN KEY ([City_Id]) REFERENCES [dbo].[City] ([Id]);


GO
PRINT N'Creando [dbo].[FK_AddressType_Id]...';


GO
ALTER TABLE [dbo].[Customer_Address]
    ADD CONSTRAINT [FK_AddressType_Id] FOREIGN KEY ([AddressType_Id]) REFERENCES [dbo].[AddressType] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Customer_Address_Customer]...';


GO
ALTER TABLE [dbo].[Customer_Address]
    ADD CONSTRAINT [FK_Customer_Address_Customer] FOREIGN KEY ([Customer_Id]) REFERENCES [dbo].[Customer] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Customer_ComunicationOption_Customer]...';


GO
ALTER TABLE [dbo].[Customer_ComunicationOption]
    ADD CONSTRAINT [FK_Customer_ComunicationOption_Customer] FOREIGN KEY ([Customer_Id]) REFERENCES [dbo].[Customer] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Customer_ComunicationOption_CommunicationOptionType]...';


GO
ALTER TABLE [dbo].[Customer_ComunicationOption]
    ADD CONSTRAINT [FK_Customer_ComunicationOption_CommunicationOptionType] FOREIGN KEY ([CommunicationOptionType_Id]) REFERENCES [dbo].[CommunicationOptionType] ([Id]);


GO
PRINT N'Creando [dbo].[FK_CustomerContact_Customer]...';


GO
ALTER TABLE [dbo].[Customer_Contact]
    ADD CONSTRAINT [FK_CustomerContact_Customer] FOREIGN KEY ([Customer_Id]) REFERENCES [dbo].[Customer] ([Id]);


GO
PRINT N'Creando [dbo].[FK_CustomerContact_Contact_Id]...';


GO
ALTER TABLE [dbo].[Customer_Contact]
    ADD CONSTRAINT [FK_CustomerContact_Contact_Id] FOREIGN KEY ([Contact_Id]) REFERENCES [dbo].[Contact] ([Id]);


GO
PRINT N'Creando [dbo].[FK_CustomerContact_Departament_Id]...';


GO
ALTER TABLE [dbo].[Customer_Contact]
    ADD CONSTRAINT [FK_CustomerContact_Departament_Id] FOREIGN KEY ([Contact_Department_Id]) REFERENCES [dbo].[Contact_Department] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Customer_Label_Customer]...';


GO
ALTER TABLE [dbo].[Customer_Label]
    ADD CONSTRAINT [FK_Customer_Label_Customer] FOREIGN KEY ([Customer_Id]) REFERENCES [dbo].[Customer] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Customer_PaymentOption_Bank]...';


GO
ALTER TABLE [dbo].[Customer_PaymentOption]
    ADD CONSTRAINT [FK_Customer_PaymentOption_Bank] FOREIGN KEY ([Bank_Id]) REFERENCES [dbo].[Bank] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Customer_PaymentOption_Customer]...';


GO
ALTER TABLE [dbo].[Customer_PaymentOption]
    ADD CONSTRAINT [FK_Customer_PaymentOption_Customer] FOREIGN KEY ([Customer_Id]) REFERENCES [dbo].[Customer] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Customer_PaymentOption_Type]...';


GO
ALTER TABLE [dbo].[Customer_PaymentOption]
    ADD CONSTRAINT [FK_Customer_PaymentOption_Type] FOREIGN KEY ([Payment_Subtype_Id]) REFERENCES [dbo].[Payment_Subtype] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Employe_Role]...';


GO
ALTER TABLE [dbo].[Employee]
    ADD CONSTRAINT [FK_Employe_Role] FOREIGN KEY ([Role_Id]) REFERENCES [dbo].[Role] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Employe_CompanyPlace]...';


GO
ALTER TABLE [dbo].[Employee]
    ADD CONSTRAINT [FK_Employe_CompanyPlace] FOREIGN KEY ([Company_Place_Id]) REFERENCES [dbo].[Company_Place] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Employe_CompanyPointOfSale]...';


GO
ALTER TABLE [dbo].[Employee]
    ADD CONSTRAINT [FK_Employe_CompanyPointOfSale] FOREIGN KEY ([Company_EmissionPoint_Id]) REFERENCES [dbo].[Company_EmissionPoint] ([Id]);


GO
PRINT N'Creando [dbo].[FK_EmployeeParent_Employee]...';


GO
ALTER TABLE [dbo].[Employee_Parent]
    ADD CONSTRAINT [FK_EmployeeParent_Employee] FOREIGN KEY ([Employee_Id]) REFERENCES [dbo].[Employee] ([Id]);


GO
PRINT N'Creando [dbo].[FK_EmployeeParent_EmployeeId]...';


GO
ALTER TABLE [dbo].[Employee_Parent]
    ADD CONSTRAINT [FK_EmployeeParent_EmployeeId] FOREIGN KEY ([EmployeeId]) REFERENCES [dbo].[Employee] ([Id]);


GO
PRINT N'Creando [dbo].[FK_EmployeeParent_Parent]...';


GO
ALTER TABLE [dbo].[Employee_Parent]
    ADD CONSTRAINT [FK_EmployeeParent_Parent] FOREIGN KEY ([ParentId]) REFERENCES [dbo].[Employee] ([Id]);


GO
PRINT N'Creando [dbo].[FK_ProductionCenter_CompanyPlace]...';


GO
ALTER TABLE [dbo].[Factory]
    ADD CONSTRAINT [FK_ProductionCenter_CompanyPlace] FOREIGN KEY ([Company_Place_Id]) REFERENCES [dbo].[Company_Place] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Inventory_BusinessItemVariation]...';


GO
ALTER TABLE [dbo].[Inventory]
    ADD CONSTRAINT [FK_Inventory_BusinessItemVariation] FOREIGN KEY ([BusinessItemVariation_Id]) REFERENCES [dbo].[BusinessItemVariation] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Inventory_InventoryIncome]...';


GO
ALTER TABLE [dbo].[Inventory]
    ADD CONSTRAINT [FK_Inventory_InventoryIncome] FOREIGN KEY ([InventoryIncome_Id]) REFERENCES [dbo].[InventoryIncome] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Inventory_InventoryOutput]...';


GO
ALTER TABLE [dbo].[Inventory]
    ADD CONSTRAINT [FK_Inventory_InventoryOutput] FOREIGN KEY ([InventoryOutput_Id]) REFERENCES [dbo].[InventoryOutput] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Inventory_InventoryStatus]...';


GO
ALTER TABLE [dbo].[Inventory]
    ADD CONSTRAINT [FK_Inventory_InventoryStatus] FOREIGN KEY ([Inventory_Status_Id]) REFERENCES [dbo].[Inventory_Status] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Inventory_Manufacturee]...';


GO
ALTER TABLE [dbo].[Inventory]
    ADD CONSTRAINT [FK_Inventory_Manufacturee] FOREIGN KEY ([Manufacture_Id]) REFERENCES [dbo].[Manufacture] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Inventory_SaleInvoice]...';


GO
ALTER TABLE [dbo].[Inventory]
    ADD CONSTRAINT [FK_Inventory_SaleInvoice] FOREIGN KEY ([SaleInvoice_Id]) REFERENCES [dbo].[SaleInvoice] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Inventory_Warehouse]...';


GO
ALTER TABLE [dbo].[Inventory]
    ADD CONSTRAINT [FK_Inventory_Warehouse] FOREIGN KEY ([Warehouse_Id]) REFERENCES [dbo].[Warehouse] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Income_Purchase]...';


GO
ALTER TABLE [dbo].[InventoryIncome]
    ADD CONSTRAINT [FK_Income_Purchase] FOREIGN KEY ([Purchase_Id]) REFERENCES [dbo].[Purchase] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Income_InventoryTransfer]...';


GO
ALTER TABLE [dbo].[InventoryIncome]
    ADD CONSTRAINT [FK_Income_InventoryTransfer] FOREIGN KEY ([InventoryTransfer_Id]) REFERENCES [dbo].[InventoryTransfer] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Income_Warehouse]...';


GO
ALTER TABLE [dbo].[InventoryIncome]
    ADD CONSTRAINT [FK_Income_Warehouse] FOREIGN KEY ([Warehouse_Id]) REFERENCES [dbo].[Warehouse] ([Id]);


GO
PRINT N'Creando [dbo].[FK_InventoryIncome_Detail_InventoryIncome]...';


GO
ALTER TABLE [dbo].[InventoryIncome_Detail]
    ADD CONSTRAINT [FK_InventoryIncome_Detail_InventoryIncome] FOREIGN KEY ([InventoryIncome_Id]) REFERENCES [dbo].[InventoryIncome] ([Id]);


GO
PRINT N'Creando [dbo].[FK_InventoryIncome_Detail_BusinessVariation]...';


GO
ALTER TABLE [dbo].[InventoryIncome_Detail]
    ADD CONSTRAINT [FK_InventoryIncome_Detail_BusinessVariation] FOREIGN KEY ([BusinessItemVariation_Id]) REFERENCES [dbo].[BusinessItemVariation] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Output_SaleInvoice]...';


GO
ALTER TABLE [dbo].[InventoryOutput]
    ADD CONSTRAINT [FK_Output_SaleInvoice] FOREIGN KEY ([SaleInvoice_Id]) REFERENCES [dbo].[SaleInvoice] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Output_Warehouse]...';


GO
ALTER TABLE [dbo].[InventoryOutput]
    ADD CONSTRAINT [FK_Output_Warehouse] FOREIGN KEY ([Warehouse_Id]) REFERENCES [dbo].[Warehouse] ([Id]);


GO
PRINT N'Creando [dbo].[FK_InventoryOutput_Detail_InventoryIncome]...';


GO
ALTER TABLE [dbo].[InventoryOutput_Detail]
    ADD CONSTRAINT [FK_InventoryOutput_Detail_InventoryIncome] FOREIGN KEY ([InventoryOutput_Id]) REFERENCES [dbo].[InventoryOutput] ([Id]);


GO
PRINT N'Creando [dbo].[FK_InventoryOutput_Detail_BusinessVariation]...';


GO
ALTER TABLE [dbo].[InventoryOutput_Detail]
    ADD CONSTRAINT [FK_InventoryOutput_Detail_BusinessVariation] FOREIGN KEY ([BusinessItemVariation_Id]) REFERENCES [dbo].[BusinessItemVariation] ([Id]);


GO
PRINT N'Creando [dbo].[FK_InventoryOutputDetail_Detail]...';


GO
ALTER TABLE [dbo].[InventoryOutputDetail_Inventory]
    ADD CONSTRAINT [FK_InventoryOutputDetail_Detail] FOREIGN KEY ([InventoryOutput_Detail_Id]) REFERENCES [dbo].[InventoryOutput_Detail] ([Id]);


GO
PRINT N'Creando [dbo].[FK_InventoryOutputDetail_Inventory]...';


GO
ALTER TABLE [dbo].[InventoryOutputDetail_Inventory]
    ADD CONSTRAINT [FK_InventoryOutputDetail_Inventory] FOREIGN KEY ([Inventory_Id]) REFERENCES [dbo].[Inventory] ([Id]);


GO
PRINT N'Creando [dbo].[FK_InventoryTransfer_OriginEmployee]...';


GO
ALTER TABLE [dbo].[InventoryTransfer]
    ADD CONSTRAINT [FK_InventoryTransfer_OriginEmployee] FOREIGN KEY ([OriginEmployee_Id]) REFERENCES [dbo].[Employee] ([Id]);


GO
PRINT N'Creando [dbo].[FK_InventoryTransfer_DestinyEmployee]...';


GO
ALTER TABLE [dbo].[InventoryTransfer]
    ADD CONSTRAINT [FK_InventoryTransfer_DestinyEmployee] FOREIGN KEY ([DestinyEmployee_Id]) REFERENCES [dbo].[Employee] ([Id]);


GO
PRINT N'Creando [dbo].[FK_InventoryTransfer_OriginWarehouse]...';


GO
ALTER TABLE [dbo].[InventoryTransfer]
    ADD CONSTRAINT [FK_InventoryTransfer_OriginWarehouse] FOREIGN KEY ([OriginWarehouse_Id]) REFERENCES [dbo].[Warehouse] ([Id]);


GO
PRINT N'Creando [dbo].[FK_InventoryTransfer_DestinyWarehouse]...';


GO
ALTER TABLE [dbo].[InventoryTransfer]
    ADD CONSTRAINT [FK_InventoryTransfer_DestinyWarehouse] FOREIGN KEY ([DestinyWareHouse_Id]) REFERENCES [dbo].[Warehouse] ([Id]);


GO
PRINT N'Creando [dbo].[FK_InventoryTransfer_Status]...';


GO
ALTER TABLE [dbo].[InventoryTransfer]
    ADD CONSTRAINT [FK_InventoryTransfer_Status] FOREIGN KEY ([InventoryTransfer_Status_Id]) REFERENCES [dbo].[InventoryTransfer_Status] ([Id]);


GO
PRINT N'Creando [dbo].[FK_InventoryTransfer_Reason]...';


GO
ALTER TABLE [dbo].[InventoryTransfer]
    ADD CONSTRAINT [FK_InventoryTransfer_Reason] FOREIGN KEY ([InventoryTransfer_Reason_Id]) REFERENCES [dbo].[InventoryTransfer_Reason] ([Id]);


GO
PRINT N'Creando [dbo].[FK_InventoryTransfer_Detail_BusinessItemVariation]...';


GO
ALTER TABLE [dbo].[InventoryTransfer_Detail]
    ADD CONSTRAINT [FK_InventoryTransfer_Detail_BusinessItemVariation] FOREIGN KEY ([BusinessItemVariation_Id]) REFERENCES [dbo].[BusinessItemVariation] ([Id]);


GO
PRINT N'Creando [dbo].[FK_InventoryTransfer_Detail_InventoryTransfer]...';


GO
ALTER TABLE [dbo].[InventoryTransfer_Detail]
    ADD CONSTRAINT [FK_InventoryTransfer_Detail_InventoryTransfer] FOREIGN KEY ([InventoryTransfer_Id]) REFERENCES [dbo].[InventoryTransfer] ([Id]);


GO
PRINT N'Creando [dbo].[FK_InventoryTransferDetail_Detail]...';


GO
ALTER TABLE [dbo].[InventoryTransferDetail_Inventory]
    ADD CONSTRAINT [FK_InventoryTransferDetail_Detail] FOREIGN KEY ([InventoryTransfer_Detail_Id]) REFERENCES [dbo].[InventoryTransfer_Detail] ([Id]);


GO
PRINT N'Creando [dbo].[FK_InventoryTransferDetail_Inventory]...';


GO
ALTER TABLE [dbo].[InventoryTransferDetail_Inventory]
    ADD CONSTRAINT [FK_InventoryTransferDetail_Inventory] FOREIGN KEY ([Inventory_Id]) REFERENCES [dbo].[Inventory] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Manufacture_ProvisionWarehouse]...';


GO
ALTER TABLE [dbo].[Manufacture]
    ADD CONSTRAINT [FK_Manufacture_ProvisionWarehouse] FOREIGN KEY ([Warehouse_Id]) REFERENCES [dbo].[Warehouse] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Manufacture_BusinessItemVariation]...';


GO
ALTER TABLE [dbo].[Manufacture]
    ADD CONSTRAINT [FK_Manufacture_BusinessItemVariation] FOREIGN KEY ([BusinessItemVariation_Id]) REFERENCES [dbo].[BusinessItemVariation] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Manufacture_UnitOfMeasure]...';


GO
ALTER TABLE [dbo].[Manufacture]
    ADD CONSTRAINT [FK_Manufacture_UnitOfMeasure] FOREIGN KEY ([UnitOfMeasure_Id]) REFERENCES [dbo].[UnitOfMeasure] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Manufacture_ProductionCenter]...';


GO
ALTER TABLE [dbo].[Manufacture]
    ADD CONSTRAINT [FK_Manufacture_ProductionCenter] FOREIGN KEY ([Factory_Id]) REFERENCES [dbo].[Factory] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Manufacture_ManufactureStatus]...';


GO
ALTER TABLE [dbo].[Manufacture]
    ADD CONSTRAINT [FK_Manufacture_ManufactureStatus] FOREIGN KEY ([Manufacture_Status_Id]) REFERENCES [dbo].[Manufacture_Status] ([Id]);


GO
PRINT N'Creando [dbo].[FK_ManufactureItem_Manufacture]...';


GO
ALTER TABLE [dbo].[Manufacture_Item]
    ADD CONSTRAINT [FK_ManufactureItem_Manufacture] FOREIGN KEY ([Manufacture_Id]) REFERENCES [dbo].[Manufacture] ([Id]);


GO
PRINT N'Creando [dbo].[FK_ManufactureItem_BusinessItemVariation]...';


GO
ALTER TABLE [dbo].[Manufacture_Item]
    ADD CONSTRAINT [FK_ManufactureItem_BusinessItemVariation] FOREIGN KEY ([BusinessItemVariation_Id]) REFERENCES [dbo].[BusinessItemVariation] ([Id]);


GO
PRINT N'Creando [dbo].[FK_MassiveEmail_CustomerSegments]...';


GO
ALTER TABLE [dbo].[MassiveEmail]
    ADD CONSTRAINT [FK_MassiveEmail_CustomerSegments] FOREIGN KEY ([CustomerSegments_Id]) REFERENCES [dbo].[CustomerSegments] ([Id]);


GO
PRINT N'Creando [dbo].[FK_MassiveEmail_MassiveEmail_State]...';


GO
ALTER TABLE [dbo].[MassiveEmail]
    ADD CONSTRAINT [FK_MassiveEmail_MassiveEmail_State] FOREIGN KEY ([MassiveEmail_State_Id]) REFERENCES [dbo].[MassiveEmail_State] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Payment_Subtype_Type]...';


GO
ALTER TABLE [dbo].[Payment_Subtype]
    ADD CONSTRAINT [FK_Payment_Subtype_Type] FOREIGN KEY ([Payment_Type_Id]) REFERENCES [dbo].[Payment_Type] ([Id]);


GO
PRINT N'Creando [dbo].[FK_RolePermission_Role]...';


GO
ALTER TABLE [dbo].[Permission]
    ADD CONSTRAINT [FK_RolePermission_Role] FOREIGN KEY ([Role_Id]) REFERENCES [dbo].[Role] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Purchase_Supplier]...';


GO
ALTER TABLE [dbo].[Purchase]
    ADD CONSTRAINT [FK_Purchase_Supplier] FOREIGN KEY ([Supplier_Id]) REFERENCES [dbo].[Supplier] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Purchase_CompanyPlace]...';


GO
ALTER TABLE [dbo].[Purchase]
    ADD CONSTRAINT [FK_Purchase_CompanyPlace] FOREIGN KEY ([Company_Place_Id]) REFERENCES [dbo].[Company_Place] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Purchase_PurchaseStatus]...';


GO
ALTER TABLE [dbo].[Purchase]
    ADD CONSTRAINT [FK_Purchase_PurchaseStatus] FOREIGN KEY ([Purchase_Status_Id]) REFERENCES [dbo].[Purchase_Status] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Purchase_Sale]...';


GO
ALTER TABLE [dbo].[Purchase]
    ADD CONSTRAINT [FK_Purchase_Sale] FOREIGN KEY ([Sale_Id]) REFERENCES [dbo].[Sale] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Purchase_Employee_Id]...';


GO
ALTER TABLE [dbo].[Purchase]
    ADD CONSTRAINT [FK_Purchase_Employee_Id] FOREIGN KEY ([Employee_Id]) REFERENCES [dbo].[Employee] ([Id]);


GO
PRINT N'Creando [dbo].[FK_PurchaseItem_Purchase]...';


GO
ALTER TABLE [dbo].[Purchase_Item]
    ADD CONSTRAINT [FK_PurchaseItem_Purchase] FOREIGN KEY ([Purchase_Id]) REFERENCES [dbo].[Purchase] ([Id]);


GO
PRINT N'Creando [dbo].[FK_PurchaseItem_Material]...';


GO
ALTER TABLE [dbo].[Purchase_Item]
    ADD CONSTRAINT [FK_PurchaseItem_Material] FOREIGN KEY ([BusinessItemVariation_Id]) REFERENCES [dbo].[BusinessItemVariation] ([Id]);


GO
PRINT N'Creando [dbo].[FK_PurchaseInvoice_Purchase]...';


GO
ALTER TABLE [dbo].[PurchaseInvoice]
    ADD CONSTRAINT [FK_PurchaseInvoice_Purchase] FOREIGN KEY ([Purchase_Id]) REFERENCES [dbo].[Purchase] ([Id]);


GO
PRINT N'Creando [dbo].[FK_PurchaseInvoice_Line]...';


GO
ALTER TABLE [dbo].[PurchaseInvoice_Line]
    ADD CONSTRAINT [FK_PurchaseInvoice_Line] FOREIGN KEY ([PurchaseInvoice_Id]) REFERENCES [dbo].[PurchaseInvoice] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creando [dbo].[FK_PurchaseInvoice_Line_BusinessItemVariation]...';


GO
ALTER TABLE [dbo].[PurchaseInvoice_Line]
    ADD CONSTRAINT [FK_PurchaseInvoice_Line_BusinessItemVariation] FOREIGN KEY ([BusinessItemVariation_Id]) REFERENCES [dbo].[BusinessItemVariation] ([Id]);


GO
PRINT N'Creando [dbo].[FK_PurchaseInvoice_LineTax_Line]...';


GO
ALTER TABLE [dbo].[PurchaseInvoice_LineTax]
    ADD CONSTRAINT [FK_PurchaseInvoice_LineTax_Line] FOREIGN KEY ([PurchaseInvoice_Line_Id]) REFERENCES [dbo].[PurchaseInvoice_Line] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creando [dbo].[FK_PurchaseInvoice_LineTax_Tax]...';


GO
ALTER TABLE [dbo].[PurchaseInvoice_LineTax]
    ADD CONSTRAINT [FK_PurchaseInvoice_LineTax_Tax] FOREIGN KEY ([Tax_Id]) REFERENCES [dbo].[Tax] ([Id]);


GO
PRINT N'Creando [dbo].[FK_PurchaseTax_PurchaseInvoice]...';


GO
ALTER TABLE [dbo].[PurchaseInvoice_Tax]
    ADD CONSTRAINT [FK_PurchaseTax_PurchaseInvoice] FOREIGN KEY ([PurchaseInvoice_Id]) REFERENCES [dbo].[PurchaseInvoice] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creando [dbo].[FK_PurchaseTax_Tax]...';


GO
ALTER TABLE [dbo].[PurchaseInvoice_Tax]
    ADD CONSTRAINT [FK_PurchaseTax_Tax] FOREIGN KEY ([Tax_Id]) REFERENCES [dbo].[Tax] ([Id]);


GO
PRINT N'Creando [dbo].[FK_PurchaseInvoicePayment_PurchaseInvoice]...';


GO
ALTER TABLE [dbo].[PurchaseInvoicePayment]
    ADD CONSTRAINT [FK_PurchaseInvoicePayment_PurchaseInvoice] FOREIGN KEY ([PurchaseInvoice_Id]) REFERENCES [dbo].[PurchaseInvoice] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creando [dbo].[FK_PurchaseInvoicePayment_CustomerPaymentOption]...';


GO
ALTER TABLE [dbo].[PurchaseInvoicePayment]
    ADD CONSTRAINT [FK_PurchaseInvoicePayment_CustomerPaymentOption] FOREIGN KEY ([Supplier_PaymentOption_Id]) REFERENCES [dbo].[Supplier_PaymentOption] ([Id]);


GO
PRINT N'Creando [dbo].[FK_RemissionGuide_InventoryOutput]...';


GO
ALTER TABLE [dbo].[RemissionGuide]
    ADD CONSTRAINT [FK_RemissionGuide_InventoryOutput] FOREIGN KEY ([InventoryOutput_Id]) REFERENCES [dbo].[InventoryOutput] ([Id]);


GO
PRINT N'Creando [dbo].[FK_RemissionGuide_InventoryTransfer]...';


GO
ALTER TABLE [dbo].[RemissionGuide]
    ADD CONSTRAINT [FK_RemissionGuide_InventoryTransfer] FOREIGN KEY ([InventoryTransfer_Id]) REFERENCES [dbo].[InventoryTransfer] ([Id]);


GO
PRINT N'Creando [dbo].[FK_RemissionGuide_Driver]...';


GO
ALTER TABLE [dbo].[RemissionGuide]
    ADD CONSTRAINT [FK_RemissionGuide_Driver] FOREIGN KEY ([Driver_Id]) REFERENCES [dbo].[Driver] ([Id]);


GO
PRINT N'Creando [dbo].[FK_RemissionGuide_Company_EmissionPoint]...';


GO
ALTER TABLE [dbo].[RemissionGuide]
    ADD CONSTRAINT [FK_RemissionGuide_Company_EmissionPoint] FOREIGN KEY ([Company_EmissionPoint_Id]) REFERENCES [dbo].[Company_EmissionPoint] ([Id]);


GO
PRINT N'Creando [dbo].[FK_RemissionGuide_Line]...';


GO
ALTER TABLE [dbo].[RemissionGuide_Line]
    ADD CONSTRAINT [FK_RemissionGuide_Line] FOREIGN KEY ([RemissionGuide_Id]) REFERENCES [dbo].[RemissionGuide] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creando [dbo].[FK_RemissionGuide_Line_BusinessItem]...';


GO
ALTER TABLE [dbo].[RemissionGuide_Line]
    ADD CONSTRAINT [FK_RemissionGuide_Line_BusinessItem] FOREIGN KEY ([BusinessItemVariation_Id]) REFERENCES [dbo].[BusinessItemVariation] ([Id]);


GO
PRINT N'Creando [dbo].[FK_RemissionGuide_PurchaseInvoice]...';


GO
ALTER TABLE [dbo].[RetentionVoucher]
    ADD CONSTRAINT [FK_RemissionGuide_PurchaseInvoice] FOREIGN KEY ([PurchaseInvoice_Id]) REFERENCES [dbo].[PurchaseInvoice] ([Id]);


GO
PRINT N'Creando [dbo].[FK_RetentionVoucher_Company_EmissionPoint]...';


GO
ALTER TABLE [dbo].[RetentionVoucher]
    ADD CONSTRAINT [FK_RetentionVoucher_Company_EmissionPoint] FOREIGN KEY ([Company_EmissionPoint_Id]) REFERENCES [dbo].[Company_EmissionPoint] ([Id]);


GO
PRINT N'Creando [dbo].[FK_RetentionVoucher_Line]...';


GO
ALTER TABLE [dbo].[RetentionVoucher_Line]
    ADD CONSTRAINT [FK_RetentionVoucher_Line] FOREIGN KEY ([RetentionVoucher_Id]) REFERENCES [dbo].[RetentionVoucher] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creando [dbo].[FK_RetentionVoucher_Line_TaxRetention]...';


GO
ALTER TABLE [dbo].[RetentionVoucher_Line]
    ADD CONSTRAINT [FK_RetentionVoucher_Line_TaxRetention] FOREIGN KEY ([Tax_Retention_Id]) REFERENCES [dbo].[Tax_Retention] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Sales_Customer]...';


GO
ALTER TABLE [dbo].[Sale]
    ADD CONSTRAINT [FK_Sales_Customer] FOREIGN KEY ([Customer_Id]) REFERENCES [dbo].[Customer] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Sale_Sale_Place]...';


GO
ALTER TABLE [dbo].[Sale]
    ADD CONSTRAINT [FK_Sale_Sale_Place] FOREIGN KEY ([Sale_Place_Id]) REFERENCES [dbo].[Sale_Place] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Sale_Employee_Id]...';


GO
ALTER TABLE [dbo].[Sale]
    ADD CONSTRAINT [FK_Sale_Employee_Id] FOREIGN KEY ([Employee_Id]) REFERENCES [dbo].[Employee] ([Id]);


GO
PRINT N'Creando [dbo].[FK_SaleItem_Sale]...';


GO
ALTER TABLE [dbo].[Sale_Item]
    ADD CONSTRAINT [FK_SaleItem_Sale] FOREIGN KEY ([Sale_Id]) REFERENCES [dbo].[Sale] ([Id]);


GO
PRINT N'Creando [dbo].[FK_SaleItem_BusinessItemVariation]...';


GO
ALTER TABLE [dbo].[Sale_Item]
    ADD CONSTRAINT [FK_SaleItem_BusinessItemVariation] FOREIGN KEY ([BusinessItemVariation_Id]) REFERENCES [dbo].[BusinessItemVariation] ([Id]);


GO
PRINT N'Creando [dbo].[FK_SaleInvoice_Sale]...';


GO
ALTER TABLE [dbo].[SaleInvoice]
    ADD CONSTRAINT [FK_SaleInvoice_Sale] FOREIGN KEY ([Sale_Id]) REFERENCES [dbo].[Sale] ([Id]);


GO
PRINT N'Creando [dbo].[FK_SaleInvoice_RecurrentProcess]...';


GO
ALTER TABLE [dbo].[SaleInvoice]
    ADD CONSTRAINT [FK_SaleInvoice_RecurrentProcess] FOREIGN KEY ([SaleInvoice_RecurrentProcess_Id]) REFERENCES [dbo].[SaleInvoice_RecurrentProcess] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creando [dbo].[FK_SaleInvoice_Company_EmissionPoint]...';


GO
ALTER TABLE [dbo].[SaleInvoice]
    ADD CONSTRAINT [FK_SaleInvoice_Company_EmissionPoint] FOREIGN KEY ([Company_EmissionPoint_Id]) REFERENCES [dbo].[Company_EmissionPoint] ([Id]);


GO
PRINT N'Creando [dbo].[FK_SaleInvoice_Line]...';


GO
ALTER TABLE [dbo].[SaleInvoice_Line]
    ADD CONSTRAINT [FK_SaleInvoice_Line] FOREIGN KEY ([SaleInvoice_Id]) REFERENCES [dbo].[SaleInvoice] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creando [dbo].[FK_SaleInvoice_Line_BusinessItem]...';


GO
ALTER TABLE [dbo].[SaleInvoice_Line]
    ADD CONSTRAINT [FK_SaleInvoice_Line_BusinessItem] FOREIGN KEY ([BusinessItemVariation_Id]) REFERENCES [dbo].[BusinessItemVariation] ([Id]);


GO
PRINT N'Creando [dbo].[FK_SaleInvoice_LineTax_Line]...';


GO
ALTER TABLE [dbo].[SaleInvoice_LineTax]
    ADD CONSTRAINT [FK_SaleInvoice_LineTax_Line] FOREIGN KEY ([SaleInvoice_Line_Id]) REFERENCES [dbo].[SaleInvoice_Line] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creando [dbo].[FK_SaleInvoice_LineTax_Tax]...';


GO
ALTER TABLE [dbo].[SaleInvoice_LineTax]
    ADD CONSTRAINT [FK_SaleInvoice_LineTax_Tax] FOREIGN KEY ([Tax_Id]) REFERENCES [dbo].[Tax] ([Id]);


GO
PRINT N'Creando [dbo].[FK_SaleInvoice_ProgressProcess]...';


GO
ALTER TABLE [dbo].[SaleInvoice_ProgressProcess]
    ADD CONSTRAINT [FK_SaleInvoice_ProgressProcess] FOREIGN KEY ([Contract_ProgressPaymentRule_Id]) REFERENCES [dbo].[Contract_ProgressPaymentRule] ([Id]);


GO
PRINT N'Creando [dbo].[FK_SaleInvoiceTax_SaleInvoice]...';


GO
ALTER TABLE [dbo].[SaleInvoice_Tax]
    ADD CONSTRAINT [FK_SaleInvoiceTax_SaleInvoice] FOREIGN KEY ([SaleInvoice_Id]) REFERENCES [dbo].[SaleInvoice] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creando [dbo].[FK_SaleInvoiceTax_Tax]...';


GO
ALTER TABLE [dbo].[SaleInvoice_Tax]
    ADD CONSTRAINT [FK_SaleInvoiceTax_Tax] FOREIGN KEY ([Tax_Id]) REFERENCES [dbo].[Tax] ([Id]);


GO
PRINT N'Creando [dbo].[FK_SaleInvoicePayment_SaleInvoice]...';


GO
ALTER TABLE [dbo].[SaleInvoicePayment]
    ADD CONSTRAINT [FK_SaleInvoicePayment_SaleInvoice] FOREIGN KEY ([SaleInvoice_Id]) REFERENCES [dbo].[SaleInvoice] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creando [dbo].[FK_SaleInvoicePayment_CustomerPaymentOption]...';


GO
ALTER TABLE [dbo].[SaleInvoicePayment]
    ADD CONSTRAINT [FK_SaleInvoicePayment_CustomerPaymentOption] FOREIGN KEY ([Customer_PaymentOption_Id]) REFERENCES [dbo].[Customer_PaymentOption] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Service_Service_Type]...';


GO
ALTER TABLE [dbo].[Service]
    ADD CONSTRAINT [FK_Service_Service_Type] FOREIGN KEY ([Service_Type_Id]) REFERENCES [dbo].[Service_Type] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Service_Status]...';


GO
ALTER TABLE [dbo].[Service]
    ADD CONSTRAINT [FK_Service_Status] FOREIGN KEY ([Service_Status_Id]) REFERENCES [dbo].[Service_Status] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Service_Priority]...';


GO
ALTER TABLE [dbo].[Service]
    ADD CONSTRAINT [FK_Service_Priority] FOREIGN KEY ([Service_Priority_Id]) REFERENCES [dbo].[Service_Priority] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Service_Customer]...';


GO
ALTER TABLE [dbo].[Service]
    ADD CONSTRAINT [FK_Service_Customer] FOREIGN KEY ([Customer_Id]) REFERENCES [dbo].[Customer] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Service_Contact]...';


GO
ALTER TABLE [dbo].[Service]
    ADD CONSTRAINT [FK_Service_Contact] FOREIGN KEY ([Contact_Id]) REFERENCES [dbo].[Contact] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Service_Contract]...';


GO
ALTER TABLE [dbo].[Service]
    ADD CONSTRAINT [FK_Service_Contract] FOREIGN KEY ([Contract_Id]) REFERENCES [dbo].[Contract] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Service_SaleInvoice_Line]...';


GO
ALTER TABLE [dbo].[Service]
    ADD CONSTRAINT [FK_Service_SaleInvoice_Line] FOREIGN KEY ([SaleInvoice_Line_Id]) REFERENCES [dbo].[SaleInvoice_Line] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Service_Employee]...';


GO
ALTER TABLE [dbo].[Service]
    ADD CONSTRAINT [FK_Service_Employee] FOREIGN KEY ([Employee_Id]) REFERENCES [dbo].[Employee] ([Id]);


GO
PRINT N'Creando [dbo].[FK_ServiceComment_Service]...';


GO
ALTER TABLE [dbo].[Service_Comment]
    ADD CONSTRAINT [FK_ServiceComment_Service] FOREIGN KEY ([Service_Id]) REFERENCES [dbo].[Service] ([Id]);


GO
PRINT N'Creando [dbo].[FK_ServiceComment_Employee]...';


GO
ALTER TABLE [dbo].[Service_Comment]
    ADD CONSTRAINT [FK_ServiceComment_Employee] FOREIGN KEY ([Employee_Id]) REFERENCES [dbo].[Employee] ([Id]);


GO
PRINT N'Creando [dbo].[FK_State_Country]...';


GO
ALTER TABLE [dbo].[State]
    ADD CONSTRAINT [FK_State_Country] FOREIGN KEY ([Country_Id]) REFERENCES [dbo].[Country] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Supplier_PaymentOption_Bank]...';


GO
ALTER TABLE [dbo].[Supplier_PaymentOption]
    ADD CONSTRAINT [FK_Supplier_PaymentOption_Bank] FOREIGN KEY ([Bank_Id]) REFERENCES [dbo].[Bank] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Supplier_PaymentOption_Supplier]...';


GO
ALTER TABLE [dbo].[Supplier_PaymentOption]
    ADD CONSTRAINT [FK_Supplier_PaymentOption_Supplier] FOREIGN KEY ([Supplier_Id]) REFERENCES [dbo].[Supplier] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Supplier_PaymentOption_Type]...';


GO
ALTER TABLE [dbo].[Supplier_PaymentOption]
    ADD CONSTRAINT [FK_Supplier_PaymentOption_Type] FOREIGN KEY ([Payment_Subtype_Id]) REFERENCES [dbo].[Payment_Subtype] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Tax_TaxType]...';


GO
ALTER TABLE [dbo].[Tax]
    ADD CONSTRAINT [FK_Tax_TaxType] FOREIGN KEY ([Tax_Type_Id]) REFERENCES [dbo].[Tax_Type] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Tax_BusinessItem_Tax]...';


GO
ALTER TABLE [dbo].[Tax_BusinessItemClass]
    ADD CONSTRAINT [FK_Tax_BusinessItem_Tax] FOREIGN KEY ([Tax_Id]) REFERENCES [dbo].[Tax] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Tax_BusinessItem_BusinessItem]...';


GO
ALTER TABLE [dbo].[Tax_BusinessItemClass]
    ADD CONSTRAINT [FK_Tax_BusinessItem_BusinessItem] FOREIGN KEY ([BusinessItem_Class_Id]) REFERENCES [dbo].[BusinessItem_Class] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Tax_CustomerClass_Tax]...';


GO
ALTER TABLE [dbo].[Tax_CustomerClass]
    ADD CONSTRAINT [FK_Tax_CustomerClass_Tax] FOREIGN KEY ([Tax_Id]) REFERENCES [dbo].[Tax] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Tax_CustomerClass_CustomerClass]...';


GO
ALTER TABLE [dbo].[Tax_CustomerClass]
    ADD CONSTRAINT [FK_Tax_CustomerClass_CustomerClass] FOREIGN KEY ([Customer_Class_Id]) REFERENCES [dbo].[Customer_Class] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Tax_RetentionType]...';


GO
ALTER TABLE [dbo].[Tax_Retention]
    ADD CONSTRAINT [FK_Tax_RetentionType] FOREIGN KEY ([Tax_RetentionType_Id]) REFERENCES [dbo].[Tax_RetentionType] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Tax_SupplierClass_Tax]...';


GO
ALTER TABLE [dbo].[Tax_SupplierClass]
    ADD CONSTRAINT [FK_Tax_SupplierClass_Tax] FOREIGN KEY ([Tax_Id]) REFERENCES [dbo].[Tax] ([Id]);


GO
PRINT N'Creando [dbo].[FK_Tax_SupplierClass_SupplierClass]...';


GO
ALTER TABLE [dbo].[Tax_SupplierClass]
    ADD CONSTRAINT [FK_Tax_SupplierClass_SupplierClass] FOREIGN KEY ([Supplier_Class_Id]) REFERENCES [dbo].[Supplier_Class] ([Id]);


GO
PRINT N'Creando [dbo].[FK_WarehouseMaterials_CompanyPlace]...';


GO
ALTER TABLE [dbo].[Warehouse]
    ADD CONSTRAINT [FK_WarehouseMaterials_CompanyPlace] FOREIGN KEY ([Company_Place_Id]) REFERENCES [dbo].[Company_Place] ([Id]);


GO
PRINT N'Creando [dbo].[BusinessOpportunity_AssignSequentialNumber]...';


GO


CREATE TRIGGER [BusinessOpportunity_AssignSequentialNumber]  
ON [BusinessOpportunity]
AFTER INSERT
AS  
	BEGIN
			
			declare @max bigint
			declare @id varchar(max)

			select @id = [Id] from [Inserted]
			select @max = max(isnull([Number],0)) from [BusinessOpportunity]
		
			update [BusinessOpportunity] set [Number] = @max + 1 where [Id] = @id

		END
GO
PRINT N'Creando [dbo].[BusinessOpportunityItem_AssignSequentialNumber]...';


GO
CREATE TRIGGER [BusinessOpportunityItem_AssignSequentialNumber]  
ON [BusinessOpportunity_Item]
AFTER INSERT
AS  
	BEGIN
			
			declare @max bigint
			declare @id varchar(max)

			select @id = [Id] from [Inserted]
			select @max = max(isnull([Number],0)) from [BusinessOpportunity_Item]
		
			update [BusinessOpportunity_Item] set [Number] = @max + 1 where [Id] = @id

		END
GO
PRINT N'Creando [dbo].[Contract_AssignSequentialNumber]...';


GO


CREATE TRIGGER [Contract_AssignSequentialNumber]  
ON [Contract]
AFTER INSERT
AS  
	BEGIN
			
			declare @max bigint
			declare @id varchar(max)

			select @id = [Id] from [Inserted]
			select @max = max(isnull([Number],0)) from [Contract]
		
			update [Contract] set [Number] = @max + 1 where [Id] = @id

		END
GO
PRINT N'Creando [dbo].[InventoryIncome_AssignSequentialNumber]...';


GO
CREATE TRIGGER [InventoryIncome_AssignSequentialNumber]
ON [InventoryIncome]
AFTER INSERT
AS  
	BEGIN
			
			declare @max bigint
			declare @id varchar(max)

			select @id = [Id] from [Inserted]
			select @max = max(isnull([Sequential],0)) from [InventoryIncome]
		
			update [InventoryIncome] set [Sequential] = @max + 1 where [Id] = @id

		END
GO
PRINT N'Creando [dbo].[InventoryOutput_AssignSequentialNumber]...';


GO
CREATE TRIGGER [InventoryOutput_AssignSequentialNumber]
ON [InventoryOutput]
AFTER INSERT
AS  
	BEGIN
			
			declare @max bigint
			declare @id varchar(max)

			select @id = [Id] from [Inserted]
			select @max = max(isnull([Sequential],0)) from [InventoryOutput]
		
			update [InventoryOutput] set [Sequential] = @max + 1 where [Id] = @id

		END
GO
PRINT N'Creando [dbo].[InventoryTransfer_AssignSequentialNumber]...';


GO
CREATE TRIGGER [InventoryTransfer_AssignSequentialNumber]
ON [InventoryTransfer]
AFTER INSERT
AS  
	BEGIN
			
			declare @max bigint
			declare @id varchar(max)

			select @id = [Id] from [Inserted]
			select @max = max(isnull([Sequential],0)) from [InventoryTransfer]
		
			update [InventoryTransfer] set [Sequential] = @max + 1 where [Id] = @id

		END
GO
PRINT N'Creando [dbo].[Manufacture_AssignSequentialNumber]...';


GO

CREATE TRIGGER [Manufacture_AssignSequentialNumber]
ON [Manufacture]
AFTER INSERT
AS  
	BEGIN
			
			declare @max bigint
			declare @id varchar(max)

			select @id = [Id] from [Inserted]
			select @max = max(isnull([Batch],0)) from [Manufacture]
		
			update [Manufacture] set [Batch] = @max + 1 where [Id] = @id

		END
GO
PRINT N'Creando [dbo].[Purchase_AssignSequentialNumber]...';


GO
CREATE TRIGGER [Purchase_AssignSequentialNumber]  
ON [Purchase]
AFTER INSERT
AS  
	BEGIN
			
			declare @max bigint
			declare @id varchar(max)

			select @id = [Id] from [Inserted]
			select @max = max(isnull([Sequential],0)) from [Purchase]
		
			update [Purchase] set [Sequential] = @max + 1 where [Id] = @id

		END
GO
PRINT N'Creando [dbo].[Sale_AssignSequentialNumber]...';


GO


CREATE TRIGGER [Sale_AssignSequentialNumber]  
ON [Sale]
AFTER INSERT
AS  
	BEGIN
			
			declare @max bigint
			declare @id varchar(max)

			select @id = [Id] from [Inserted]
			select @max = max(isnull([Number],0)) from [Sale]
		
			update [Sale] set [Number] = @max + 1 where [Id] = @id

		END
GO
PRINT N'Creando [dbo].[SaleItem_AssignSequentialNumber]...';


GO
CREATE TRIGGER [SaleItem_AssignSequentialNumber]
ON [Sale_Item]
AFTER INSERT
AS  
	BEGIN
			
			declare @max bigint
			declare @id varchar(max)

			select @id = [Id] from [Inserted]
			select @max = max(isnull([Number],0)) from [Sale_Item]
		
			update [Sale_Item] set [Number] = @max + 1 where [Id] = @id

		END
GO
PRINT N'Creando [dbo].[Service_AssignSequentialNumber]...';


GO
CREATE TRIGGER [Service_AssignSequentialNumber]
ON [Service]
AFTER INSERT
AS  
	BEGIN
			
			declare @max bigint
			declare @id varchar(max)

			select @id = [Id] from [Inserted]
			select @max = max(isnull([Number],0)) from [Service]
		
			update [Service] set [Number] = @max + 1 where [Id] = @id

		END
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
