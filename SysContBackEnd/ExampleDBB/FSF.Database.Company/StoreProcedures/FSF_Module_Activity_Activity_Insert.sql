CREATE PROCEDURE [FSF_Module_Activity_Activity_Insert]
		    
			@Id						nvarchar(max)
		   ,@Subject				nvarchar(max)
           ,@ScheduleDateFrom		nvarchar(max)
		   ,@ScheduleDateTo			nvarchar(max)
           ,@RealDateFrom			nvarchar(max)
		   ,@RealDateTo				nvarchar(max)
           ,@Place					nvarchar(max)
           ,@Status					int
           ,@Priority				int
           ,@Activity_Type_Id		nvarchar(max)
           ,@Activity_PlaceType_Id  nvarchar(max)
           ,@Entity_Id				nvarchar(max)
           ,@ExternalId				nvarchar(max)
           ,@Comments				nvarchar(max)
           ,@RowStatus				int
           ,@AssignedTo				varchar(max)
           ,@CreatedBy				varchar(max)
           ,@CreatedDate			varchar(max)


AS


INSERT INTO [dbo].[Activity]
           ([Id]
           ,[Subject]
           ,[ScheduleDateFrom]
		   ,[ScheduleDateTo]
           ,[RealDateFrom]
		   ,[RealDateTo]
           ,[Place]
           ,[Status]
           ,[Priority]
           ,[Activity_Type_Id]
           ,[Activity_PlaceType_Id]
           ,[Entity_Id]
           ,[ExternalId]
           ,[Comments]
           ,[RowStatus]
           ,[AssignedTo]
           ,[CreatedBy]
           ,[CreatedDate]
           
		   )
     VALUES
           (
		   	@Id						
		   ,@Subject				
           ,@ScheduleDateFrom
		   ,@ScheduleDateTo
           ,@RealDateFrom
		   ,@RealDateTo			
           ,@Place					
           ,@Status					
           ,@Priority				
           ,@Activity_Type_Id		
           ,@Activity_PlaceType_Id  
           ,@Entity_Id				
           ,@ExternalId				
           ,@Comments				
           ,@RowStatus				
           ,@AssignedTo				
           ,@CreatedBy				
           ,@CreatedDate			

		   
		   
		   )