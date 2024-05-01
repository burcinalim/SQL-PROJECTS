CREATE TABLE list_of_orders(
	Order_ID VARCHAR(25),
	Order_Date VARCHAR(25),
	CustomerName VARCHAR(30),
	State VARCHAR(30),
	City VARCHAR(30)
);

CREATE TABLE order_details(
	Order_ID VARCHAR(25),
	Amount double precision,
	Profit double precision,
	Quantity smallint,
	Category VARCHAR(30),
	Sub_Category VARCHAR(30)
);

CREATE TABLE sales_target(
	Month_of_Order_Date VARCHAR(10),
	Category VARCHAR(25),
	Target double precision
);