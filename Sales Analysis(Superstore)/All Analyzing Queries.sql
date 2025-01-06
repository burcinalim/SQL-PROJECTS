
--1.Total Profit
SELECT TRUNC(SUM(profit)) AS "Total Profit($)" FROM sales_list;

--2.Total Sales
SELECT TRUNC(SUM(sales)) AS "Total Sales($)" FROM sales_list;

--3.Profits by Region
SELECT region,TRUNC(SUM(profit)) AS "Total Profit by Region($)" FROM sales_list
GROUP BY region;

--4.Total Profits based on specific timeline
SELECT TRUNC(SUM(profit)) AS "Total Profit($)" FROM sales_list
WHERE order_date BETWEEN '2015-01-01' AND '2016-12-31';

--5.Profits by Categories
SELECT category,TRUNC(SUM(profit)) AS "Profit by Categories($)" FROM sales_list
GROUP BY category;

--6.Profits by Sub Categories 
SELECT sub_category,TRUNC(SUM(profit)) AS "Profit by Sub Categories($)" FROM sales_list
GROUP BY sub_category
ORDER BY "Profit by Sub Categories($)" desc;

--7.Profits by Segments
SELECT segment,TRUNC(SUM(profit)) AS "Profit by Segments($)" FROM sales_list
GROUP BY segment;

--8.The Top 5 Most Profitable Products
SELECT product_name, TRUNC(SUM(profit)) AS "Total Profit($)" FROM sales_list
GROUP BY product_name
ORDER BY "Total Profit($)" desc
LIMIT 5;

--9.The Top 5 Less Profitable Products
SELECT product_name, TRUNC(SUM(profit)) AS "Total Profit($)" FROM sales_list
GROUP BY product_name
ORDER BY "Total Profit($)"
LIMIT 5;



