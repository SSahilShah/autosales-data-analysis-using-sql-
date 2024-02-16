--DATA CLEANING--
--checking for missing values
SELECT COUNT(*) AS MissingCount, 'Order Date Missing' AS ErrorType
 FROM `primal-carport-400621.auto_sales.auto_mobile`
WHERE ORDERDATE IS NULL
UNION ALL
SELECT COUNT(*) AS MissingCount, 'Sales Missing' AS ErrorType
FROM `primal-carport-400621.auto_sales.auto_mobile`
WHERE SALES IS NULL;



-- data consistency check
SELECT DISTINCT COUNTRY
FROM `primal-carport-400621.auto_sales.auto_mobile`;

--data range check using orderdate
SELECT *
FROM `primal-carport-400621.auto_sales.auto_mobile`
WHERE ORDERDATE < '2000-01-01' OR ORDERDATE > '2024-01-01';

--analysis--
-- Total Sales by Product Line
SELECT 
  PRODUCTLINE, 
  ROUND(SUM(SALES), 2) AS total_sales 
FROM 
  `primal-carport-400621.auto_sales.auto_mobile`
GROUP BY 
  PRODUCTLINE
ORDER BY 
  SUM(SALES) DESC;

-- Monthly Sales Trend
SELECT 
  EXTRACT(YEAR FROM ORDERDATE) AS Year, 
  FORMAT_DATETIME("%B", ORDERDATE) AS MonthName, 
  ROUND(SUM(SALES), 2) AS MonthlySales -- Numeric monthly sales
FROM 
  `primal-carport-400621.auto_sales.auto_mobile`
GROUP BY 
  Year, MonthName
ORDER BY 
  Year, MonthName;

-- Top Customer
SELECT 
  CUSTOMERNAME, 
  ROUND(SUM(SALES), 2) AS TotalSales 
FROM 
  `primal-carport-400621.auto_sales.auto_mobile`
GROUP BY 
  CUSTOMERNAME
ORDER BY 
  TotalSales DESC
LIMIT 5;

-- Geographical Distribution of Sales
SELECT 
  COUNTRY, 
  ROUND(SUM(SALES), 2) AS TotalSales 
FROM 
  `auto_sales.auto_mobile`
GROUP BY 
  COUNTRY
ORDER BY 
  TotalSales DESC;

-- Product Popularity
SELECT 
  PRODUCTLINE, 
  SUM(QUANTITYORDERED) AS TotalQuantity 
FROM 
  `auto_sales.auto_mobile`
GROUP BY 
  PRODUCTLINE
ORDER BY 
  TotalQuantity DESC
LIMIT 10;

-- Sales Breakdown by Product Line and Country
SELECT 
  PRODUCTLINE, 
  COUNTRY, 
  ROUND(SUM(SALES), 2) AS TotalSales
FROM 
  `primal-carport-400621.auto_sales.auto_mobile`
GROUP BY 
  PRODUCTLINE, COUNTRY
ORDER BY 
  PRODUCTLINE, TotalSales DESC;

-- Year Over Year Sales Comparison
WITH MonthlySales AS (
  SELECT 
    EXTRACT(YEAR FROM ORDERDATE) AS Year,
    EXTRACT(MONTH FROM ORDERDATE) AS Month,
    ROUND(SUM(SALES), 2) AS TotalSales
  FROM 
    `primal-carport-400621.auto_sales.auto_mobile`
  GROUP BY 
    Year, Month
)
SELECT 
  a.Year, 
  a.Month, 
  a.TotalSales AS SalesThisYear, 
  b.TotalSales AS SalesLastYear, 
  ROUND((a.TotalSales - b.TotalSales) / b.TotalSales * 100, 2) AS YoYChange 
FROM 
  MonthlySales a
LEFT JOIN 
  MonthlySales b ON a.Month = b.Month AND a.Year = b.Year + 1
ORDER BY 
  a.Year, a.Month;
