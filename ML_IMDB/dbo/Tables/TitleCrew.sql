CREATE TABLE dbo.TitleCrew
(
    TitleId    CHAR(9) NOT NULL
  , PersonId     CHAR(10) NOT NULL
  , CrewTypeId TINYINT  NOT NULL
  , CONSTRAINT pk_TitleId#PersonId#CrewTypeId
        PRIMARY KEY (TitleId, PersonId, CrewTypeId)
);
GO

ALTER TABLE dbo.TitleCrew
ADD CONSTRAINT fk_TitleCrew#CrewType
    FOREIGN KEY (CrewTypeId)
    REFERENCES dbo.CrewType (CrewTypeId);
GO