CREATE VIEW [ml].[vFeatures]
	AS 
   SELECT a.titleid
         , a.Title
         , a.AvgRating
         , a.Duration
         , a.StartYear
		,  CASE 
			  WHEN a.StartYear < 1980 THEN 0 
			  WHEN a.StartYear >= 1980 AND a.StartYear < 1990 THEN 1
			  WHEN a.StartYear >= 1990 AND a.StartYear < 2000 THEN 2
			  WHEN a.StartYear >= 2005 AND a.StartYear < 2010 THEN 3
			  WHEN a.StartYear >= 2010 AND a.StartYear < 2012 THEN 4
			  WHEN a.StartYear >= 2012 AND a.StartYear < 2014 THEN 5
			  WHEN a.StartYear >= 2014 AND a.StartYear < 2016 THEN 6
			  WHEN a.StartYear = 2017 THEN 7
			  ELSE  8
		  END AS YearCode
         , a.Western
         , a.War
         , a.Thriller
         , a.[Talk-Show]
         , a.Sport
         , a.Short
         , a.[Sci-Fi]
         , a.Romance
         , a.[Reality-TV]
         , a.News
         , a.Mystery
         , a.Musical
         , a.Music
         , a.Horror
         , a.History
         , a.[Game-Show]
         , a.[Film-Noir]
         , a.Fantasy
         , a.Family
         , a.Drama
         , a.Documentary
         , a.Crime
         , a.Comedy
         , a.Biography
         , a.Animation
         , a.Adventure
         , a.Adult
         , a.Action
      FROM (   SELECT t.TitleId
                    , t.Title
                    , g.GenreId
                    , g.GenreName
                    , t.AvgRating
                    , t.Duration
                    , t.StartYear
                 FROM dbo.Title      AS t
                 JOIN dbo.TitleGenre AS pkt ON pkt.TitleId = t.TitleId
                 JOIN dbo.Genre      AS g ON g.GenreId     = pkt.GenreId) AS t
      PIVOT (   COUNT(GenreId)
                  FOR GenreName IN (Action, Adult, Adventure, Animation, Biography, Comedy, Crime, Documentary, Drama
                                  , Family, Fantasy, [Film-Noir], [Game-Show], History, Horror, Music, Musical, Mystery
                                  , News, [Reality-TV], Romance, [Sci-Fi], Short, Sport, [Talk-Show], Thriller, War
                                  , Western)) AS a;
	



