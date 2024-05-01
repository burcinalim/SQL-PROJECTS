--1. Find the total number of orders, customers, cities, and states.
SELECT COUNT(DISTINCT order_id) AS Total_Order,
		COUNT(DISTINCT customer_name) AS Total_Num_Customer,
		COUNT(DISTINCT state) AS Total_Num_State,
		COUNT(DISTINCT city) AS Total_Num_City
FROM combined_table;

/*2. Find the new customers who made purchases in the year 2019. 
Only shows the top 5 new customers and their respective cities and states. Order the result by the amount they spent. */
SELECT customer_name,state,city,SUM(amount)
FROM combined_table
WHERE customer_name NOT IN (
	SELECT DISTINCT customer_name FROM combined_table
	WHERE EXTRACT(YEAR FROM TO_DATE(order_date,'dd/mm/yyyy'))=2018
)
AND EXTRACT(YEAR FROM TO_DATE(order_date,'dd/mm/yyyy'))=2019
GROUP BY customer_name,state,city
ORDER BY SUM(amount) DESC
LIMIT 5;

/*
3. Find the top 10 profitable states & cities so that the company can expand its business.
Determine the number of products sold and the number of customers in these top 10 profitable states & cities.
*/
SELECT 
	state,
	city,
	COUNT(DISTINCT customer_name) AS total_customer,
	SUM(quantity) AS total_products,
	SUM(profit) AS total_profit
FROM combined_table
GROUP BY state,city
ORDER BY total_profit DESC
LIMIT 10;

/*
4. Display the details (in terms of “order_date”, “order_id”, “State”, and “CustomerName”)for the first order in each state.
Order the result by “order_id”.
*/
WITH first_orders AS(
	SELECT order_date, order_id, state, customer_name,
	ROW_NUMBER() OVER (PARTITION BY state ORDER BY order_date, order_id) AS rn
	FROM combined_table
)
SELECT order_date, order_id, state, customer_name FROM first_orders
WHERE rn =1
ORDER BY order_id;

/*
5. Check the monthly profitability and monthly quantity sold to see if there are patterns in the dataset.
*/
WITH month_order AS (
    SELECT 'Jan-2018' AS month_name, 1 AS month_order
    UNION ALL SELECT 'Feb-2018', 2
    UNION ALL SELECT 'Mar-2018', 3
    UNION ALL SELECT 'Apr-2018', 4
    UNION ALL SELECT 'May-2018', 5
    UNION ALL SELECT 'Jun-2018', 6
    UNION ALL SELECT 'Jul-2018', 7
    UNION ALL SELECT 'Aug-2018', 8
    UNION ALL SELECT 'Sep-2018', 9
    UNION ALL SELECT 'Oct-2018', 10
    UNION ALL SELECT 'Nov-2018', 11
    UNION ALL SELECT 'Dec-2018', 12
	UNION ALL SELECT 'Jan-2019', 13
    UNION ALL SELECT 'Feb-2019', 14
    UNION ALL SELECT 'Mar-2019', 15
)
SELECT CONCAT(TO_CHAR(TO_DATE(order_date, 'DD/MM/YYYY'), 'Mon'), '-', EXTRACT(YEAR FROM TO_DATE(order_date, 'DD/MM/YYYY'))) AS month_of_year,
       SUM(profit) AS total_profit,
       SUM(quantity) AS total_quantity
FROM combined_table
JOIN month_order ON CONCAT(TO_CHAR(TO_DATE(order_date, 'DD/MM/YYYY'), 'Mon'), '-', EXTRACT(YEAR FROM TO_DATE(order_date, 'DD/MM/YYYY'))) = month_order.month_name
GROUP BY month_of_year, month_order.month_order
ORDER BY month_order.month_order;


--6. Determine the number of times that salespeople hit or failed to hit the sales target for each category.

--to find out the sales for each category in each month
CREATE VIEW sales_by_category AS
SELECT CONCAT(TO_CHAR(TO_DATE(order_date, 'DD/MM/YYYY'), 'Mon'), '-', TO_CHAR(TO_DATE(order_date, 'DD/MM/YYYY'), 'yy')) AS month_of_year,
category,SUM(amount) AS sales
FROM combined_table
GROUP BY month_of_year,category;

CREATE VIEW sales_vs_target AS
SELECT s.month_of_year,s.category,
	   s.sales AS sales,
	   t.target AS target,
	   CASE
	   		WHEN sales >= target THEN 'Good Job'
			ELSE 'Fail'
	   END AS comparison_result
FROM sales_by_category AS s
JOIN sales_target AS t ON s.month_of_year = t.month_of_order_date;




































