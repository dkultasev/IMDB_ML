CREATE TABLE dbo.TitleCrew
(
    TitleId    CHAR(10) NOT NULL
  , NameId     CHAR(10) NOT NULL
  , CrewTypeId TINYINT  NOT NULL
  , CONSTRAINT pk_TitleId#nameId#CrewTypeId
        PRIMARY KEY (TitleId, NameId, CrewTypeId)
);
GO

ALTER TABLE dbo.TitleCrew
ADD CONSTRAINT fk_TitleCrew#CrewType
    FOREIGN KEY (CrewTypeId)
    REFERENCES dbo.CrewType (CrewTypeId);
GO