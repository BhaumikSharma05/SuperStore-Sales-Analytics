CREATE DATABASE superstore_proj;
USE superstore_proj;

DROP TABLE IF EXISTS superstore;

CREATE TABLE superstore (
  Row_ID TEXT,
  Order_ID TEXT,
  Order_Date TEXT,
  Ship_Date TEXT,
  Ship_Mode TEXT,
  Customer_ID TEXT,
  Customer_Name TEXT,
  Segment TEXT,
  Country TEXT,
  City TEXT,
  State TEXT,
  Postal_Code TEXT,
  Region TEXT,
  Product_ID TEXT,
  Category TEXT,
  Sub_Category TEXT,
  Product_Name TEXT,
  Sales TEXT
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/superstore_clean.csv'
INTO TABLE superstore
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(Row_ID, Order_ID, Order_Date, Ship_Date, Ship_Mode, Customer_ID, Customer_Name,
 Segment, Country, City, State, Postal_Code, Region, Product_ID, Category, Sub_Category, Product_Name, Sales);

SELECT COUNT(*) FROM superstore;

describe superstore;
select distinct region from superstore;
select distinct category from superstore;


select 
sum(case when Sales is null then 1 else 0 end) as null_sales
from superstore;

select Order_ID, Count(*)
from superstore
group by Order_ID
having count(*) >1;

select 
 round(sum(sales), 2) as total_sales 
from superstore;


select region, round(sum(sales), 2) as total_sales
from superstore
group by region
order by total_sales desc;

SELECT Category, ROUND(SUM(Sales), 2) AS total_sales
FROM superstore
GROUP BY Category
ORDER BY total_sales DESC;

select year(str_to_date(Order_Date, '%d/%m/%Y')) as order_year,
    round(sum(sales), 2) as total_sales
from superstore
group by order_year
order by order_year;

select 
  round(sum(sales) / count(distinct order_ID), 2) as avg_order_value
from superstore;

SELECT Region, State, ROUND(SUM(Sales), 2) AS total_sales
FROM superstore
GROUP BY Region, State
ORDER BY Region, total_sales DESC;


-- Top 10 states
SELECT State, ROUND(SUM(Sales), 2) AS total_sales
FROM superstore
GROUP BY State
ORDER BY total_sales DESC
LIMIT 10;

-- Bottom 10 states
SELECT State, ROUND(SUM(Sales), 2) AS total_sales
FROM superstore
GROUP BY State
ORDER BY total_sales ASC
LIMIT 10;

CREATE VIEW yearly_sales AS
SELECT 
  YEAR(STR_TO_DATE(Order_Date, '%d/%m/%Y')) AS year,
  SUM(Sales) AS total_sales
FROM superstore
GROUP BY year;
------------------------------------------------------------------------------------------------------------------------------------------------

/* 🔹 Key Insights:
- Total Sales ≈ $2.26M (2015–2018) with steady annual growth.
- West region contributes ~31% of total sales, leading all regions.
- Technology category generates the highest revenue share.
- Top customer: Sean Miller with approx. $25K in sales.
- Sales peak during November–December (holiday season).
*/


8. Project Learnings
- Learned how to load, clean, and analyze data using MySQL
- Gained experience with GROUP BY, aggregate functions, ranking, and view creation
- Developed ability to interpret business performance from SQL queries
*/
SELECT * 
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/superstore_clean.csv'
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
FROM superstore;


SHOW VARIABLES LIKE 'secure_file_priv';


SELECT * 
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/superstore_clean.csv'
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
FROM superstore;


