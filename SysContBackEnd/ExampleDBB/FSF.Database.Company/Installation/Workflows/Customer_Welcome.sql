
--INSERT INTO [dbo].[EmailTemplate]([Id],[Name],[To],[Subject],[Entity_Id],[RowStatus], [Body])
--     VALUES
--           ('66E2CF1E-92CA-43C6-81DE-30DE71C2A905',
--			'Agradecimiento Sierra',
--			'[Customer.Email]',
--			'Plan International | Agradecimiento',
--			null,
--			1,
--			'<div align="center"><h1><span style="background-color: inherit;">¡ Gracias [Customer.Name1] !</span></h1></div><p><br></p><p><img style="width: 800px;" src="http://fraggati.com/fotos/agradecimiento-sierra.jpg"><br></p>'
--           ),

--		   ('D2535B60-4D2D-4592-A646-9E7FB84134EE',
--			'Agradecimiento Costa',
--			'[Customer.Email]',
--			'Plan International | Agradecimiento',
--			null,
--			1,
--			'<div align="center"><h1><span style="background-color: inherit;">¡ Gracias [Customer.Name1] !</span></h1></div><p><br></p><p><img style="width: 800px;" src="http://fraggati.com/fotos/agradecimiento-costa.jpg"><br></p>'
--           )

		   
----------------------------------------------------------------
----------------------------------------------------------------------

--INSERT INTO [dbo].[Workflow]	(	[Id],									[Name],						[RowStatus]	)	VALUES
--								(	'7EBE49CC-C158-4F66-A600-4017C0250F50',	'Email bienvenida Sierra',	1			)	,
--								(	'7D03B596-F794-4682-8B63-18B62B2F8EE3',	'Email bienvenida Costa',	1			)	


--INSERT INTO [dbo].[Workflow_Rule]	(	[Id],									[EntityName],	[OnCreate],	[OnUpdate],	[OnDdelete],	[Workflow_Id],							[RowStatus]	)	VALUES
--									(	'CDEA8EBB-0C73-4ED1-942E-D7E0F7E92D4F',	'Customer',		1,			0,			0,				'7EBE49CC-C158-4F66-A600-4017C0250F50',	1			)	,
--									(	'20D17209-8AB2-4ADF-9C51-C7B21587B487',	'Customer',		1,			0,			0,				'7D03B596-F794-4682-8B63-18B62B2F8EE3',	1			)	

		

--INSERT INTO [dbo].[Workflow_RuleCriteria]	(	[Id],									[EntityField],	[Comparator],	[Value],								[Workflow_Rule_Id],						[RowStatus]	)	VALUES
--											--Sierra
--											(	'2F41FF95-A6B9-4D19-8396-08959F1DD73F',	'Territory_Id',	1,				'FA185052-147B-4EEB-98EF-689093221CA5',	'CDEA8EBB-0C73-4ED1-942E-D7E0F7E92D4F',	1			)	,
--											--Costa
--											(	'04AC5B7B-5FFF-49AE-8849-B502031B51B9',	'Territory_Id',	1,				'226A97E9-85DF-4230-995F-4FA35D7DE46E',	'20D17209-8AB2-4ADF-9C51-C7B21587B487',	1			)

--INSERT INTO [dbo].[Workflow_Action]	(	[Id],									[Type],	[EmailTemplate_Id],						[Order],	[Workflow_Rule_Id],						[RowStatus]	)	VALUES
--									(	'A83488DF-D72C-41E2-BB20-851221BA17CF',	1,		'66E2CF1E-92CA-43C6-81DE-30DE71C2A905',	1,			'CDEA8EBB-0C73-4ED1-942E-D7E0F7E92D4F',	1			)	,
--									(	'CE63C3D0-FFC3-4A13-A0F2-F02EB9EDEB9B',	1,		'D2535B60-4D2D-4592-A646-9E7FB84134EE',	1,			'20D17209-8AB2-4ADF-9C51-C7B21587B487',	1			)


