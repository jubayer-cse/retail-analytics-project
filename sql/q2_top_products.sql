-- Query 2: Top 10 Products by Revenue
-- Identifies highest revenue-generating products
-- Answers: Which products should be prioritized for stock and marketing?

SELECT
  "Description",
  SUM("Quantity") AS units_sold,
  ROUND(SUM("TotalPrice")::numeric, 2) AS revenue
FROM transactions
GROUP BY "Description"
ORDER BY revenue DESC
LIMIT 10;
