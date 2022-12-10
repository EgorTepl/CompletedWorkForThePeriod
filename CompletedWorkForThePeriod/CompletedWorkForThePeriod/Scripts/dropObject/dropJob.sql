USE [msdb]
GO
/****** Object:  Job [test]    Script Date: 8/29/2022 4:24:45 PM ******/

DECLARE @jobName nvarchar(100) = N'pbi_11709.comletedWorkForThePeriod_sync'

IF EXISTS (SELECT 1 FROM msdb.dbo.sysjobs WHERE name = @jobName)
BEGIN
	EXEC msdb.dbo.sp_delete_job @job_name = @jobName, @delete_unused_schedule = 1
	PRINT N'Dropped job ' + @jobName
END
ELSE
BEGIN
	PRINT N'Не удалось удалить джоб ' + @jobName + N' поскольку его не существует'
END

GO
