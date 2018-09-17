CREATE VIEW [ml].[vFeatures]
	AS 
SELECT t.TitleId,
	   t.StartYear,
	   CASE 
		   WHEN t.StartYear < 1980 THEN 0 
		   WHEN t.StartYear >= 1980 AND t.StartYear < 1990 THEN 1
		   WHEN t.StartYear >= 1990 AND t.StartYear < 2000 THEN 2
		   WHEN t.StartYear >= 2005 AND t.StartYear < 2010 THEN 3
		   WHEN t.StartYear >= 2010 AND t.StartYear < 2012 THEN 4
		   WHEN t.StartYear >= 2012 AND t.StartYear < 2014 THEN 5
		   WHEN t.StartYear >= 2014 AND t.StartYear < 2016 THEN 6
		   WHEN t.StartYear = 2017 THEN 7
		   ELSE  8
	  END AS YearCode,
	   t.Duration,
	   t.AvgRating,
	   t.NbrVotes
FROM dbo.Title t


