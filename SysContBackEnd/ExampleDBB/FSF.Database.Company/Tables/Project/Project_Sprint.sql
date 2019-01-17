﻿CREATE TABLE [dbo].[Project_Sprint]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
    [Number]							INT					NOT NULL, 
	[PlannedStart]						DATE				NULL, 
	[PlannedEnd]						DATE				NULL, 
	[ActualStart]						DATE				NULL, 
	[ActualEnd]							DATE				NULL, 
	[Project_Id]						UNIQUEIDENTIFIER	NULL, 
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_Project_Sprint] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_Project_Sprint] FOREIGN KEY ([Project_Id]) REFERENCES [Project]([Id]), 
)