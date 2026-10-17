CREATE DATABASE online_retail_db;USE online_retail_db;
CREATE TABLE online_retail (
    InvoiceNo VARCHAR(20),
    StockCode VARCHAR(20),
    Description VARCHAR(255),
    Quantity INT,
    InvoiceDate DATETIME,
    UnitPrice DECIMAL(10,2),
    CustomerID VARCHAR(20),
    Country VARCHAR(100),
    Year INT,
    Month INT,
    Month_Name VARCHAR(20),
    Day INT,
    Day_Name VARCHAR(20),
    Hour INT,
    Quarter VARCHAR(10),
    Sales_Amount DECIMAL(12,2),
    Revenue_Category VARCHAR(30),
    Quantity_Category VARCHAR(30),
    Customer_Type VARCHAR(30)
);
USE online_retail_db;
SHOW TABLES;
SELECT COUNT(*) AS total_rows
FROM online_retail;
DESCRIBE online_retail;
SELECT
    COUNT(*) AS total_rows,
    MIN(Quantity) AS min_quantity,
    MAX(Quantity) AS max_quantity,
    MIN(UnitPrice) AS min_price,
    MAX(UnitPrice) AS max_price,
    SUM(Sales_Amount) AS total_sales
FROM online_retail;
SELECT COUNT(*) AS total_rows
FROM online_retail;
SELECT MIN(Quantity) AS min_quantity,
       MAX(Quantity) AS max_quantity
FROM online_retail;
SELECT MIN(UnitPrice) AS min_price,
       MAX(UnitPrice) AS max_price
FROM online_retail;
SELECT SUM(Sales_Amount) AS total_sales
FROM online_retail;
SELECT
    ROUND(SUM(Sales_Amount), 2) AS Total_Sales,
    COUNT(DISTINCT InvoiceNo) AS Total_Orders,
    SUM(Quantity) AS Total_Quantity,
    COUNT(DISTINCT CustomerID) AS Total_Customers
FROM online_retail;
SELECT
    Country,
    ROUND(SUM(Sales_Amount), 2) AS Total_Sales
FROM online_retail
GROUP BY Country
ORDER BY Total_Sales DESC
LIMIT 10;
SELECT
    Year,
    Month,
    Month_Name,
    ROUND(SUM(Sales_Amount), 2) AS Total_Sales
FROM online_retail
GROUP BY Year, Month, Month_Name
ORDER BY Total_Sales DESC;
SELECT
    StockCode,
    Description,
    ROUND(SUM(Sales_Amount), 2) AS Total_Sales,
    SUM(Quantity) AS Total_Quantity
FROM online_retail
GROUP BY StockCode, Description
ORDER BY Total_Sales DESC
LIMIT 10;
SELECT
    Customer_Type,
    COUNT(DISTINCT CustomerID) AS Total_Customers,
    ROUND(SUM(Sales_Amount), 2) AS Total_Sales,
    SUM(Quantity) AS Total_Quantity
FROM online_retail
GROUP BY Customer_Type
ORDER BY Total_Sales DESC;
SELECT
    CustomerID,
    ROUND(SUM(Sales_Amount), 2) AS Total_Sales,
    SUM(Quantity) AS Total_Quantity,
    COUNT(DISTINCT InvoiceNo) AS Total_Orders
FROM online_retail
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY Total_Sales DESC
LIMIT 10;
SELECT
    Day_Name,
    ROUND(SUM(Sales_Amount), 2) AS Total_Sales,
    SUM(Quantity) AS Total_Quantity,
    COUNT(DISTINCT InvoiceNo) AS Total_Orders
FROM online_retail
GROUP BY Day_Name
ORDER BY Total_Sales DESC;
SELECT
    Hour,
    ROUND(SUM(Sales_Amount), 2) AS Total_Sales,
    SUM(Quantity) AS Total_Quantity,
    COUNT(DISTINCT InvoiceNo) AS Total_Orders
FROM online_retail
GROUP BY Hour
ORDER BY Total_Sales DESC;
SELECT
    Revenue_Category,
    COUNT(*) AS Total_Transactions,
    ROUND(SUM(Sales_Amount), 2) AS Total_Sales,
    SUM(Quantity) AS Total_Quantity
FROM online_retail
GROUP BY Revenue_Category
ORDER BY Total_Sales DESC;