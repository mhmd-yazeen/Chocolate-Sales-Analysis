-- 1. Advanced Joins
-- INNER, LEFT, RIGHT, FULL OUTER JOIN
-- SELF JOIN
-- CROSS JOIN
-- Multiple-table joins
-- Join conditions and filtering
-- Finding unmatched records

select SaleDate,SPID,Boxes
from sales
where boxes > (
	select avg(boxes)
    from sales
    );
    
select SaleDate,SPID,Amount,Boxes
from sales
where spid in(
select spid
from people
where Location='Seattle');

select SaleDate,SPID,Amount,Boxes
from sales
where PID in(
select pid
from products
where Category='Bars');

select
s.SPID,p.Salesperson,s.SaleDate,s.Amount
from sales s
join people p
on s.spid=p.spid
where s.amount > (
select avg(s2.amount)
from sales s2
where s2.spid = s.spid);


select
p.SPID,
p.Salesperson
from people p
where exists (
select 1
from sales s
where s.spid = p.spid);

select
p.SPID,
p.Salesperson
from people p
where not exists (
select 1
from sales s
where s.spid = p.spid);

-- What is a CTE?

-- CTE stands for Common Table Expression.

-- A CTE is a temporary named result set that you create at the beginning of a query using WITH

-- WITH cte_name AS (
--     SELECT ...
--     FROM ...
--     WHERE ...
-- )
-- SELECT *
-- FROM cte_name;

with large_shipment as(
select
SaleDate,SPID,Boxes,Amount
from sales
where Boxes > 1000) 
select * 
from large_shipment; 

WITH january_sales AS (
    SELECT *
    FROM sales
    WHERE SaleDate >= '2022-01-01'
      AND SaleDate < '2022-02-01'
)
SELECT *
FROM january_sales;

WITH salesperson_sales AS (
    SELECT
        SPID,
        SUM(Boxes) AS total_boxes
    FROM sales
    GROUP BY SPID
)
SELECT *
FROM salesperson_sales;

WITH salesperson_sales AS (
    SELECT
        SPID,
        SUM(Boxes) AS total_boxes
    FROM sales
    GROUP BY SPID
)
SELECT
    p.Salesperson,
    ss.total_boxes
FROM salesperson_sales ss
JOIN people p
    ON ss.SPID = p.SPID
WHERE ss.total_boxes > 10000
ORDER BY ss.total_boxes DESC;

-- Find total sales and total boxes for each salesperson.

WITH salesperson_amount AS (
    SELECT
        SPID,
        SUM(Amount) AS total_sales
    FROM sales
    GROUP BY SPID
),

salesperson_boxes AS (
    SELECT
        SPID,
        SUM(Boxes) AS total_boxes
    FROM sales
    GROUP BY SPID
)

SELECT
    p.Salesperson,
    sa.total_sales,
    sb.total_boxes
FROM people p
JOIN salesperson_amount sa
    ON p.SPID = sa.SPID
JOIN salesperson_boxes sb
    ON p.SPID = sb.SPID;
    