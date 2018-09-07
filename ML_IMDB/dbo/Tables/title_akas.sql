CREATE TABLE [dbo].[title_akas] (
    [titleId]        CHAR(10) NOT NULL,
    [ordering]        smallint NOT NULL,
    [title]           NVARCHAR (200) NOT NULL,
    [region]          VARCHAR (5) NULL,
    [language]        varchar (200) NULL,
    [types]           VARCHAR (200) NULL,
    [attributes]      VARCHAR (200) NULL,
    [isOriginalTitle] tinyint NULL, 
    CONSTRAINT [pk_titleId#ordering] PRIMARY KEY ([titleId], [ordering])
);
