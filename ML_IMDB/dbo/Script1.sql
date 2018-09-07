INSERT INTO dbo.professions (profession_name)
select distinct spl.value
from [dbo].[name_basics_tmp]
CROSS APPLY string_split(primaryProfession,',') spl;

insert into [dbo].[name_basics_professions] 
select n.nconst, p.profession_id
from dbo.[name_basics_tmp] n
CROSS APPLY string_split(n.primaryProfession,',') spl
join dbo.professions p ON p.profession_name = spl.value
;


insert into [dbo].[name_basics] ([nconst], [primaryName], [birthYear], [deathYear])
select 
CAST([nconst] AS CHAR(10)), CAST([primaryName] AS VARCHAR(20)), CAST([birthYear] AS SMALLINT), CAST([deathYear] AS SMALLINT)
 from [name_basics_tmp];

 insert into [dbo].name_titles 
select CAST(n.nconst AS CHAR(10)), CAST(spl.value AS CHAR(10))
from dbo.[name_basics_tmp] n
CROSS APPLY string_split(n.knownForTitles,',') spl;



insert into dbo.title_akas
SELECT CAST([titleId] AS CHAR(10)), CAST([ordering] AS INT), CAST([title] AS NVARCHAR(200)),  CAST([region] AS VARCHAR(200)), 
CAST([language] AS VARCHAR(200)), CAST([types] AS VARCHAR(200)), CAST([attributes] AS VARCHAR(200)), CAST([isOriginalTitle] AS INT)
FROM dbo.title_akas_tmp;

insert into dbo.crew_type  VALUES (1, 'Director'), (2, 'Writer');
