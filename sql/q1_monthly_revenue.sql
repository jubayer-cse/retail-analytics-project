-- Query 1: Monthly Revenue Trend
-- Shows total revenue per month across the full dataset
-- Answers: Is revenue growing? When does it peak seasonally?

SELECT
  DATE_TRUNC('month', "InvoiceDate"::timestamp) AS month,
  ROUND(SUM("TotalPrice")::numeric, 2) AS revenue
FROM transactions
GROUP BY month
ORDER BY month;
