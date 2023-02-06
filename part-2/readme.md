## PART 2: DEMONSTRATE YOUR SQL COMPETENCY

### Given a database of employees who are accountable for sales 
(with table structure;employee, department, sales, year), 

Write SQL scripts to:

1. Find the top 10 employees in each department

```
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

-- select the rows where ranking <=2, where 2 can be replaced with 10 as per the question requirement. 

Select * From cteByDepartmentEmployeeSalesRank where ranking<=2;
;
```



#### Aggregated total sales with ranking:

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

#### Picking top 2(10) sales made by the employees within each department:
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

2. For each department, calculate year over year growth


