:SETVAR PathToImdbPublicTsvExtractFolder "C:\smf"

BULK INSERT [dbo].[Person_tmp] 
FROM '$(PathToImdbPublicTsvExtractFolder)\name.basics.tsv\data.tsv' WITH (
  ROWTERMINATOR = '0x0a'
, FIELDTERMINATOR = '	'
, FIRSTROW =2 

);  

UPDATE p
SET [primaryName] = CASE WHEN [primaryName] = '\N' THEN NULL ELSE [primaryName] END
, [birthYear] = CASE WHEN [birthYear] = '\N' THEN NULL ELSE [birthYear] END
, [deathYear] = CASE WHEN [deathYear] = '\N' THEN NULL ELSE [deathYear] END
, [primaryProfession] = CASE WHEN [primaryProfession] = '\N' THEN NULL ELSE [primaryProfession] END
, [knownForTitles] = CASE WHEN [knownForTitles] = '\N' THEN NULL ELSE [knownForTitles] END

FROM [dbo].[Person_tmp]  p;



BULK INSERT [dbo].[title_episodes_tmp] 
FROM '$(PathToImdbPublicTsvExtractFolder)\title.episode.tsv\data.tsv' WITH (
  ROWTERMINATOR = '0x0a'
, FIELDTERMINATOR = '	'
, FIRSTROW =2 

);  

UPDATE p
SET [parenttitleId] = CASE WHEN [parenttitleId] = '\N' THEN NULL ELSE [parenttitleId] END
, [seasonNumber] = CASE WHEN [seasonNumber] = '\N' THEN NULL ELSE [seasonNumber] END
, [episodeNumber] = CASE WHEN [episodeNumber] = '\N' THEN NULL ELSE [episodeNumber] END
FROM [dbo].[title_episodes_tmp]  p

------------
BULK INSERT [dbo].[title_principals_tmp] 
FROM '$(PathToImdbPublicTsvExtractFolder)\title.principals.tsv\data.tsv' WITH (
  ROWTERMINATOR = '0x0a'
, FIELDTERMINATOR = '	'
, FIRSTROW =2 

);  

UPDATE p
SET [ordering] = CASE WHEN [ordering] = '\N' THEN NULL ELSE [ordering] END
, [PersonId] = CASE WHEN [PersonId] = '\N' THEN NULL ELSE [PersonId] END
, [category] = CASE WHEN [category] = '\N' THEN NULL ELSE [category] END
, [job] = CASE WHEN [job] = '\N' THEN NULL ELSE [job] END
, [characters] = CASE WHEN [characters] = '\N' THEN NULL ELSE [characters] END
FROM [dbo].[title_principals_tmp]  p

------------

BULK INSERT [dbo].[title_ratings_tmp] 
FROM '$(PathToImdbPublicTsvExtractFolder)\title.ratings.tsv\data.tsv' WITH (
  ROWTERMINATOR = '0x0a'
, FIELDTERMINATOR = '	'
, FIRSTROW =2 

);  

UPDATE p
SET [averageRating] = CASE WHEN [averageRating] = '\N' THEN NULL ELSE [averageRating] END
, [numVotes] = CASE WHEN [numVotes] = '\N' THEN NULL ELSE [numVotes] END
FROM [dbo].[title_ratings_tmp]  p
------------

BULK INSERT [dbo].[TitleCrew_tmp] 
FROM '$(PathToImdbPublicTsvExtractFolder)\title.crew.tsv\data.tsv' WITH (
  ROWTERMINATOR = '0x0a'
, FIELDTERMINATOR = '	'
, FIRSTROW =2 

);  

UPDATE p
SET [directors] = CASE WHEN [directors] = '\N' THEN NULL ELSE [directors] END
, [writers] = CASE WHEN [writers] = '\N' THEN NULL ELSE [writers] END
FROM [dbo].[TitleCrew_tmp]  p


------------

BULK INSERT [dbo].[TitleInternational_tmp] 
FROM '$(PathToImdbPublicTsvExtractFolder)\title.akas.tsv\data.tsv' WITH (
  ROWTERMINATOR = '0x0a'
, FIELDTERMINATOR = '	'
, FIRSTROW =2 

);  

UPDATE p
SET [region] = CASE WHEN [region] = '\N' THEN NULL ELSE [region] END
, [language] = CASE WHEN [language] = '\N' THEN NULL ELSE [language] END
, [types] = CASE WHEN [types] = '\N' THEN NULL ELSE [types] END
, [attributes] = CASE WHEN [attributes] = '\N' THEN NULL ELSE [attributes] END
, [isOriginalTitle] = CASE WHEN [isOriginalTitle] = '\N' THEN NULL ELSE [isOriginalTitle] END
FROM [dbo].[TitleInternational_tmp]  p


BULK INSERT [dbo].[title_basics] 
FROM '$(PathToImdbPublicTsvExtractFolder)\title.basics.tsv\data.tsv' WITH (
  ROWTERMINATOR = '0x0a'
, FIELDTERMINATOR = '	'
, FIRSTROW =2 
);  

