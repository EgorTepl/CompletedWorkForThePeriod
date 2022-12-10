-- =============================================
-- Author: TeploukhovES
-- Create date: 06.07.2022
-- Description: Синхронизация таблиц отчета
-- =============================================
CREATE PROCEDURE [pbi_11709].[main_sync]
AS

BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		EXEC [pbi_11709].[fctJobTicket_sync]
		EXEC [pbi_11709].[fctPrintout_sync]
		EXEC [pbi_11709].[fctInventoryJournal_sync]
		EXEC [pbi_11709].[fctCompletedWorkForThePeriod_sync]
	END TRY

	BEGIN CATCH
		ROLLBACK;
		EXEC pbi_11709.[errorLog_insert];
		THROW
	END CATCH
END