CREATE TABLE [dbo].[Service_Comment]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
    [Date]								DATETIME			NULL, 
	[Text]								NVARCHAR(1000)		NULL,
	[Service_Id]						UNIQUEIDENTIFIER	NOT NULL,
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_ServiceComment] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_ServiceComment_Service] FOREIGN KEY ([Service_Id]) REFERENCES [Service]([Id]),
    CONSTRAINT [FK_ServiceComment_Employee] FOREIGN KEY ([Employee_Id]) REFERENCES [Employee]([Id]) 

)
