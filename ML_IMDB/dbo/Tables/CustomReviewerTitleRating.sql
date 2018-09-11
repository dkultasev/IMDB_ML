CREATE TABLE dbo.UserTitleRating
(
    CustomReviewerId   INT   NOT NULL
  , TitleId CHAR(9) NOT NULL
  , Rating DECIMAL(4,2) NOT NULL
  , RatingDtime DATETIME2(7) NOT NULL DEFAULT SYSDATETIME()
  , CONSTRAINT pk_UserId#TitleId
        PRIMARY KEY (CustomReviewerId, TitleId)
)
GO

ALTER TABLE dbo.UserTitleRating
ADD CONSTRAINT fk_UserTitleRating#User#UserId
    FOREIGN KEY (CustomReviewerId)
    REFERENCES dbo.CustomReviewer (CustomReviewerId);
GO