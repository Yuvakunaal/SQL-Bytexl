select * from employees;

-- Display details about last_name = Smith
select employee_id,first_name,last_name,gender
from employees
where last_name='Smith';

-- Display first_name, last_name, DOB for all employees
select first_name,last_name,date_of_birth
from employees;

-- Display first_name, last_name, DOB, age (Note : age is not a column of employees) for all employees
-- Using TIMESTAMPDIFF : we could find no.of days or months or years for two different timestamps
-- now() : current timestamp
select first_name,last_name,date_of_birth,timestampdiff(year,date_of_birth,now()) as age
from employees; 

-- Display first_name, last_name, DOB, age, No of years left for retirement (assume age of retirement : 60)
select first_name,last_name,date_of_birth,
timestampdiff(year,date_of_birth,now()) as age,
60 - timestampdiff(year,date_of_birth,now()) as rem_years_for_retirement
from employees;

-- Display first_name, last_name, DOB, age, No of years left for retirement (assume age of retirement : 60)
-- but in ascending order by first_name
select first_name,last_name,date_of_birth,
timestampdiff(year,date_of_birth,now()) as age,
60 - timestampdiff(year,date_of_birth,now()) as rem_years_for_retirement
from employees
order by first_name;

-- Display first_name, last_name, DOB, age, No of years left for retirement (assume age of retirement : 60)
-- but in ascending order by age
select first_name,last_name,date_of_birth,
timestampdiff(year,date_of_birth,now()) as age,
60 - timestampdiff(year,date_of_birth,now()) as rem_years_for_retirement
from employees
order by age;

-- Display first_name, last_name, DOB, age, No of years left for retirement (assume age of retirement : 60)
-- but in descending order by age
select first_name,last_name,date_of_birth,
timestampdiff(year,date_of_birth,now()) as age,
60 - timestampdiff(year,date_of_birth,now()) as rem_years_for_retirement
from employees
order by age desc;

-- Display first_name, last_name, DOB, age, No of years left for retirement (assume age of retirement : 60)
-- but in ascending order by both age and first_name
select first_name,last_name,date_of_birth,
timestampdiff(year,date_of_birth,now()) as age,
60 - timestampdiff(year,date_of_birth,now()) as rem_years_for_retirement
from employees
order by age,first_name;

-- Display first_name, last_name, DOB, age, No of years left for retirement (assume age of retirement : 60)
-- but in ascending order by age and descending order by first_name
select first_name,last_name,date_of_birth,
timestampdiff(year,date_of_birth,now()) as age,
60 - timestampdiff(year,date_of_birth,now()) as rem_years_for_retirement
from employees
order by age,first_name desc;

-- Display first_name, last_name, DOB, age, No of years left for retirement (assume age of retirement : 60)
-- but in ascending order by first_name and 
-- fiter by age - above or equal to 36
select first_name,last_name,date_of_birth,
timestampdiff(year,date_of_birth,now()) as age,
60 - timestampdiff(year,date_of_birth,now()) as rem_years_for_retirement
from employees
order by first_name,age>=36;

-- Display first_name, last_name, DOB, age, No of years left for retirement (assume age of retirement : 60)
-- but in ascending order by first_name and 
-- fiter by age - is one of 33,36,41
select first_name,last_name,date_of_birth,
timestampdiff(year,date_of_birth,now()) as age,
60 - timestampdiff(year,date_of_birth,now()) as rem_years_for_retirement
from employees
where timestampdiff(year,date_of_birth,now()) in (33,36,41)
order by first_name;

-- Display first_name, last_name, DOB, age, No of years left for retirement (assume age of retirement : 60)
-- but in ascending order by last_name and 
-- fiter by age - is between 33 and 44
select first_name,last_name,date_of_birth,
timestampdiff(year,date_of_birth,now()) as age,
60 - timestampdiff(year,date_of_birth,now()) as rem_years_for_retirement
from employees
where timestampdiff(year,date_of_birth,now()) between 33 and 41
order by last_name;

-- Display first_name, last_name, DOB, age, No of years left for retirement (assume age of retirement : 60)
-- filer by first_name - starts with 'a'
select first_name,last_name,date_of_birth,
timestampdiff(year,date_of_birth,now()) as age,
60 - timestampdiff(year,date_of_birth,now()) as rem_years_for_retirement
from employees
where first_name like 'a%';

-- Display first_name, last_name, DOB, age, No of years left for retirement (assume age of retirement : 60)
-- filer by last_name -  ends with 'r'
select first_name,last_name,date_of_birth,
timestampdiff(year,date_of_birth,now()) as age,
60 - timestampdiff(year,date_of_birth,now()) as rem_years_for_retirement
from employees
where last_name like '%l';