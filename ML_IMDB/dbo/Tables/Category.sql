CREATE TABLE dbo.Category
(
    CategoryId   TINYINT      IDENTITY(1, 1) NOT NULL
  , CategoryName VARCHAR(200) NOT NULL
  , CONSTRAINT pk_CategoryId
        PRIMARY KEY (CategoryId)
);
GO