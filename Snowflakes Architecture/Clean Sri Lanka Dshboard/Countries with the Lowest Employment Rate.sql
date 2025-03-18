--Countries with the lowest employment rate 
SELECT country, AVG(unemployment) AS avg_unemployment
FROM DB2.PUBLIC.COUNTRY_ECONOMY
GROUP BY country
ORDER BY avg_unemployment ASC
LIMIT 10;
