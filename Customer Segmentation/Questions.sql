--What is the distribution of order values across all customers in the dataset?
SELECT "Description",SUM("Quantity") as "Total Order Quantity"  FROM online_retail_table
GROUP BY "Description"
ORDER BY SUM("Quantity") DESC;

--Total Customer Count
SELECT COUNT(DISTINCT "CustomerID") FROM online_retail_table;

-- How many unique products has each customer purchased?
SELECT "CustomerID",COUNT(DISTINCT "Description")AS product_count
FROM online_retail_table
GROUP BY "CustomerID"
ORDER BY "CustomerID";

-- Which customers have only made a single purchase from the company?
SELECT "CustomerID", COUNT("Description") AS description_count
FROM online_retail_table
GROUP BY "CustomerID"
HAVING COUNT("Description") = 1;

-- Which products are most commonly purchased together by customers in the dataset?
SELECT 
    t1."StockCode" AS product1,
    t2."StockCode" AS product2,
    COUNT(*) AS frequency
FROM 
    online_retail_table t1
JOIN 
    online_retail_table t2 
    ON t1."InvoiceNo" = t2."InvoiceNo" 
    AND t1."CustomerID" = t2."CustomerID" 
    AND t1."StockCode" < t2."StockCode" -- Avoid counting pairs twice
GROUP BY 
    t1."StockCode", t2."StockCode"
ORDER BY 
    frequency DESC
LIMIT 
    10; -- Optionally limit the result to the top 10 most common pairs
