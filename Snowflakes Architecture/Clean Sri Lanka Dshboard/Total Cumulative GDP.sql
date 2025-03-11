--Total Cumulative GDP
SELECT country, SUM(gdp) AS total_gdp 
FROM DB2.PUBLIC.COUNTRY_ECONOMY 
GROUP BY country
ORDER BY total_gdp DESC
LIMIT 10;
