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


INSERT INTO [dbo].[Contract_Status]	(	[Id],									[Name],				[RowStatus],	[Locked],	[Required]	)	VALUES
										(	'7ED0C506-4818-4823-910E-8A2BF81E663E',	'Activo',		1,				1,			0			)	,
										(	'9A50E0E7-F3E8-4997-A1A2-5E409F7B981B',	'Suspendido',	1,				1,			0			)	


INSERT INTO [dbo].[Contract_EndReason]	(	[Id],									[Name],									[RowStatus],	[Locked],	[Required]	)	VALUES
										(	'99CD9122-DDA8-4298-A7C0-0396D19EEDDD',	'Se venció el plazo acordado',			1,				0,			0			)	,
										(	'A9A328E7-4155-48E2-8580-146CB22B81FF',	'Desempleo',							1,				0,			0			)	,
										(	'C651100D-2B27-4724-9576-1B9A324B8E02',	'Fuera del país',						1,				0,			0			)	,
										(	'B0384930-757C-448D-B732-31D272922272',	'Falleció',								1,				0,			0			)	,
										(	'94AB1E50-675D-4787-AB4E-8C190855415C',	'Motivos personales',					1,				0,			0			)	,
										(	'0183A06C-402D-4D8D-B26E-91B751A4D16B',	'Problemas económicos',					1,				0,			0			)	,
										(	'9C25D114-D5EE-4C98-8180-9DBF86920750',	'Salida de Plan International',			1,				0,			0			)	,
										(	'3034AF69-5382-424E-BC3E-E13ABE6B91E8',	'Se va a otra fundación',				1,				0,			0			)	,
										(	'716B7FC2-154F-45D9-903B-E2861596EBD6',	'Por salida de mi familiar de Plan',	1,				0,			0			)
								


				

INSERT INTO [dbo].[Customer_Class]	(	[Id],									[Name],						[RowStatus],	[Locked],	[Required]	)	VALUES
									(	'1A920D90-D05D-4442-8255-D537F4651A18',	'Persona natural',			1,				0,			0			)	,
									(	'CE37CEF5-F95B-4698-B96A-2484AA5AB776',	'Contribuyente especial',	1,				0,			0			)	


  
INSERT INTO [dbo].[Customer_Rating]	(	[Id],									[Name],		[RowStatus],	[Locked],	[Required]	)	VALUES
									(	'6E7ECA9A-87E8-43E8-9FA5-2014AEB27CCC',	'Tipo A',	1,				0,			0			)		





INSERT INTO [dbo].[Contract_RecurrenceType]	(	[Id],									[Name],			[Months],	[RowStatus]	)	VALUES
											(	'5E8E9C0B-B0BB-4BB9-90DE-23FA7A7C6436',	'Mensual',		1,			1			)	,
											(	'360CD385-8B39-46F4-A7CD-413F6579B568',	'Trimestral',	3,			1			)	,
											(	'4F895E24-D7B2-4BEA-93D7-434CF6AAE1B3',	'Semestral',	6,			1			)	,
											(	'CAC1A1FD-ED10-4963-8CD3-6669EDF6057D',	'Anual',		12,			1			)	,
											(	'4231EF9D-F5BB-433F-8880-EA5B2DF650FC',	'Bimensual',	2,			1			)	
		



INSERT INTO [dbo].[LegalIdType]	(	[Id],									[Code],	[Name],				[RowStatus]	)	VALUES
								(	'0D26F84F-441F-4A8B-9593-A1180F1CE899',	'04',	'RUC',				1			)	,
								(	'9D2E39DB-B075-456F-90B6-4AB49C921485',	'05',	'CEDULA',			1			)	,
								(	'BAFC756E-1FC0-442C-B8D6-2AC44F8E65E2',	'06',	'PASAPORTE',		1			)	,
								(	'8A52DD93-E68D-4FF3-BAEC-D008CA57D890',	'07',	'CONSUMIDOR FINAL',	1			)	



INSERT INTO [dbo].[Currency]	(	[Id],									[Code],	[Name],		[RowStatus]	)	VALUES
								(	'D4E266EB-7D4A-4BEB-AFC9-24E96679B59D',	'USD',	'Dólar',	1			)

INSERT INTO [dbo].[Territory]	(	[Id],									[Name],				[RowStatus]		)	VALUES
								(	'FA185052-147B-4EEB-98EF-689093221CA5',	'Región Sierra',	1				)	,	
								(	'226A97E9-85DF-4230-995F-4FA35D7DE46E',	'Región Costa',		1				)	


INSERT INTO [dbo].[Activity_PlaceType]	(	[Id],									[Name],				[RowStatus]		)	VALUES
										(	'B18B7534-0DFF-403C-AD5E-E223BBA7C482',	'Presencial',		1				)	,	
										(	'65D60AB1-CD41-40B0-BF30-F6BAF3D25A4A',	'No presencial',	1				)	

INSERT INTO [dbo].[Activity_Type]	(	[Id],									[Name],						[RowStatus]		)	VALUES
									(	'0087B7DD-7EE8-49EE-ADBA-38B4F77F5025',	'Llamada telefónica',		1				)	,
									(	'184B3538-11B8-446F-BA3B-20CAA1510D2B',	'Correo electrónico',		1				)	,
									(	'7D30C4E6-093A-4AF9-A9C4-3A343B7FE91B',	'Reunión',					1				)

INSERT INTO [dbo].[Campaign_Type]	(	[Id],										[Name],				[RowStatus]	)	VALUES
									(	'6B3E2700-48F2-407C-B141-171E0D63B43F',		'Radio',			1			)	,
									(	'CBD034B7-2BE3-4704-B7D5-384B8FB78D67',		'Televisión',		1			)	,
									(	'34E728C8-863E-40D8-942D-76C92FD6987C',		'Telemarketing',	1			)	,
									(	'9BC25FCE-71CD-4672-B3D0-9F88196781E0',		'BTL',				1			)	,
									(	'493B1504-D984-4C6C-BAA9-C5E62151A919',		'Email masivo',		1			)	,
									(	'376E17DC-AE2C-4360-A47B-08E6E7B97A01',		'Evento',			1			)	,
									(	'7245130D-00AA-4600-B37B-D588C8402069',		'F2F',				1			)
									
INSERT INTO [InvestmentFund_TransactionType]	(	[Id],											[Name],				[RowStatus],	[Required]	)	VALUES
												(	'F14BB615-DE0C-4DCB-92F1-790810407EA0',		'Depósito',				1,				1			)	,
												(	'403238D2-8155-42E2-881B-7B26D49BBF6F',		'Rescate',				1,				1			)	,
												(	'37FBF241-09BA-4265-83C2-AE43B3B3858E',		'Ajuste',				1,				1			)	,
												(	'5CB0E11A-5F32-4449-8507-89ECA27F2146',		'Gasto Administrativo',	1,				1			)	,
												(	'4DF610D4-DE0C-4285-A11B-51B82EA2441B',		'Impuesto a la renta',	1,				1			)	

INSERT INTO [dbo].[AddressType]	(	[Id],									[Name],			[RowStatus]	)	VALUES
								(	'404464AF-592B-4DCC-8FCB-17A5B73FEB6E',	'Domicilio',	1			)	,
								(	'CDB8B4A3-8F37-450C-B273-24AA22B43FC8',	'Oficina',		1			)

INSERT INTO [dbo].[CommunicationOptionType]	(	[Id],									[Name],			[RowStatus]	)	VALUES
											--(	'DBA448CE-7443-4ED9-9A5B-0AF0FD8A9464',	'Email',			1			)	,
											(	'03B556CD-41D3-4323-AE1E-2671C2453A74',	'Website',			1			)	,
											--(	'CB81ED91-7169-4C6D-8903-3720A86B7F50',	'Teléfono',			1			)	,
											--(	'B6C7C555-A896-4DB4-B338-504E2D9FF2A4',	'Móvil',			1			)	,
											(	'7EABD7AB-C484-4CA2-8EE5-5784CF4C7732',	'Facebook',			1			)	,
											(	'6309FA9F-7359-4544-A4EF-5A38F8CD285B',	'Twitter',			1			)	,
											(	'9B1D8BA9-56A0-47E5-B621-5A7A35EAF9CF',	'Skype',			1			)	,
											(	'BCE74C29-C6C0-43B4-8E93-843CD8ABB9D4',	'Webex',			1			)	,
											(	'6B881327-1A88-416A-BB0C-14C2C54CFF61',	'Hangouts',			1			)	,
											(	'F52A8282-B4B7-4071-BA73-2831E2B9EBBE',	'Facetime',			1			)	,
											(	'CA13E195-CD0F-447B-91B0-33008A066094',	'LinkedIn',			1			)

