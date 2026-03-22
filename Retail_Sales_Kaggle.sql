CREATE TABLE retail_sales (
    transaction_id    NUMBER,
    transaction_date  VARCHAR2(20),
    customer_id       VARCHAR2(20),
    gender            VARCHAR2(10),
    age               NUMBER,
    product_category  VARCHAR2(30),
    quantity          NUMBER,
    price_per_unit    NUMBER(10,2),
    total_amount      NUMBER(10,2)
);

-- Retail Sales Analysis with SQL
-- Dataset: Retail Sales Dataset (Kaggle)

--Overall rertail_sales summary
SELECT 
    COUNT(*) AS total_transactions,
    SUM(total_amount) AS total_sales,
    AVG(total_amount) AS avg_transaction_value
FROM retail_sales;

--Sales by product category
SELECT 
    product_category,
    COUNT(*) AS transaction_count,
    SUM(quantity) AS total_quantity_sold,
    SUM(total_amount) AS total_sales,
    ROUND(AVG(total_amount), 2) AS avg_transaction_value
FROM retail_sales
GROUP BY product_category
ORDER BY total_sales DESC;

--Sales by gender
SELECT 
    gender,
    COUNT(*) AS transaction_count,
    SUM(quantity) AS total_quantity_sold,
    SUM(total_amount) AS total_sales,
    ROUND(AVG(total_amount), 2) AS avg_transaction_value
FROM retail_sales
GROUP BY gender
ORDER BY total_sales DESC;

--Customer age group analysis
SELECT 
    CASE 
        WHEN age < 25 THEN 'Under 25'
        WHEN age BETWEEN 25 AND 34 THEN '25-34'
        WHEN age BETWEEN 35 AND 44 THEN '35-44'
        WHEN age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END AS age_group,
    COUNT(*) AS transaction_count,
    SUM(total_amount) AS total_sales,
    ROUND(AVG(total_amount), 2) AS avg_transaction_value
FROM retail_sales
GROUP BY 
    CASE 
        WHEN age < 25 THEN 'Under 25'
        WHEN age BETWEEN 25 AND 34 THEN '25-34'
        WHEN age BETWEEN 35 AND 44 THEN '35-44'
        WHEN age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END
ORDER BY total_sales DESC;

--Monthly sales trend
SELECT 
    TO_CHAR(TO_DATE(transaction_date, 'YYYY-MM-DD'), 'YYYY-MM') AS sales_month,
    COUNT(*) AS transaction_count,
    SUM(total_amount) AS monthly_sales
FROM retail_sales
GROUP BY TO_CHAR(TO_DATE(transaction_date, 'YYYY-MM-DD'), 'YYYY-MM')
ORDER BY sales_month;

--High-value VS low-value transactions
SELECT 
    CASE 
        WHEN total_amount >= 1000 THEN 'High Value'
        WHEN total_amount >= 500 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS transaction_segment,
    COUNT(*) AS transaction_count,
    SUM(total_amount) AS total_sales,
    ROUND(AVG(total_amount), 2) AS avg_transaction_value
FROM retail_sales
GROUP BY 
    CASE 
        WHEN total_amount >= 1000 THEN 'High Value'
        WHEN total_amount >= 500 THEN 'Medium Value'
        ELSE 'Low Value'
    END
ORDER BY total_sales DESC;


--Most popular category by quantity sold
SELECT 
    product_category,
    SUM(quantity) AS total_quantity_sold
FROM retail_sales
GROUP BY product_category
ORDER BY total_quantity_sold DESC;