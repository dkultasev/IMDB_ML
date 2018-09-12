CREATE PROCEDURE dbo.pUpdateCustomReviewerTitleRating
    @CustomerReviewerName NVARCHAR(200)
  , @TitleId              CHAR(9)
  , @Rating               DECIMAL(4, 2)
AS
    BEGIN
        DECLARE @ReviewerId INT;

        SELECT @ReviewerId = cr.CustomReviewerId
          FROM dbo.CustomReviewer AS cr
         WHERE cr.CustomReviewerName = @CustomerReviewerName;

        IF (@ReviewerId IS NULL)
            BEGIN
                RAISERROR(
                    15600
                  , -1
                  , -1
                  , 'Exception in [dbo].[pUpdateCustomReviewerTitleRating]: Custom reviewer is not found.');
            END;
		IF (COALESCE(@Rating,0) = 0)
		BEGIN
			DELETE FROM dbo.UserTitleRating WHERE TitleId = @TitleId AND CustomReviewerId = @ReviewerId;
		END
		ELSE
		BEGIN
			UPDATE dbo.UserTitleRating
			   SET Rating = @Rating
			 WHERE TitleId = @TitleId AND CustomReviewerId = @ReviewerId;
		END
        SELECT @@ROWCOUNT AS rows_updated;
    END;