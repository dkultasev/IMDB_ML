CREATE TABLE dbo.Person
(
    PersonId    CHAR(10)     NOT NULL
  , PrimaryName NVARCHAR(20) NOT NULL
  , BirthYear   SMALLINT     NULL
  , DeathYear   SMALLINT     NULL
  , CONSTRAINT pk_PersonId
        PRIMARY KEY (PersonId)
);
GO