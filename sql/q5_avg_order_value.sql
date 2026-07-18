-- Query 5: Average Order Value by Month
-- Uses a subquery to calculate true order totals first
-- (since the table has one row per product line, not per order)
-- Answers: How much does a customer spend per complete order visit?

SELECT
  DATE_TRUNC('month', "InvoiceDate"::timestamp) AS month,
  ROUND(AVG("order_total")::numeric, 2) AS avg_order_value
FROM (
  SELECT "InvoiceNo",
         "InvoiceDate",
         SUM("TotalPrice") AS order_total
  FROM transactions
  GROUP BY "InvoiceNo", "InvoiceDate"
) order_totals
GROUP BY month
ORDER BY month;
