-- Trade balance, exports imports
SELECT country, SUM(exports) - SUM(imports) AS trade_balance
FROM DB2.PUBLIC.COUNTRY_ECONOMY
GROUP BY country
ORDER BY trade_balance DESC;
