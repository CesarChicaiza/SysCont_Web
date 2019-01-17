CREATE TABLE [dbo].[Activity]
(
	[Id]					UNIQUEIDENTIFIER	NOT NULL, 
    [Subject]				NVARCHAR(500)		NULL, 
    [ScheduleDateFrom]		DATETIME			NULL, 
    [ScheduleDateTo]		DATETIME			NULL, 
    [RealDateFrom]			DATETIME			NULL, 
	[RealDateTo]			DATETIME			NULL, 
	[Place]					NVARCHAR(MAX)		NULL, 
    [Activity_Status_Id]	UNIQUEIDENTIFIER	NULL,  --0: planificado, 1: realizado
	[Activity_Priority_Id]	UNIQUEIDENTIFIER	NULL, --1: alta ... 5:baja
	[Activity_Type_Id]		UNIQUEIDENTIFIER	NULL, 
	[Activity_PlaceType_Id] UNIQUEIDENTIFIER	NULL, 
	[Entity_Id]				UNIQUEIDENTIFIER	NULL, 
    [ExternalId]			UNIQUEIDENTIFIER	NULL, 
    [ExternalName]			NVARCHAR(MAX)		NULL, 
    [Comments]				NVARCHAR(MAX)		NULL, 
	[RowStatus]				INT                 NOT NULL,
	[Locked]				BIT					NOT NULL DEFAULT 0,
	[Required]				BIT					NOT NULL DEFAULT 0,
	[Employee_Id]			UNIQUEIDENTIFIER	NULL,
	[CreatedBy]				UNIQUEIDENTIFIER	NULL,
	[CreatedDate]			DATETIME			NULL,
	[ModifiedBy]			UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]			DATETIME			NULL, 
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_Activity] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_Activity_Priority] FOREIGN KEY ([Activity_Priority_Id]) REFERENCES [Activity_Priority]([Id]), 
    CONSTRAINT [FK_Activity_Status] FOREIGN KEY ([Activity_Status_Id]) REFERENCES [Activity_Status]([Id]), 
    CONSTRAINT [FK_Activity_Type] FOREIGN KEY ([Activity_Type_Id]) REFERENCES [Activity_Type]([Id]), 
    CONSTRAINT [FK_Activity_PlaceType] FOREIGN KEY ([Activity_PlaceType_Id]) REFERENCES [Activity_PlaceType]([Id]) 
)
