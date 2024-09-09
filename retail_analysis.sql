--SQL Retail Sales Analysis

-- First 10 rows of table
SELECT TOP 10 * FROM sales;

-- Total records
SELECT COUNT(*) AS total_records FROM sales;

--DATA CLEANING 

-- Check null values 
SELECT * FROM sales
WHERE transactions_id IS NULL; -- no missing values

SELECT * FROM sales
WHERE sale_date IS NULL; -- no missing values

SELECT * FROM sales
WHERE sale_time IS NULL; -- no missing values

-- Finding null values in each column
SELECT * FROM sales
WHERE 
	transactions_id IS NULL OR
	sale_date IS NULL OR
	sale_time IS NULL OR
	customer_id IS NULL OR
	gender IS NULL OR
	age IS NULL OR
	category IS NULL OR
	quantiy IS NULL OR
	price_per_unit IS NULL OR
	cogs IS NULL OR
	total_sale IS NULL;

-- Delete all null values
DELETE FROM sales
WHERE 
	transactions_id IS NULL OR
	sale_date IS NULL OR
	sale_time IS NULL OR
	customer_id IS NULL OR
	gender IS NULL OR
	age IS NULL OR
	category IS NULL OR
	quantiy IS NULL OR
	price_per_unit IS NULL OR
	cogs IS NULL OR
	total_sale IS NULL;

-- Data Exploration

--How many sales we have ?
SELECT COUNT(*) AS total_sales FROM sales

-- How many customers we have?
SELECT COUNT(DISTINCT customer_id) as unique_customers FROM sales

-- How many categories we have?
SELECT COUNT(DISTINCT category) as types_of_category FROM sales

-- What categories we have ?
SELECT DISTINCT category as categories FROM sales

-- Data Analysis & Bussiness key problems & answers

-- My Analysis & Findings
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05'
-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
-- Q.3 Write a SQL query to calculate the total sales (total_sale) and number of orders for each category.
-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)


-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05'
SELECT * FROM sales WHERE sale_date = '2022-11-05';

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 3 in the month of Nov-2022
SELECT 
	*
FROM sales 
WHERE category = 'Clothing' 
	AND DATEPART(YEAR, sale_date) = 2022
	AND DATEPART(MONTH, sale_date) = 11
	AND quantiy > 3

-- Q.3 Write a SQL query to calculate the total sales (total_sale) and number of orders for each category.
SELECT category, SUM(total_sale) AS total_sales, COUNT(*) as total_orders
FROM sales
GROUP BY category

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
SELECT AVG(age) as average_age_beauty
FROM sales
WHERE category = 'Beauty'

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
SELECT *
FROM sales
WHERE total_sale > 1000

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
SELECT COUNT(transactions_id)  AS number_of_transactions, gender, category
FROM sales
GROUP BY gender, category
ORDER BY number_of_transactions DESC

-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
SELECT year, month, avg_sales FROM
(
	SELECT DATEPART(YEAR, sale_date) AS year, DATEPART(MONTH, sale_date) AS month, AVG(total_sale) AS avg_sales,
			RANK () OVER (PARTITION BY DATEPART(YEAR, sale_date) ORDER BY AVG(total_sale) DESC) AS rank 
	FROM sales
	GROUP BY DATEPART(YEAR, sale_date), DATEPART(MONTH, sale_date)
) AS t1
WHERE rank = 1

-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
SELECT TOP 5 customer_id AS customer, SUM(total_sale) AS total_sale 
FROM sales
GROUP BY customer_id
ORDER BY total_sale DESC

-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
SELECT COUNT(DISTINCT customer_id) AS number_of_unique_customers, category
FROM sales
GROUP BY category

-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)
SELECT shift, COUNT(transactions_id) as number_of_orders
FROM
(	SELECT *,
		CASE 
			WHEN DATEPART(HOUR, sale_time) < 12 THEN 'Morning'
			WHEN DATEPART(HOUR, sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
			ELSE 'Evening'
		END AS shift
	FROM sales
) AS t1
GROUP BY shift;


-- OR WITH CTE
WITH hourly_sale AS (	
	SELECT *,
		CASE 
			WHEN DATEPART(HOUR, sale_time) < 12 THEN 'Morning'
			WHEN DATEPART(HOUR, sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
			ELSE 'Evening'
		END AS shift
	FROM sales
)
SELECT shift, COUNT(transactions_id) AS number_of_orders 
FROM hourly_sale
GROUP BY shift
ORDER BY number_of_orders DESC