

----Data de prueba
											



INSERT INTO [dbo].[Campaign]	(	[Id],									[Name],					[FromDate],		[ToDate],		[Campaign_Type_Id],						[RowStatus]	)	VALUES
								(	'EF65BD65-1FFF-42FD-860D-08D5065B13FC',	'Niño Ecuador',			'2015-01-01',	'2016-01-01',	'493B1504-D984-4C6C-BAA9-C5E62151A919',	1			)	,
								(	'F87F4788-D0B8-43A0-9065-10AC95245255',	'Sociedad responsable',	'2017-03-22',	'2017-04-27',	'376E17DC-AE2C-4360-A47B-08E6E7B97A01',	1			)	


				

insert INTO [Employee]	(	[Id],										[Name]					, [RowStatus]) values
						(	'2CF61D35-0C86-496D-8A59-EFD8BDF11E3E',		'Juan Carlos Cadena'	,	1)



INSERT INTO		[Customer]	(	[Id],									[Parent_Id],	[LegalId],		[Number],	[Picture],	[Salutation_Id],						[Gender_Id],							[Name1],					[Name2],	[Birth],		[DoNotCall],	[DoNotEmail],	[DoNotSMS],	[LastActivity],	[Description],	[Industry_Id],							[Customer_Type_Id],						[Customer_RelationshipType_Id],				[SourceChannel_Id],						[Campaign_Id],							[Language_Id],							[RowStatus]	)	VALUES
							(	'11DAD69C-9025-4A7A-846E-FC51EBF5B5D0',	null,			'1714325816',	'0000001',	null,		'DC109EFF-32DD-436A-9D34-0547E6161AE9',	'8B3465A4-929A-4352-860C-1B188E0FCE3C',	'Cristóbal 	Calahorrano',	'',			'1980-01-22',	0,				0,				0,			null,			'',				'846BCF78-4416-4F8D-987F-058BAE84B16E',	'75296B03-7879-45B7-8DF0-836FAB4E9E9C',	'82C6DEE3-1EA8-4A23-A224-002433922AB2',		'AAB966B0-0806-4B68-993B-1119723AB225',	'EF65BD65-1FFF-42FD-860D-08D5065B13FC',	'69E507BF-8D22-424A-BB81-2A81070F7BBC',	1			)	,
							(	'63CA59F3-EC8E-4997-ADA7-CE35E6B15880', null,			'0929202826',	'0000002',	null,		'808F0213-6EFE-4D2A-A518-0A71E620F65E',	'9D878F69-640B-4323-90BD-0164E250BD01',	'Jéssica Cabezas',			'',			'1981-05-19',	0,				0,				0,			null,			'',				'F1E056CB-55FF-48E4-9F04-2D52954D0C23',	'75296B03-7879-45B7-8DF0-836FAB4E9E9C',	'82C6DEE3-1EA8-4A23-A224-002433922AB2',		'AAB966B0-0806-4B68-993B-1119723AB225',	'F87F4788-D0B8-43A0-9065-10AC95245255',	'69E507BF-8D22-424A-BB81-2A81070F7BBC',	1			)	,
							(	'C376D161-4AEE-4FC3-A063-1461D3C8257B', null,			'0728292821',	'0000003',	null,		'808F0213-6EFE-4D2A-A518-0A71E620F65E',	'9D878F69-640B-4323-90BD-0164E250BD01',	'Leonor Bolaños',			'',			'1982-01-06',	0,				0,				0,			null,			'',				'392B827B-989B-4CD8-8061-46619BF7537D',	'04549646-6D92-4961-970E-931DF3193F74',	'AE8950D5-83C0-4721-9667-012E387FDEE1',		'52A6414A-52D9-4A8A-B492-01ABCE7CBB09',	'F87F4788-D0B8-43A0-9065-10AC95245255',	'5E91187F-505C-4F6A-A235-3E45746E6A41',	1			)
																		
