CREATE TABLE dbo.TitleGenre
(
	TitleId CHAR(9) NOT NULL,
	GenreId TINYINT NOT NULL
  , CONSTRAINT pk_TitleId#GenreId
        PRIMARY KEY (TitleId, GenreId)
)
GO