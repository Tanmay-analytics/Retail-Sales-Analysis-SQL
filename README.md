# **Retail Sales Analysis using SQL**

## **Project Overview**

This project involves a comprehensive analysis of retail sales data using SQL. The goal is to clean, explore, and analyze sales records to uncover key business insights, such as customer demographics, sales trends, and high-performing product categories.

## **Objectives**

1. **Data Cleaning:** Identify and remove null values or inconsistencies in the dataset.  
2. **Data Exploration:** Understand the scale of the data, unique customers, and product categories.  
3. **Business Analysis:** Use SQL queries to answer specific business questions and derive actionable insights for the retail business.

## **Dataset Structure**

The project uses a dataset named retail\_sales with the following columns:

* transactions\_id: Unique identifier for each transaction.  
* sale\_date: Date of the transaction.  
* sale\_time: Time of the transaction.  
* customer\_id: Unique identifier for the customer.  
* gender: Gender of the customer.  
* age: Age of the customer.  
* category: Product category (e.g., Clothing, Electronics, Beauty).  
* quantity: Number of units sold.  
* price\_per\_unit: Price per single unit.  
* cogs: Cost of Goods Sold.  
* total\_sale: Total revenue from the transaction.

## **Project Workflow**

### **1\. Database Setup**

The script begins by creating the database schema and defining the table structure to ensure data integrity.

### **2\. Data Cleaning**

To ensure the accuracy of the analysis, the following steps were performed:

* Checking for null values across all critical columns.  
* Removing records with missing values to maintain a clean dataset using DELETE statements.

### **3\. Data Exploration**

Key exploration queries included:

* Counting total records in the dataset.  
* Identifying the number of unique customers.  
* Listing all distinct product categories and their distribution.

## **Data Analysis (Business Questions)**

The project addresses 16 specific business questions through SQL queries, including:

1. **Transactional Filters:** Finding all sales on specific dates or for specific quantities (e.g., Clothing sales \> 4 units).  
2. **Category Analysis:** Calculating total sales and total transactions per category.  
3. **Demographic Deep-Dives:** Finding the average age of customers per category (e.g., Beauty) and gender distribution across categories.  
4. **Time-Series Analysis:** Determining the best-selling month for each year and identifying peak sales dates.  
5. **Customer Loyalty:** Identifying the top 5 customers by total spend and customers with more than 5 lifetime purchases.  
6. **Shift Categorization:** Breaking down sales into Morning, Afternoon, and Evening shifts to identify peak traffic hours.  
7. **Contribution Analysis:** Calculating the percentage contribution of each category to the total revenue.

## **Key Insights & Findings**

The results of the SQL analysis revealed several critical business trends:

* **High-Value Transactions:** A significant portion of revenue is driven by large individual transactions (over 1000 in total sale).  
* **Peak Performance:** Sales activity peaks during specific "shifts" (Afternoon/Evening), suggesting staffing should be optimized for these periods.  
* **Category Dominance:** Certain categories like Electronics and Clothing show higher transaction frequency, while others may have higher average unit prices.  
* **Customer Behavior:** A small segment of "power users" (those with \>5 purchases) contributes disproportionately to total sales, highlighting the importance of customer retention.  
* **Seasonal Trends:** Monthly analysis indicates clear seasonality, with certain months showing consistent spikes in revenue year-over-year.

## **Key SQL Techniques Used**

* **Data Aggregation:** SUM(), AVG(), COUNT(), MAX(), MIN().  
* **Complex Filtering:** WHERE, HAVING, LIKE, IN, and logical operators.  
* **Joins & Subqueries:** (Where applicable) for advanced data retrieval.  
* **Window Functions:** Used for ranking and year-over-year comparisons.  
* **Data Transformation:** CASE statements for custom bucketing (e.g., Age Groups and Time Shifts).

## **How to Use**

1. **Database:** Ensure you have a SQL environment (PostgreSQL recommended).  
2. **Import Data:** Create the table using the schema provided in retail\_sales\_analysis.sql and import the SQL \- Retail Sales Analysis.csv file.  
3. **Run Queries:** Execute the queries sequentially to clean the data and view the analysis results.

## **Conclusion**

This analysis provides a data-driven foundation for retail strategy. By understanding when customers shop, what they buy, and who the most loyal customers are, the business can optimize inventory, marketing spend, and operational hours to maximize profitability.