INSERT INTO [dbo].[Customer_ComunicationOption]	(	[Id],										[IsValid],	[Value],			[CommunicationOptionType_Id],				[Customer_Id],	[RowStatus]	)	VALUES
												(	'77ABA290-A010-440A-BA54-519D54DCE34A',		1,			'mail1@mail.com',	'DBA448CE-7443-4ED9-9A5B-0AF0FD8A9464',		'11DAD69C-9025-4A7A-846E-FC51EBF5B5D0',		1	)	,
												(	'4F056794-C73A-4C79-8ED7-628A836400A6',		1,			'+59322344159',		'CB81ED91-7169-4C6D-8903-3720A86B7F50',		'11DAD69C-9025-4A7A-846E-FC51EBF5B5D0',		1	)	,
												(	'DD3C9FD7-C902-4F13-A595-794F7A96E65B',		1,			'paolo_aguilar',	'9B1D8BA9-56A0-47E5-B621-5A7A35EAF9CF',		'11DAD69C-9025-4A7A-846E-FC51EBF5B5D0',		1	)	,
												(	'D483AD8E-EFED-4C34-8B2B-8285DF445DE2',		1,			'faceboobk1',		'7EABD7AB-C484-4CA2-8EE5-5784CF4C7732',		'63CA59F3-EC8E-4997-ADA7-CE35E6B15880',		1	)	,
												(	'2D746B73-BA08-4527-9B72-C3FDA15375D8',		1,			'+5932829282',		'CB81ED91-7169-4C6D-8903-3720A86B7F50',		'63CA59F3-EC8E-4997-ADA7-CE35E6B15880',		1	)	,
												(	'4A57A0CD-3D98-4228-9F33-CA6C0CCD6F02',		1,			'+5932344151',		'CB81ED91-7169-4C6D-8903-3720A86B7F50',		'C376D161-4AEE-4FC3-A063-1461D3C8257B',		1	)	,
												(	'03925B12-F693-42CD-B5BE-1D4644CAE56A',		1,			'+5930999072312',	'B6C7C555-A896-4DB4-B338-504E2D9FF2A4',		'C376D161-4AEE-4FC3-A063-1461D3C8257B',		1	)	

	
INSERT INTO [dbo].[Customer_Address]	(	[Id],									[Line1],		[Line2],	[Number],	[PostalCode],	[Reference],			[Latitude],	[Longitude],	[City_Id],								[AddressType_Id],						[Customer_Id],							[RowStatus]	)	VALUES
										(	'508A1A38-0F11-45DF-8282-96834A34B2DB',	'Av. Shyris',	'Rusia',	'N33-99',	'20282',		'Parque La Carolina',	1,			1,				'95BB7258-8A03-4510-9E01-139C86D4700A',	'CDB8B4A3-8F37-450C-B273-24AA22B43FC8',	'11DAD69C-9025-4A7A-846E-FC51EBF5B5D0',	1			)

						
								
INSERT INTO	[Customer_Contact]	(	[Id],									[LegalId],		[Picture],	[Salutation_Id],						[Gender_Id],							[FirstName],	[LastName],		[Birth],		[DoNotCall],	[DoNotEmail],	[DoNotSMS],	[LastActivity],	[Description],	[SourceChannel_Id],						[Language_Id],							[RowStatus]	)	VALUES
								(	'645CF2CE-5773-4027-B94A-8CD6FEF6376E',	'1792263875',	null,		'DC109EFF-32DD-436A-9D34-0547E6161AE9',	'8B3465A4-929A-4352-860C-1B188E0FCE3C',	'José',			'Feliciano',	'1990-07-19',	0,				0,				0,			null,			'',				'AAB966B0-0806-4B68-993B-1119723AB225',	'69E507BF-8D22-424A-BB81-2A81070F7BBC',	1			)

								
																		
INSERT INTO [dbo].[Customer_Contact_ComunicationOption]	(	[Id],										[IsValid],	[Value],						[CommunicationOptionType_Id],				[Customer_Contact_Id],						[RowStatus]	)	VALUES
														(	'EAFD95EA-32B8-4212-8F57-1B34EBB342CB',		1,			'mail1@planinternacional.com',	'DBA448CE-7443-4ED9-9A5B-0AF0FD8A9464',		'645CF2CE-5773-4027-B94A-8CD6FEF6376E',		1			)	,
														(	'882846A7-4401-4FF1-AB8D-674801A0D8DB',		1,			'+5939228291',					'CB81ED91-7169-4C6D-8903-3720A86B7F50',		'645CF2CE-5773-4027-B94A-8CD6FEF6376E',		1			)	,
														(	'A91309C9-625E-4E6D-B889-797235B9D5B6',		1,			'+5930997754091',				'B6C7C555-A896-4DB4-B338-504E2D9FF2A4',		'645CF2CE-5773-4027-B94A-8CD6FEF6376E',		1			)	



