SELECT * FROM departments;
--Total number of departments
select count(*) from departments;

--Query department by id 
select * from departments where department_id=101;

--Query department by name
select * from departments where department_name='Engineering';

--Show all employees 
select * from employees;

--Total number of employees 
select count(*) from employees;

--Query employee by id
select * from employees where employee_id=3;

--Query employee by name
select * from employees where first_name='Robert';

--Count by gender
select gender, count(*) from employees group by gender;

--count by number
select position, count(*) from employees group by position;

-- to find max leaves count 
select max(leaves_count)
from
(select employee_id, count(*) leaves_count
from leaves 
group by employee_id) as leaves_count 

-- to display only 3 rows 
select * from employees limit 3;

-- employee with most leaves
select employee_id, count(*) leaves_count
from leaves 
group by employee_id
order by 2 desc
limit 1

-- employee with most leaves
select  e.*, count(*) leaves_count
from leaves l 
Inner Join employees e ON (l.employee_id = e.employee_id)
group by l.employee_id
order by count(*) desc
limit 1

-- top salary
select  e.*, s.amount salary
from employees e
Inner Join salaries s ON (e.employee_id = s.employee_id)
order by s.amount desc
limit 1

-- first max salary
select max(amount) from salaries

-- second highest salary 
select max(amount) from salaries
where (amount < (select max(amount) from salaries)) 

-- second highest salaried employee
select e.* , s.amount
from employees e
Inner Join salaries s on (e.employee_id=s.employee_id)
where s.amount < (select max(amount) from salaries)
order by s.amount desc
limit 1