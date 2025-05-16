CREATE DATABASE IF NOT EXISTS vgsales_raw;
USE vgsales_raw;

CREATE TABLE vgsales_raw.vgsales_raw
(
    Rank Int32 NOT NULL,
    Name String,
    Platform String,
    Year Nullable(Int32),
    Genre String,
    Publisher Nullable(String),
    NA_Sales Float64,
    EU_Sales Float64,
    JP_Sales Float64,
    Other_Sales Float64,
    Global_Sales Float64
)
ENGINE = MergeTree()
ORDER BY Rank