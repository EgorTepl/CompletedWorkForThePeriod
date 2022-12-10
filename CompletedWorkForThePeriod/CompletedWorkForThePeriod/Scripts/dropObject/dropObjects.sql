USE $(DB_TARGET_NAME)
GO

:setvar PBI_SCHEMA_NAME 'pbi_11709'

BEGIN TRANSACTION
	:r .\dropJob.sql
	:r .\dropSsisProject.sql
	:r .\dropDbObject.sql
	:r .\dropSchemas.sql
IF @@ERROR = 0
	COMMIT
ELSE
	ROLLBACK