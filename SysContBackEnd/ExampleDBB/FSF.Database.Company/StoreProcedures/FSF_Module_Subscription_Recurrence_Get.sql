CREATE PROCEDURE [dbo].[FSF_Module_Subscription_Recurrence_Get]

	@id	nvarchar(max)

AS


SELECT * 
FROM [Subscription_Recurrence]
WHERE [Id] = @id