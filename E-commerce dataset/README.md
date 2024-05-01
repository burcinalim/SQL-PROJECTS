
# E-Commerce Data Analysis w/SQL

## Table of Contents
- Problem Statement
- Data Source
- Tools
- Data Analyzing

### Problem Statement

Sales analysis is used to demonstrate how well some products are selling by comparing their sales target with the actual sales. It also helps us to discover insights such as popular and underperforming products, market trends, high-value customers, etc. This study will help us to answer the following commands related to Indian e-commerce website:

    1. Find the total number of orders, customers, cities, and states.
    2. Find the new customers who made purchases in the year 2019. Only shows the top 5 new customers and their respective cities and states. Order the result by the amount they spent.
    3. Find the top 10 profitable states & cities so that the company can expand its business. Determine the number of products sold and the number of customers in these top 10 profitable states & cities.
    4. Display the details (in terms of “order_date”, “order_id”, “State”, and “CustomerName”) for the first order in each state. Order the result by “order_id”.
    5. Check the monthly profitability and monthly quantity sold to see if there are patterns in the dataset.
    6. Determine the number of times that salespeople hit or failed to hit the sales target for each category.

### Data Source
The datasets used for this analysis are the "List of Orders.csv", "Order Details.csv", and "Sales Target.csv" files.
#### What's inside?

    1. List of Orders -> This dataset contains purchase information. The information includes ID, Date of Purchase, and customer details.
    2. Order Details -> This dataset contains the order ID, with the order price, quantity, profit, category, and subcategory of the product.
    3. The sales target -> This dataset contains the sales target amount and date for each product category.

### Tools
 PostgreSQL

 #### Functions Used

    - Create Table,Create View
    - Inner Join, Union All
    - Group By, Order By, Limit
    - Count, Distinct
    - Extract, To_Date, To_Char
    - Row_Number()
    - Case


### Data Analyzing 
- Step 1: I created a database and tables in the pgAdmin to import CSV files.
- Step 2: For convenience, I created a view called “combined_table” by joining the “order_details” & “list_of_orders” tables.
- Step 3: I wrote proper queries to answer the questions. You can reach all queries within the repo.
     
    - Query 1: Find the total number of orders, customers, cities, and states.

            The COUNT DISTINCT function was used to return the number of unique values in the column of “order_id”, "customer_name”, “city”, and “state”.

    - Query 2: Find the new customers who made purchases in the year 2019. Only shows the top 5 new customers and their respective cities and states. Order the result by the amount they spent.
        
            WHERE function was used to get a customer list that contains new customer. IN operator returns a list of customers’ names who made purchases in the year 2018. 
            To find new customers in the year 2019, simply used NOT before the IN operator to eliminate those old customers from the result. 

    - Query 3: Find the top 10 profitable states & cities so that the company can expand its business. Determine the number of products sold and the number of customers in these top 10 profitable states & cities.
    
            GROUP BY function was used to group data according to state and city. Also, the data was ORDERED BY total profit. Then, to limit the results LIMIT function was used. 

    - Query 4: Display the details (in terms of “order_date”, “order_id”, “State”, and “CustomerName”) for the first order in each state. Order the result by “order_id”.
    
            The ROW_NUMBER() function was used to assign a row number to each order within each state, ordered by order_date and order_id. The PARTITION BY state clause ensures that the row number is reset for each state.
            I selected only the rows where the row number is 1, indicating the first order in each state.

    - Query 5: Check the monthly profitability and monthly quantity sold to see if there are patterns in the dataset.

            The month_order common table expression (CTE) creates a mapping between the abbreviated month names and their corresponding order numbers.
            This mapping is then used in the main query to join with the combined_table based on the month names.
            By including the month_order.month_order column in the GROUP BY and ORDER BY clauses, you ensure that the data is grouped and ordered according to the month order.

    - Query 6: Determine the number of times that salespeople hit or failed to hit the sales target for each category.

            I created a view to find out the sales for each category in each month.
            I used the CONCAT function to make the date format look like the month_of_order_date column in sales_target table.
            Then, I created a new view to compare actual sales and targets according to category. I used CASE statement to check if 'sales' is greater than 'target'
            and If the condition is true, it assigns the value 'Good Job' to the comparison_result column