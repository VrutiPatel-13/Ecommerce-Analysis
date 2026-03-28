CREATE DATABASE ecommerce;
USE ecommerce;

CREATE TABLE `ecommerce_sales_data_2024_2025` (
  `Order ID` int DEFAULT NULL,
  `Order Date` date,
  `Customer Name` varchar(100),
  `Region` varchar(100),
  `City` varchar(100),
  `Category` varchar(100),
  `Sub-Category` varchar(100),
  `Product Name` varchar(100),
  `Quantity` int DEFAULT NULL,
  `Unit Price` int DEFAULT NULL,
  `Discount` int DEFAULT NULL,
  `Sales` double DEFAULT NULL,
  `Profit` double DEFAULT NULL,
  `Payment Mode` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SHOW TABLES;
#Total Revenue
SELECT SUM(Sales) AS Total_Revenue 
FROM ecommerce_sales_data_2024_2025

#Monthly Revenue
SELECT 
    MONTH(`Order Date`) AS month,
    SUM(Sales) AS revenue
FROM ecommerce_sales_data_2024_2025
GROUP BY MONTH(`Order Date`);

#Top Products
SELECT 
    `Product Name`,
    SUM(Quantity) AS Total_Sold
FROM ecommerce_sales_data_2024_2025
GROUP BY `Product Name`
ORDER BY Total_Sold DESC
LIMIT 10;

#Sales by region
select Region, sum(Sales) 
As Revenue from ecommerce_sales_data_2024_2025
group by region;

#Payment Mode Analysis
select `Payment Mode`,count(*) As orders from ecommerce_sales_data_2024_2025
group by `Payment Mode`;