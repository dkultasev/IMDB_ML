create table dbo.name_titles
(
	nconst CHAR(10),
	titleId CHAR(10), 
    CONSTRAINT [pk_nconst#title_id] PRIMARY KEY ([nconst], titleId)
);
GO
ALTER TABLE dbo.name_titles     
ADD CONSTRAINT fk_name_titles#name_basics#nconst FOREIGN KEY (nconst)     
    REFERENCES dbo.name_basics (nconst)     
;   
