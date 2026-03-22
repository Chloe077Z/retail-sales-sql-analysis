# Retail Sales Analysis with SQL

## Project Overview
This is a mini SQL project built using a public retail sales dataset from Kaggle. The project explores transaction performance, product category trends, customer behavior, and monthly sales patterns through business-oriented SQL queries.

## Dataset
- Source: Kaggle Retail Sales Dataset
- Format: CSV
- Fields used: transaction_id, transaction_date, customer_id, gender, age, product_category, quantity, price_per_unit, total_amount

## Objectives
The project answers the following business questions:
1. What is the overall sales performance of the business?
2. Which product categories generate the highest sales?
3. How do customer groups differ by gender and age?
4. What are the monthly sales trends?
5. Which transactions and customers can be considered high value?

## SQL Skills Demonstrated
- Data aggregation using `SUM()`, `AVG()`, and `COUNT()`
- Grouping and sorting with `GROUP BY` and `ORDER BY`
- Conditional logic using `CASE WHEN`
- Date transformation using `TO_DATE()` and `TO_CHAR()`
- Top-N analysis using `FETCH FIRST ... ROWS ONLY`

## Key Findings
- Clothing and Electronics generated strong sales performance across the dataset.
- Monthly sales trends showed variation over time, which can help identify stronger and weaker periods.
- High-value transactions contributed disproportionately to total revenue.
- Customer groups can be segmented by age and gender for more targeted business insights.

## Files
- `retail_sales_analysis.sql` — SQL queries used in the project
- `retail_sales_dataset.csv` — source dataset
- `screenshots/` — selected query outputs

## Tools Used
- Oracle SQL Developer
- SQL
- Kaggle public dataset
