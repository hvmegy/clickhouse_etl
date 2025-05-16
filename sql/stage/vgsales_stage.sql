DROP DATABASE IF EXISTS vgsales_stage;
CREATE DATABASE IF NOT EXISTS vgsales_stage;
USE vgsales_stage;

CREATE TABLE vgsales_stage.vgsales_raw
(
    Name String NOT NULL,
    Platform String NOT NULL,
    Year Int32 NOT NULL,
    Genre String NOT NULL,
    Publisher String NOT NULL,
    NA_Sales Float64 NOT NULL,
    EU_Sales Float64 NOT NULL,
    JP_Sales Float64 NOT NULL,
    Other_Sales Float64 NOT NULL,
)
ENGINE = MergeTree()
ORDER BY (Name);

INSERT INTO vgsales_stage.vgsales_raw
SELECT *
FROM vgsales_raw.vgsales_raw;

--- dim_country --- 

CREATE TABLE dim_country
(
    country_id Int32 NOT NULL,
    country_name String
)
ENGINE = MergeTree()
ORDER BY (country_id);

INSERT INTO dim_country (country_id, country_name)
SELECT
    rowNumberInAllBlocks() AS country_id,
    country_name
FROM
(
    SELECT arrayJoin(['NA', 'EU', 'JP', 'Other']) AS country_name
);

--- end dim_country ---

--- dim_platform ---

CREATE TABLE dim_platform
(
    platform_id Int32 NOT NULL,
    platform String
)
ENGINE = MergeTree()
ORDER BY (platform_id);

INSERT INTO dim_platform (platform_id, platform)
SELECT 
    rowNumberInAllBlocks() AS platform_id,
    Platform
FROM (
    SELECT DISTINCT Platform
    FROM vgsales_raw
);

--- end dim_platform ---

--- dim_game ---
CREATE TABLE dim_game
(
        game_id Int32,
        name String
)
ENGINE = MergeTree()
ORDER BY (game_id);

INSERT INTO dim_game (game_id, name)
SELECT 
        rowNumberInAllBlocks() AS game_id,
        name 
FROM (
        SELECT DISTINCT Name as name
        FROM vgsales_raw
);

--- end dim_game ---

--- dim_publisher ---

CREATE TABLE dim_publisher
(
    publisher_id Int32,
    publisher Nullable(String)
)
ENGINE = MergeTree()
ORDER BY (publisher_id);

INSERT INTO dim_publisher (publisher_id, publisher)
SELECT 
    rowNumberInAllBlocks() AS publisher_id,
    publisher
FROM (
        SELECT DISTINCT Publisher as publisher
        FROM vgsales_raw
);

--- end dim_publisher ---


--- dim_year ---
CREATE TABLE dim_year
(
    year_id Int32,
    year Nullable(Int32)
)
ENGINE = MergeTree()
ORDER BY (year_id);

INSERT INTO dim_year (year_id, year)
SELECT 
    rowNumberInAllBlocks() AS year_id,
        year 
FROM (
        SELECT DISTINCT Year as year
        FROM vgsales_raw
);
--- end dim_year ---

--- dim_genre ---
CREATE TABLE dim_genre
(
    genre_id Int32,
    genre String
)
ENGINE = MergeTree()
ORDER BY (genre_id);

INSERT INTO dim_genre (genre_id, genre)
SELECT 
    rowNumberInAllBlocks() AS genre_id,
    genre 
FROM (
        SELECT DISTINCT Genre as genre
        FROM vgsales_raw
);
--- end dim_genre ---


