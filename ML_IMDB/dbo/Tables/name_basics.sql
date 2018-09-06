CREATE TABLE [dbo].[name_basics] (
    [ncost]       CHAR (10)    NOT NULL,
    [primaryName] VARCHAR (20) NOT NULL,
    [birthYear]   SMALLINT     NULL,
    [deathYear]   SMALLINT     NULL, 
    CONSTRAINT [pk_ncost] PRIMARY KEY ([ncost])
);
GO
