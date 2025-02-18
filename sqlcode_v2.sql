DROP TABLE IF EXISTS hapiness;

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


/* COPY hapiness
FROM 'C:\code\sql\testimport\happiness.csv'
DELIMITER ';'
CSV Header;


COPY hapiness
FROM PROGRAM 'curl -s https://github.com/Mini-project-1-Group-3/Data-for-mini-project/blob/main/happiness_sorted.csv'
DELIMITER ';'
CSV Header; */


COPY hapiness
FROM PROGRAM 'curl -s https://raw.githubusercontent.com/Mini-project-1-Group-3/Data-for-mini-project/refs/heads/main/happiness_new.csv?token=GHSAT0AAAAAAC6QGOY6RYJANPRK3YWRZDAAZ5URGPQ'
DELIMITER ','
CSV Header;



SELECT *
FROM hapiness;