INSERT INTO [dbo].[Customer_RelationshipType]	(	[Id],									[Name],			[RowStatus],	[Required]	)	VALUES
												(	'82C6DEE3-1EA8-4A23-A224-002433922AB2',	'Cliente',		1,				1			)	,
												(	'AE8950D5-83C0-4721-9667-012E387FDEE1',	'Prospecto',	1,				1			)


	INSERT INTO [Customer_Type]	(	[Id],									[Name],				[RowStatus],	[Required]	)	VALUES
								(	'75296B03-7879-45B7-8DF0-836FAB4E9E9C',	'Persona',			1,				1			)	,
								(	'04549646-6D92-4961-970E-931DF3193F74',	'Empresa',			1,				1			)


	INSERT INTO [Country]		(	[Id],									[Name],				[RowStatus]	)	VALUES
								(	'3CD80F14-0975-4864-B533-B9376024BB74',	'Ecuador',			1			)	


	INSERT INTO [State]		(	[Id],										[Name],								[Country_Id],							[RowStatus]	)	VALUES
								('7B7A14A3-0801-492C-B12B-0DA0A8EC4A12',	'Guayas',							'3CD80F14-0975-4864-B533-B9376024BB74',	1			),
								('4088E6E3-443E-4DA2-9E56-1CE5AFBE8150',	'Pichincha',						'3CD80F14-0975-4864-B533-B9376024BB74',	1			),
								('C780F921-5AEA-462C-9D8C-2EA42A906EEE',	'Azuay',							'3CD80F14-0975-4864-B533-B9376024BB74',	1			),
								('0E50346A-11DF-49AC-9780-2EE10E333DC5',	'Santo Domingo de los Tsáchilas',	'3CD80F14-0975-4864-B533-B9376024BB74',	1			),
								('ECF12F46-C34B-4268-95DE-44C2610C6EB2',	'El Oro',							'3CD80F14-0975-4864-B533-B9376024BB74',	1			),
								('77F5C53A-6279-4F1A-9223-55EE45AC0D3B',	'Manabí',							'3CD80F14-0975-4864-B533-B9376024BB74',	1			),
								('6D8D4D3A-BD63-4B7E-9F73-5D0D97CD9384',	'Loja',								'3CD80F14-0975-4864-B533-B9376024BB74',	1			),
								('08807D28-1FE5-49CE-8073-64F6FD49F0F7',	'Tungurahua',						'3CD80F14-0975-4864-B533-B9376024BB74',	1			),
								('F2F493FD-E884-49C1-A53B-70F97140AA41',	'Esmeraldas',						'3CD80F14-0975-4864-B533-B9376024BB74',	1			),
								('198F5C57-1CF5-4BE1-81FD-7F6011CAF040',	'Los Ríos',							'3CD80F14-0975-4864-B533-B9376024BB74',	1			),
								('04D3EDA5-5A26-4E2F-8191-8F5E303134D5',	'Chimborazo',						'3CD80F14-0975-4864-B533-B9376024BB74',	1			),
								('52C722C2-85F8-4343-A03E-94952E44FC87',	'Imbabura',							'3CD80F14-0975-4864-B533-B9376024BB74',	1			),
								('4D730885-FC9D-4F20-A0DC-A0B3D965A8FB',	'Cotopaxi',							'3CD80F14-0975-4864-B533-B9376024BB74',	1			),
								('4FC7033C-1DBE-455B-9C7F-AA799DD792F8',	'Santa Elena',						'3CD80F14-0975-4864-B533-B9376024BB74',	1			),
								('B4531359-AF4F-412C-B449-BB28031C3361',	'Carchi',							'3CD80F14-0975-4864-B533-B9376024BB74',	1			),
								('BA866E5C-1BD4-46FB-BCE4-D78DBF34C1F3',	'Sucumbíos',						'3CD80F14-0975-4864-B533-B9376024BB74',	1			),
								('9065FB21-34C3-48D6-964A-DBD8790CB59A',	'Orellana',							'3CD80F14-0975-4864-B533-B9376024BB74',	1			),
								('A791D607-50F2-4355-A389-E2A9C7DE307F',	'Cañar',							'3CD80F14-0975-4864-B533-B9376024BB74',	1			),
								('4949DC23-CA53-40AA-90B6-062F8E7F4E23',	'Pastaza',							'3CD80F14-0975-4864-B533-B9376024BB74',	1			),
								('3EEDAA65-EEC8-4C30-9857-0E37ABEEAEAC',	'Bolívar',							'3CD80F14-0975-4864-B533-B9376024BB74',	1			),
								('AEE8ECE7-5222-4BF2-B415-1429B1ECD49E',	'Napo',								'3CD80F14-0975-4864-B533-B9376024BB74',	1			),
								('F1B872EE-A65B-420A-B581-1616D0D12170',	'Morona Santiago',					'3CD80F14-0975-4864-B533-B9376024BB74',	1			),
								('7EB9849B-145B-4331-9549-1F2F3A515A13',	'Zamora Chinchipe',					'3CD80F14-0975-4864-B533-B9376024BB74',	1			),
								('489C90B4-587E-47AB-9BF6-4B7C5FDAE87D',	'Galápagos',						'3CD80F14-0975-4864-B533-B9376024BB74',	1			)

	INSERT INTO [City]	(	[Id],								[Name],	[State_Id],										[RowStatus]	)	VALUES
						('53EBB586-B7D8-43B4-994A-04D695EF11FD','Guayaquil','7B7A14A3-0801-492C-B12B-0DA0A8EC4A12',1),
						('95BB7258-8A03-4510-9E01-139C86D4700A','Quito','4088E6E3-443E-4DA2-9E56-1CE5AFBE8150',1),
						('0B10B398-3C0D-4307-B174-26DFE0026B4A','Cuenca','C780F921-5AEA-462C-9D8C-2EA42A906EEE',1),
						('E12D2199-D8BF-4BD1-BDE7-27C24084895D','Santo Domingo','0E50346A-11DF-49AC-9780-2EE10E333DC5',1),
						('F47AB43F-B078-462D-A39D-3D2E0545A3D3','Machala','ECF12F46-C34B-4268-95DE-44C2610C6EB2',1),
						('736A341E-D1E1-4311-A35C-5240F710D13D','Durán','7B7A14A3-0801-492C-B12B-0DA0A8EC4A12',1),
						('8DBE404A-E9BB-494F-B398-6141D8198380','Portoviejo','77F5C53A-6279-4F1A-9223-55EE45AC0D3B',1),
						('DCB3EB95-0D0B-4BCD-A7BF-74FC64133D19','Manta','77F5C53A-6279-4F1A-9223-55EE45AC0D3B',1),
						('EF1CFAD4-A822-4D57-9DE1-755D0437D3BE','Loja','6D8D4D3A-BD63-4B7E-9F73-5D0D97CD9384',1),
						('AF2EA246-7225-4C28-8093-7B314C839E20','Ambato','08807D28-1FE5-49CE-8073-64F6FD49F0F7',1),
						('6CC087C7-BFCE-4D8E-8220-A9DE07958D91','Esmeraldas','F2F493FD-E884-49C1-A53B-70F97140AA41',1),
						('E6000B35-2B6D-4C3A-B003-B3DF020F213B','Quevedo','198F5C57-1CF5-4BE1-81FD-7F6011CAF040',1),
						('A262ADB3-131E-4F3C-B27B-C5FDAF9482FF','Riobamba','04D3EDA5-5A26-4E2F-8191-8F5E303134D5',1),
						('C0A7ECAD-DB69-4694-9334-D1141792F86A','Milagro','7B7A14A3-0801-492C-B12B-0DA0A8EC4A12',1),
						('4D528607-A71B-4DA0-A0A4-DD82F0EB8B7C','Ibarra','52C722C2-85F8-4343-A03E-94952E44FC87',1),
						('D2C24F98-45FC-4CCF-B7E1-E26D0E5B2B54','Latacunga','4D730885-FC9D-4F20-A0DC-A0B3D965A8FB',1),
						('290755CE-A329-45F4-BEB0-E3797E0F354A','Babahoyo','198F5C57-1CF5-4BE1-81FD-7F6011CAF040',1),
						('F2889D53-12F8-4BDB-9155-F28216E473A5','La Libertad','4FC7033C-1DBE-455B-9C7F-AA799DD792F8',1),
						('E1854899-58F1-48DB-BDF6-041F97E45CE0','Daule','7B7A14A3-0801-492C-B12B-0DA0A8EC4A12',1),
						('6B9021FD-26C5-47D1-B40F-1FB67C69043D','Sangolquí','4088E6E3-443E-4DA2-9E56-1CE5AFBE8150',1),
						('17831CAF-8FC7-494D-B8CA-32F09F7F459D','Tulcán','B4531359-AF4F-412C-B449-BB28031C3361',1),
						('EDB516E6-8B07-48C0-A413-379DE34FAFEB','Chone','77F5C53A-6279-4F1A-9223-55EE45AC0D3B',1),
						('9C92D247-21C7-4546-A836-42E160063001','Pasaje','ECF12F46-C34B-4268-95DE-44C2610C6EB2',1),
						('896D6A7A-E568-4CCE-82BD-53DBD910ABBA','Santa Rosa','ECF12F46-C34B-4268-95DE-44C2610C6EB2',1),
						('ECF698CA-BEF6-4722-A19E-655B271AB9E0','Nueva Loja','BA866E5C-1BD4-46FB-BCE4-D78DBF34C1F3',1),
						('145D75D7-A8F8-4D3D-98E8-6BA67EF389B5','Huaquillas','ECF12F46-C34B-4268-95DE-44C2610C6EB2',1),
						('5EDF66FD-10CE-4224-88C7-7A506E3E60CF','El Carmen','77F5C53A-6279-4F1A-9223-55EE45AC0D3B',1),
						('F74109A3-324A-41B1-A32E-7AC013A676B6','Montecristi','77F5C53A-6279-4F1A-9223-55EE45AC0D3B',1),
						('AE6A0CB5-9D8A-4BDF-9619-85E981FF19C9','Samborondón','7B7A14A3-0801-492C-B12B-0DA0A8EC4A12',1),
						('8BD02753-2988-42BB-9CCD-861A5973C936','Francisco de Orellana (Coca)','9065FB21-34C3-48D6-964A-DBD8790CB59A',1),
						('B1D72361-4474-4655-93EA-9B3F44746C3A','Jipijapa','77F5C53A-6279-4F1A-9223-55EE45AC0D3B',1),
						('FA991C48-053C-49E2-BC83-A01FA17F8265','Santa Elena','4FC7033C-1DBE-455B-9C7F-AA799DD792F8',1),
						('C2E8B330-5A0B-41F4-939B-CC8F7214D3D8','Otavalo','52C722C2-85F8-4343-A03E-94952E44FC87',1),
						('006A88DF-0E53-4E26-8DFB-D60883F06E0D','Cayambe','4088E6E3-443E-4DA2-9E56-1CE5AFBE8150',1),
						('3839F7BB-163E-42D6-B066-DC200AC28B9B','Buena Fe','198F5C57-1CF5-4BE1-81FD-7F6011CAF040',1),
						('21BBF68D-0189-47A0-8AA8-E8AD65D983D5','Ventanas','198F5C57-1CF5-4BE1-81FD-7F6011CAF040',1),
						('10AEB40F-5214-447D-918B-0E9EC68FA2AF','Velasco Ibarra (El Empalme)','7B7A14A3-0801-492C-B12B-0DA0A8EC4A12',1),
						('4FA6254B-C929-4A8A-B495-2042E7C9C105','La Troncal','A791D607-50F2-4355-A389-E2A9C7DE307F',1),
						('F3052A58-918B-4F19-8657-22C4A949D888','El Triunfo','7B7A14A3-0801-492C-B12B-0DA0A8EC4A12',1),
						('1E6A2AA2-7049-47AB-99FC-3A61ACA2A0EA','Salinas','4FC7033C-1DBE-455B-9C7F-AA799DD792F8',1),
						('9945DCE5-CEBF-4685-A113-428E64437E0B','General Villamil (Playas)','7B7A14A3-0801-492C-B12B-0DA0A8EC4A12',1),
						('97109410-6E6E-407C-B86A-4AE3DF26AEF7','Azogues','A791D607-50F2-4355-A389-E2A9C7DE307F',1),
						('E12DE95C-DF15-4E07-9B29-5925E25122FF','Puyo','4949DC23-CA53-40AA-90B6-062F8E7F4E23',1),
						('45BCBB04-8162-49FD-826C-70CFE5F08129','Vinces','198F5C57-1CF5-4BE1-81FD-7F6011CAF040',1),
						('21BAE9C4-0854-4E96-9224-723061C43435','La Concordia','0E50346A-11DF-49AC-9780-2EE10E333DC5',1),
						('D4027836-C257-4251-A4B2-886BCEEEDE4E','Rosa Zárate (Quinindé)','F2F493FD-E884-49C1-A53B-70F97140AA41',1),
						('5BF6A933-9DB6-4FDF-AD99-9FAE7CC73997','Balzar','7B7A14A3-0801-492C-B12B-0DA0A8EC4A12',1),
						('FD9C20FB-C67C-41C4-9C66-A1A1E2A6912B','Naranjito','7B7A14A3-0801-492C-B12B-0DA0A8EC4A12',1),
						('9EEF860A-009C-4955-BB50-A280A070D130','Naranjal','7B7A14A3-0801-492C-B12B-0DA0A8EC4A12',1),
						('3CFDCDA8-75E2-4C37-9533-A88771653C1B','Guaranda','3EEDAA65-EEC8-4C30-9857-0E37ABEEAEAC',1),
						('1BCCD427-2E34-484B-A1D7-B16A353BAF1F','La Maná','4D730885-FC9D-4F20-A0DC-A0B3D965A8FB',1),
						('6261CF10-9D46-4D71-9AD3-C6D02E66A237','Tena','AEE8ECE7-5222-4BF2-B415-1429B1ECD49E',1),
						('848B32B7-C8DB-42A0-931E-CE2816194B20','San Lorenzo','F2F493FD-E884-49C1-A53B-70F97140AA41',1),
						('4C599A6E-014E-40DB-83D3-F9F0A1214AA9','Catamayo','6D8D4D3A-BD63-4B7E-9F73-5D0D97CD9384',1),
						('85898A4C-DCD7-4F90-905F-19F5E3D70646','El Guabo','ECF12F46-C34B-4268-95DE-44C2610C6EB2',1),
						('F67F15F7-283D-4483-B448-220967AC8B74','Pedernales','77F5C53A-6279-4F1A-9223-55EE45AC0D3B',1),
						('136FD928-AEF4-4649-9A0A-2DA36A810E8D','Atuntaqui','52C722C2-85F8-4343-A03E-94952E44FC87',1),
						('7C780E21-CDD8-4734-93F4-5F432C612A31','Bahía de Caráquez','77F5C53A-6279-4F1A-9223-55EE45AC0D3B',1),
						('35D5244B-D59B-48D2-B1E9-68455658725A','Pedro Carbo','7B7A14A3-0801-492C-B12B-0DA0A8EC4A12',1),
						('D89133DD-19B8-4CC1-A53C-7534D58730D6','Macas','F1B872EE-A65B-420A-B581-1616D0D12170',1),
						('E2762DBE-4FF8-4C13-97F9-8A3BDE0A0271','Yaguachi','7B7A14A3-0801-492C-B12B-0DA0A8EC4A12',1),
						('A3541BDA-DA99-4775-9DEE-8AE760B454BF','Calceta','77F5C53A-6279-4F1A-9223-55EE45AC0D3B',1),
						('6B79EDC6-636F-4751-92F5-8C95F9EB0A29','Arenillas','ECF12F46-C34B-4268-95DE-44C2610C6EB2',1),
						('6C735A34-8BEC-40AB-BA57-981E6071A43E','Jaramijó','77F5C53A-6279-4F1A-9223-55EE45AC0D3B',1),
						('E3D6B93C-F53C-4994-9FBD-AB9AA8F2ABD9','Valencia','198F5C57-1CF5-4BE1-81FD-7F6011CAF040',1),
						('C09B572F-4923-4D82-B927-B1A9BA41C0F7','Machachi','4088E6E3-443E-4DA2-9E56-1CE5AFBE8150',1),
						('78372F41-8DCD-4003-8ED9-B5B2BFCE35C8','Shushufindi','BA866E5C-1BD4-46FB-BCE4-D78DBF34C1F3',1),
						('F101F9CF-7ACC-4570-81F3-CE809E0B463A','Atacames','F2F493FD-E884-49C1-A53B-70F97140AA41',1),
						('1A2F69A4-1481-4804-AEC2-DAC2D23CB96F','Piñas','ECF12F46-C34B-4268-95DE-44C2610C6EB2',1),
						('C398B77A-A1C4-4198-B985-E0469EC9B327','San Gabriel','B4531359-AF4F-412C-B449-BB28031C3361',1),
						('346DAFC7-9689-47A0-B4B2-F8A21E85B28F','Gualaceo','C780F921-5AEA-462C-9D8C-2EA42A906EEE',1),
						('C9FC7ADA-B416-43E8-91EB-FBDFAB694906','Lomas de Sargentillo','7B7A14A3-0801-492C-B12B-0DA0A8EC4A12',1),
						('27856590-81A2-4224-BD91-02DC556C818E','Cañar','A791D607-50F2-4355-A389-E2A9C7DE307F',1),
						('AA7DE310-451E-4796-8898-1041CCCDAA40','Cariamanga','6D8D4D3A-BD63-4B7E-9F73-5D0D97CD9384',1),
						('9EF4F33B-383C-400A-9859-1130E9C1D0C9','Baños de Agua Santa','08807D28-1FE5-49CE-8073-64F6FD49F0F7',1),
						('C1C29B84-4686-4DF0-B833-45BFB9DD57E3','Montalvo','198F5C57-1CF5-4BE1-81FD-7F6011CAF040',1),
						('A7AFEA85-8CCB-4B23-B130-51DD27915788','Macará','6D8D4D3A-BD63-4B7E-9F73-5D0D97CD9384',1),
						('830CD8EE-FB41-4545-AC99-7A08CD465A74','San Miguel (Salcedo)','4D730885-FC9D-4F20-A0DC-A0B3D965A8FB',1),
						('6D0528FE-1937-472A-B5EB-81989011FCE9','Zamora','7EB9849B-145B-4331-9549-1F2F3A515A13',1),
						('944A010C-3D0A-424D-8D78-84E0091AD00F','Puerto Ayora','489C90B4-587E-47AB-9BF6-4B7C5FDAE87D',1),
						('ECA50ECF-6FBB-4FB6-AC50-93FA903FF3AE','La Joya de los Sachas','9065FB21-34C3-48D6-964A-DBD8790CB59A',1),
						('2CE8B243-B2A6-4A2D-BD31-9BEA89379613','Salitre','7B7A14A3-0801-492C-B12B-0DA0A8EC4A12',1),
						('96186684-41EA-4E4D-BEF8-ACA000303F66','Tosagua','77F5C53A-6279-4F1A-9223-55EE45AC0D3B',1),
						('154F217D-CA6B-477E-AE09-AF15643B34D2','Pelileo','08807D28-1FE5-49CE-8073-64F6FD49F0F7',1),
						('C6153C53-E87F-41E2-B2E7-BD0E6E847634','Pujilí','4D730885-FC9D-4F20-A0DC-A0B3D965A8FB',1),
						('1A9F9BB8-DC82-4D26-B353-CC6C26709E6E','Tabacundo','4088E6E3-443E-4DA2-9E56-1CE5AFBE8150',1),
						('774C0645-8D8E-446B-A295-D2A89A4AC6E5','Puerto López','77F5C53A-6279-4F1A-9223-55EE45AC0D3B',1),
						('E026B328-62CE-4EA0-82BE-DB6C3CE58B9E','San Vicente','77F5C53A-6279-4F1A-9223-55EE45AC0D3B',1),
						('75BFDDA4-BCC4-4D20-80A1-E2E33C7C57B2','Santa Ana de Vuelta Larga','77F5C53A-6279-4F1A-9223-55EE45AC0D3B',1),
						('86BEAFE6-38FC-413D-9619-FE74974EE1C2','Zaruma','ECF12F46-C34B-4268-95DE-44C2610C6EB2',1),
						('EEDF5A4E-4EFB-409E-A38B-13752E526034','Balao','7B7A14A3-0801-492C-B12B-0DA0A8EC4A12',1),
						('F26DB380-B6BA-4DBA-97E7-18BA37990681','Rocafuerte','77F5C53A-6279-4F1A-9223-55EE45AC0D3B',1),
						('3F4AA4F4-B583-4C3A-BB6F-233F3CA21A8B','Yantzaza','7EB9849B-145B-4331-9549-1F2F3A515A13',1),
						('002EC74B-B6E1-4D1B-90AE-28348E31AA6B','Cotacachi','52C722C2-85F8-4343-A03E-94952E44FC87',1),
						('AD20B8E4-9874-4AB8-8199-2B6A6DDDF54D','Santa Lucía','7B7A14A3-0801-492C-B12B-0DA0A8EC4A12',1),
						('315D53CD-1413-4282-A115-394A1F5FD7A5','Cumandá','04D3EDA5-5A26-4E2F-8191-8F5E303134D5',1),
						('F132AD85-29B2-4FC6-8C7B-3DE925569586','Palestina','7B7A14A3-0801-492C-B12B-0DA0A8EC4A12',1),
						('64462B10-056C-46DE-B6EF-41169895B673','Alfredo Baquerizo Moreno (Jujan)','7B7A14A3-0801-492C-B12B-0DA0A8EC4A12',1),
						('009FF6FE-77FD-4324-88D7-41D27098AF6B','Narcisa de Jesús (Nobol)','7B7A14A3-0801-492C-B12B-0DA0A8EC4A12',1),
						('3B695F83-BEDD-4552-B905-473DA54D2D0B','Mocache','198F5C57-1CF5-4BE1-81FD-7F6011CAF040',1),
						('4885DB7E-57D6-4592-A4A5-4BB50B4B7585','Puebloviejo','198F5C57-1CF5-4BE1-81FD-7F6011CAF040',1),
						('4409E56B-9773-48E6-8151-5281C8C8E7BA','Portovelo','ECF12F46-C34B-4268-95DE-44C2610C6EB2',1),
						('B1FB06B8-2699-4A83-9A55-532789CAD922','Sucúa','F1B872EE-A65B-420A-B581-1616D0D12170',1),
						('1C617945-9722-4C6F-8EC3-575AA47FA447','Guano','04D3EDA5-5A26-4E2F-8191-8F5E303134D5',1),
						('CA648053-59F0-4240-A680-5D787284E136','Píllaro','08807D28-1FE5-49CE-8073-64F6FD49F0F7',1),
						('DDDF1A58-5716-43BE-A9C5-660B0EA32E3F','Simón Bolívar','7B7A14A3-0801-492C-B12B-0DA0A8EC4A12',1),
						('2088BA0C-4C72-408F-9CE8-79191EBE88B9','Gualaquiza','F1B872EE-A65B-420A-B581-1616D0D12170',1),
						('FA1D29B3-A244-4EC7-8BC3-7EC421DD177E','Paute','C780F921-5AEA-462C-9D8C-2EA42A906EEE',1),
						('58B6799D-E663-4E7B-A3EB-8FA150C96FA4','Saquisilí','4D730885-FC9D-4F20-A0DC-A0B3D965A8FB',1),
						('7E472948-BD9E-4C8F-9160-91F61226EEAF','Coronel Marcelino Maridueña','7B7A14A3-0801-492C-B12B-0DA0A8EC4A12',1),
						('54A8E201-8C57-4A6E-BD8E-98D22FA70CFA','Paján','77F5C53A-6279-4F1A-9223-55EE45AC0D3B',1),
						('61B03181-B91B-4846-AFAE-9F736EC00B36','San Miguel','3EEDAA65-EEC8-4C30-9857-0E37ABEEAEAC',1),
						('E1021D80-3F31-4658-A2A6-A00B37D52C1F','Puerto Baquerizo Moreno','489C90B4-587E-47AB-9BF6-4B7C5FDAE87D',1),
						('D7388EAB-1402-42E3-8F5C-A74B55B739C8','Catacocha','6D8D4D3A-BD63-4B7E-9F73-5D0D97CD9384',1),
						('BBF13B4C-2FDD-4867-B0A9-B19B5FE024C9','Palenque','198F5C57-1CF5-4BE1-81FD-7F6011CAF040',1),
						('200B1BDF-39F5-4739-9366-C69EB495F875','Alausí','04D3EDA5-5A26-4E2F-8191-8F5E303134D5',1),
						('AE9C4010-F0CB-4F5E-B01A-CD7CD474A801','Caluma','3EEDAA65-EEC8-4C30-9857-0E37ABEEAEAC',1),
						('B2A52D2B-D27B-46BE-945B-CED6E7228CD1','Catarama','198F5C57-1CF5-4BE1-81FD-7F6011CAF040',1),
						('DC1E7A30-E5C0-4485-86EC-D3362162A147','Flavio Alfaro','77F5C53A-6279-4F1A-9223-55EE45AC0D3B',1),
						('0D4D8032-562B-41A2-AC13-D39D529637C5','Colimes','7B7A14A3-0801-492C-B12B-0DA0A8EC4A12',1),
						('2FD68081-A132-4FF9-BAF7-E5864DE6FC51','Echeandía','3EEDAA65-EEC8-4C30-9857-0E37ABEEAEAC',1),
						('0C3A50A2-3368-4F5A-9FA0-EAB72995E49E','Jama','77F5C53A-6279-4F1A-9223-55EE45AC0D3B',1),
						('55405777-D32F-459E-96B5-EDE59D64C1B4','General Antonio Elizalde (Bucay)','7B7A14A3-0801-492C-B12B-0DA0A8EC4A12',1),
						('11BFABD2-969A-4696-9865-F84B57CE3C4F','Isidro Ayora','7B7A14A3-0801-492C-B12B-0DA0A8EC4A12',1),
						('41370B1A-936C-46BA-B784-FC1E615B1BBE','Muisne','F2F493FD-E884-49C1-A53B-70F97140AA41',1),
						('1122219E-7A8A-4E5C-81F6-FCC1E5FEF076','Santa Isabel','C780F921-5AEA-462C-9D8C-2EA42A906EEE',1),
						('5F178B5C-62A2-4FD7-BD84-05BBF387EDF8','Pedro Vicente Maldonado','4088E6E3-443E-4DA2-9E56-1CE5AFBE8150',1),
						('6B3947FB-293C-4253-B9B4-0AD590C9CAD5','Biblián','A791D607-50F2-4355-A389-E2A9C7DE307F',1),
						('609C58B6-3797-4731-86B6-14DFCD178CD0','Archidona','AEE8ECE7-5222-4BF2-B415-1429B1ECD49E',1),
						('2C9AE975-CC13-42BB-ABC2-1DCB9C83FDBF','Junín','77F5C53A-6279-4F1A-9223-55EE45AC0D3B',1),
						('0D8BC39C-4C18-4DB9-805D-1F04A3457727','Baba','198F5C57-1CF5-4BE1-81FD-7F6011CAF040',1),
						('A763EDCA-B7F9-4980-AA08-227C8FDFB765','Valdez (Limones)','F2F493FD-E884-49C1-A53B-70F97140AA41',1),
						('3CBD6097-8260-41B1-9EA7-2A328E2986A5','Pimampiro','52C722C2-85F8-4343-A03E-94952E44FC87',1),
						('504FDCAD-3DEA-4B12-B2E4-34F49058F605','Camilo Ponce Enríquez','C780F921-5AEA-462C-9D8C-2EA42A906EEE',1),
						('84C7BD3F-A4AF-48F2-AFB6-3C04C6FF12FF','San Miguel de Los Bancos','4088E6E3-443E-4DA2-9E56-1CE5AFBE8150',1),
						('21534844-8CA6-42EE-BF2F-45E1BE68A0F8','El Tambo','A791D607-50F2-4355-A389-E2A9C7DE307F',1),
						('6932911D-034E-4600-9934-4C726D0553B3','Quinsaloma','198F5C57-1CF5-4BE1-81FD-7F6011CAF040',1),
						('098ECECB-7AE3-4A70-9A7C-4FAB9F2C075F','El Ángel','B4531359-AF4F-412C-B449-BB28031C3361',1),
						('0D5A3CFF-1833-4E23-8240-5507F5CAD0EA','Alamor','6D8D4D3A-BD63-4B7E-9F73-5D0D97CD9384',1),
						('624D5E13-329D-4ECA-8A2A-5518258C810C','Chambo','04D3EDA5-5A26-4E2F-8191-8F5E303134D5',1),
						('2E318469-9DCC-4110-B31C-66CB7106502A','San José de Chimbo','3EEDAA65-EEC8-4C30-9857-0E37ABEEAEAC',1),
						('507BD13A-0B7A-4323-B3DE-6942A6B76EE0','Celica','6D8D4D3A-BD63-4B7E-9F73-5D0D97CD9384',1),
						('94F1FD23-6E56-4B19-8D20-70982F05A9E5','Chordeleg','C780F921-5AEA-462C-9D8C-2EA42A906EEE',1),
						('C5558975-A7E5-49C6-9064-819253EE51B6','Balsas','ECF12F46-C34B-4268-95DE-44C2610C6EB2',1),
						('E7D83745-DCE2-4A3B-881E-842FED4B2FB3','Saraguro','6D8D4D3A-BD63-4B7E-9F73-5D0D97CD9384',1),
						('4199872A-0C21-43DE-9BE2-8F8C47564155','El Chaco','AEE8ECE7-5222-4BF2-B415-1429B1ECD49E',1),
						('D5A191F1-B7ED-42D1-A122-914AD22C3A54','Girón','C780F921-5AEA-462C-9D8C-2EA42A906EEE',1),
						('EDA62312-2705-4402-9C9C-96142119F51D','Huaca','B4531359-AF4F-412C-B449-BB28031C3361',1),
						('66BB08A3-F0D5-4482-8DB2-9C5C2AA5BC12','Pichincha','77F5C53A-6279-4F1A-9223-55EE45AC0D3B',1),
						('25E81743-F1EE-4F98-ADAA-9E8B59638572','Chunchi','04D3EDA5-5A26-4E2F-8191-8F5E303134D5',1),
						('46908B3B-19C9-46F4-97B5-A19774E7C58D','Pallatanga','04D3EDA5-5A26-4E2F-8191-8F5E303134D5',1),
						('867599C1-44B8-4E71-BA69-B3CD79612E34','Marcabelí','ECF12F46-C34B-4268-95DE-44C2610C6EB2',1),
						('8073F4F0-D779-4F0A-A1F4-B40040387771','Sígsig','C780F921-5AEA-462C-9D8C-2EA42A906EEE',1),
						('69064AC0-12C3-400F-9A36-B4E4CE57C67B','General Leonidas Plaza Gutiérrez (Limón)','F1B872EE-A65B-420A-B581-1616D0D12170',1),
						('A9E59DD5-6D42-40D0-9412-BF9547BA9A9C','Urcuquí','52C722C2-85F8-4343-A03E-94952E44FC87',1),
						('FD0030FC-F96F-4DAB-BCBF-C1FED53CA2A2','Loreto','9065FB21-34C3-48D6-964A-DBD8790CB59A',1),
						('3F696B95-A288-44E6-998E-C994158B59E2','Rioverde','F2F493FD-E884-49C1-A53B-70F97140AA41',1),
						('CE6D126D-3286-4776-96E3-D9A28978F03A','Zumba','7EB9849B-145B-4331-9549-1F2F3A515A13',1),
						('D18C3A13-3505-4D3E-9224-DD4349A86E34','Palora','F1B872EE-A65B-420A-B581-1616D0D12170',1),
						('275DB387-E387-4A68-94AB-E498DC21BFCB','Mira','B4531359-AF4F-412C-B449-BB28031C3361',1),
						('FF22CF1D-AA3B-4B3D-BC52-E6D260D987F5','El Pangui','7EB9849B-145B-4331-9549-1F2F3A515A13',1),
						('FBA897D9-8CFE-446F-827E-E8FFBCBD0A5B','Puerto Quito','4088E6E3-443E-4DA2-9E56-1CE5AFBE8150',1),
						('33A21A82-977A-46B2-BBFA-01E6BBD4215C','Bolívar','B4531359-AF4F-412C-B449-BB28031C3361',1),
						('0604E815-070A-4D39-8B61-231BC0033A34','Sucre','77F5C53A-6279-4F1A-9223-55EE45AC0D3B',1),
						('03F11AA2-63D0-4978-A499-2D9AE294756A','Chillanes','3EEDAA65-EEC8-4C30-9857-0E37ABEEAEAC',1),
						('37A63069-0BB8-4896-BE65-4068548CC060','Quero','08807D28-1FE5-49CE-8073-64F6FD49F0F7',1),
						('68E4AED5-A2A3-4D92-8835-44F5B7ECC268','Guamote','04D3EDA5-5A26-4E2F-8191-8F5E303134D5',1),
						('890EAB72-EEF1-475F-BBA2-4A1304330DD1','Cevallos','08807D28-1FE5-49CE-8073-64F6FD49F0F7',1),
						('424E2031-4CEA-4DDD-9821-50BE31B99840','Zapotillo','6D8D4D3A-BD63-4B7E-9F73-5D0D97CD9384',1),
						('B49D1CBD-807C-40CC-BE9D-51AF4FC52DCB','Villa La Unión (Cajabamba)','04D3EDA5-5A26-4E2F-8191-8F5E303134D5',1),
						('013DA89E-6E9D-4BE2-B5CD-617E94031ABD','Santiago de Méndez','F1B872EE-A65B-420A-B581-1616D0D12170',1),
						('A735FD06-2411-4C5B-9584-649CEB6C2F8F','Zumbi','7EB9849B-145B-4331-9549-1F2F3A515A13',1),
						('188BA0CB-EE75-4FC4-9131-675432116C20','Puerto El Carmen de Putumayo','BA866E5C-1BD4-46FB-BCE4-D78DBF34C1F3',1),
						('BCD51618-9DD6-4FD4-B36B-6B345FD6327F','Patate','08807D28-1FE5-49CE-8073-64F6FD49F0F7',1),
						('252156FF-5A3C-4D68-8459-70D289E8DBC9','Olmedo','77F5C53A-6279-4F1A-9223-55EE45AC0D3B',1),
						('4EA21EF8-6356-4DF9-A52A-769361D29F47','Puerto Villamil','489C90B4-587E-47AB-9BF6-4B7C5FDAE87D',1),
						('9645463C-DB1B-4366-BD3B-7D37EC79950F','El Dorado de Cascales','BA866E5C-1BD4-46FB-BCE4-D78DBF34C1F3',1),
						('93AC32BE-8F59-4DD7-B4EA-7F087B495D38','Lumbaqui','BA866E5C-1BD4-46FB-BCE4-D78DBF34C1F3',1),
						('DD51EF61-9ACE-40F0-9891-821E66D53C51','Palanda','7EB9849B-145B-4331-9549-1F2F3A515A13',1),
						('676ED761-4743-4F6D-9707-82B0A2A9CFA8','Sigchos','4D730885-FC9D-4F20-A0DC-A0B3D965A8FB',1),
						('8C793D68-F9AB-40AF-8B73-9841A8E0F421','Pindal','6D8D4D3A-BD63-4B7E-9F73-5D0D97CD9384',1),
						('D9BF2603-01C2-49A7-B9C1-A8878E509E05','Guayzimi','7EB9849B-145B-4331-9549-1F2F3A515A13',1),
						('07EB3A6B-6A44-4652-975F-AA7F6F112276','Baeza','AEE8ECE7-5222-4BF2-B415-1429B1ECD49E',1),
						('EF3972A6-74F6-4EC9-A0F0-AF1B8C49208F','El Corazón','4D730885-FC9D-4F20-A0DC-A0B3D965A8FB',1),
						('97156698-2262-4459-947C-B17F9239D98D','Paccha','ECF12F46-C34B-4268-95DE-44C2610C6EB2',1),
						('00B7471E-C92A-401A-97AC-B7401955A951','Amaluza','6D8D4D3A-BD63-4B7E-9F73-5D0D97CD9384',1),
						('A03B4A62-E8EA-4FA7-8FCC-BA0D610765EA','Las Naves','3EEDAA65-EEC8-4C30-9857-0E37ABEEAEAC',1),
						('5BC2DAAF-D49C-49CE-9983-BB0C94E72C99','Logroño','F1B872EE-A65B-420A-B581-1616D0D12170',1),
						('E053AE09-0F2E-431F-8FA2-C7787B758685','San Fernando','C780F921-5AEA-462C-9D8C-2EA42A906EEE',1),
						('E116F1F3-CBD8-4D61-AC4C-D3909800C004','Gonzanamá','6D8D4D3A-BD63-4B7E-9F73-5D0D97CD9384',1),
						('C41A68AD-8463-4EB4-80C8-D4398C79CF52','San Juan Bosco','F1B872EE-A65B-420A-B581-1616D0D12170',1),
						('29311E95-23B9-461A-9608-D64E7CCFBC00','28 de Mayo (San José de Yacuambi)','7EB9849B-145B-4331-9549-1F2F3A515A13',1),
						('26940C46-7C01-4B71-ABA4-E6AC071A3E2F','Santa Clara','4949DC23-CA53-40AA-90B6-062F8E7F4E23',1),
						('DEF5D741-B80A-4A20-AF44-EC2D527D4F1F','Arajuno','4949DC23-CA53-40AA-90B6-062F8E7F4E23',1),
						('90A783B0-2462-41C5-AFEF-F55FA7A007CB','Tarapoa','BA866E5C-1BD4-46FB-BCE4-D78DBF34C1F3',1),
						('3FCF46D8-57AE-4E6C-925A-F6C089AABB3B','Tisaleo','08807D28-1FE5-49CE-8073-64F6FD49F0F7',1),
						('8D7891EF-ED90-4BEA-89BF-F7CE9F615944','Suscal','A791D607-50F2-4355-A389-E2A9C7DE307F',1),
						('3F1C9484-EC53-4A29-A2D6-F87F98510D99','Nabón','C780F921-5AEA-462C-9D8C-2EA42A906EEE',1),
						('38C881DB-C718-45EF-A29C-0D37ED97EFBB','Mocha','08807D28-1FE5-49CE-8073-64F6FD49F0F7',1),
						('9EDD9C62-2317-4C3F-9B07-12045D59A45C','La Victoria','ECF12F46-C34B-4268-95DE-44C2610C6EB2',1),
						('7FE94440-3960-4927-BF7B-1B87B5EEE071','Guachapala','C780F921-5AEA-462C-9D8C-2EA42A906EEE',1),
						('41271016-55A1-40F2-8726-1FAB1B04C805','Santiago','F1B872EE-A65B-420A-B581-1616D0D12170',1),
						('54A6C8BB-7A75-407C-AE88-2A8B1DCDA000','Chaguarpamba','6D8D4D3A-BD63-4B7E-9F73-5D0D97CD9384',1),
						('6FE02FEC-76C3-4C7F-BBD8-2D654F7CA636','Penipe','04D3EDA5-5A26-4E2F-8191-8F5E303134D5',1),
						('AA121DB6-5BA3-49C1-921D-2E34FE73BAD7','Taisha','F1B872EE-A65B-420A-B581-1616D0D12170',1),
						('7B1F65E4-C9CE-4430-B0E1-391A4F04E50F','Chilla','ECF12F46-C34B-4268-95DE-44C2610C6EB2',1),
						('67B3AD2E-2911-4423-A69F-3A493065C892','Paquisha','7EB9849B-145B-4331-9549-1F2F3A515A13',1),
						('EC3893A5-B08E-4FF4-9C2B-42962C2A7978','Carlos Julio Arosemena Tola','AEE8ECE7-5222-4BF2-B415-1429B1ECD49E',1),
						('16B96437-5B03-4B2C-8AD2-499CA5958A8B','Sozoranga','6D8D4D3A-BD63-4B7E-9F73-5D0D97CD9384',1),
						('2194E64C-14AF-4908-9667-54752193FA3A','Pucará','C780F921-5AEA-462C-9D8C-2EA42A906EEE',1),
						('8665B541-ABBC-4162-ACA8-5B31CB7214AA','Huamboya','F1B872EE-A65B-420A-B581-1616D0D12170',1),
						('154636F2-6E2E-4E42-93C7-5D0B59521DDA','Quilanga','6D8D4D3A-BD63-4B7E-9F73-5D0D97CD9384',1),
						('DCF5A954-61DA-48DD-87C7-60D220475F48','San Felipe de Oña','C780F921-5AEA-462C-9D8C-2EA42A906EEE',1),
						('D92F9840-B123-4A10-B7AE-6995045B9812','Sevilla de Oro','C780F921-5AEA-462C-9D8C-2EA42A906EEE',1),
						('97B67A3A-199E-4E90-8901-7053E654A18B','Mera','4949DC23-CA53-40AA-90B6-062F8E7F4E23',1),
						('699CBF7B-9FC0-4D27-A62E-83E823A1B2F6','Pablo Sexto','F1B872EE-A65B-420A-B581-1616D0D12170',1),
						('C2422AAD-46CB-45E1-BEA7-85D948850E77','Olmedo','6D8D4D3A-BD63-4B7E-9F73-5D0D97CD9384',1),
						('DC996503-2F5E-4EA6-AD5C-9A4D855D1ED6','Déleg','A791D607-50F2-4355-A389-E2A9C7DE307F',1),
						('B0A7C2E7-B309-4CD5-88DA-9CC214ADCB1E','La Bonita','BA866E5C-1BD4-46FB-BCE4-D78DBF34C1F3',1),
						('036F9AD9-0CF0-4582-AEF6-A0B586E7D202','El Pan','C780F921-5AEA-462C-9D8C-2EA42A906EEE',1),
						('2C1DA224-9261-4035-968C-AC7406E35A55','Tiputini','9065FB21-34C3-48D6-964A-DBD8790CB59A',1)



										
			INSERT INTO [dbo].[Company]	(	[Id],									[LegalId],			[Name1],					[Name2],					[Address],									[Phone],			[AccountingRequired],	[TaxPayerId],	[Currency_Id],							[CurrencyCode],	[CurrencyName],	[WebSite],						[RowStatus],	[Required], [Image]	)	VALUES
										--(	'4A30257D-0EAD-4E41-8B35-E60859F63BA0',	'0000000000',		'Polykret',					'Polykret',					'Avenida República',						'(02) 244 4941',	'SI',					'0',			'D4E266EB-7D4A-4BEB-AFC9-24E96679B59D',	'USD',			'DOLAR',		'www.Polykret.com',				1,				1		,	'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'	)
										(	'2382C2D0-87B2-4EE0-9524-2ECCC72BF8DE',	'1792263875001',	'Fraggati Tecnologia S.A.',	'Fraggati Tecnologia S.A.',	'Olmedo S3-30 y Montúfar',					'099 840 0078',		'SI',					'0',			'D4E266EB-7D4A-4BEB-AFC9-24E96679B59D', 'USD',			'DOLAR',		'www.fraggati.com',	1,				1		,	'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'	)

							

			INSERT INTO [dbo].[Company_Place]	(	[Id],									[Code],	[Name],		[Address],															[Phone],			[Company_Id],								[City_Id],								[RowStatus]	)	VALUES
												--(	'5EE26B36-1000-4E03-AD68-4D890DD9E5B8',	'001',	'Matriz',	'Avenida República OE1-135 entre 10 de Agosto y Teresa de Cepeda',	'(02) 244 4941',	'4A30257D-0EAD-4E41-8B35-E60859F63BA0',		'95BB7258-8A03-4510-9E01-139C86D4700A',	1			)
												(	'5EE26B36-1000-4E03-AD68-4D890DD9E5B8',	'001',	'Matriz',	'Avenida República OE1-135 entre 10 de Agosto y Teresa de Cepeda',	'(02) 244 4941',	'2382C2D0-87B2-4EE0-9524-2ECCC72BF8DE',		'95BB7258-8A03-4510-9E01-139C86D4700A',	1			)


			INSERT INTO [dbo].[Company_EmissionPoint]	(	[Id],									[Code],	[Name],					[InvoiceSequential],	[Company_Place_Id],						[RowStatus]	)	VALUES
														(	'2A4FBFAE-850B-4435-8B44-814482F036D5',	'001',	'Punto de emision 1',	0,						'5EE26B36-1000-4E03-AD68-4D890DD9E5B8',	1			)



	INSERT INTO [Gender]	(	[Id],									[Name],					[RowStatus],	[Required]	)	VALUES
							(	'8B3465A4-929A-4352-860C-1B188E0FCE3C',	'Masculino',			1,				1			)	,
							(	'9D878F69-640B-4323-90BD-0164E250BD01',	'Femenino',				1,				1			)	


	INSERT INTO [Ocupation]	(	[Id],									[Name],								[RowStatus]	)	VALUES
								('E0549ACD-5808-4803-B199-10FF0E63A8FF','Abogado',							1),
								('D7080D45-2528-43A1-B09D-068098DD4922','Administrativo',					1),
								('192F786E-60DC-4940-BB67-1C4B41C564FF','Agrónomo',							1),
								('92157AEB-6DC7-4AD4-9B7A-1D0BFBB99576','Antropólogo',1),
								('4868BED4-A270-48AD-8E89-2A7D4D81ED63','Arqueólogo',1),
								('42949684-2C7A-46A6-A3A1-36DF2EB86F06','Arquitecto',1),
								('2D4703C1-E311-40BF-86DE-4C958FF0E6C6','Artista',1),
								('52C13FB5-6B26-4872-A7C0-4F07898EA0BD','Avicultor',1),
								('85AB7C3E-C725-48E8-AAB8-61026FC85ED9','Bibliotecario',1),
								('9469A0FD-C10B-4691-A521-611B5260E3CB','Biógrafo',1),
								('69DB5171-C884-4B67-9596-6AD964D462FD','Biólogo',1),
								('DDB0E66E-9ED5-4051-8298-74A278288215','Bioquímico',1),
								('AE64887C-1A7A-4E2A-9D53-777E2D28DCA8','Bodeguero',1),
								('E2100292-2845-4163-87B1-A311513CCC5A','Botánico',1),
								('E29E2AA6-9EA3-4BBB-ADB3-A3C9D5700550','Cartógrafo',1),
								('8F0E7E3C-F55E-4B17-A52B-A7F884BEFF6D','Catedrático',1),
								('AA91D318-E10C-4F83-870A-ACDCC5001DDD','Climatólogo',1),
								('AE62CC15-C4D4-49E5-B174-AF251A7A0A23','Decorador',1),
								('961FB516-0502-46B8-A240-B1F5F06E2B75','Dentista',1),
								('6B1DAEC6-4B03-4AF1-BD20-B25AE917971B','Economista',1),
								('48D8B7F8-706D-41E0-8331-BF405A6813C1','Enfermero',1),
								('B223858A-C34E-4161-A3CB-C2F3FD11BA2F','Estadista',1),
								('1021D4F4-8C0A-445F-AD80-C4203E2978AB','Etnólogo',1),
								('D39794E7-8726-4A02-9CE0-C449FE50EED4','Farmacólogo',1),
								('DC178599-6909-4FC3-8989-C52D2D859ED9','Filósofo',1),
								('A9CC2338-2F6B-4F4C-9F3E-C7F88836237D','Fisioterapeuta',1),
								('8AA41277-B756-47F6-8968-C82D2247CBAD','Fotógrafo',1),
								('FDBE3081-BD15-40E9-A102-C882A77E9904','Genetista',1),
								('01AA3C96-255E-448F-B7A9-CF7BC7C35751','Geólogo',1),
								('A59FF356-D6C7-4A9B-B0CF-D3AB54ED11D2','Historiador',1),
								('9AFE8DAC-06FE-47D2-982F-D93844513CD5','Ingeniero',1),
								('ECA2F5E4-F5FB-4DF2-96DD-E20F12F6DE59','Jardinero',1),
								('2FCF1398-C977-4AD2-9997-EB928B7B394B','Licenciado',1),
								('B4F848CF-F391-4C10-B26E-F5B92F88A70E','Médico',1),
								('E1B003DC-E8E8-4EB6-928A-F8EDB22B6219','Periodista',1),
								('AABC1200-D9C6-41D8-A6F2-FD258D4487D7','Publicista',1),
								('CC5D9701-B398-44FA-9230-02FCF89F4067','Subsecretario',1),
								('CCA8AD75-1607-4191-A0CE-0D59A4AE5664','Técnico',1),
								('81C047DE-9BC3-4DEB-A30D-1DF225C791A6','Telefonista',1),
								('27850233-BC8D-4950-90BD-054EC6A2AFD0','Traductor',1),
								('C6D403B4-9C08-434A-BAA0-2273B81B4FD4','Veterinario',1)



	INSERT INTO [Salutation]	(	[Id],										[Name],			[RowStatus]	)	VALUES
								(	'DC109EFF-32DD-436A-9D34-0547E6161AE9',		'Sr',			1			)	,
								(	'F53BEF8C-477D-46E9-8390-15BD67C4DCA4',		'Sra',			1			)	,
								(	'808F0213-6EFE-4D2A-A518-0A71E620F65E',		'Srta',			1			)	
								

	INSERT INTO [dbo].[SourceChannel]	(	[Id],									[Name],				[RowStatus]	)	VALUES
										(	'52A6414A-52D9-4A8A-B492-01ABCE7CBB09',	'F2F',				1			)	,
										(	'A3D27453-4623-45F3-9466-0FA93941EC3D',	'Telemarketing',	1			)	,
										(	'AAB966B0-0806-4B68-993B-1119723AB225',	'Correo directo',	1			)	,
										(	'5B13B7FD-B31B-4D98-BB61-1C0D75845822',	'Web',				1			)	,
										(	'3447636A-B9A9-450C-9D6B-FEAE4A741B44',	'Colaboradores',	1			)	

			
	
	INSERT INTO [dbo].[Industry]	(	[Id],									[Name],				[RowStatus]	)	VALUES
									(	'846BCF78-4416-4F8D-987F-058BAE84B16E',	'Servicios',						1			)	,
									(	'0368AFD0-6F32-42E0-A302-0599F1FD0792',	'Metalmecánica',					1			)	,
									(	'1613D8C0-39A3-46EC-B8D9-05D1C73163F0',	'Química',							1			)	,
									(	'F982E803-5BEA-4369-9900-05FDBC9CFC92',	'Alimenticias',						1			)	,
									(	'22C8A913-1933-4CF7-95FF-0F89782B796E',	'Textiles ',						1			)	,
									(	'94A641A0-B390-4A82-9C37-247D32860D95',	'Construcciones',					1			)	,
									(	'F1E056CB-55FF-48E4-9F04-2D52954D0C23',	'Vestimenta',						1			)	,
									(	'3D847314-754B-4EE2-91C8-383D364E4ED2',	'Farmacéuticas',					1			)	,
									(	'284FD1A6-52E2-4690-B097-406615277B7A',	'Educativas',						1			)	,
									(	'392B827B-989B-4CD8-8061-46619BF7537D',	'Consumo Masivo',					1			)	,
									(	'E171204F-0085-417D-9E58-4C579BC99AE8',	'Inmobiliarias',					1			)	,
									(	'994B071E-2DF3-485B-B90D-4E6EE7F5FC13',	'Automotriz',						1			)	,
									(	'FD537137-AC88-49D3-A739-53DE29D5DC81',	'Plásticos',						1			)	,
									(	'632F7FEF-0F0C-4C99-831A-61EEDB9225AA',	'Telefónicas',						1			)	,
									(	'E6FE572E-149E-4EFA-817F-70F41F4EC71C',	'Tecnología',						1			)	,
									(	'EE2F5E44-E794-4681-BE74-8F5AEA692AB0',	'Organización sin fines de lucro',	1			)	
					
									
	INSERT INTO [dbo].[Language]	(	[Id],									[Name],				[RowStatus]	)	VALUES
									(	'290AF718-B799-407D-9A69-0249C07310AB',	'Alemán',			1			)	,
									(	'63E6842F-E670-46F5-85DD-08C87A6823B1',	'Chino mandarín',	1			)	,
									(	'69E507BF-8D22-424A-BB81-2A81070F7BBC',	'Español',			1			)	,
									(	'56A3F4E9-3E36-47F8-BB62-32D35DDF8E49',	'Francés',			1			)	,
									(	'5E91187F-505C-4F6A-A235-3E45746E6A41',	'Inglés',			1			)	,
									(	'25D82AD3-983A-44FD-B8D9-53A045531357',	'Italiano',			1			)	,
									(	'BDB4714A-1E58-4A55-A314-6DF132448867',	'Japonés',			1			)	,
									(	'E3497770-DF98-4F31-8A0A-7F68A04D2A0E',	'Portugués',		1			)	,
									(	'ACE8A723-6CFE-4826-BABA-8B59D3E0EE22',	'Ruso',				1			)	
														

	--INSERT INTO [Bank]	(	[Id],[Code],			[Name],	[Country_Id],		[RowStatus]	)	VALUES
	--										(NEWID(),'1','BCE','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'5125','BANCO NACIONAL DE FOMENTO','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'10','PICHINCHA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'17','BANCO DE GUAYAQUIL S.A','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'19','BANCO TERRITORIAL','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'24','BANCO CITY BANK','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'25','BANCO MACHALA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'26','BANCO UNIBANCO SA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'27','BANCO DELBANK S.A.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'29','BANCO DE LOJA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'30','BANCO DEL PACIFICO','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'32','BANCO INTERNACIONAL','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'34','BANCO AMAZONAS','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'35','BANCO DEL AUSTRO','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'36','BANCO DE LA PRODUCCION','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'37','BANCO BOLIVARIANO','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'39','COMERCIAL DE MANABI','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'40','BANCO PROMERICA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'42','BANCO GENERAL RUMINAHUI','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'43','BANCO DEL LITORAL S.A.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'45','BANCO SUDAMERICANO','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'50','BANCO COFIEC','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'59','BANCO SOLIDARIO','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'60','BANCO PROCREDIT','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'61','BANCO CAPITAL','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'82','FINANCOOP','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'202','BANCO ECUATORIANO DE LA VIVIENDA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'203','CACPECO LTDA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'204','COOP. AHORRO Y CRED. DE LA PEQ. EMPRESA DE PASTAZA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'205','COOP. AHORRO Y CREDITO 23 DE JULIO','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'206','COOP. AHORRO Y CREDITO 29 DE OCTUBRE','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'207','COOP. AHORRO Y CREDITO ANDALUCIA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'208','COOP. AHORRO Y CREDITO COTOCOLLAO','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'209','COOP. AHORRO Y CREDITO DESARROLLO PUEBLOS','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'210','COOP. AHORRO Y CREDITO EL SAGRARIO','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'211','COOP. AHORRO Y CREDITO GUARANDA LTDA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'213','COOPERATIVA JUVENTUD ECUATORIANA  PROGRESISTA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'215','COOP. AHORRO Y CREDITO NACIONAL','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'216','COOP. AHORRO Y CREDITO OSCUS','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'217','COOP. AHORRO Y CREDITO PABLO MUNOZ VEGA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'218','COOP. AHORRO Y CREDITO PROGRESO','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'219','COOP. AHORRO Y CREDITO RIOBAMBA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'220','COOP. AHORRO Y CREDITO SAN FRANCISCO','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'222','COOP. AHORRO Y CREDITO TULCAN','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'223','COOP. DE AHORRO Y CREDITO ATUNTAQUI LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'224','COOP. DE AHORRO Y CREDITO COMERCIO LTDA PORTOVIEJO','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'225','COOP. DE AHORRO Y CREDITO LA DOLOROSA LTDA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'226','COOP. PREVISION AHORRO Y DESARROLLO','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'227','COOP.AHORRO Y CREDITO ALIANZA DEL VALLE LTDA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'228','COOP.AHORRO Y CREDITO CAMARA DE COMERCIO QUITO','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'229','COOP.AHORRO Y CREDITO CHONE LTDA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'231','COOPERATIVA DE AHORRO Y CREDITO SANTA ANA LTDA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'232','FINANCIERA - DINERS CLUB DEL ECUADOR','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'233','MUTUALISTA AMBATO','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'234','MUTUALISTA AZUAY','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'236','MUTUALISTA IMBABURA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'238','MUTUALISTA PICHINCHA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'239','PACIFICARD','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'1119','COOPERATIVA 11 DE JUNIO','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'1141','COOPERATIVA STA ROSA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'1182','COOPERATIVA SAN FRANCISCO DE ASIS','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'2129','COOPMECO C MANUEL ESTEBAN GODO','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'2753','COOPERATIVA 9 DE OCTUBRE','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'3304','COOPERATIVA PADRE JOSE JULIAN LORENTE','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'3352','COOPERATIVA PEQUENA EMPRESA DE BIBLIAN','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'3364','COOPERATIVA SAN JOSE DE CHIMBO','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'3615','COOPERATIVA JARDIN AZUAYO','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4001','BANCO DEL INSTITUTO ECUATORIANO DE SEGURIDAD SOCIA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4002','BANCO PARA LA ASISTENCIA COMUNITARIA FINCA S.A.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4003','BANCO-D-MIRO S.A.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4004','COOP. A Y C DE LA PEQ. EMP. CACPE ZAMORA LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4005','COOP. A. Y C. CARROCEROS DE TUNGURAHUA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4006','COOP. AHO.Y CRED.NUEVOS HORIZONTES EL ORO LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4007','COOP. AHORRO Y CREDITO AGRARIA MUSHUK KAWSAY LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4008','COOP. AHORRO Y CREDITO ALIANZA MINAS LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4009','COOP. AHORRO Y CREDITO CAMARA DE COMERCIO DEL CANT','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'0','COOP. AHORRO Y CREDITO CAMARA DE COMERCIO INDIGENA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4011','COOP. AHORRO Y CREDITO CARIAMANGA LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4012','COOP. AHORRO Y CREDITO DE LA CAMARA DE COMERCIO DE','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4013','COOP AHORRO Y CREDITO DE LA PEQUENA EMPRESA GUALA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4014','COOP. AHORRO Y CREDITO FAMILIA AUSTRAL','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4015','COOP. AHORRO Y CREDITO FUNDESARROLLO','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4016','COOP. AHORRO Y CREDITO JUAN DE SALINAS LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4017','COOP. AHORRO Y CREDITO LOS RIOS','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4018','COOP. AHORRO Y CREDITO MALCHINGUI LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4019','COOP. AHORRO Y CREDITO MANANTIAL DE ORO LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4020','COOP. AHORRO Y CREDITO MI TIERRA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4021','COOP. AHORRO Y CREDITO NUEVA JERUSALEN','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4022','COOP. AHORRO Y CREDITO PUELLARO LTDA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4023','COOP. AHORRO Y CREDITO SAN ANTONIO LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4024','COOP. AHORRO Y CREDITO SAN GABRIEL LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4025','COOP. AHORRO Y CREDITO SAN MIGUEL DE LOS BANCOS','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4026','COOP. AHORRO Y CREDITO SEMILLA DEL PROGRESO LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4027','COOP. AHORRO Y CREDITO SENOR DE GIRON','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4028','COOP. AHORRO Y CREDITO TENA LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4029','COOP. AHORRO Y CREDITO TUNGURAHUA LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4030','COOP. AHORRO. Y CREDI. MUJERES UNIDAS TANTANAKUSHK','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4031','COOP. DE A Y C EDUCADORES DE PASTAZA LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4032','COOP. DE A Y C GONZANAMA (MIES)','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4033','COOP. DE A Y C JUAN PIO DE MORA LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4034','COOP. DE A. Y C. 23 DE MAYO LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4035','COOP. DE A. Y C. BANOS LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4036','COOP. DE A. Y C. CASAG LTDA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4037','COOP. DE A. Y C. CREDISUR LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4038','COOP. DE A. Y C. DE LA PEQ. EMPRESA CACPE MACARA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4039','COOP. DE A. Y C. DE LOS SERV. PUBL. DEL MIN. DE ED','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4040','COOP. DE A. Y C. DEL COL. FISC. EXPER. VICENTE ROC','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4041','COOP. DE A. Y C. DESARROLLO INTEGRAL LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4042','COOP. DE A. Y C. ECUAFUTURO LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4043','COOP. DE A. Y C. ESCENCIA INDIGENA LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4044','COOP. DE A. Y C. FOCLA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4045','COOP. DE A. Y C. FUTURO Y PROGRESO DE GALAPAGOS LT','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4046','COOP. DE A. Y C. GENERAL RUMINAHUI','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4047','COOP. DE A. Y C. GRAMEEN AMAZONAS','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4048','COOP. DE A. Y C. GUAMOTE LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4049','COOP. DE A. Y C. LUCHA CAMPESINA LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4050','COOP. DE A. Y C. MAQUITA CUSHUN LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4051','COOP. DE A. Y C. MAQUITA CUSHUNCHIC LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4052','COOP. DE A. Y C. PIJAL','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4053','COOP. DE A. Y C. PROFESIONALES DEL VOLANTE UNION L','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4054','COOP. DE A. Y C. SANTA ROSA DE PATUTAN LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4055','COOP. DE A. Y C. SIERRA CENTRO LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4056','COOP. DE A. Y C. SINCHI RUNA LTDA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4057','COOP. DE A. Y C. SUMAC LLACTA LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4058','COOP. DE A. Y C. UNION MERCEDARIA LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4059','COOP. DE A. Y C. VALLES DEL LIRIO','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4060','COOP. DE A. Y C. VENCEDORES DE TUNGURAHUA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4061','COOP. DE AHORRO Y CREDITO  SIMIATUG LTDA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4062','COOP. DE AHORRO Y CREDITO 4 DE OCTUBRE LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4063','COOP. DE AHORRO Y CREDITO ACCION Y DESARROLLO LTDA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4064','COOP. DE AHORRO Y CREDITO ALFONSO JARAMILLO C.C.C.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4065','COOP. DE AHORRO Y CREDITO ANDINA LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4066','COOP. DE AHORRO Y CREDITO CAMARA DE COMERCIO DE AM','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4067','COOP. DE AHORRO Y CREDITO CREDI FACIL LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4068','COOP. DE AHORRO Y CREDITO CREDIAMIGO LTDA. LOJA (M','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4069','COOP. DE AHORRO Y CREDITO CRISTO REY','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4070','COOP. DE AHORRO Y CREDITO DE LA PEQ. EMP. CACPE YA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4071','COOP. DE AHORRO Y CREDITO DORADO LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4072','COOP. DE AHORRO Y CREDITO EDUC.DEL TUNGURAHUA LTDA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4073','COOP. DE AHORRO Y CREDITO EDUCADORES DE CHIMBORAZO','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4074','COOP. DE AHORRO Y CREDITO HUAICANA LTDA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4075','COOP. DE AHORRO Y CREDITO HUAQUILLAS LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4076','COOP. DE AHORRO Y CREDITO JADAN LTDA. (MIES)','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4077','COOP. DE AHORRO Y CREDITO LA MERCED LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4078','COOP. DE AHORRO Y CREDITO MUSHUC RUNA LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4079','COOP. DE AHORRO Y CREDITO NUESTROS ABUELOS LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4080','COOP. DE AHORRO Y CREDITO NUEVA HUANCAVILCA LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4081','COOP. DE AHORRO Y CREDITO PEDRO MONCAYO LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4082','COOP. DE AHORRO Y CREDITO PILAHUIN TIO LTDA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4083','COOP. DE AHORRO Y CREDITO PUERTO LOPEZ LTDA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4084','COOP. DE AHORRO Y CREDITO SAN MIGUEL DE SIGCHOS','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4085','COOP. ESFUERZO UNIDO PARA EL DESARR. DEL CHILCO LA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4086','COOP.AHORRO Y CREDITO DE LA PEQUENA EMPRESA DE LOJ','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4087','COOP.AHORRO Y CREDITO PRIMERO DE ENERO DEL AUSTRO ','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4088','COOP.DE AHORRO Y CREDITO COCA LTDA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4089','COOP.DE AHORRO Y CREDITO HUAYCO PUNGO LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4090','COOP.DE AHORRO Y CREDITO SAN PEDRO DE TABOADA LTDA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4091','COOPERATIVA 15 DE AGOSTO PILACOTO','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4092','COOPERATIVA DE AHORRO Y CREDITO SAN JORGE LTDA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4093','COOPERATIVA DE AHORRO Y CREDITO 27 DE ABRIL LOJA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4094','COOPERATIVA DE AHORRO Y CREDITO AGRICOLA JUNIN L','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4095','COOPERATIVA DE AHORRO Y CREDITO AMBATO LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4096','COOPERATIVA DE AHORRO Y CREDITO ARTESANOS LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4097','COOPERATIVA DE AHORRO Y CREDITO CAC-CICA (MIES)','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4098','COOPERATIVA DE AHORRO Y CREDITO CACPE CELICA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4099','COOPERATIVA DE AHORRO Y CREDITO CATAMAYO LTDA. (MI','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4100','COOPERATIVA DE AHORRO Y CREDITO EL CALVARIO LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4101','COOPERATIVA DE AHORRO Y CREDITO ERCO LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4102','COOPERATIVA DE AHORRO Y CREDITO FERNANDO DAQUILEMA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4103','COOPERATIVA DE AHORRO Y CREDITO FORTUNA (MIES)','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4104','COOPERATIVA DE AHORRO Y CREDITO INTEGRAL','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4105','COOPERATIVA DE AHORRO Y CREDITO LLANGANATES','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4106','COOPERATIVA DE AHORRO Y CREDITO MARCABELI LTDA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4107','COOPERATIVA DE AHORRO Y CREDITO NUEVA ESPERANZA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4108','COOPERATIVA DE AHORRO Y CREDITO PILAHUIN','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4109','COOPERATIVA DE AHORRO Y CREDITO PROVIDA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4110','COOPERATIVA DE AHORRO Y CREDITO PUCARA LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4111','COOPERATIVA DE AHORRO Y CREDITO QUILANGA LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4112','COOPERATIVA DE AHORRO Y CREDITO SAN JOSE S.J.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4113','COOPERATIVA DE AHORRO Y CREDITO SANTA ANITA LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4115','FONDO DE CESANTIA DEL MAGISTERIO ECUATORIANO FCME','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										('CCFA8ADC-0081-4F3F-BFE3-8E1D7599F734','4116','INTERDIN S.A.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4117','COOP. AHORRO Y CREDITO AMAZONAS LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'9987','COOP.CALCETA LTDA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'9988','COOPERATIVA DE AHORRO Y CREDITO MINGA LTDA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'9989','COOPERATIVA AHORRO Y CREDITO ACCION RURAL','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'9995','COOPERATIVA 15 DE ABRIL','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'9996','COOPERATIVA DE AHORRO Y CREDITO COOPERA LTDA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'9997','COOPERATIVA POLICIA NACIONAL','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4118','COOP. DE A. Y C. FINANCIERA INDIGENA LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4119','COOP. DE A. Y C. 20 DE FEBRERO LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4120','COOP. DE A. Y C. EDUCADORES TULCAN LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4121','CAMARA DE COMERCIO JOYA DE LOS SACHAS','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4122','COOP. DE AHORRO Y CREDITO FCO. DE ORELLANA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4123','DE AHORRO Y CREDITO CRECIENDO JUNTOS','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4124','COOP. DE AHORRO Y CRÉDITO GÚEL LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4125','COOP. DE AHORRO Y CRÉDITO FASAYÑAN LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4126','COOP. DE AHORRO Y CRÉDITO SOL DE LOS ANDES','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4127','COOP. DE AHORRO Y CRÉDITO 22 DE JUNIO','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4129','COOP. DE AHORRO Y CRÉDITO POPULAR Y SOLIDARIA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4130','COOP. DE AHORRO Y CRÉDITO LA FLORIDA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4131','COOP. DE AHORRO Y CREDITO SAN SANTIAGO DE MOLLETURO LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4132','COOP. DE AHORRO Y CREDITO CUMBEÑITA LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4133','COOP. DE AHORRO Y CREDITO GUACHAPALA LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4134','COOP. DE AHORRO Y CREDITO 29 DE ENERO','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4136','CORPORACIÓN EN LAS HUELLAS DEL BANCO GRAMEEN','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4137','COOP. DE AHORRO Y CREDITO 23 DE ENERO','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4138','COOP. DE LA PEQUENA Y MEDIANA EMPRESA CIUDADANA DE MACARA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4139','CAJA DE AHORRO Y CREDITO ZHONDELEG','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4140','CAJA DE AHORRO Y CREDITO MANU','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4141','CAJA DE AHORRO Y CREDITO FRONTERA SUR','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4142','CAJA DE AHORRO Y CREDITO SAN FRANCISCO','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4143','CAJA DE AHORRO Y CREDITO HORIZONTE FAMILIAR','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4144','COOP. DE AHORRO Y CREDITO CÁMARA DE COMERICO GONZANAMÁ','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4145','COOP. CACIQUE GURITAVE','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4146','COOP. SOLIDARIDAD Y PROGRESO ORIENTAL','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4147','COOPERATIVA DE AHORRO Y CREDITO SAN MARCOS','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4148','COOP. DE AHORRO Y CREDITO MIGRANTE SOLIDARIO','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4149','CAJA DE AHORRO Y CREDITO EL INGENIO','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4150','COOP. DE AHORRO Y CREDITO SAN JOSÉ (EL AIRO)','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4151','CAJA DE AHORRO Y CREDITO NUESTRA SEÑORA DE LA MERCED','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4152','CAJA DE AHORRO Y CREDITO FRANCISCA CHIGUA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4153','CAJA DE AHORRO Y CREDITO EL MANIZAL','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4154','COOP. DE A Y C MUSHUK YUYAY','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4155','COOP. SOLIDARIA DE GUALAQUIZA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4156','CAJA SOLIDARIA CHIQUICHA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4157','CAJA SOLIDARIA ESTRELLA DEL MUNDO','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4158','COOP. DE A Y C DESARROLLO POPULAR','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4159','COOP. DE A Y C KURI WASI','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4160','COOP. DE A Y C WUAMANLOMA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4161','CORPORACION VIENTOS SOLIDARIOS','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4162','COOP. AGUILAS DE CRISTO','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4163','COOP. FUENTE DE VIDA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4164','COOP. CREDIUNION','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4165','COOP. OLMEDO','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4166','FINANCIERA - CONSULCREDITO S.A.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4167','COOPERATIVA DE AHORRO Y CREDITO HUINARA LTDA. (MIES)','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4168','COOP. DE A. Y C. INKA KIPU LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4169','COOP. DE A. Y C. ACCIÓN TUNGURAHUA LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4170','COOP. DE A. Y C. 16 DE JUNIO','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4171','COOP. A.Y C. ESC.SUP.POLITEC. AGROP. DE MANABI MANUEL FELIX LOPEZ LTDA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4172','COOP. DE A. Y C. INDIGENA ALFA Y OMEGA LTDA.ALFA Y OMEGA LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4173','COOP. DE A. Y C. FENIX','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4174','COOP. DE AHORRO Y CREDITO LOS ANDES LATINOS LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4175','COOP. DE AHORRO Y CREDITO GUARUMAL DEL CENTRO LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4176','VAZCORP SOCIEDAD FINANCIERA S.A.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4177','COOP. DE A. Y C. COOPAC AUSTRO LTDA (MIESS)','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4178','COOPERATIVA DE AHORRO Y CREDITO CREA LTDA ( MIES)','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4179','CCOP. DE A. Y C. SALASACA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4180','COOP. DE A. Y C. SUMAK SAMY LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4181','COOP. DE A. Y C. INTERCULT. TARPUK RUNA LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4182','COOP. DE A. Y C. CHIBULEO LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4183','COOP. DE A. Y C. EL TESORO PILLAREÑO','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4184','COOP. DE A. Y C. KISAPINCHA LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4185','COOP. DE A. Y C. JUVENTUD UNIDA LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4186','COOP. DE A. Y C. UNION QUISAPINCHA LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4187','COOP. DE A. Y C. 13 DE ABRIL LTDA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4188','COOP. DE A. Y C. SALINAS LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4189','COOP. DE A. Y C. SAN PEDRO LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4190','COOP. DE A. Y C. VIRGEN DEL CISNE','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4191','COOP. DE A. Y C. LOS CHASQUIS PASTOCALLE LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4192','COOP. DE A. Y C. COOPINDIGENA LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4193','COOP. DE A. Y C  EDUCADORES DE ZAMORA CHINCHIPE','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4194','COOPERATIVA DE AHORRO Y CREDITO LAS LAGUNAS (MIESS)','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4195','COOP.DE A.Y C. EL COMERCIANTE LTDA (MIES)','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4196','COOP. DE AHORRO Y CREDITO EDUCADORES DE EL ORO LTDA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4197','COOP. DE A. Y C. EMPLEADOS BANCARIOS DEL ORO LTDA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4198','COOPERATIVA DE AHORRO Y CREDITO RIOCHICO','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4199','COOP. DE A. Y C. LA UNION LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4200','COOP. DE A. Y C. SAN MARTIN DE TISALEO LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4201','COOP. DE A. Y C. ALLI TARPUC LTDA.','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4202','COOP. DE AHORRO Y CREDITO SAN MIGUEL DE PALLATANGA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4203','COOP. DE A. Y C. PADRE VICENTE PONCE RUBIO','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4204','CORPORACIÓN DE DESARROLLO SOCIAL Y FINANCIERO ISLAS ENCANTADAS','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4205','COOP. DE SERVICIOS MULTIPLES AGRO VIDA','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4206','COOP. DE LA MICROEMPRESA DE CHIMBORAZO','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4207','COOP. DE A Y C 4 DE OCTUBRE SAN FRANCISCO DE CHAMBO','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4208','COOP. DE A Y C 26 DE SEPTIEMBRE LAZARO CONDO ','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4209','CAJA SOLIDARIA DE A Y C CORDTUCH','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4210','COOP. SAN PABLO','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4211','COOP. 15 DE DICIEMBRE','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'4212','CAJA DE A Y C JEVENTUD Y DESARROLLO','3CD80F14-0975-4864-B533-B9376024BB74',1),
	--										(NEWID(),'-1', 'PLAN INTERNATIONAL', '3CD80F14-0975-4864-B533-B9376024BB74',1 )


--PAYMENT	
GO
INSERT INTO [dbo].[Payment_Type]	(	[Id],									[Name],					[Code],	[RowStatus]	)	VALUES
									(	'CCFA8ADC-0081-4F3F-BFE3-8E1D7599F734',	'Tarjeta de crédito',	'19',	1			)	,
									(	'8077AD19-D6E2-4ED3-B452-2109A7832CD7',	'Cuenta bancaria',		'20',	1			)	,
									(	'6177D205-895F-4AD5-BDA6-A5E2ED299F41',	'Otros',				'01',	1			)

GO
INSERT INTO [dbo].[Payment_Subtype]	(	[Id],									[Name],				[Payment_Type_Id],							[RowStatus]	)	VALUES
									(	'64D4DB58-A13E-4618-A482-2E78246172E3',	'Cuenta Corriente',	'8077AD19-D6E2-4ED3-B452-2109A7832CD7',		1	)	,	
									(	'76BB43AB-AB4A-4D4A-B262-3E2CBA66645B',	'Cuenta Ahorros',	'8077AD19-D6E2-4ED3-B452-2109A7832CD7',		1	)	,
									(	'7CD189E6-914D-473B-8EB7-554089C76810',	'Diners',			'CCFA8ADC-0081-4F3F-BFE3-8E1D7599F734',		1	)	,
									(	'44AB813B-3939-4D1E-936A-5B1C6D315216',	'Discover',			'CCFA8ADC-0081-4F3F-BFE3-8E1D7599F734',		1	)	,
									(	'64C8A4A5-E1EB-4412-8505-0FACC4D13185',	'Mastercard',		'CCFA8ADC-0081-4F3F-BFE3-8E1D7599F734',		1	)	,
									(	'E4633230-0C15-4C5B-9134-565EC7F93A69',	'Visa',				'CCFA8ADC-0081-4F3F-BFE3-8E1D7599F734',		1	)	,
									(	'9B952057-4EC6-4D78-BEE7-6E95DFF96502',	'American Express',	'CCFA8ADC-0081-4F3F-BFE3-8E1D7599F734',		1	)	,
									(	'59F9D428-5D1F-4881-A39C-75A199C39F75',	'Planilla',			'6177D205-895F-4AD5-BDA6-A5E2ED299F41',		1	)	,
									(	'152DA376-9A7F-41F4-91AB-8964D082884F',	'Efectivo',			'6177D205-895F-4AD5-BDA6-A5E2ED299F41',		1	)	,
									(	'501FE247-B132-4A71-8E54-FD26B574BAFA',	'Factura',			'6177D205-895F-4AD5-BDA6-A5E2ED299F41',		1	)	

--GO
--  INSERT INTO [dbo].[Payment_DebtFileType]	(	[Id],									[Name],							[RowStatus]	)	VALUES
--											(	'8BC54987-3182-4C36-859C-072C4B771AD8',	'Cuentas bancarias BI',			1			)	,
--											(	'5CAB98E7-B410-46BB-A50B-091512F0CE9B',	'Cuentas bancarias SCI',							1			)	,
--											(	'643262DF-1C8B-4FE2-B237-44EA9385D6D5',	'Visa',							1			)	,
--											(	'5B52430C-3C40-44F5-B499-52FC2D8E55F1',	'Mastercard',					1			)	,
--											(	'5781AB03-24F7-485B-A29E-67EDE562E173',	'Diners',						1			)	,
--											(	'675CC791-5FFD-41A7-B9FC-033558FFE075',	'Discover',						1			)	,
--											(	'9B60978C-14BD-4922-86D0-2E25A85892CF',	'Planilla Plan International',	1			)	,
--											(	'5F601E37-5E5C-4C5C-A46A-D78255566200',	'American Express',				1			)




GO
--INSERT INTO [dbo].[Payment_AquirerCompany_DebtFileType_Subtype]	(	[Id],								[Payment_DebtFileType_Id],					[Payment_Subtype_Id],					[Payment_AcquirerCompany_Id],	[RowStatus]	)	VALUES
--															(	'91E97191-91F1-4F74-8D32-1C72B0188686',	'5781AB03-24F7-485B-A29E-67EDE562E173',	'7CD189E6-914D-473B-8EB7-554089C76810',	null,							1			)	,	--Diners
--															(	'7B4BD005-AD2C-4EE9-9B74-233FC10F5A21',	'643262DF-1C8B-4FE2-B237-44EA9385D6D5',	'E4633230-0C15-4C5B-9134-565EC7F93A69',	null,							1			)	,	--Visa 
--															(	'FF505A51-BF97-4237-9EB5-50EA44C651DD',	'675CC791-5FFD-41A7-B9FC-033558FFE075',	'44AB813B-3939-4D1E-936A-5B1C6D315216',	null,							1			)	,	--Discover 
--															(	'EA17F401-F837-48EC-AF78-5A67BE9D1103',	'5F601E37-5E5C-4C5C-A46A-D78255566200',	'9B952057-4EC6-4D78-BEE7-6E95DFF96502', null,							1			)	,	--American Express
--															(	'EC5273BF-E055-437B-A7F2-610DC6FFC838',	'9B60978C-14BD-4922-86D0-2E25A85892CF',	'59F9D428-5D1F-4881-A39C-75A199C39F75',	null,							1			)	,	--Planilla
--															(	'451E0084-CE29-42BA-9973-61643C4067E5',	'5B52430C-3C40-44F5-B499-52FC2D8E55F1',	'64C8A4A5-E1EB-4412-8505-0FACC4D13185', null,							1			)		--Mastercard
																								
--GO
--INSERT INTO [dbo].[Payment_AquirerCompany_DebtFileType_Subtype]	(	[Id],		[Payment_DebtFileType_Id],				[Payment_Subtype_Id],					[Payment_AcquirerCompany_Id],	[RowStatus]	)	
--															--BI AHORROS
--															SELECT	newid(),	'8BC54987-3182-4C36-859C-072C4B771AD8',	'76BB43AB-AB4A-4D4A-B262-3E2CBA66645B',	a.Id,							1			
--															FROM [Analytica01].[dbo].[Payment_AcquirerCompany] a
--															where code = 32
--															--BI CORRIENTE
--															UNION
--															SELECT	newid(),	'8BC54987-3182-4C36-859C-072C4B771AD8',	'64D4DB58-A13E-4618-A482-2E78246172E3',	a.Id,							1			
--															FROM [Analytica01].[dbo].[Payment_AcquirerCompany] a
--															where code = 32
--															--SCI AHORROS
--															UNION
--															SELECT	newid(),	'5CAB98E7-B410-46BB-A50B-091512F0CE9B',	'76BB43AB-AB4A-4D4A-B262-3E2CBA66645B',	a.Id,							1			
--															FROM [Analytica01].[dbo].[Payment_AcquirerCompany] a
--															where code != 32
--															--SCI CORRIENTE
--															UNION
--															SELECT	newid(),	'5CAB98E7-B410-46BB-A50B-091512F0CE9B',	'64D4DB58-A13E-4618-A482-2E78246172E3',	a.Id,							1			
--															FROM [Analytica01].[dbo].[Payment_AcquirerCompany] a
--															where code != 32
															


--SUBSCRIPTION

--GO
--INSERT INTO [dbo].[Subscription_Status]	(	[Id],									[Name],		[RowStatus]	)	VALUES
--										(	'2D77E264-4A66-450D-A399-A543154E52A6',	'Activo',	1			)	,
--										(	'ADE01433-55ED-4144-ADE2-FF025DC6BF61',	'Inactivo',	1			)

--GO
--INSERT INTO [dbo].[Subscription_Recurrence]	    (	[Id],										[Name],				[Months],	[RowStatus]	)	VALUES
--												(	'5E8E9C0B-B0BB-4BB9-90DE-23FA7A7C6436',		'Mensual',			1,			1			)	,
--												(	'4231EF9D-F5BB-433F-8880-EA5B2DF650FC',		'Bimensual',		2,			1			)	,
--												(	'360CD385-8B39-46F4-A7CD-413F6579B568',		'Trimestral',		3,			1			)	,
--												(	'4F895E24-D7B2-4BEA-93D7-434CF6AAE1B3',		'Semestral',		6,			1			)	,
--												(	'CAC1A1FD-ED10-4963-8CD3-6669EDF6057D',		'Anual',			12,			1			)	,
--												(	'EF53E3C2-233A-4D96-9EAA-BBE6B63D2919',		'Personalizado',	0,			1			)	

--MANUFACTURE STATUS
GO
INSERT INTO [dbo].[Manufacture_Status]	(	[Id],									[Name],						[RowStatus]	)	VALUES
										(	'F57DC35F-91FD-491B-B29C-46B437299307',	'Borrador',					1			)	,
										(	'CF24BE20-F9E7-4C2E-A86E-169DBFCEA392',	'En espera',				1			)	,
										(	'17430003-8CB6-4F5E-B20D-F7CB9E37716B',	'Lista para fabricar',		1			)	,
										(	'14CC66A7-FE15-4E6C-8D8E-A6CFB33EB113',	'En proceso',				1			)	,
										(	'C70ADD16-6BC0-4B88-88D6-127A47FBB6EF',	'Finalizada',				1			)	
GO

INSERT INTO [dbo].[MassiveEmail_State]	(	[Id],									[Name],						[RowStatus]	,	[Locked]	)	VALUES
										(	'F57DC35F-91FD-491B-B29C-46B437299307',	'Borrador',					1			,	1			)	,
										(	'17430003-8CB6-4F5E-B20D-F7CB9E37716B',	'Lista para enviar',		1			,	1			)	,
										(	'C70ADD16-6BC0-4B88-88D6-127A47FBB6EF',	'Enviada',					1			,	1			)	


INSERT INTO [dbo].[Email_State]	(	[Id],									[Name],						[RowStatus]	,	[Locked]	)	VALUES
								(	'F57DC35F-91FD-491B-B29C-46B437299307',	'Borrador',					1			,	1			)	,
								(	'17430003-8CB6-4F5E-B20D-F7CB9E37716B',	'Lista para enviar',		1			,	1			)	,
								(	'C70ADD16-6BC0-4B88-88D6-127A47FBB6EF',	'Enviada',					1			,	1			)	,
								(	'082A712F-8290-46C2-8831-F30C1DE9134E',	'Error al enviar',			1			,	1			)	

INSERT INTO [dbo].[Purchase_Status] (	[Id],									[Name],						[RowStatus],	[Locked]	)	VALUES
									(	'C3C53849-B66B-416E-B683-2250B1FD986A',	'Aprobado',					1,				1			),
									(	'5CCBE063-364A-4C38-92BC-50B1EDC13847',	'Solicitado',				1,				1			),
									(	'0700761C-157A-4B9D-B41C-78B7FD8DC7DA',	'Enviado al proveedor',		1,				1			)

INSERT INTO [dbo].[InventoryTransfer_Status]	(	[Id],									[Name],						[RowStatus],	[Locked]	)	VALUES
												(	'C3C53849-B66B-416E-B683-2250B1FD986A',	'Solicitado',				1,				1			),
												(	'5CCBE063-364A-4C38-92BC-50B1EDC13847',	'Aprobado',					1,				1			),
												(	'0700761C-157A-4B9D-B41C-78B7FD8DC7DA',	'En proceso',				1,				1			),
												(	'97153065-ADA7-4FAF-A0B1-82058D9E4433',	'Transferido',				1,				1			)

INSERT INTO [dbo].[Inventory_Status]	(	[Id],									[Name],						[RowStatus],	[Locked]	)	VALUES
										(	'C3C53849-B66B-416E-B683-2250B1FD986A',	'Disponible',				1,				1			),
										(	'5CCBE063-364A-4C38-92BC-50B1EDC13847',	'En proceso',				1,				1			),
										(	'0700761C-157A-4B9D-B41C-78B7FD8DC7DA',	'Reservado',				1,				1			),
										(	'BF12478D-B7D6-4760-BF0A-9091AA48FA2A',	'Despachado',				1,				1			)

INSERT INTO [dbo].[Inventory_Status]	(	[Id],									[Name],						[RowStatus],	[Locked]	)	VALUES
										(	'C3C53849-B66B-416E-B683-2250B1FD986A',	'Disponible',				1,				1			),
										(	'5CCBE063-364A-4C38-92BC-50B1EDC13847',	'En proceso',				1,				1			),
										(	'0700761C-157A-4B9D-B41C-78B7FD8DC7DA',	'Reservado',				1,				1			),
										(	'BF12478D-B7D6-4760-BF0A-9091AA48FA2A',	'Vendido',					1,				1			)

INSERT INTO [dbo].[Tax_Type]	(	[Id],									[Name],			[Code],		[RowStatus],	[Locked]	) VALUES
								(	'80D9E2FD-DBE5-4C25-AA40-EC11EF117DCB',	'IVA',			'2',		1,				1			),
								(	'97153065-ADA7-4FAF-A0B1-82058D9E4433',	'ICE',			'3',		1,				1			),
								(	'BF12478D-B7D6-4760-BF0A-9091AA48FA2A',	'IRBPNR',		'5',		1,				1			)

INSERT INTO [dbo].[Tax]		(	[Id],									[Name],						[Percentage],		[PercentageCode],	[Code],	[Tax_Type_Id],							[RowStatus],	[Locked]	) VALUES
							(	'4EC4A877-D446-420A-913A-A7C50920D0E2',	'IVA 0%',					0,					'0',				'0',	'80D9E2FD-DBE5-4C25-AA40-EC11EF117DCB',	1,				1			),
							(	'46A185F6-AD32-4208-B851-4C59B9558FBB',	'IVA 12%',					12,					'2',				'2',	'80D9E2FD-DBE5-4C25-AA40-EC11EF117DCB',	1,				1			),
							(	'7076F167-C2B3-4A48-A1EB-C7B3D6B02FC5',	'IVA 14%',					14,					'3',				'3',	'80D9E2FD-DBE5-4C25-AA40-EC11EF117DCB',	1,				1			),
							(	'7F67CCDA-BCE6-410F-A635-06A15F40A677',	'No Objeto de impuesto',	0,					'6',				'6',	'80D9E2FD-DBE5-4C25-AA40-EC11EF117DCB',	1,				1			),
							(	'58F4EAAA-5E5B-43B0-8FD2-E621CF10C265',	'Exento de IVA',			0,					'7',				'7',	'80D9E2FD-DBE5-4C25-AA40-EC11EF117DCB',	1,				1			)

INSERT INTO [dbo].[Tax_RetentionType]	(	[Id],									[Name],			[Code],		[RowStatus],	[Locked]	) VALUES
										(	'80D9E2FD-DBE5-4C25-AA40-EC11EF117DCB',	'RENTA',		'1',		1,				1			),
										(	'97153065-ADA7-4FAF-A0B1-82058D9E4433',	'IVA',			'2',		1,				1			),
										(	'BF12478D-B7D6-4760-BF0A-9091AA48FA2A',	'ISD',			'6',		1,				1			)

INSERT INTO [dbo].[Tax_Retention]	(	[Id],									[Name],						[Percentage],		[Code],		[Tax_RetentionType_Id],						[RowStatus],	[Locked]	) VALUES
									(	'4EC4A877-D446-420A-913A-A7C50920D0E2',	'IVA 0%',					0,					'7',		'97153065-ADA7-4FAF-A0B1-82058D9E4433',		1,				1			),
									(	'9707C32E-63D5-4BCA-896B-6240B98144BD',	'IVA 10%',					10,					'9',		'97153065-ADA7-4FAF-A0B1-82058D9E4433',		1,				1			),
									(	'513BA1C6-6062-47B7-A776-E2158B0894D6',	'IVA 20%',					20,					'10',		'97153065-ADA7-4FAF-A0B1-82058D9E4433',		1,				1			),
									(	'55484BEC-8B26-42C3-A54E-F6E74DB7C625',	'IVA 30%',					30,					'1',		'97153065-ADA7-4FAF-A0B1-82058D9E4433',		1,				1			),
									(	'9475615F-142B-4346-8D38-2E3E0F0F0449',	'IVA 50%',					50,					'11',		'97153065-ADA7-4FAF-A0B1-82058D9E4433',		1,				1			),
									(	'BCC49B25-7DC0-4877-9F74-385AE778AB72',	'IVA 70%',					70,					'2',		'97153065-ADA7-4FAF-A0B1-82058D9E4433',		1,				1			),
									(	'6EEE84C5-5CB1-40FD-85EA-20AB908A9B3C',	'IVA 100%',					100,				'3',		'97153065-ADA7-4FAF-A0B1-82058D9E4433',		1,				1			)

INSERT INTO [dbo].[BusinessItem_Type]	(	[Id],									[Name],				[RowStatus],	[Locked]	) VALUES
										(	'80D9E2FD-DBE5-4C25-AA40-EC11EF117DCB',	'Servicio',			1,				1			),
										(	'97153065-ADA7-4FAF-A0B1-82058D9E4433',	'Producto',			1,				1			),
										(	'BF12478D-B7D6-4760-BF0A-9091AA48FA2A',	'Activo fijo',		1,				1			)



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
