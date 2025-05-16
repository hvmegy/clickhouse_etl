DROP DATABASE IF EXISTS vgsales_raw;
CREATE DATABASE IF NOT EXISTS vgsales_raw;
USE vgsales_raw;

CREATE TABLE vgsales_raw.vgsales_raw
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