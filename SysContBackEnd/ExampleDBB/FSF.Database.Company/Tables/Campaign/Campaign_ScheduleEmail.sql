CREATE TABLE [dbo].[Campaign_ScheduleEmail]
(
	[Id]								UNIQUEIDENTIFIER NOT NULL PRIMARY KEY, 
    [Since]								DATETIME NULL, 
    [To]								DATETIME NULL, 
    [Status]							INT NULL, 
	[Email_Template_Id]					UNIQUEIDENTIFIER NULL, 
    [Campaign_ScheduleEmail_Id]			UNIQUEIDENTIFIER NULL, 
    [Campaign_Id]						UNIQUEIDENTIFIER NULL, 
    [Campaign_Segment_Id]				UNIQUEIDENTIFIER NULL, 
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 
    
)
