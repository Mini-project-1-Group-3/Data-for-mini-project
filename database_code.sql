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



CREATE TABLE gpd_country (     country_code TEXT,     "1950" VARCHAR(100),     "1951" VARCHAR(100),     "1952" VARCHAR(100),     "1953" VARCHAR(100),     "1954" VARCHAR(100),     "1955" VARCHAR(100),     "1956" VARCHAR(100),     "1957" VARCHAR(100),     "1958" VARCHAR(100),     "1959" VARCHAR(100),     "1960" VARCHAR(100),     "1961" VARCHAR(100),     "1962" VARCHAR(100),     "1963" VARCHAR(100),     "1964" VARCHAR(100),     "1965" VARCHAR(100),     "1966" VARCHAR(100),     "1967" VARCHAR(100),     "1968" VARCHAR(100),     "1969" VARCHAR(100),     "1970" VARCHAR(100),     "1971" VARCHAR(100),     "1972" VARCHAR(100),     "1973" VARCHAR(100),     "1974" VARCHAR(100),     "1975" VARCHAR(100),     "1976" VARCHAR(100),     "1977" VARCHAR(100),     "1978" VARCHAR(100),     "1979" VARCHAR(100),     "1980" VARCHAR(100),     "1981" VARCHAR(100),     "1982" VARCHAR(100),     "1983" VARCHAR(100),     "1984" VARCHAR(100),     "1985" VARCHAR(100),     "1986" VARCHAR(100),     "1987" VARCHAR(100),     "1988" VARCHAR(100),     "1989" VARCHAR(100),     "1990" VARCHAR(100),     "1991" VARCHAR(100),     "1992" VARCHAR(100),     "1993" VARCHAR(100),     "1994" VARCHAR(100),     "1995" VARCHAR(100),     "1996" VARCHAR(100),     "1997" VARCHAR(100),     "1998" VARCHAR(100),     "1999" VARCHAR(100),     "2000" VARCHAR(100),     "2001" VARCHAR(100),     "2002" VARCHAR(100),     "2003" VARCHAR(100),     "2004" VARCHAR(100),     "2005" VARCHAR(100),     "2006" VARCHAR(100),     "2007" VARCHAR(100),     "2008" VARCHAR(100),     "2009" VARCHAR(100),     "2010" VARCHAR(100),     "2011" VARCHAR(100),     "2012" VARCHAR(100),     "2013" VARCHAR(100),     "2014" VARCHAR(100),     "2015" VARCHAR(100),     "2016" VARCHAR(100),     "2017" VARCHAR(100),     "2018" VARCHAR(100),     "2019" VARCHAR(100),     "2020" VARCHAR(100),     "2021" VARCHAR(100),     "2022" VARCHAR(100) );

SELECT *
FROM gpd_country;

CREATE TABLE indicators (
	country_name VARCHAR(255),
	country_code VARCHAR(255),
	indicator_name VARCHAR(255),
	indicator_code VARCHAR(255),
	year INT,
	value VARCHAR(255)
);
