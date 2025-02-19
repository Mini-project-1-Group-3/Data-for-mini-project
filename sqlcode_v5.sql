DROP TABLE IF EXISTS dim_country, dim_date, dim_happiness, dim_series, dim_gdp, indicators, fact_indicators;


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

ALTER TABLE dim_country
ADD COLUMN country_id SERIAL PRIMARY KEY;



CREATE TABLE IF NOT EXISTS dim_happiness (
	"country" VARCHAR(255),
	"year" INT,
	"log_gdp" NUMERIC(6,3),
	"social_support" NUMERIC(6,3),
	"life_expectancy" NUMERIC(6,3),
	"freedom" NUMERIC(6,3),
	"Generosity" NUMERIC(6,3)
);

COPY dim_happiness
FROM PROGRAM 'curl -s https://raw.githubusercontent.com/Mini-project-1-Group-3/Data-for-mini-project/refs/heads/main/happiness_new.csv'
DELIMITER ','
CSV Header;


ALTER TABLE dim_happiness
ADD COLUMN country_id INT REFERENCES dim_country (country_id);

UPDATE dim_country
SET country_name = 'Laos'
WHERE country_name = 'Lao PDR';

UPDATE dim_country
SET country_name = 'Syria'
WHERE country_name = 'Syrian Arab Republic';

UPDATE dim_country
SET country_name = 'South Korea'
WHERE country_name = 'Korea';

UPDATE dim_country
SET country_name = 'Kyrgyzstan'
WHERE country_name = 'Kyrgyz Republic';

UPDATE dim_country
SET country_name = 'Turkiye'
WHERE country_name = 'Türkiye';

UPDATE dim_country
SET country_name = 'Somaliland region'
WHERE country_name = 'Somalia';

UPDATE dim_country
SET country_name = 'Gambia'
WHERE country_name = 'The Gambia';

UPDATE dim_country
SET country_name = 'Slovakia'
WHERE country_name = 'Slovak Republic';

UPDATE dim_country
SET country_name = 'Ivory Coast'
WHERE country_name = 'Côte d''Ivoire';

UPDATE dim_country
SET country_name = 'Congo (Brazzaville)'
WHERE country_name = 'Congo';

UPDATE dim_country
SET country_name = 'Hong Kong S.A.R. of China'
WHERE country_name = 'Hong Kong SAR, China';

UPDATE dim_happiness
SET country_id = dim_country.country_id
FROM dim_country
WHERE dim_happiness.country = dim_country.country_name;



CREATE TABLE IF NOT EXISTS dim_gdp (
	country VARCHAR(255),
	year INT,
	value NUMERIC(20,15)
);


COPY dim_gdp
FROM PROGRAM 'curl -s https://raw.githubusercontent.com/Mini-project-1-Group-3/Data-for-mini-project/refs/heads/main/debt_gdp_sorted.csv'
DELIMITER ';'
CSV Header;

ALTER TABLE dim_gdp
ADD COLUMN country_id INT REFERENCES dim_country (country_id);


UPDATE dim_gdp
SET country = 'Brunei'
WHERE country = 'Brunei Darussalam';


UPDATE dim_gdp
SET country = 'Turkiye'
WHERE country = 'Türkiye, Republic of';

UPDATE dim_gdp
SET country = 'Czechia'
WHERE country = 'Czech Republic';

UPDATE dim_gdp
SET country = 'São Tomé and Principe'
WHERE country = 'São Tomé and Príncipe';

UPDATE dim_gdp
SET country = 'St. Lucia'
WHERE country = 'Saint Lucia';

UPDATE dim_gdp
SET country = 'Hong Kong S.A.R. of China'
WHERE country = 'Hong Kong SAR';

UPDATE dim_gdp
SET country = 'Slovakia'
WHERE country = 'Slovak Republic';
 
UPDATE dim_gdp
SET country = 'Laos'
WHERE country = 'Lao P.D.R.';
 
UPDATE dim_gdp
SET country = 'St. Kitts and Nevis'
WHERE country = 'Saint Kitts and Nevis';

UPDATE dim_gdp
SET country = 'Gambia'
WHERE country = 'Gambia, The';

UPDATE dim_gdp
SET country = 'The Bahamas'
WHERE country = 'Bahamas, The';

UPDATE dim_gdp
SET country = 'Congo (Brazzaville)'
WHERE country = 'Congo, Republic of';
 
 
UPDATE dim_gdp
SET country = 'St. Vincent and the Grenadines'
WHERE country = 'Saint Vincent and the Grenadines';

UPDATE dim_gdp
SET country = 'South Korea'
WHERE country = 'Korea';
 
UPDATE dim_gdp
SET country = 'Kyrgyzstan'
WHERE country  = 'Kyrgyz Republic';
 
UPDATE dim_gdp
SET country = 'Ivory Coast'
WHERE country  = 'Côte d''Ivoire';
 
UPDATE dim_gdp
SET country = 'Russia'
WHERE country = 'Russian Federation';


UPDATE dim_gdp
SET country_id = dim_country.country_id
FROM dim_country
WHERE dim_gdp.country = dim_country.country_name;


-- Create the date dimension table
CREATE TABLE IF NOT EXISTS dim_date (
    date_id SERIAL PRIMARY KEY,
    year INT NOT NULL
);

-- Populate the table with years from 1969 to 2025
WITH RECURSIVE years AS (
    SELECT 1969 as year
    UNION ALL
    SELECT year + 1
    FROM years
    WHERE year < 2025
)

INSERT INTO dim_date (year)
SELECT
    year
FROM years;

-- Index for better performance
CREATE INDEX idx_dim_date_year ON dim_date(year);

CREATE TABLE IF NOT EXISTS dim_series (
	"indicator_id" VARCHAR(255) PRIMARY KEY,
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



CREATE TABLE IF NOT EXISTS fact_indicators (
	unique_id_SK SERIAL PRIMARY KEY,
	country_id INT REFERENCES dim_country (country_id),
	indicator_id VARCHAR(255) REFERENCES dim_series (indicator_id),
	date_id INT REFERENCES dim_date (date_id),
	value NUMERIC(50,30)
);



SELECT *
FROM dim_happiness;

SELECT *
FROM dim_country;

SELECT *
FROM dim_date;

SELECT *
FROM dim_series;


SELECT *
FROM indicators;

SELECT *
FROM dim_gdp;