CREATE TABLE dbo.CrewType
(
    CrewTypeId TINYINT      IDENTITY(1, 1) NOT NULL
  , CrewType   VARCHAR(200) NOT NULL
  , CONSTRAINT pk_CrewTypeId
        PRIMARY KEY (CrewTypeId)
);
GO