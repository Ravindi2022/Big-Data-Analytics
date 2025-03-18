--Year with the Highest Global GDP
SELECT year, SUM(gdp) AS total_gdp
FROM DB2.PUBLIC.COUNTRY_ECONOMY
GROUP BY year
ORDER BY total_gdp DESC
LIMIT 1;
