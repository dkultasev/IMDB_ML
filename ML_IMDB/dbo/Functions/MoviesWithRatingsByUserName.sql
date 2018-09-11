CREATE FUNCTION dbo.MoviesWithRatingsByUserName
(
    @CustomerReviewerName NVARCHAR(200)
)
RETURNS TABLE
AS
    RETURN (
               SELECT      t.TitleId
                         , Title
                         , AvgRating
                         , NbrVotes
                         , cr.CustomReviewerId
                         , utr.Rating
                 FROM      title              AS t
                 LEFT JOIN dbo.CustomReviewer AS cr ON cr.CustomReviewerName = @CustomerReviewerName
                 LEFT JOIN UserTitleRating    AS utr ON utr.TitleId          = t.TitleId
                                                    AND utr.CustomReviewerId = cr.CustomReviewerId);
