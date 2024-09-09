# Retail Sales Analysis - Basic SQL Project

## Overview

This project demonstrates how to analyze a retail sales dataset using SQL. The analysis covers data cleaning, exploration, and answering business-related questions. We used **Microsoft SQL Server** to perform operations such as data aggregation, filtering, and transformation to generate insights about customer behavior, sales performance, and product trends.

## Table of Contents

- [Overview](#overview)
- [Data Overview](#data-overview)
- [Data Cleaning](#data-cleaning)
- [Data Exploration](#data-exploration)
- [Business Questions](#business-questions)
- [Conclusion](#conclusion)
- [Contact](#contact)

---

## Data Overview

1. **Retrieve Sample Records**:  
   Retrieve the first 10 rows from the `sales` table using the `SELECT` statement with the `TOP` clause. This provides a snapshot of the dataset structure and its contents.

   Functions Used: `SELECT`, `TOP`

2. **Count Total Records**:  
   Determine the total number of records in the table using the `COUNT` aggregate function.

   Functions Used: `SELECT`, `COUNT`

---

## Data Cleaning

1. **Check for NULL Values**:  
   Identify rows that have missing values in key columns by combining `WHERE` conditions for each column. This ensures the integrity of the data before analysis.

   Functions Used: `SELECT`, `WHERE`, `IS NULL`

2. **Delete Rows with NULL Values**:  
   Remove rows with missing data using the `DELETE` statement to ensure cleaner and more reliable analysis results.

   Functions Used: `DELETE`, `WHERE`, `IS NULL`

---

## Data Exploration

1. **Total Number of Sales**:  
   Calculate the total number of sales using the `COUNT` function to understand the sales volume.

   Functions Used: `SELECT`, `COUNT`

2. **Number of Unique Customers**:  
   Identify how many distinct customers made purchases using the `COUNT DISTINCT` function.

   Functions Used: `SELECT`, `COUNT(DISTINCT)`

3. **Number of Unique Categories**:  
   Determine how many different product categories are present in the dataset by using `COUNT DISTINCT` on the `category` column.

   Functions Used: `SELECT`, `COUNT(DISTINCT)`

4. **List of Distinct Categories**:  
   Retrieve a list of distinct product categories using the `SELECT DISTINCT` statement.

   Functions Used: `SELECT DISTINCT`

---

## Business Questions

1. **Sales on a Specific Date**:  
   Retrieve all records for sales made on a specific date (`2022-11-05`) using the `WHERE` clause to filter by `sale_date`.

   Functions Used: `SELECT`, `WHERE`

2. **Filter Transactions by Category and Quantity**:  
   Filter all transactions for a specific category (e.g., 'Clothing') where the quantity sold exceeds a threshold (e.g., 3), while limiting results to a specific month using the `DATEPART` function.

   Functions Used: `SELECT`, `WHERE`, `DATEPART`

3. **Total Sales and Orders for Each Category**:  
   Use the `SUM` function to calculate the total sales and `COUNT` to get the total number of orders for each product category.

   Functions Used: `SELECT`, `SUM`, `COUNT`, `GROUP BY`

4. **Average Age of Customers for Specific Category**:  
   Calculate the average age of customers who purchased items from the 'Beauty' category using the `AVG` aggregate function.

   Functions Used: `SELECT`, `AVG`, `WHERE`

5. **High-Value Transactions**:  
   Retrieve all transactions where the total sale exceeds a specific value (e.g., $1000) using the `WHERE` clause for filtering.

   Functions Used: `SELECT`, `WHERE`

6. **Transactions by Gender and Category**:  
   Use the `COUNT` function combined with `GROUP BY` to find the total number of transactions per gender and category.

   Functions Used: `SELECT`, `COUNT`, `GROUP BY`, `ORDER BY`

7. **Monthly Sales Analysis**:  
   Calculate the average monthly sales and determine the best-selling month each year using `AVG`, `DATEPART`, and `RANK`.

   Functions Used: `SELECT`, `AVG`, `DATEPART`, `RANK`, `PARTITION BY`, `GROUP BY`

8. **Top 5 Customers by Total Sales**:  
   Find the top 5 customers based on their total sales using `SUM`, `GROUP BY`, and `ORDER BY` to sort and limit the results.

   Functions Used: `SELECT`, `SUM`, `GROUP BY`, `ORDER BY`, `TOP`

9. **Unique Customers per Category**:  
   Calculate the number of unique customers for each product category using `COUNT(DISTINCT)` and `GROUP BY`.

   Functions Used: `SELECT`, `COUNT(DISTINCT)`, `GROUP BY`

10. **Shift-Based Sales Analysis**:  
    Create time-based shifts (Morning, Afternoon, Evening) using the `CASE` statement and the `DATEPART` function, then count the total orders for each shift.

    Functions Used: `SELECT`, `CASE`, `DATEPART`, `GROUP BY`

---

## Conclusion

This project provides an in-depth exploration of retail sales data using SQL. The queries show how data cleaning, aggregation, and filtering can generate meaningful business insights. By analyzing sales, customer behavior, and product categories, businesses can use this data to improve performance and understand their market trends.

---

## Contact

For further information, you can connect with me on [LinkedIn](https://www.linkedin.com/in/jakub-buckanic-9757682b3).
