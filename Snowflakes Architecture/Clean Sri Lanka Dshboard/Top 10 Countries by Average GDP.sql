--Top 10 Countries by Average GDP
SELECT country, AVG(gdp) AS avg_gdp
FROM DB2.PUBLIC.COUNTRY_ECONOMY
GROUP BY country
ORDER BY avg_gdp DESC
LIMIT 10;




