CREATE TABLE sales_list(
Row_ID smallint,
Order_ID varchar(50),
Order_Date date,
Ship_Date date,
Ship_Mode char(100),
Customer_ID varchar(30),
Customer_Name char(100),
Segment char(20),
Country char(25),
City char(30),
State char(30),
Postal_Code smallint,
Region char(10),
Product_ID varchar(50),
Category char(30),
Sub_Category char(30),
Product_Name varchar(130),
Sales double precision,
Quantity smallint,
Discount double precision,
Profit double precision

);

SELECT * FROM sales_list;

