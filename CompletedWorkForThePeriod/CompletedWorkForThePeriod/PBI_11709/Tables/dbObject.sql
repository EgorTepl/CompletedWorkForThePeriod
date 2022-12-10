CREATE TABLE [pbi_11709].[dbObject]
(
	objectId INT NOT NULL,
	objectName NVARCHAR(255) NOT NULL,
	schemaName NVARCHAR(13) NOT NULL,
	objectType NVARCHAR(15) NOT NULL,
	primaryKeyColumnName NVARCHAR(255) NULL,
	primaryKeyName NVARCHAR(255) NULL,
	objectTypeNumber TINYINT NOT NULL,
	CONSTRAINT [pk_dbObject_errorId] PRIMARY KEY CLUSTERED ([objectId])
)
