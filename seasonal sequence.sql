select first_name, last_name, hire_date,
case 
	when hire_date like '____-03-__' or hire_date like '____-04-__' or hire_date like '____-05-__' then 'spring'
	when hire_date like '____-06-__' or hire_date like '____-08-__' or hire_date like '____-07-__' then 'summer'
	when hire_date like '____-09-__' or hire_date like '____-11-__' or hire_date like '____-10-__' then 'autumn'
	else 'winter'
end as season
from employees
order by season;

----------------------------------------------------------------------------------------------------

select first_name, last_name, hire_date,
case 
	when month(hire_date) in (3,4,5) then 'Spring'
	when month(hire_date) in (6,7,8) then 'Summer'
	when month(hire_date) in (9,10,11) then 'Autumn'
	else 'Winter'
end as season
from employees
order by season;

-----------------------------------------------------------------------------------------------------

SELECT first_name, last_name, hire_date,
case 
	when MONTH(hire_date) between 3 and 5 then 'Spring'
    when MONTH(hire_date) between 6 and 8 then 'Summer'
    when MONTH(hire_date) between 9 and 11 then 'Autumn'
    else 'Winter'
end as season
from employees
order by season;