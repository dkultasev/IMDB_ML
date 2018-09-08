CREATE TABLE dbo.TitlePersonCharacter
(
    TitleId   CHAR(10)       NOT NULL
  , PersonId  CHAR(10)       NOT NULL
  , Character NVARCHAR(1000) NOT NULL
);
GO

CREATE NONCLUSTERED INDEX ni_TitleId#PersonId
    ON dbo.TitlePersonCharacter (TitleId, PersonId)
    INCLUDE (Character);
--GO

--ALTER TABLE dbo.TitlePersonCharacter
--ADD CONSTRAINT fk_TitlePersonCharacter#Person#PersonId
--    FOREIGN KEY (PersonId)
--    REFERENCES dbo.Person (PersonId);
--GO

--ALTER TABLE dbo.TitlePersonCharacter
--ADD CONSTRAINT fk_TitlePersonCharacter#Title#TitleId
--    FOREIGN KEY (TitleId)
--    REFERENCES dbo.Title (TitleId);
--GO