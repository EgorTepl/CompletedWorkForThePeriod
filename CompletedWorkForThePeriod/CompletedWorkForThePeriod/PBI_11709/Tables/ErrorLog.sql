CREATE TABLE [pbi_11709].[errorLog]
(
    [errorId] INT IDENTITY(1, 1) NOT NULL,
    [userName] NVARCHAR(150),
    [errorNumber] INT,
    [errorState] INT,
    [errorSeverity] INT,
    [errorLine] INT,
    [errorProcedure] NVARCHAR(MAX),
    [errorMessage]   NVARCHAR(MAX),
    [errorDateTime]  DATETIME2(0)
    CONSTRAINT [pk_errorLog_errorId] PRIMARY KEY CLUSTERED ([errorId])
)
