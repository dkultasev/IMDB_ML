CREATE TABLE [dbo].[name_basics_professions] (
    [nconst]         CHAR (10) NOT NULL,
    [profession_id] INT       NOT NULL, 
    CONSTRAINT [pk_nconst#profession_id] PRIMARY KEY ([nconst], [profession_id])
);
GO
ALTER TABLE dbo.[name_basics_professions]     
ADD CONSTRAINT fk_ame_basics_professions#name_basics#nconst FOREIGN KEY (nconst)     
    REFERENCES dbo.name_basics (nconst)     
; 
GO

ALTER TABLE dbo.[name_basics_professions]     
ADD CONSTRAINT fk_ame_basics_professions#professions#profession_id FOREIGN KEY (profession_id)     
    REFERENCES dbo.professions (profession_id)     
; 