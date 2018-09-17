CREATE VIEW [ml].[vFeatures]
	AS 
SELECT t.TitleId,
	   t.StartYear,
	   t.Duration,
	   t.AvgRating,
	   t.NbrVotes
FROM dbo.Title t


