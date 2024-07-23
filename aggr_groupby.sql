select * from salaries;
select * from employees;
select * from departments;

-- Aggregate functions :-

-- To count no.of records - For checking whether both tables have same no.of rows to perform joins
select count(*) from salaries;
select count(*) from employees;

-- Before doing aggr function have a glance on one type of join...
-- Inner Join : Interection (means joins the common columns in both table)
-- To display employee_name and salary
select employees.employee_id,employees.first_name,employees.last_name,salaries.amount
from employees
Inner Join
salaries on (employees.employee_id = salaries.employee_id)

-- Min
select min(salaries.amount) as Min_Salary
from employees
Inner Join
salaries on (employees.employee_id = salaries.employee_id)

-- Max
select max(salaries.amount) as Max_Salary
from employees
Inner Join
salaries on (employees.employee_id = salaries.employee_id)

-- Sum
select sum(salaries.amount) as Total_Salary
from employees
Inner Join
salaries on (employees.employee_id = salaries.employee_id)

-- Average
select avg(salaries.amount) as Average_Salary
from employees
Inner Join
salaries on (employees.employee_id = salaries.employee_id)

-- Distinct : Avoids duplicates
-- To get distinct position,gender
select distinct position from employees;
select distinct gender from employees;

-- To find no.of values in position
select count(position) as position_count 
from employees

-- To find no.of values in position without duplicates
select count(distinct position) as position_count 
from employees

-- To find sum of male salaries
select sum(s.amount) as Total_Male_Salaries
from employees as e
Inner Join
salaries as s on(e.employee_id = s.employee_id)
where e.gender='male'

-- To find sum of female salaries
select sum(s.amount) as Total_Female_Salaries
from employees as e
Inner Join
salaries as s on(e.employee_id = s.employee_id)
where e.gender='female'

-- Group by :-
-- It is used to group rows that have the same values into summary rows.
select e.gender as genders
from employees as e
Inner Join 
salaries as s on(e.employee_id = s.employee_id)
group by e.gender

-- To find Total_salaries per gender
select e.gender as genders,sum(s.amount) as Total_salaries
from employees as e
Inner Join 
salaries as s on(e.employee_id = s.employee_id)
group by e.gender

-- To find Total_salaries based on department id
select e.department_id as department_id, sum(s.amount) as Total_Salary
from employees as e 
Inner Join
salaries as s on(e.employee_id = s.employee_id)
group by e.department_id

-- To find Total_Salary based on department_id and gender
select e.department_id as department_id, e.gender, sum(s.amount) as Total_Salary
from employees as e 
Inner Join
salaries as s on(e.employee_id = s.employee_id)
group by e.department_id,e.gender
order by e.department_id, e.gender desc

-- To find Total_salaries & Average_salaries based on department id
select e.department_id as department_id, sum(s.amount) as Total_Salary, avg(s.amount) as Average_Salary
from employees as e 
Inner Join
salaries as s on(e.employee_id = s.employee_id)
group by e.department_id
order by e.department_id

-- To find Total_salaries based on department id where total_salary >= 3.6 lakh
select e.department_id as department_id, sum(s.amount) as Total_Salary
from employees as e 
Inner Join
salaries as s on(e.employee_id = s.employee_id)
group by e.department_id
having sum(s.amount) >= 360000

-- To display first_name, last_name, department_name 
select e.first_name, e.last_name, d.department_name 
from employees as e 
INNER JOIN 
departments as d on(e.department_id = d.department_id);

-- To count number of rows after employees joined with departments
select count(*) as No_of_rows 
from employees as e 
Inner Join
departments as d on(e.department_id = d.department_id)

-- To find department name wise total salary
select d.department_name, sum(s.amount) as salary
from employees as e 
INNER JOIN departments as d on(e.department_id = d.department_id)
INNER JOIN salaries as s on(e.employee_id = s.employee_id)
GROUP BY d.department_name