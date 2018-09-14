CREATE TABLE dbo.Genre
(
    GenreId   TINYINT      IDENTITY(1, 1) NOT NULL
  , GenreName VARCHAR(200) NOT NULL
  , CONSTRAINT pk_GenreId
        PRIMARY KEY (GenreId)
)
GO