﻿CREATE TABLE [dbo].[BusinessOpportunity]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
    [Date]								DATETIME			NOT NULL, 
    [DateClosing]						DATETIME			NOT NULL, 
	[Number]							BIGINT				NULL, 
	[Description]						NVARCHAR(500)		NOT NULL DEFAULT '', 
	[Discount]							DECIMAL(18, 5)		NULL, 
	[Subtotal]							DECIMAL(18, 5)		NULL, 
	[Total]								DECIMAL(18, 5)		NULL, 
	[BusinessOpportunity_State_Id]		UNIQUEIDENTIFIER	NULL,
	[BusinessOpportunity_LossReason_Id]	UNIQUEIDENTIFIER	NULL,
	[ImplementationTime]				NVARCHAR(MAX)		NULL,		
	[Comments]							NVARCHAR(MAX)		NULL,		
	[Customer_Id]						UNIQUEIDENTIFIER	NOT NULL,
	[Campaign_Id]						UNIQUEIDENTIFIER	NULL, 
	[SourceChannel_Id]					UNIQUEIDENTIFIER	NULL, 
	[Customer_Contact_Id]				UNIQUEIDENTIFIER	NULL, 
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_BusinessOpportunity] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_BusinessOpportunity_Customer] FOREIGN KEY ([Customer_Id]) REFERENCES [Customer]([Id]),
    CONSTRAINT [FK_BusinessOpportunity_Campaign] FOREIGN KEY ([Campaign_Id]) REFERENCES [Campaign]([Id]), 
    CONSTRAINT [FK_BusinessOpportunity_Employee_Id] FOREIGN KEY ([Employee_Id]) REFERENCES [Employee]([Id]),
    CONSTRAINT [FK_BusinessOpportunity_State_Id] FOREIGN KEY ([BusinessOpportunity_State_Id]) REFERENCES [BusinessOpportunity_State]([Id]), 
    CONSTRAINT [FK_BusinessOpportunity_LossReason_Id] FOREIGN KEY ([BusinessOpportunity_LossReason_Id]) REFERENCES [BusinessOpportunity_LossReason]([Id]) ,
    CONSTRAINT [FK_BusinessOpportunity_SourceChannel_Id] FOREIGN KEY ([SourceChannel_Id]) REFERENCES [SourceChannel]([Id]),
    CONSTRAINT [FK_BusinessOpportunity_Customer_Contact] FOREIGN KEY ([Customer_Contact_Id]) REFERENCES [Customer_Contact]([Id])
)
