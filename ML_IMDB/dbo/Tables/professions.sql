CREATE TABLE [dbo].[professions] (
    [profession_id]   INT           IDENTITY (1, 1) NOT NULL,
    [profession_name] VARCHAR (200) NOT NULL, 
    CONSTRAINT [pk_profession_id] PRIMARY KEY ([profession_id])
);
GO
