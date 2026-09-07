select * from sales;

-- manually creating null values
INSERT INTO sales (SaleDate, SPID, PID, Amount, Boxes)
VALUES ('2024-01-01', 'SP110', 'P110', NULL, NULL);

select * from sales;

-- Basic null handling
SELECT *
FROM sales
WHERE Amount IS NULL;

-- COALESCE is a function used to handle NULL values.

-- It returns the first non-NULL value from a list of values.

-- Using COALESCE (replace NULL values)

select amount , coalesce(Amount,0) as clean_Amount from sales;

-- Replace NULL Boxes with 0

SELECT SaleDate, Amount, COALESCE(Boxes, 0) AS Boxes
FROM sales;

select * from people;

INSERT INTO people ( Salesperson,SPID, Team,Location)
VALUES ("Kenny",'SP220', NULL, NULL);

SELECT Salesperson, COALESCE(Team, 'No Team') AS Team
FROM people
order by Salesperson;

-- WHERE → filters rows before grouping
-- HAVING → filters groups after aggregation

-- HAVING = filter results after applying aggregate functions (SUM, AVG, COUNT, etc.)-- 


SELECT SPID, SUM(Amount) AS Total_Sales
FROM sales
GROUP BY SPID
HAVING SUM(Amount) > 1500000;

-- Count number of sales per SPID-- 
SELECT SPID, COUNT(*) AS Total_Orders
FROM sales
GROUP BY SPID
HAVING COUNT(*) > 300;

-- treating null values in amount column with 0
SELECT SPID, SUM(COALESCE(Amount, 0)) AS Total_Sales
FROM sales
GROUP BY SPID
HAVING SUM(COALESCE(Amount, 0)) > 1500000;

select * from sales;

SELECT SPID,SUM(Amount) AS Total_Sales
FROM sales
WHERE Boxes > 5
GROUP BY SPID
HAVING SUM(Amount) > 200000;

-- LIMIT
-- Show first 5 rows from sales

SELECT *
FROM sales
LIMIT 10;


-- lowest first 5 sales
SELECT *
FROM sales
ORDER BY Amount 
LIMIT 5;

-- highest 5 sales
SELECT *
FROM sales
ORDER BY Amount DESC
LIMIT 5;

-- skipping first 5 and extracting next 5 rows
SELECT *
FROM sales
ORDER BY Amount 
LIMIT 5 OFFSET 5;