INSERT INTO [dbo].[Customer_Contact_Address]	(	[Id],									[Line1],		[Line2],	[Number],	[PostalCode],	[Reference],			[Latitude],	[Longitude],	[City_Id],								[AddressType_Id],						[Customer_Contact_Id],					[RowStatus]	)	VALUES
												(	'508A1A38-0F11-45DF-8282-96834A34B2DB',	'Av. Shyris',	'Rusia',	'N33-99',	'20282',		'Parque La Carolina',	1,			1,				'95BB7258-8A03-4510-9E01-139C86D4700A',	'CDB8B4A3-8F37-450C-B273-24AA22B43FC8',	'645CF2CE-5773-4027-B94A-8CD6FEF6376E',	1			)

	

INSERT INTO [dbo].[Customer_CustomerContact]	(	[Id],										[OfficeDepartment],	[JobTitle],	[Influencer],	[DecisionMaker],	[Start],		[End],	[RelationshipRate],	[Customer_Id],							[Customer_Contact_Id],					[RowStatus]	)	VALUES
												(	'9269D3D1-82AD-467E-898C-8E029582F1D8',		'',					'',			0,				0,					'2017-02-24',	null,	5,					'C376D161-4AEE-4FC3-A063-1461D3C8257B',	'645CF2CE-5773-4027-B94A-8CD6FEF6376E',	1			)


--PAYMENT




INSERT INTO [dbo].[Payment_Method]	(	[Id],									[Owner],		[Number],				[ExpirationDate],	[Payment_AcquirerCompany_Id],			[Payment_Type_Id],						[Customer_Id],								[RowStatus]		)	VALUES
									(	'4884F4DB-C615-4B7E-B2A0-ADE86F0F8420',	'Juan Pérez',	'4219456776598787',		'2018-02-01',		'CCFA8ADC-0081-4F3F-BFE3-8E1D7599F734',	'CCFA8ADC-0081-4F3F-BFE3-8E1D7599F734',	'C376D161-4AEE-4FC3-A063-1461D3C8257B',		1				)		


--SUBSCRIPTION
INSERT INTO [dbo].[Subscription_Recurrence]	    (	[Id],										[Name],				[Months],	[RowStatus]	)	VALUES
												(	'5E8E9C0B-B0BB-4BB9-90DE-23FA7A7C6436',		'Mensual',			1,			1			)	,
												(	'360CD385-8B39-46F4-A7CD-413F6579B568',		'Trimestral',		3,			1			)	,
												(	'4F895E24-D7B2-4BEA-93D7-434CF6AAE1B3',		'Semestral',		6,			1			)	,
												(	'CAC1A1FD-ED10-4963-8CD3-6669EDF6057D',		'Anual',			12,			1			)	,
												(	'EF53E3C2-233A-4D96-9EAA-BBE6B63D2919',		'Personalizado',	0,			1			)	


												

INSERT INTO [dbo].[Subscription]	(	[Id],									[Amount],	[Start],		[End],				[Comments],	[Subscription_Recurrence_Id],			[Payment_Method_Id],					[Subscription_DesactivatedReason_Id],	[RowStatus]	)	VALUES
									(	'FB335032-36F9-4B31-838B-04084F4C0A6B',	50,			'2017-03-01',	'2017-07-01',		'',			'5E8E9C0B-B0BB-4BB9-90DE-23FA7A7C6436',	'4884F4DB-C615-4B7E-B2A0-ADE86F0F8420',	null,									1			)

INSERT INTO [dbo].[Subscription_MoneyCollect]	(	[Id],									[Date],			[CanCollect],	[CollectBankStatus],	[CollectBankStatusDetail],	[Retries],	[Subscription_Id],						[RowStatus]	)	VALUES
												(	'8A014BBB-3EEE-4436-8425-CE4664DF2D01',	'2017-03-01',	1,				'DEBITADO',				'',							1,			'FB335032-36F9-4B31-838B-04084F4C0A6B',	1			)	,
												(	'5CE8E1C0-B0CE-4472-AF17-F5577ACF132F',	'2017-04-01',	1,				'NO DEBITADO',			'Tarjeta caducada',			3,			'FB335032-36F9-4B31-838B-04084F4C0A6B',	1			)	,
												(	'31E58A6C-EDE7-425C-BDD1-12B62289D196',	'2017-05-01',	1,				'DEBITADO',				'',							1,			'FB335032-36F9-4B31-838B-04084F4C0A6B',	1			)	
