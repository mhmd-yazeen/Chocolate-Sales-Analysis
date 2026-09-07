-- What is a Window Function?

-- A window function performs a calculation across a group of related rows without combining those rows into one row.

-- This is the key difference:

-- GROUP BY

SELECT
    SPID,
    SUM(Amount) AS total_sales
FROM sales
GROUP BY SPID;


SELECT
    SPID,
    SaleDate,
    Amount,
    SUM(Amount) OVER(PARTITION BY SPID) AS total_sales
FROM sales;

-- FUNCTION() OVER(
--     PARTITION BY ...
--     ORDER BY ...
-- )

-- 1. ROW_NUMBER()

-- ROW_NUMBER() gives every row a unique sequential number.

-- Example

-- Number all sales based on sale date.

SELECT
    SaleDate,
    SPID,
    Amount,
    ROW_NUMBER() OVER(
        ORDER BY SaleDate
    ) AS row_num
FROM sales;


-- ROW_NUMBER with PARTITION BY ⭐

-- Number each salesperson's sales separately.

SELECT
    SPID,
    SaleDate,
    Amount,
    ROW_NUMBER() OVER(
        PARTITION BY SPID
        ORDER BY SaleDate
    ) AS sale_number
FROM sales;

-- 2. RANK()

-- RANK() assigns the same rank to tied values.

-- Rank sales based on Amount.

SELECT
    SaleDate,
    SPID,
    Amount,
    RANK() OVER(
        ORDER BY Amount DESC
    ) AS sales_rank
FROM sales;

-- 3. DENSE_RANK()

-- DENSE_RANK() also gives the same rank to ties, but doesn't skip the next rank.

SELECT
    SaleDate,
    SPID,
    Amount,
    DENSE_RANK() OVER(
        ORDER BY Amount DESC
    ) AS sales_rank
FROM sales;


-- Values:     50000  40000  40000  30000

-- RANK:          1      2      2      4

-- DENSE_RANK:    1      2      2      3


-- 5. NTILE()

-- NTILE() divides rows into a specified number of groups/buckets.


-- Divide sales into 4 performance groups.

SELECT
    SPID,
    Amount,
    NTILE(4) OVER(
        ORDER BY Amount DESC
    ) AS sales_quartile
FROM sales;


-- 6. LAG()

-- LAG() lets you access a value from a previous row.

-- This is extremely useful for time-series analysis.


-- Compare today's sale with the previous sale.

SELECT
    SaleDate,
    Amount,
    LAG(Amount) OVER(
        ORDER BY SaleDate
    ) AS previous_amount
FROM sales;

SELECT
    SaleDate,
    Amount,
    LEAD(Amount) OVER(
        ORDER BY SaleDate
    ) AS next_amount
FROM sales;


