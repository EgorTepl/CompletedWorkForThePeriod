DECLARE @pbiSchemaName nvarchar(9) = (SELECT s.pbiSchemaName FROM pbi_11709.projectSchema AS s)

IF EXISTS (SELECT 1 FROM sys.schemas WHERE name = @pbiSchemaName)
BEGIN
	PRINT N'Inserting database objects...';

	TRUNCATE TABLE pbi_11709.dbObject;

	INSERT pbi_11709.dbObject
	(
		objectId,
		objectName,
		schemaName,
		objectType,
		primaryKeyColumnName,
		primaryKeyName,
		objectTypeNumber
	)
	SELECT
		obj.object_id AS objectId,
		obj.name AS objectName,
		SCHEMA_NAME(obj.schema_id) AS schemaName,
		obj.type AS objectType,
		primKeyCol.COLUMN_NAME AS primaryKeyColumnName,
		primKey.name AS primaryKeyName,
		CASE obj.type
			WHEN N'P' THEN 0
			WHEN N'V' THEN 1
			WHEN N'U' THEN 2
			WHEN N'PK' THEN 3
		END AS objectTypeNumber
	FROM sys.objects AS obj
	LEFT JOIN
	(
		SELECT
			ck.TABLE_SCHEMA,
			ck.TABLE_NAME,
			ck.COLUMN_NAME
		FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE AS ck
		WHERE OBJECTPROPERTY(OBJECT_ID(CONSTRAINT_SCHEMA + '.' + QUOTENAME(CONSTRAINT_NAME)), N'IsPrimaryKey') = 1
	) AS primKeyCol
		ON obj.object_id = OBJECT_ID(primKeyCol.TABLE_SCHEMA + '.' + primKeyCol.TABLE_NAME)
	LEFT JOIN sys.objects AS primKey
		ON obj.object_id = primKey.parent_object_id
	WHERE
		 (obj.schema_id = SCHEMA_ID(@pbiSchemaName))

	UNION ALL

	SELECT
		t.user_type_id AS objectId,
		t.name AS objectName,
		SCHEMA_NAME(t.schema_id) AS schemaName,	
		TYPE_NAME(t.system_type_id)  AS objectType,
		NULL AS primaryKeyColumn,
		NULL AS primaryKeyName,
		CASE TYPE_NAME(t.system_type_id)
			WHEN N'table type' THEN 4
		END AS objectTypeNumber
	FROM sys.types AS t
	WHERE 
		t.schema_id = SCHEMA_ID(@pbiSchemaName)
END

GO
