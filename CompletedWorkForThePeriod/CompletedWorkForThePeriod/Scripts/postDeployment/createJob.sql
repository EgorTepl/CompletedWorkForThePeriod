USE [msdb]
GO

DECLARE @jobName nvarchar(100) = N'pbi_11709.comletedWorkForThePeriod_sync'
DECLARE @referenceId nvarchar(MAX)
DECLARE @environmentName sysname = (SELECT p.environmentName FROM [$(DB_TARGET_NAME)].pbi_11709.ssisProject AS p)
DECLARE @ssisCommand nvarchar(MAX)

SELECT
	@referenceId = eref.reference_id
FROM SSISDB.internal.environment_references AS eref
WHERE eref.environment_name = @environmentName

SET @ssisCommand = N'/ISSERVER "\"\SSISDB\Pbi_11709_CompletedWorkForThePeriod_Sync\CompletedWorkForThePeriod_Sync\ImportFromDax.dtsx\"" /SERVER "\"$(SERVER_TARGET_NAME)\"" /ENVREFERENCE ' + @referenceId + ' /Par "\"$ServerOption::LOGGING_LEVEL(Int16)\"";1 /Par "\"$ServerOption::SYNCHRONIZED(Boolean)\"";True /CALLERINFO SQLAGENT /REPORTING E'

IF EXISTS (SELECT job_id FROM msdb.dbo.sysjobs WHERE name = @jobName)
BEGIN
	PRINT N'Джоб ' + @jobName + ' уже существует...'
END

IF NOT EXISTS (SELECT job_id FROM msdb.dbo.sysjobs WHERE name = @jobName)
BEGIN
	PRINT N'Creating Job...';
	BEGIN TRANSACTION
	DECLARE @ReturnCode INT
	SELECT @ReturnCode = 0
	/****** Object:  JobCategory [[Uncategorized (Local)]]    Script Date: 8/26/2022 6:42:57 PM ******/
	IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
	BEGIN
	EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
	IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

	END

	DECLARE @jobId BINARY(16)
	EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name = @jobName, 
			@enabled=1, 
			@notify_level_eventlog=0, 
			@notify_level_email=2, 
			@notify_level_netsend=0, 
			@notify_level_page=0, 
			@delete_level=0, 
			@description=N'Синхронизация отчета "Выполненные работы за период"', 
			@category_name=N'[Uncategorized (Local)]', 
			@owner_login_name=N'sa', 
			@notify_email_operator_name = N'$(ALERT_OPERATOR_NAME)', @job_id = @jobId OUTPUT
	IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
	/****** Object:  Step [ssisSync]    Script Date: 8/26/2022 6:42:57 PM ******/
	EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'ssisSync', 
			@step_id=1, 
			@cmdexec_success_code=0, 
			@on_success_action=3, 
			@on_success_step_id=0, 
			@on_fail_action=2, 
			@on_fail_step_id=0, 
			@retry_attempts=0, 
			@retry_interval=0, 
			@os_run_priority=0, @subsystem=N'SSIS', 
			@command = @ssisCommand, 
			@database_name=N'master', 
			@flags=0, 
			@proxy_name=N'$(JOB_LAUNCHER_NAME)'
	IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
	/****** Object:  Step [mainSync]    Script Date: 8/26/2022 6:42:57 PM ******/
	EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'mainSync', 
			@step_id=2, 
			@cmdexec_success_code=0, 
			@on_success_action=1, 
			@on_success_step_id=0, 
			@on_fail_action=2, 
			@on_fail_step_id=0, 
			@retry_attempts=0, 
			@retry_interval=0, 
			@os_run_priority=0, @subsystem=N'TSQL', 
			@command=N'
	EXEC pbi_11709.main_sync', 
			@database_name=N'$(DB_TARGET_NAME)', 
			@flags=0
	IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
	EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
	IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
	EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'reportSyncSchedule', 
			@enabled=1, 
			@freq_type=4, 
			@freq_interval=1, 
			@freq_subday_type=8, 
			@freq_subday_interval=2, 
			@freq_relative_interval=0, 
			@freq_recurrence_factor=0, 
			@active_start_date=20220826, 
			@active_end_date=99991231, 
			@active_start_time=73000, 
			@active_end_time=210000, 
			@schedule_uid=N'bfba2284-4359-4951-91eb-69603df2aa2f'
	IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
	EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'$(SERVER_TARGET_NAME)'
	IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
	COMMIT TRANSACTION
	GOTO EndSave
	QuitWithRollback:
		IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
	EndSave:	
END