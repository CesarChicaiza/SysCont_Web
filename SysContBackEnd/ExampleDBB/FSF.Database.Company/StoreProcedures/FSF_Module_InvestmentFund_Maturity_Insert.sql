CREATE PROCEDURE [dbo].[FSF_Module_InvestmentFund_Maturity_Insert]

		@id 						UNIQUEIDENTIFIER	= null,
		@portafolio 				NVARCHAR			= null, 
   		@tivId 						NVARCHAR			= null,
		@codigo 					NVARCHAR			= null, 
		@emisor 					NVARCHAR			= null, 
		@sector 					NVARCHAR			= null, 
		@tipoRenta 					NVARCHAR			= null, 
		@tipoValor 					NVARCHAR			= null, 
		@subtipo 					NVARCHAR			= null, 
		@tipoTasa 					NVARCHAR			= null,
		@tituloTasaInteres 			DECIMAL				= null,
		@tituloPrecioSpot 			DECIMAL				= null,
		@valorEfectivo 				DECIMAL				= null,
		@valorNominalTotal 			DECIMAL				= null,
		@valorNominalUnitario 		DECIMAL				= null,
		@tituloCodigo 				NVARCHAR			= null, 
		@tituloRendimiento 			DECIMAL				= null,
		@interesAcumulado 			DECIMAL				= null,
		@tituloTasaMargen 			DECIMAL				= null,
		@tituloTasaCuponRemanente 	DECIMAL				= null,
		@monedaNombre 				NVARCHAR			= null, 
		@monedaCodigo 				NVARCHAR			= null, 
		@plazo 						NVARCHAR			= null, 
		@cupon 						BIT					= null, 
		@tipoCategoria 				NVARCHAR			= null,
		@fechaVencimiento 			DATETIME2			= null, 
		@fechaEmision 				DATETIME2			= null,
		@fechaCorte 				DATETIME2			= null, 
		@numeracion 				NVARCHAR			= null, 
		@desmaterializadoNombre 	NVARCHAR			= null,
		@diasTranscurridos 			INT					= null,
		@fechaCompra 				DATETIME2			= null,			 
		@plazoTotal 				INT					= null,
		@plazoVencer 				INT					= null,
		@fechaCapital 				DATETIME2			= null,
		@fechaInteres 				DATETIME2			= null,
		@diasAcrual 				INT					= null, 
		@fechaAcrual 				DATETIME2			= null,	
		@cantidad 					DECIMAL(18,10)		= null,
		@valor 						NVARCHAR(100)		= null,
		@calificadora 				NVARCHAR(100)		= null,
		@tipoBase 					NVARCHAR(100)		= null,
		@custodio 					NVARCHAR(100)		= null,
		@rendimientoOperacion 		DECIMAL(18,10)		= null, 
		@fechaCalificacion 			DATETIME2			= null,
		@siglasTipoValor 			NVARCHAR(100)		= null, 
		@grupoTipoValor 			NVARCHAR(100)		= null,
		@valorEfectivoCompra 		DECIMAL(18,10)		= null, 
		@precioCompra 				DECIMAL(18,10)		= null,
		@fechaVencimientoCupon 		DATETIME2			= null,
		@fechaVencimientoCapital 	DECIMAL(18,10)		= null,
		@vencimientoInteres 		DECIMAL(18,10)		= null,
		@tasaCupon 					DECIMAL(18,10)		= null,
		@codigoEmisor 				NVARCHAR(100)		= null, 
		@retencion 					NVARCHAR(100)		= null,
		@fechaVencimientoInteres 	DECIMAL(18,10)		= null,
		@numeroDeCuenta 			NVARCHAR(100)		= null,
		@banco 						NVARCHAR(100)		= null,
		@observaciones 				NVARCHAR(100)		= null,
		@total 						DECIMAL(18,10)		= null,
		@loadDate 					DATETIME			= null
AS
	
		   


		   
INSERT INTO [dbo].[InvestmentFund_Maturity]
           ([Id]
           ,[Portafolio]
           ,[TivId]
           ,[Codigo]
           ,[Emisor]
           ,[Sector]
           ,[TipoRenta]
           ,[TipoValor]
           ,[Subtipo]
           ,[TipoTasa]
           ,[TituloTasaInteres]
           ,[TituloPrecioSpot]
           ,[ValorEfectivo]
           ,[ValorNominalTotal]
           ,[ValorNominalUnitario]
           ,[TituloCodigo]
           ,[TituloRendimiento]
           ,[InteresAcumulado]
           ,[TituloTasaMargen]
           ,[TituloTasaCuponRemanente]
           ,[MonedaNombre]
           ,[MonedaCodigo]
           ,[Plazo]
           ,[Cupon]
           ,[TipoCategoria]
           ,[FechaVencimiento]
           ,[FechaEmision]
           ,[FechaCorte]
           ,[Numeracion]
           ,[DesmaterializadoNombre]
           ,[DiasTranscurridos]
           ,[FechaCompra]
           ,[PlazoTotal]
           ,[PlazoVencer]
           ,[FechaCapital]
           ,[FechaInteres]
           ,[DiasAcrual]
           ,[FechaAcrual]
           ,[Cantidad]
           ,[Valor]
           ,[Calificadora]
           ,[TipoBase]
           ,[Custodio]
           ,[RendimientoOperacion]
           ,[FechaCalificacion]
           ,[SiglasTipoValor]
           ,[GrupoTipoValor]
           ,[ValorEfectivoCompra]
           ,[PrecioCompra]
           ,[FechaVencimientoCupon]
           ,[FechaVencimientoCapital]
           ,[VencimientoInteres]
           ,[TasaCupon]
           ,[CodigoEmisor]
           ,[Retencion]
           ,[FechaVencimientoInteres]
           ,[NumeroDeCuenta]
           ,[Banco]
           ,[Observaciones]
           ,[Total]
           ,[LoadDate])
     VALUES
	 (
		@id,
		@portafolio, 
   		@tivId,
		@codigo, 
		@emisor, 
		@sector, 
		@tipoRenta, 
		@tipoValor, 
		@subtipo, 
		@tipoTasa,
		@tituloTasaInteres,
		@tituloPrecioSpot,
		@valorEfectivo,
		@valorNominalTotal,
		@valorNominalUnitario,
		@tituloCodigo, 
		@tituloRendimiento,
		@interesAcumulado,
		@tituloTasaMargen,
		@tituloTasaCuponRemanente,
		@monedaNombre, 
		@monedaCodigo, 
		@plazo, 
		@cupon, 
		@tipoCategoria,
		@fechaVencimiento, 
		@fechaEmision,
		@fechaCorte, 
		@numeracion, 
		@desmaterializadoNombre,
		@diasTranscurridos,
		@fechaCompra, 
		@plazoTotal,
		@plazoVencer,
		@fechaCapital,
		@fechaInteres,
		@diasAcrual, 
		@fechaAcrual, 
		@cantidad,
		@valor,
		@calificadora,
		@tipoBase,
		@custodio,
		@rendimientoOperacion, 
		@fechaCalificacion,
		@siglasTipoValor, 
		@grupoTipoValor,
		@valorEfectivoCompra, 
		@precioCompra,
		@fechaVencimientoCupon,
		@fechaVencimientoCapital,
		@vencimientoInteres,
		@tasaCupon,
		@codigoEmisor, 
		@retencion,
		@fechaVencimientoInteres,
		@numeroDeCuenta,
		@banco,
		@observaciones,
		@total,
		@loadDate
		)
GO

