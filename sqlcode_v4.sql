DROP TABLE IF EXISTS dim_happiness, dim_country, dim_series, dim_gdp, indicators;


CREATE TABLE IF NOT EXISTS dim_happiness (
	"country_id" VARCHAR(255),
	"year" INT,
	"log_gdp" NUMERIC(6,3),
	"social_support" NUMERIC(6,3),
	"life_expectancy" NUMERIC(6,3),
	"freedom" NUMERIC(6,3),
	"Generosity" NUMERIC(6,3)
);


/* COPY hapiness
FROM 'C:\code\sql\testimport\happiness.csv'
DELIMITER ';'
CSV Header;


COPY hapiness
FROM PROGRAM 'curl -s https://github.com/Mini-project-1-Group-3/Data-for-mini-project/blob/main/happiness_sorted.csv'
DELIMITER ';'
CSV Header; */


COPY dim_happiness
FROM PROGRAM 'curl -s https://raw.githubusercontent.com/Mini-project-1-Group-3/Data-for-mini-project/refs/heads/main/happiness_new.csv'
DELIMITER ','
CSV Header;


-- ALTER TABLE hapiness
-- ADD COLUMN happiness_id SERIAL PRIMARY KEY;


CREATE TABLE IF NOT EXISTS dim_country (
	"country_name" VARCHAR(255),
	"country_code" VARCHAR(3),
	"currency_unit" VARCHAR(100),
	"region" VARCHAR(100),
	"income_group" VARCHAR(100)
);


COPY dim_country
FROM PROGRAM 'curl -s https://raw.githubusercontent.com/Mini-project-1-Group-3/Data-for-mini-project/refs/heads/main/country_table_data.csv'
DELIMITER ';'
CSV Header;


CREATE TABLE IF NOT EXISTS dim_series (
	"indicator_id" VARCHAR(255),
	"topic" VARCHAR(255),
	"indicator_name" TEXT,
	"long_definition" TEXT,
	"unit_of_measure" VARCHAR(100),
	"periodicity" VARCHAR(100),
	"base_period" VARCHAR(100),
	"aggregation_method" VARCHAR(100)
);


COPY dim_series
FROM PROGRAM 'curl -s https://raw.githubusercontent.com/Mini-project-1-Group-3/Data-for-mini-project/refs/heads/main/series_sorted.csv'
DELIMITER ';'
CSV Header;


CREATE TABLE IF NOT EXISTS indicators (
	country_name VARCHAR(255),
	country_code VARCHAR(3),
	indicator_name TEXT,
	indicator_code VARCHAR(100),
	year INT,
	value NUMERIC(50,30)
);

COPY indicators
FROM PROGRAM 'curl -s https://raw.githubusercontent.com/Mini-project-1-Group-3/Data-for-mini-project/refs/heads/main/indicators_sorted.csv'
DELIMITER ';'
CSV Header;

CREATE TABLE IF NOT EXISTS dim_gdp (
	country VARCHAR(255),
	year INT,
	value NUMERIC(20,15)
);


COPY dim_gdp
FROM PROGRAM 'curl -s https://raw.githubusercontent.com/Mini-project-1-Group-3/Data-for-mini-project/refs/heads/main/debt_gdp_sorted.csv'
DELIMITER ';'
CSV Header;


SELECT *
FROM dim_happiness;

SELECT *
FROM dim_country;

SELECT *
FROM dim_series;


SELECT *
FROM indicators;

SELECT *
FROM dim_gdp;