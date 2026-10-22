CREATE DATABASE sales_retail;
USE sales_retail;

DESCRIBE sales_retail;

SELECT * FROM sales_retail;

USE sales_retail;
SHOW VARIABLES LIKE 'secure_file_priv';

SHOW DATABASES;
USE sales_retail;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/retail_sales_dataset-selected-columns.csv'
INTO TABLE sales_retail
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;


SELECT * FROM sales_retail;
USE sales_retail;
CREATE TABLE sales_retail_cleaned
AS SELECT * FROM sales_retail;



SELECT * FROM sales_retail_cleaned;

SELECT COUNT(*) FROM sales_retail_cleaned;

SELECT customer_gender FROM sales_retail_cleaned;

SELECT * FROM sales_retail_cleaned 
WHERE customer_gender = 'Other';

UPDATE sales_retail_cleaned
SET customer_gender = 'Non Specific'
WHERE customer_gender = 'Other';

SELECT category FROM sales_retail_cleaned
;

SELECT * FROM sales_retail_cleaned
WHERE category = 'Groceries';

SELECT DISTINCT customer_gender FROM sales_retail_cleaned;

SELECT DISTINCT customer_age_group FROM sales_retail_cleaned;

SELECT DISTINCT customer_segment FROM sales_retail_cleaned;

SELECT DISTINCT category FROM sales_retail_cleaned;

SELECT DISTINCT brand FROM sales_retail_cleaned;

SELECT DISTINCT product_name FROM sales_retail_cleaned
ORDER BY product_name ASC;

SELECT * FROM sales_retail_cleaned;

SELECT DISTINCT YEAR(transaction_date) FROM sales_retail_cleaned;

SELECT YEAR(transaction_date) AS transaction_year, product_name, category FROM sales_retail_cleaned
ORDER BY transaction_year;


ALTER TABLE sales_retail_cleaned
ADD COLUMN transaction_year INT;

UPDATE sales_retail_cleaned
SET transaction_year = YEAR(transaction_date);

SELECT * FROM sales_retail_cleaned;

SELECT transaction_year, customer_age_group,
COUNT(*) AS age_related_sales_count
FROM sales_retail_cleaned 
GROUP BY transaction_year,customer_age_group 
ORDER BY transaction_year, age_related_sales_count DESC;

SELECT * FROM sales_retail_cleaned;

SELECT transaction_year, customer_gender,
COUNT(*) AS gender_related_sales_count
FROM sales_retail_cleaned 
GROUP BY transaction_year,customer_gender
ORDER BY transaction_year, gender_related_sales_count DESC;

SELECT * FROM sales_retail_cleaned;


SELECT transaction_year, category,
COUNT(*) AS sales_count
FROM sales_retail_cleaned 
GROUP BY transaction_year, category
ORDER BY transaction_year, sales_count DESC;

SELECT DISTINCT customer_segment FROM sales_retail_cleaned;

SELECT transaction_year, customer_segment,
COUNT(*) AS sales_count
FROM sales_retail_cleaned 
GROUP BY transaction_year, customer_segment
ORDER BY transaction_year, sales_count DESC;


SELECT COUNT(*) FROM sales_retail_cleaned;




SELECT *
FROM sales_retail_cleaned
WHERE transaction_id = 'T0000002';


SELECT DISTINCT *
FROM sales_retail_cleaned;

SELECT transaction_id
FROM sales_retail_cleaned
;

