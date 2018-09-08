CREATE TABLE dbo.TitlePerson
(
    TitleId    CHAR(10)     NOT NULL
  , Ordering   TINYINT      NOT NULL
  , PersonId   CHAR(10)     NOT NULL
  , CategoryId TINYINT      NOT NULL
  , Job        VARCHAR(200) NULL
  , CONSTRAINT pk_TitleId#Ordering#PersonId
        PRIMARY KEY (TitleId, Ordering, PersonId)
);
GO

--ALTER TABLE dbo.TitlePerson
--ADD CONSTRAINT fk_TitlePerson#Title#TitleId
--    FOREIGN KEY (TitleId)
--    REFERENCES dbo.Title (TitleId);
--GO

--ALTER TABLE dbo.TitlePerson
--ADD CONSTRAINT fk_TitlePerson#Person#PersonId
--    FOREIGN KEY (PersonId)
--    REFERENCES dbo.Person (PersonId);