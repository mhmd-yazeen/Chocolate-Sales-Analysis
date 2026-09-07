select * from people;

select * from sales;

select * from products;

-- 1. Print details of shipments (sales) where amounts are > 2,000 and boxes are <100?
select *
from sales
where Amount > 2000 
and Boxes < 100;


-- 2. How many shipments (sales) each of the sales persons had in the month of January 2022?
select s.SPID,p.Salesperson, count(s.SPID) as Total_Shipment
from sales s
left join people p on s.spid=p.spid
where month(s.SaleDate) = 1 and year(s.SaleDate) = '2022'
group by s.SPID;


-- 3. Which product sells more boxes? Milk Bars or Eclairs?
select pr.Product, sum(Boxes) as Total_Sales
from sales s
left join products pr on s.pid = pr.pid
where pr.Product in ('Milk Bars','Eclairs')
group by pr.Product
order by sum(Boxes) desc;

-- 4. Which product sold more boxes in the first 7 days of February 2022? Milk Bars or Eclairs?
SELECT pr.Product, SUM(s.Boxes) AS Total_Boxes
FROM sales s
JOIN products pr ON s.PID = pr.PID
WHERE pr.Product IN ('Milk Bars', 'Eclairs')
AND s.SaleDate BETWEEN '2022-02-01' AND '2022-02-07'
GROUP BY pr.Product
ORDER BY Total_Boxes DESC;

-- 5. Which shipments had under 100 customers & under 100 boxes? Did any of them occur on Wednesday?

SELECT SPID,Customers,Amount,dayname(SaleDate) As Day
FROM sales
WHERE Customers < 100 
AND dayname(SaleDate)='Wednesday'
AND Boxes < 100;


-- 1. What are the names of salespersons who had at least one shipment (sale)
-- in the first 7 days of January 2022?
SELECT p.Salesperson ,S.SaleDate
FROM sales s
JOIN people p ON s.SPID = p.SPID
WHERE s.SaleDate BETWEEN '2022-01-01' AND '2022-01-07'
order by s.SaleDate;

-- 2. Which salespersons did not make any shipments in the first 7 days of January 2022?



-- 3. How many times we shipped more than 1,000 boxes in each month?
-- 4. Did we ship at least one box of ‘After Nines’ to ‘New Zealand’ on all the months?
-- 5. India or Australia? Who buys more chocolate boxes on a monthly basis?








