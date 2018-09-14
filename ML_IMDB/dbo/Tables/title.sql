CREATE TABLE dbo.Title
(
    TitleId   CHAR(9)		NOT NULL
  , Title     NVARCHAR(200) NOT NULL
  , TitleType VARCHAR(20)	NOT NULL
  , StartYear SMALLINT		NULL
  , EndYear   SMALLINT		NULL
  , Duration  INT		NULL
  , Region    VARCHAR(5)    NULL
  , Language  VARCHAR(200)  NULL
  , AvgRating DECIMAL(4, 2) NULL
  , NbrVotes  INT           NULL
  , CONSTRAINT pk_titleId
        PRIMARY KEY (TitleId)
);
