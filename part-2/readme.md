## PART 2: DEMONSTRATE YOUR SQL COMPETENCY

### Given a database of employees who are accountable for sales 
(with table structure;employee, department, sales, year), 

Write SQL scripts to:

#### 1. Find the top 10 employees in each department

```
-- Solution Query
-- Please refer attached file dump.sql to create the database with tables
-- join the respective tables in a cte, resulting in yearly sales total by employee and department

with cteByYearlySales as(
select e.emp_id,e.emp_fname,e.dept_id, d.dept_name, sum(s.sales_amount) as yearly_sales, extract(year from s.sales_date) as year from employee e 
join department d on e.dept_id = d.dept_id 
left join sales s on e.emp_id = s.emp_id
group by  e.emp_id,e.dept_id, d.dept_name,extract(year from s.sales_date)
order by e.dept_id
),

-- aggregate the data by total_sales per employee by removing year

cteByDepartmentEmployeeSales as (
Select distinct emp_id,emp_fname,dept_id,dept_name, sum(yearly_sales) over(partition by emp_id) as total_sales 
from cteByYearlySales    
),

-- add the window ranking function to rank total sales by employee and department

cteByDepartmentEmployeeSalesRank as (  
Select *
, rank() over (partition by dept_id order by total_sales desc) as ranking
from cteByDepartmentEmployeeSales
)

-- select the rows where ranking <=2, where 2 can be replaced with 10 as per the question requirement

Select * From cteByDepartmentEmployeeSalesRank where ranking<=2;
;
```



##### Aggregated total sales with ranking:

```
 emp_id | emp_fname | dept_id |      dept_name       | total_sales | ranking 
--------+-----------+---------+----------------------+-------------+---------
      1 | Michale   |       1 | queens               |    71223.00 |       1
      7 | Kuleswar  |       1 | queens               |    66505.00 |       2
     13 | Maria     |       1 | queens               |    57790.00 |       3
      9 | Alex      |       1 | queens               |    52184.00 |       4
      3 | Enric     |       1 | queens               |    32383.00 |       5
     11 | Mario     |       2 | manhattan-east       |   101074.00 |       1
      2 | Carlos    |       2 | manhattan-east       |    73350.00 |       2
      4 | Jhon      |       2 | manhattan-east       |    52342.00 |       3
      5 | Joseph    |       3 | manhattan-west       |    87369.00 |       1
      6 | Zanifer   |       3 | manhattan-west       |    75865.00 |       2
      8 | Henrey    |       3 | manhattan-west       |    58747.00 |       3
     10 | George    |       4 | manhattan-upper-east |    57778.00 |       1
     12 | Alan      |       4 | manhattan-upper-east |    48753.00 |       2
     14 | Nickole   |       4 | manhattan-upper-east |    20323.00 |       3
(14 rows)
```

##### Picking top 2(10) sales made by the employees within each department:
```
 emp_id | emp_fname | dept_id |      dept_name       | total_sales | ranking 
--------+-----------+---------+----------------------+-------------+---------
      1 | Michale   |       1 | queens               |    71223.00 |       1
      7 | Kuleswar  |       1 | queens               |    66505.00 |       2
     11 | Mario     |       2 | manhattan-east       |   101074.00 |       1
      2 | Carlos    |       2 | manhattan-east       |    73350.00 |       2
      5 | Joseph    |       3 | manhattan-west       |    87369.00 |       1
      6 | Zanifer   |       3 | manhattan-west       |    75865.00 |       2
     10 | George    |       4 | manhattan-upper-east |    57778.00 |       1
     12 | Alan      |       4 | manhattan-upper-east |    48753.00 |       2
(8 rows)
```

#### 2. For each department, calculate year over year growth

```
-- Solution Query

with cteByYearlySales as(
select e.dept_id, d.dept_name, sum(s.sales_amount) as yearly_sales, extract(year from s.sales_date) as year from employee e 
join department d on e.dept_id = d.dept_id 
left join sales s on e.emp_id = s.emp_id
group by  e.dept_id, d.dept_name,extract(year from s.sales_date)
order by e.dept_id, year
)
select dept_id, year,sum(yearly_sales) yearly_sales_total,
COALESCE (round(((sum(yearly_sales)/lag(sum(yearly_sales)) over (partition by dept_id order by dept_id, year))-1 ) * 100,2),0.00) as YOY 
from cteByYearlySales group by dept_id, year;

```

```
-- Solution Result

 dept_id | year | yearly_sales_total |  yoy   
---------+------+--------------------+--------
       1 | 2018 |           60924.00 |   0.00
       1 | 2019 |           39010.00 | -35.97
       1 | 2020 |           39001.00 |  -0.02
       1 | 2021 |           37723.00 |  -3.28
       1 | 2022 |          103427.00 | 174.17
       2 | 2018 |           47779.00 |   0.00
       2 | 2019 |           53558.00 |  12.10
       2 | 2020 |           33554.00 | -37.35
       2 | 2021 |           48995.00 |  46.02
       2 | 2022 |           42880.00 | -12.48
       3 | 2018 |           52035.00 |   0.00
       3 | 2019 |           49663.00 |  -4.56
       3 | 2020 |           61162.00 |  23.15
       3 | 2021 |           11968.00 | -80.43
       3 | 2022 |           47153.00 | 293.99
       4 | 2018 |           12871.00 |   0.00
       4 | 2019 |           13326.00 |   3.54
       4 | 2020 |           22916.00 |  71.96
       4 | 2021 |           48106.00 | 109.92
       4 | 2022 |           29635.00 | -38.40
(20 rows)
```



       
     
