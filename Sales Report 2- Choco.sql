select * from people;
select * from sales;

select s.SPID,s.SaleDate,s.Amount,p.Salesperson
from sales s
left join people p on s.spid=p.spid
order by Salesperson;

select * from products;

select s.SaleDate,s.Amount,pr.Product
from sales s
left join products pr on s.pid=pr.pid;

-- salesdate , product , category

select s.SaleDate,pr.Product,pr.Category
from sales s
left join products pr on s.pid=pr.pid;

select * from geo;

select s.SaleDate,g.Region
from sales s
left join geo g on s.geoid = g.geoid;

-- where amount < 500
--- where team is delish

select s.SaleDate,s.Amount,p.Salesperson,p.Team,pr.Product
from sales s
join people p on s.spid=p.spid
join products pr on s.pid=pr.pid;

select s.SaleDate,s.Amount,p.Salesperson,p.Team,pr.Product
from sales s
join people p on s.spid=p.spid
join products pr on s.pid=pr.pid
join geo 
where amount < 500; -- 433

select s.SaleDate,s.Amount,p.Salesperson,p.Team,pr.Product
from sales s
join people p on s.spid=p.spid
join products pr on s.pid=pr.pid
where amount < 500 
and Team = 'Delish'; -- 140

select * from people;

select s.SaleDate,s.Amount,p.Salesperson,p.Team,pr.Product
from sales s
join people p on s.spid=p.spid
join products pr on s.pid=pr.pid
where amount < 500 
and p.Team = '';

-- salesdate , amount , salep , team ,product
-- geo ( indian , newsland

select  * from geo;


select s.SaleDate,s.Amount,p.Salesperson,p.Team,pr.Product,g.Geo
from sales s
join people p on s.spid=p.spid
join products pr on s.pid=pr.pid
join geo g on s.GeoID=g.GeoID
where amount < 500 
and p.Team = 'Delish'
and g.Geo in ('New Zealand','India'); -- 48

select s.SaleDate,s.Amount,p.Salesperson,p.Team,pr.Product
from sales s
join people p on s.spid=p.spid
join products pr on s.pid=pr.pid
join geo g on s.GeoID=g.GeoID
where amount < 500 
and p.Team = 'Delish'
and g.Geo in ('New Zealand','India')
order by s.SaleDate;

select * from geo;

select g.Geo,sum(Amount),avg(Amount),sum(Boxes)
from sales s
left join geo g on s.GeoID=g.GeoID 
group by s.GeoID;

select pr.Category, sum(Amount)
from sales s
left join products pr on s.pid=pr.pid
group by pr.Category
order by sum(Amount) desc;

select monthname(SaleDate) AS months , sum(Amount) as sum_amount
from sales
group by months
order by sum_amount desc;

select p.Salesperson , sum(Amount) as sum_amount
from sales s
left join people p on s.spid=p.spid
group by s.spid
order by sum_amount desc;

