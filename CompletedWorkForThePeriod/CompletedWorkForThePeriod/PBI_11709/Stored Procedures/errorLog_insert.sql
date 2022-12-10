-- =============================================
-- Author: TeploukhovES
-- Create date: 22.08.2022
-- Description:	Регистрирует ошибки синхронизации отчета
-- =============================================
CREATE PROCEDURE [pbi_11709].[errorLog_insert]
AS

BEGIN
	SET NOCOUNT ON;

	INSERT INTO pbi_11709.errorLog
	(
		userName,
		errorNumber,
		errorState,
		errorSeverity,
		errorLine,
		errorProcedure,
		errorMessage,
		errorDateTime
	)
	VALUES
	(
		SUSER_SNAME(),
	    ERROR_NUMBER(),
	    ERROR_STATE(),
	    ERROR_SEVERITY(),
	    ERROR_LINE(),
	    ERROR_PROCEDURE(),
	    ERROR_MESSAGE(),
	    GETDATE()
	)
END
