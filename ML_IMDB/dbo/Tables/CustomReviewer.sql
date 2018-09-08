CREATE TABLE [dbo].[CustomReviewer]
(
    CustomReviewerId   INT      IDENTITY(1, 1) NOT NULL
  , CustomReviewerName NVARCHAR(200) NOT NULL
  , CONSTRAINT pk_OtherUserId
        PRIMARY KEY (CustomReviewerId) 
)
GO