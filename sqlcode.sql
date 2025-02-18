DROP TABLE IF EXISTS hapiness;
DROP TABLE IF EXISTS dim_country;

CREATE TABLE IF NOT EXISTS hapiness (
	"Country name" VARCHAR(255),
	year INT,
	"Life Ladder" NUMERIC(6,3),
	"Log GDP per capita" NUMERIC(6,3),
	"Social support" NUMERIC(6,3),
	"Healthy life expectancy at birth" NUMERIC(6,3),
	"Freedom to make life choices" NUMERIC(6,3),
	"Generosity" NUMERIC(6,3),
	"Perceptions of corruption" NUMERIC(6,3),
	"Positive affect" NUMERIC(6,3),
	"Negative affect" NUMERIC(6,3)
);

CREATE TABLE IF NOT EXISTS dim_country (
	"country_name" VARCHAR(255),
	"country_code" VARCHAR(3),
	"currency_unit" VARCHAR(100),
	"region" VARCHAR(100),
	"income_group" VARCHAR(100)
);

/* COPY hapiness
FROM 'C:\code\sql\testimport\happiness.csv'
DELIMITER ';'
CSV Header;


COPY hapiness
FROM PROGRAM 'curl -s https://github.com/Mini-project-1-Group-3/Data-for-mini-project/blob/main/happiness_sorted.csv'
DELIMITER ';'
CSV Header; */


COPY hapiness
FROM PROGRAM 'curl -s https://raw.githubusercontent.com/Mini-project-1-Group-3/Data-for-mini-project/refs/heads/main/happiness_new.csv?token=GHSAT0AAAAAAC62POS3BCAUNSWZZMYQCRK4Z5URTOQ'
DELIMITER ','
CSV Header;

COPY dim_country
FROM PROGRAM 'curl -s https://raw.githubusercontent.com/Mini-project-1-Group-3/Data-for-mini-project/refs/heads/main/country_table_data.csv'
DELIMITER ';'
CSV Header;

SELECT *
FROM hapiness;

SELECT *
FROM dim_country;