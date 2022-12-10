/* Drop folder from Integration Serices Catalogs */
DECLARE @folderName AS nvarchar(128)

SELECT 
	@folderName = p.folderName
FROM pbi_11709.ssisProject AS p

IF EXISTS
(
	SELECT 1
	FROM SSISDB.internal.folders AS f
	WHERE f.name = @folderName
)
BEGIN
	EXEC [SSISDB].[catalog].[delete_folder] @folder_name = @folderName;
	PRINT N'Dropped Folder: ' + @folderName	
END
GO