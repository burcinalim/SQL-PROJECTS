
# Customer Segmentation Analysis w/SQL

## Table of Contents
- Problem Statement
- Data Source
- Tools
- Data Cleaning
- Data Analyzing

### Problem Statement

Customer segmentation is a typical strategy used by organizations to categorize clients based on their demographics, shopping patterns, or other traits. This study helps us to answer the following questions:

- What is the distribution of order values across all customers in the dataset?
- How many unique products have each customer purchased?
- Which customers have only made a single purchase from the company?
- Which products are most commonly purchased together by customers in the dataset?

### Data Source
The primary dataset used for this analysis is the "Online_Retail_edited.csv" file, containing detailed information.

#### Data-Related Terms

**InvoiceNo**: The invoice number for each transaction

**StockCode:** The unique code for each product sold

**Description:** The description of each product sold

**Quantity:** The quantity of each product sold in each transaction

**InvoiceDate:** The date and time of each transaction

**UnitPrice:** The price of each product sold

**CustomerID:** The unique identifier for each customer

**Country:** The country where each transaction occurred

### Tools
 - PostgreSQL

### Data Cleaning

- Step 1: I removed some invalid data that is undefined, or blank in the Description column in excel.
- Step 2: I removed invalid data from the Unit Price column. It contained some negative value(the unit price shouldn’t be negative)
- Step 3: I changed blank CustomerID values with N/A
- Step 4: I changed the Invoice Date format with the proper one for Postgres (mm/dd/yyyy) 
- Step 5: I cleared the Quantity column from negative values.

### Data Analyzing 
- Step 1: I created a database and a table that has the same columns as the resource file.
- Step 2: I uploaded the edited excel file in CSV format into the pgAdmin.
- Step 3: I wrote proper queries to answer the questions. You can reach all queries within the repo.