UPDATE tb
SET 
	titleType = CASE WHEN titleType = '\N' THEN NULL ELSE titleType END,
	primaryTitle = CASE WHEN primaryTitle = '\N' THEN NULL ELSE primaryTitle END,
	originalTitle = CASE WHEN originalTitle = '\N' THEN NULL ELSE originalTitle END,
	isAdult = CASE WHEN isAdult = '\N' THEN NULL ELSE isAdult END,
	startYear = CASE WHEN startYear = '\N' THEN NULL ELSE startYear END,
	endYear = CASE WHEN endYear = '\N' THEN NULL ELSE endYear END,
	runtimeMinutes = CASE WHEN runtimeMinutes = '\N' THEN NULL ELSE runtimeMinutes END,
	genres = CASE WHEN genres = '\N' THEN NULL ELSE genres END
FROM [dbo].[title_basics] ;

----- data normalization

INSERT INTO dbo.profession (professionname)
select distinct spl.value
from [dbo].[Person_tmp]
CROSS APPLY string_split(primaryProfession,',') spl;


insert into [dbo].[Person] ([PersonId], [primaryName], [birthYear], [deathYear])
select 
CAST([PersonId] AS CHAR(10)), CAST([primaryName] AS VARCHAR(20)), CAST([birthYear] AS SMALLINT), CAST([deathYear] AS SMALLINT)
 from [Person_tmp];

 insert into [dbo].[PersonProfession] 
select n.PersonId, p.professionId
from dbo.[Person_tmp] n
CROSS APPLY string_split(n.primaryProfession,',') spl
join dbo.profession p ON p.professionname = spl.value
;

insert into title
(  TitleId  
 , Title    
 , Region   
 , Language 
 )
select
[titleId]   
,[title]     
,[region]    
,[language] 
From(
select 
CAST([titleId]    AS CHAR(9))		  [titleId]   
,CAST([title]  AS NVARCHAR(200))   	  [title]     
,CAST([region]    AS VARCHAR(5))	  [region]    
,CAST([language]  AS VARCHAR(200))	  [language] 
,row_number() over (partition by [titleId] order by [titleId], isOriginalTitle desc) as rn

 
from [TitleInternational_tmp]

) a where rn = 1;

insert into dbo.TitleInternational
(
  titleId        
, ordering       
, title          
, region         
, language       
, types          
, isOriginalTitle
)


select 
CAST([titleId]    AS CHAR(9))		  [titleId]   
,CAST(ordering    AS int)		  [titleId]   
,CAST([title]  AS NVARCHAR(200))   	  [title]     
,CAST([region]    AS VARCHAR(5))	  [region]    
,CAST([language]  AS VARCHAR(200))	  [language] 
,CAST(types  AS VARCHAR(20))	  [language] 
, CAST(isOriginalTitle AS BIT)
 
from [TitleInternational_tmp];

insert into [dbo].PersonKnownTitle 
select CAST(n.PersonId AS CHAR(10)), CAST(spl.value AS CHAR(9))
from dbo.[Person_tmp] n
CROSS APPLY string_split(n.knownForTitles,',') spl;

INSERT into dbo.CrewType (CrewType)  VALUES ('Director'), ('Writer');

insert into [dbo].[TitleEpisode]
select 
titleid,	parenttitleid,	COALESCE(seasonNumber,0), COALESCE(episodeNumber,0)
from [title_episodes_tmp]
;

insert into [Category] (categoryname) select distinct category from [title_principals_tmp];

INSERT into [TitlePerson]
select CAST(t.titleid AS CHAR(9)), t.ordering, CAST(t.personid AS CHAR(10)), c.categoryid, CAST(t.job AS VARCHAR(200)) from [title_principals_tmp] t
left join category c on c.categoryname = t.category;


insert into [dbo].[TitlePersonCharacter]
select CAST(titleid AS CHAR(9)), CAST(personid AS CHAR(10)),  REPLACE(REPLACE(spl.value,'["',''),'"]','') from [title_principals_tmp] t
cross apply string_split(REPLACE(t.characters,'","','?'),'?') spl
WHERE t.characters is not NULL;


UPDATE t
SET t.AvgRating = [averageRating], NbrVotes = [numVotes]
FROM Title t
JOIN title_ratings_tmp tm ON tm.[titleId] = t.[titleId];



insert into titlecrew 
select titleid, spl.value, ct.CrewTypeId
from titlecrew_tmp t
CROSS APPLY string_split(t.directors,',') spl
CROSS JOIN CrewType ct 
WHERE t.directors IS NOT NULL
AND ct.CrewType = 'Director'



insert into titlecrew 
select titleid, spl.value, ct.CrewTypeId
from titlecrew_tmp t
CROSS APPLY string_split(t.writers,',') spl
CROSS JOIN CrewType ct 
WHERE t.writers IS NOT NULL
AND ct.CrewType = 'Writer';

UPDATE t
SET 
    TitleType  = CAST(tb.titleType AS VARCHAR(20))
  , StartYear = CAST(tb.startYear AS SMALLINT)
  , EndYear  = CAST(tb.endYear AS SMALLINT)
  , Duration = CAST(tb.runtimeMinutes AS INT)
FROM dbo.Title t
JOIN [dbo].[title_basics] tb ON t.TitleId = tb.tconst;


insert into Genre (GenreName)
select DISTINCT spl.value
from [title_basics] t
CROSS APPLY string_split(t.genres,',') spl;


insert into [dbo].TitleGenre 
select CAST(n.tconst AS CHAR(9)), g.GenreId
from dbo.[title_basics] n
CROSS APPLY string_split(n.genres,',') spl
JOIN dbo.genre g ON CAST(spl.value AS VARCHAR(200)) = g.GenreName