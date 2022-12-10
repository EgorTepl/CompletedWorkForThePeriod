/* Drop deployment from Integration Serices Catalogs */

DECLARE @projectName AS nvarchar(128)
DECLARE @folderName AS nvarchar(128)

SELECT 
	@folderName = p.folderName
FROM pbi_11709.ssisProject AS p

SELECT @projectName = 
(
    SELECT
	    TOP 1 p.name
    FROM [SSISDB].[internal].[projects] AS p
    INNER JOIN SSISDB.internal.folders AS f
	    ON p.folder_id = f.folder_id
    WHERE f.name = @folderName
)
WHILE @projectName IS NOT NULL
BEGIN
    EXEC [SSISDB].[catalog].[delete_project] @project_name = @projectName, @folder_name = @folderName;
    PRINT N'Dropped Deployment: ' + @projectName
    SELECT @projectName = 
    (
        SELECT 
	        TOP 1 p.name
        FROM [SSISDB].[internal].[projects] AS p
        INNER JOIN SSISDB.internal.folders AS f
	        ON p.folder_id = f.folder_id
        WHERE f.name = @folderName
    )
END
GO