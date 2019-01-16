﻿CREATE TABLE [dbo].[Activity_Topic]
(
	[Id]					UNIQUEIDENTIFIER	NOT NULL, 
    [Name]					NVARCHAR(MAX)		NULL, 
    [Description]			NVARCHAR(MAX)		NULL, 
	[Accomplished]			BIT					NULL, 
	[Successful]			BIT					NULL,
	[Comments]				NVARCHAR(MAX)		NULL,
    [Activity_Id]			UNIQUEIDENTIFIER	NULL, 
	[RowStatus]				INT                 NOT NULL,
	[Locked]				BIT					NOT NULL DEFAULT 0,
	[Required]				BIT					NOT NULL DEFAULT 0,
	[Employee_Id]			UNIQUEIDENTIFIER	NULL,
	[CreatedBy]				UNIQUEIDENTIFIER	NULL,
	[CreatedDate]			DATETIME			NULL,
	[ModifiedBy]			UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]			DATETIME			NULL, 
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_Activity_Topic] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_ActivityTopic_Topic] FOREIGN KEY (Activity_Id) REFERENCES [Activity]([Id]), 
)
