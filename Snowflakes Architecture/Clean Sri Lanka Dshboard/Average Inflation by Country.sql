--Average Inflation by Country
SELECT country, AVG(inflation) AS avg_inflation
FROM DB2.PUBLIC.COUNTRY_ECONOMY
GROUP BY country
ORDER BY avg_inflation DESC;
