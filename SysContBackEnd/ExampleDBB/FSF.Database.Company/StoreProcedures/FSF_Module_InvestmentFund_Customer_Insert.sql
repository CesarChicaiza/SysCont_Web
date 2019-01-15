CREATE PROCEDURE [dbo].[FSF_Module_InvestmentFund_Customer_Insert]
		     @idComitente							varchar(max)
			,@nombreComitente						varchar(max)
			,@correo								varchar(max)
			,@rucComitente							varchar(max)
			,@telefono								varchar(max)
			,@companyId								varchar(max)



AS


DECLARE @id		UNIQUEIDENTIFIER	=	(select newid());

--Create customer
INSERT INTO [dbo].[Customer]
           ([Id]
           ,[LegalId]
           ,[Name1]
           ,[Customer_RelationshipType_Id]
           ,[RowStatus]
		   )
     VALUES
           (
			@id,
			@rucComitente,
			@nombreComitente,
			'82C6DEE3-1EA8-4A23-A224-002433922AB2',
			1
		   )

-- create phone and email
INSERT INTO [dbo].[Customer_ComunicationOption]	(	[Id],	[IsValid],	[Value],	[CommunicationOptionType_Id],			[Customer_Id],	[RowStatus]	)	VALUES
												(	newid(),1,			@correo,	'DBA448CE-7443-4ED9-9A5B-0AF0FD8A9464',	@id,			1			)	,
												(	newid(),1,			@telefono,	'CB81ED91-7169-4C6D-8903-3720A86B7F50',	@id,			1			)	


-- create login
DECLARE @membershipId		UNIQUEIDENTIFIER	=	(select newid());


	INSERT INTO FSF.[dbo].[Membership]	(	[Id],			[Entity_Id],							[ExternalId],	[Name],				[Username],		[Password],		[Email],	[IsApproved],	[IsLockedOut],	[RowStatus]	) VALUES
									(	@membershipId, '6A3A34A8-3178-4CB6-9CBC-0F1D4C3CFDF3',		@id,			@nombreComitente,	@rucComitente,	@rucComitente,	@correo,	1,				0,				1			)			
							

--

INSERT INTO [FSF].[dbo].[Membership_Company_Role]
           ([Id]
           ,[Membership_Id]
           ,[Company_Id]
           ,[Role_Id]
           ,[RowStatus]
			)
     VALUES(
			NEWID(),
			@membershipId,
			@companyId,
			'61F0223F-631C-4825-AF3E-0D0E3D0C3279',
			1

	 )



	