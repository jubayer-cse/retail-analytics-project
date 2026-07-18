-- Query 3: Revenue by Country
-- Shows revenue and customer count per country
-- Answers: Where is revenue concentrated geographically?

SELECT
  "Country",
  ROUND(SUM("TotalPrice")::numeric, 2) AS revenue,
  COUNT(DISTINCT "CustomerID") AS customers
FROM transactions
GROUP BY "Country"
ORDER BY revenue DESC;
