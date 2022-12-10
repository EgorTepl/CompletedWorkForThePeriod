DECLARE @pbiSchemaName nvarchar(9) = N'pbi_11709'

IF NOT EXISTS
(
    SELECT 1
    FROM pbi_11709.projectSchema AS s
    WHERE
        s.pbiSchemaName = @pbiSchemaName
)
BEGIN
	PRINT N'Inserting data into projectSchemaTable...';

    INSERT INTO pbi_11709.projectSchema
    (
        pbiSchemaName
    )
    VALUES
    (
        @pbiSchemaName
    )
END

GO