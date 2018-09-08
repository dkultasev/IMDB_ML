CREATE TABLE dbo.TitleInternational
(
    titleId         CHAR(10)      NOT NULL
  , ordering        TINYINT       NOT NULL
  , title           NVARCHAR(200) NOT NULL
  , region          VARCHAR(5)    NULL
  , language        VARCHAR(5)    NULL
  , types           VARCHAR(20)   NULL
  , isOriginalTitle BIT           NULL
  , CONSTRAINT pk_titleId#ordering
        PRIMARY KEY (titleId, ordering)
);
GO

ALTER TABLE dbo.TitleInternational
ADD CONSTRAINT fk_TitleInternational#title#PersonId
    FOREIGN KEY (titleId)
    REFERENCES dbo.title (titleId);
GO