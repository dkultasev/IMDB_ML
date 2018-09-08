CREATE TABLE dbo.PersonTitle
(
    PersonId CHAR(10) NOT NULL
  , TitleId  CHAR(10) NOT NULL
  , CONSTRAINT pk_PersonId#TitleId
        PRIMARY KEY (PersonId, TitleId)
);
GO

ALTER TABLE dbo.PersonTitle
ADD CONSTRAINT fk_PersonTitle#Person#PersonId
    FOREIGN KEY (PersonId)
    REFERENCES dbo.Person (PersonId);
GO

ALTER TABLE dbo.PersonTitle
ADD CONSTRAINT fk_PersonTitle#Title#TitleId
    FOREIGN KEY (TitleId)
    REFERENCES dbo.Title (TitleId);
