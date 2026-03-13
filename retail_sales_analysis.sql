-- SQL Retail Sales Analysis -- P1

DROP TABLE IF EXISTS retail_sales;
CREATE TABLE retail_sales 
		(
		transactions_id	int PRIMARY KEY,
		sale_date Date,
		sale_time time,
		customer_id	int,
		gender varchar(15),
		age int,
		category varchar(15),
		quantity	int,
		price_per_unit float,
		cogs float,
		total_sale float		
		);

SELECT * FROM retail_sales
LIMIT 20

SELECT COUNT (*)
FROM retail_sales

--DATA CLEANING

SELECT * FROM retail_sales
WHERE 
    transactions_id IS NULL
    OR
    sale_date IS NULL
    OR 
    sale_time IS NULL
    OR
    gender IS NULL
    OR
    category IS NULL
    OR
    quantity IS NULL
    OR
    cogs IS NULL
    OR
    total_sale IS NULL;

DELETE FROM retail_sales
WHERE 
    transactions_id IS NULL
    OR
    sale_date IS NULL
    OR 
    sale_time IS NULL
    OR
    gender IS NULL
    OR
    category IS NULL
    OR
    quantity IS NULL
    OR
    cogs IS NULL
    OR
    total_sale IS NULL;

-- DATA EXPLORATION 

-- How many sales we have?
SELECT COUNT(*) as total_sale
FROM retail_sales

--  How many uniuque customers we have ?
SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM retail_sales;


-- Data Analysis & Business Key Problems & Answers

-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05

SELECT *
FROM retail_sales
WHERE sale_date = '2022-11-05';

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022

SELECT *
FROM retail_sales
WHERE category = 'Clothing'
AND sale_date BETWEEN '2022-11-01' AND '2022-11-30'
AND quantity >= 4;

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.

SELECT category,
SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY category;

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.

SELECT 
ROUND(AVG(age),2) AS avg_age
FROM retail_sales
WHERE category = 'Beauty';

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.

SELECT *
FROM retail_sales
WHERE total_sale > 1000;

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.

SELECT category,
gender,
COUNT(transactions_id) AS total_transactions
FROM retail_sales
GROUP BY category, gender
ORDER BY category;

-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year

SELECT 
EXTRACT(YEAR FROM sale_date) AS year,
EXTRACT(MONTH FROM sale_date) AS month,
ROUND(AVG(total_sale)::numeric, 2) AS avg_sale
FROM retail_sales
GROUP BY year, month
ORDER BY year, avg_sale DESC;


-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 

SELECT customer_id,
SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 10;

-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.

SELECT category,
COUNT(DISTINCT customer_id) AS unique_customers
FROM retail_sales
GROUP BY category;

-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17)

SELECT 
CASE
    WHEN EXTRACT(HOUR FROM sale_time) <= 12 THEN 'Morning'
    WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 13 AND 17 THEN 'Afternoon'
    ELSE 'Evening'
END AS shift,
COUNT(*) AS total_orders
FROM retail_sales
GROUP BY shift;

--Q.11 Write a SQL query to find the top selling category by total sales.

SELECT 
    category,
    SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY category
ORDER BY total_sales DESC;

-- Q.12 Write a SQL query to find the day with the highest total sales.

SELECT 
    sale_date,
    SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY sale_date
ORDER BY total_sales DESC
LIMIT 3;

-- Q.13 Write a SQL query to find the average quantity sold per transaction.

SELECT 
    ROUND(AVG(quantity)::numeric, 2) AS avg_quantity_per_transaction
FROM retail_sales;

-- Q.14 Write a SQL query to find the most frequently purchased category by customers.

SELECT 
    category,
    COUNT(*) AS total_transactions
FROM retail_sales
GROUP BY category
ORDER BY total_transactions DESC;

-- Q.15 Write a SQL query to find customers who made more than 5 purchases.

SELECT 
    customer_id,
    COUNT(transactions_id) AS total_purchases
FROM retail_sales
GROUP BY customer_id
HAVING COUNT(transactions_id) > 5
ORDER BY total_purchases DESC;

-- Q.16 Write a SQL query to calculate the percentage contribution of each category to total sales.

SELECT 
    category,
    SUM(total_sale) AS category_sales,
    ROUND(
        ((SUM(total_sale) / (SELECT SUM(total_sale) FROM retail_sales)) * 100)::numeric, 2) 
	AS sales_percentage
FROM retail_sales
GROUP BY category
ORDER BY sales_percentage DESC;

-- End --
