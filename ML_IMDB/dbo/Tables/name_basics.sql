CREATE TABLE [dbo].[name_basics] (
    [nconst]       CHAR (10)    NOT NULL,
    [primaryName] NVARCHAR (20) NOT NULL,
    [birthYear]   SMALLINT     NULL,
    [deathYear]   SMALLINT     NULL, 
    CONSTRAINT [pk_nconst] PRIMARY KEY ([nconst])
);
GO
