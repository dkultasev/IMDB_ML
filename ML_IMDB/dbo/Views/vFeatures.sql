CREATE VIEW dbo.vFeatures
AS
    SELECT a.titleid
         , a.Title
         , a.AvgRating
         , a.Duration
         , a.StartYear
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
      FROM (   SELECT t.titleid
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
