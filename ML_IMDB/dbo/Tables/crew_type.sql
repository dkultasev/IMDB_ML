create table dbo.crew_type 
(
  crew_type_id TINYINT NOT NULL,
  crew_type VARCHAR(200) NOT NULL, 
    CONSTRAINT [pk_crew_type_id] PRIMARY KEY (crew_type_id)
)
GO