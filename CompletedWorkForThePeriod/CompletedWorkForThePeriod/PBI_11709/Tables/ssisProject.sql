CREATE TABLE [pbi_11709].[ssisProject]
(
	recId INT IDENTITY(1,1) NOT NULL,
	folderName NVARCHAR(128) NOT NULL,
	environmentName NVARCHAR(128) NOT NULL,
	projectName NVARCHAR(128) NOT NULL,
	CONSTRAINT [pk_ssisProject_recId] PRIMARY KEY CLUSTERED ([recId] ASC)
)
