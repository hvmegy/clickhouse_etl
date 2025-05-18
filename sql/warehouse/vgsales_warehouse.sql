-- Create the vgsales_warehouse database
DROP DATABASE IF EXISTS vgsales_warehouse;
CREATE DATABASE IF NOT EXISTS vgsales_warehouse;
USE vgsales_warehouse;

-- Create and load dim_country
CREATE TABLE vgsales_warehouse.dim_country
(
    country_id Int32 NOT NULL,
    country String
)
ENGINE = MergeTree()
ORDER BY (country_id);

INSERT INTO vgsales_warehouse.dim_country
SELECT country_id, country
FROM vgsales_stage.dim_country;

-- Create and load dim_platform
CREATE TABLE vgsales_warehouse.dim_platform
(
    platform_id Int32 NOT NULL,
    platform String
)
ENGINE = MergeTree()
ORDER BY (platform_id);

INSERT INTO vgsales_warehouse.dim_platform
SELECT platform_id, platform
FROM vgsales_stage.dim_platform;

-- Create and load dim_game
CREATE TABLE vgsales_warehouse.dim_game
(
    game_id Int32,
    name String
)
ENGINE = MergeTree()
ORDER BY (game_id);

INSERT INTO vgsales_warehouse.dim_game
SELECT game_id, name
FROM vgsales_stage.dim_game;

-- Create and load dim_publisher
CREATE TABLE vgsales_warehouse.dim_publisher
(
    publisher_id Int32,
    publisher Nullable(String)
)
ENGINE = MergeTree()
ORDER BY (publisher_id);

INSERT INTO vgsales_warehouse.dim_publisher
SELECT publisher_id, publisher
FROM vgsales_stage.dim_publisher;

-- Create and load dim_year
CREATE TABLE vgsales_warehouse.dim_year
(
    year_id Int32,
    year Nullable(Int32)
)
ENGINE = MergeTree()
ORDER BY (year_id);

INSERT INTO vgsales_warehouse.dim_year
SELECT year_id, year
FROM vgsales_stage.dim_year;

-- Create and load dim_genre
CREATE TABLE vgsales_warehouse.dim_genre
(
    genre_id Int32,
    genre String
)
ENGINE = MergeTree()
ORDER BY (genre_id);

INSERT INTO vgsales_warehouse.dim_genre
SELECT genre_id, genre
FROM vgsales_stage.dim_genre;

-- Create and load fact_sales
CREATE TABLE vgsales_warehouse.fact_sales
(
    sales_id Int32 NOT NULL,
    game_id Int32,
    platform_id Int32,
    year_id Int32,
    genre_id Int32,
    publisher_id Int32,
    country_id Int32,
    sales Float64
)
ENGINE = MergeTree()
ORDER BY (sales_id);

INSERT INTO vgsales_warehouse.fact_sales
SELECT
    sales_id,
    game_id,
    platform_id,
    year_id,
    genre_id,
    publisher_id,
    country_id,
    sales
FROM vgsales_stage.fact_sales;