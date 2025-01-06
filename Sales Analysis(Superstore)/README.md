
# Superstore Sales Analysis w/SQL

## Table of Contents
- Problem Statement
- Data Source
- Tools
- Data Cleaning
- Data Analyzing

## Problem Statement

In this Superstore Sales Analysis project, the main aim of the project is to uncover insights into the store's sales and profits trends and patterns between given years. After cleaning and preprocessing the data, the below criteria were identified.

    1. Total Profits
    2. Total Sales
    3. Profits by Region
    4. Total Profits based on specific timeline
    5. Profits by Categories (based on specific timeline)
    6. Profits by Sub Categories (based on specific timeline)
    7. Profits by Segment
    8. The Top 5 Most Profitable Products
    9. The Top 5 Less Profitable Products

## Data Source

**Explanation of the data table**

    Row ID => Unique ID for each row.
    
    Order ID => Unique Order ID for each Customer.
    
    Order Date => Order Date of the product.
    
    Ship Date => Shipping Date of the Product.
    
    Ship Mode=> Shipping Mode specified by the Customer.
    
    Customer ID => Unique ID to identify each Customer.
    
    Customer Name => Name of the Customer.
    
    Segment => The segment where the Customer belongs.
    
    Country => Country of residence of the Customer.
    
    City => City of residence of the Customer.
    
    State => State of residence of the Customer.
    
    Postal Code => Postal Code of every Customer.
    
    Region => Region where the Customer belong.
    
    Product ID => Unique ID of the Product.
    
    Category => Category of the product ordered.
    
    Sub-Category => Sub-Category of the product ordered.
    
    Product Name => Name of the Product
    
    Sales => Sales of the Product.
    
    Quantity => Quantity of the Product.
    
    Discount => Discount provided.
    
    Profit => Profit/Loss incurred.
    
## Tools 
PostgreSQL

**Functions Used in PostgreSQL**
    
    - Create Table
    - Select
    - Group By
    - Order By
    - Where
    - Trunc
    - Between
    - Limit

## Data Cleaning
    - changing date format,
    - transforming the “,” with “;”(because the file delimited with “,”.
    - change quirky characters within the data

## Data Analyzing
    
**Step 1:** I created a database and tables in the pgAdmin to import CSV files. Creating Table query was added into the file.

**Step 2:** I wrote proper queries to answer below questions. You can reach all queries within the repo.
        

    1.Total Profit
    SELECT TRUNC(SUM(profit)) AS "Total Profit($)" FROM sales_list;
    
    2.Total Sales
    SELECT TRUNC(SUM(sales)) AS "Total Sales($)" FROM sales_list;
    
    3.Profits by Region
    SELECT region,TRUNC(SUM(profit)) AS "Total Profit by Region($)" FROM sales_list
    GROUP BY region;
    
    4.Total Profits based on specific timeline
    SELECT TRUNC(SUM(profit)) AS "Total Profit($)" FROM sales_list
    WHERE order_date BETWEEN '2015-01-01' AND '2016-12-31';
    
    5.Profits by Categories
    SELECT category,TRUNC(SUM(profit)) AS "Profit by Categories($)" FROM sales_list
    GROUP BY category;
    
    6.Profits by Sub Categories 
    SELECT sub_category,TRUNC(SUM(profit)) AS "Profit by Sub Categories($)" FROM sales_list
    GROUP BY sub_category
    ORDER BY "Profit by Sub Categories($)" desc;
    
    7.Profits by Segments
    SELECT segment,TRUNC(SUM(profit)) AS "Profit by Segments($)" FROM sales_list
    GROUP BY segment;
    
    8.The Top 5 Most Profitable Products
    SELECT product_name, TRUNC(SUM(profit)) AS "Total Profit($)" FROM sales_list
    GROUP BY product_name
    ORDER BY "Total Profit($)" desc
    LIMIT 5;
    
    9.The Top 5 Less Profitable Products
    SELECT product_name, TRUNC(SUM(profit)) AS "Total Profit($)" FROM sales_list
    GROUP BY product_name
    ORDER BY "Total Profit($)"
    LIMIT 5;

