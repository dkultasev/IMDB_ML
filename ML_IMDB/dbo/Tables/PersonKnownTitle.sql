CREATE TABLE dbo.PersonKnownTitle
(
    PersonId CHAR(10) NOT NULL
  , TitleId  CHAR(9) NOT NULL
  , CONSTRAINT pk_PersonId#TitleId
        PRIMARY KEY (PersonId, TitleId)
);
GO

--ALTER TABLE dbo.PersonKnownTitle
--ADD CONSTRAINT fk_PersonKnownTitle#Person#PersonId
--    FOREIGN KEY (PersonId)
--    REFERENCES dbo.Person (PersonId);
--GO

--ALTER TABLE dbo.PersonKnownTitle
--ADD CONSTRAINT fk_PersonKnownTitle#Title#TitleId
--    FOREIGN KEY (TitleId)
--    REFERENCES dbo.Title (TitleId);