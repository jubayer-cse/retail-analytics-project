-- Query 4: Repeat vs One-Time Customers
-- Uses a subquery to count orders per customer first,
-- then labels each customer as Repeat or One-Time
-- Answers: What share of customers return for a second purchase?

SELECT
  CASE WHEN order_count = 1 THEN 'One-time'
       ELSE 'Repeat'
  END AS customer_type,
  COUNT(*) AS num_customers
FROM (
  SELECT "CustomerID",
         COUNT(DISTINCT "InvoiceNo") AS order_count
  FROM transactions
  GROUP BY "CustomerID"
) sub
GROUP BY customer_type;
