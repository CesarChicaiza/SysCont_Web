CREATE TABLE [dbo].[Contract_RecurringPaymentRule]
(
	[Id]								UNIQUEIDENTIFIER	NOT NULL, 
    [Start]								DATE				NOT NULL,
	[End]								DATE				NULL,
	[Contract_Id]						UNIQUEIDENTIFIER	NOT NULL,
	[Contract_RecurrenceType_Id]		UNIQUEIDENTIFIER	NOT NULL,
	[Customer_PaymentOption_Id]			UNIQUEIDENTIFIER	NOT NULL,
	[RowStatus]							INT					NOT NULL,
	[Locked]							BIT					NOT NULL DEFAULT 0,
	[Required]							BIT					NOT NULL DEFAULT 0,
	[Employee_Id]						UNIQUEIDENTIFIER	NULL,
	[CreatedBy]							UNIQUEIDENTIFIER	NULL,
	[CreatedDate]						DATETIME			NULL,
	[ModifiedBy]						UNIQUEIDENTIFIER	NULL,
	[ModifiedDate]						DATETIME			NULL,
    [Picture] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_Contract_RecurringPaymentRule] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_Contract_RecurringPaymentRule] FOREIGN KEY ([Contract_Id]) REFERENCES [Contract]([Id]), 
    CONSTRAINT [FK_Contract_RecurringPaymentRule_Type] FOREIGN KEY ([Contract_RecurrenceType_Id]) REFERENCES [Contract_RecurrenceType]([Id]), 
    CONSTRAINT [FK_Contract_RecurringPaymentRule_CustomerPaymentOption] FOREIGN KEY ([Customer_PaymentOption_Id]) REFERENCES [Customer_PaymentOption]([Id]) 
)
