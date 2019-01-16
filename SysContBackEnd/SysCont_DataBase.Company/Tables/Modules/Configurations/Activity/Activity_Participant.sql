CREATE TABLE [dbo].[Activity_Participant]
(
	[Id]					UNIQUEIDENTIFIER	NOT NULL , 
    [Mandatory]				BIT					NULL, 
	[Activity_Id]			UNIQUEIDENTIFIER	NULL, 
    [Entity_Id]				UNIQUEIDENTIFIER	NULL, 
    [ExternalId]			UNIQUEIDENTIFIER	NULL, 
    [Attendance]			BIT					NULL, 
	[RowStatus]				INT                 NOT NULL,
	[Locked]				BIT					NOT NULL DEFAULT 0,
	[Required]				BIT					NOT NULL DEFAULT 0,
	[Employee_Id]			UNIQUEIDENTIFIER	NULL,
	[CreatedBy]				UNIQUEIDENTIFIER	NULL,
	[CreatedDate]			DATETIME			NULL,
	[ModifiedBy]			UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]			DATETIME			NULL, 
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [FK_ActivityParticipant_Activity] FOREIGN KEY ([Activity_Id]) REFERENCES [Activity]([Id]), 
    CONSTRAINT [PK_Activity_Participant] PRIMARY KEY ([Id])
)
