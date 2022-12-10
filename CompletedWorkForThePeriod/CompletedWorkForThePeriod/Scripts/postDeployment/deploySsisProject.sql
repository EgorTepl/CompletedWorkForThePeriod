/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
DECLARE @folderName AS sysname = N'Pbi_11709_CompletedWorkForThePeriod_Sync'
DECLARE @environmentName AS nvarchar(128) = N'ProjectParams'
DECLARE @projectName AS nvarchar(128) = N'CompletedWorkForThePeriod_Sync'

IF NOT EXISTS
(
    SELECT 1
    FROM pbi_11709.ssisProject AS p
    WHERE
        p.folderName = @folderName
        AND p.environmentName = @environmentName
        AND p.projectName = @projectName
)
BEGIN
	PRINT N'Inserting data into ssisProjectTable...';

    INSERT INTO pbi_11709.ssisProject
    (
        folderName,
        environmentName,
        projectName
    )
    VALUES
    (
        @folderName,
        @environmentName,
        @projectName
    )
END;

PRINT N'Creating SsisProject...';

EXEC pbi_11709.ssisProject_create
    '$(DB_SOURCE_NAME)',
    '$(DB_TARGET_NAME)',
    '$(SERVER_SOURCE_NAME)',
    '$(SERVER_TARGET_NAME)'
    
