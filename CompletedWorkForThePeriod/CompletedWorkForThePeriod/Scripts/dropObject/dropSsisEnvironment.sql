/* Drop environments from Integration Serices Catalogs */
GO
DECLARE @environmentName AS nvarchar(128)
DECLARE @folderName AS nvarchar(128)

SELECT 
	@folderName = p.folderName
FROM pbi_11709.ssisProject AS p

SELECT @environmentName = 
(
    SELECT
	    TOP 1 e.environment_name
    FROM SSISDB.internal.environments AS e
    INNER JOIN SSISDB.internal.folders AS f
	    ON e.folder_id = f.folder_id
    WHERE f.name = @folderName
)
WHILE @environmentName IS NOT NULL
BEGIN
    EXEC [SSISDB].[catalog].[delete_environment] @environment_name = @environmentName, @folder_name = @folderName;
    PRINT N'Dropped Environment: ' + @environmentName
    SELECT @environmentName = 
    (
        SELECT
	        TOP 1 e.environment_name
        FROM SSISDB.internal.environments AS e
        INNER JOIN SSISDB.internal.folders AS f
	        ON e.folder_id = f.folder_id
        WHERE f.name = @folderName
    )
END

GO