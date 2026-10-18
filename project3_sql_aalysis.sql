-- Project 3: SQL Data Analysis (Decode Labs)
-- Dataset Table: SalesData

-- 1. Total Revenue and Order Count
SELECT
    COUNT(OrderID) AS Total_Orders,
    SUM(TotalPrice) AS Total_Revenue,
    AVG(TotalPrice) AS Average_Order_Value
FROM SalesData;

-- 2. Sales and Revenue Breakdown by Product
SELECT
    Product,
    COUNT(OrderID) AS Total_Orders,
    SUM(Quantity) AS Total_Quantity_Sold,
    SUM(TotalPrice) AS Total_Revenue
FROM SalesData
GROUP BY Product
ORDER BY Total_Revenue DESC;

-- 3. Filter High-Value Delivered Transactions
SELECT
    OrderID, CustomerID, Product, TotalPrice, OrderStatus
FROM SalesData
WHERE OrderStatus = 'Delivered'
  AND TotalPrice > 1000
ORDER BY TotalPrice DESC;

-- 4. Revenue Distribution by Payment Method
SELECT
    PaymentMethod,
    COUNT(OrderID) AS Order_Count,
    SUM(TotalPrice) AS Total_Revenue
FROM SalesData
GROUP BY PaymentMethod
ORDER BY Total_Revenue DESC;

-- 5. Customer Acquisition Insights by Referral Source
SELECT
    ReferralSource,
    COUNT(DISTINCT CustomerID) AS Unique_Customers,
    SUM(TotalPrice) AS Total_Revenue
FROM SalesData
GROUP BY ReferralSource
ORDER BY Total_Revenue DESC;