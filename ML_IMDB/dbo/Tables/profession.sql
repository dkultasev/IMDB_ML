CREATE TABLE dbo.Profession
(
    ProfessionId   TINYINT      IDENTITY(1, 1) NOT NULL
  , ProfessionName VARCHAR(200) NOT NULL
  , CONSTRAINT pk_ProfessionId
        PRIMARY KEY (ProfessionId)
);
GO