CREATE TABLE [dbo].[name_basics_professions] (
    [ncost]         CHAR (10) NOT NULL,
    [profession_id] INT       NOT NULL, 
    CONSTRAINT [pk_ncost#profession_id] PRIMARY KEY ([ncost], [profession_id])
);
GO
