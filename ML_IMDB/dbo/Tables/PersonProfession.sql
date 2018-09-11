CREATE TABLE dbo.PersonProfession
(
    PersonId     CHAR(9) NOT NULL
  , ProfessionId TINYINT  NOT NULL
  , CONSTRAINT pk_PersonId#ProfessionId
        PRIMARY KEY (PersonId, ProfessionId)
);
GO

ALTER TABLE dbo.PersonProfession
ADD CONSTRAINT fk_PersonProfession#Person#PersonId
    FOREIGN KEY (PersonId)
    REFERENCES dbo.Person (PersonId);
GO

ALTER TABLE dbo.PersonProfession
ADD CONSTRAINT fk_PersonProfession#Profession#ProfessionId
    FOREIGN KEY (ProfessionId)
    REFERENCES dbo.Profession (ProfessionId);