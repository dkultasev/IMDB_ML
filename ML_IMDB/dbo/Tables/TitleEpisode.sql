CREATE TABLE dbo.TitleEpisode
(
    TitleId       CHAR(10) NOT NULL
  , ParentTitleId CHAR(10) NOT NULL
  , SeasonNbr     INT      NOT NULL
  , EpisodeNbr    INT      NOT NULL
  , CONSTRAINT pk_TitleId#ParentTitleId#SeasonNbr#EpisodeNbr
        PRIMARY KEY (TitleId, ParentTitleId, SeasonNbr, EpisodeNbr)
);
GO

--ALTER TABLE dbo.TitleEpisode
--ADD CONSTRAINT fk_TitleEpisode#Title#TitleId
--    FOREIGN KEY (TitleId)
--    REFERENCES dbo.Title (TitleId);
--GO

--ALTER TABLE dbo.TitleEpisode
--ADD CONSTRAINT fk_TitleEpisode#Title#ParentTitleId
--    FOREIGN KEY (ParentTitleId)
--    REFERENCES dbo.Title (TitleId);
--GO