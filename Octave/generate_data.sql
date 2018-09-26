DROP TABLE #tmp
select
top 500
CAST([AvgRating]*10 as int) [AvgRating]
,[Duration]
,[YearCode]
,[Western]
,[War]
,[Thriller]
,[Talk-Show]
,[Sport]
,[Short]
,[Sci-Fi]
,[Romance]
,[Reality-TV]
,[News]
,[Mystery]
,[Musical]
,[Music]
,[Horror]
,[History]
,[Game-Show]
,[Film-Noir]
,[Fantasy]
,[Family]
,[Drama]
,[Documentary]
,[Crime]
,[Comedy]
,[Biography]
,[Animation]
,[Adventure]
,[Adult]
,[Action]
into #tmp
  from dbo.Features a
  order by newid()

  select * from #tmp

  select rating, ROW_NUMBER() over(order by rating) as k
  from (
  select distinct CAST(f.avgRating * 10 AS INT)  AS rating
  from features f
  where exists (
  select * from #tmp t where t.avgrating = CAST(f.AvgRating * 10 as int)
  )
  ) a
  order by 1