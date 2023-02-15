select * from departments

SET datestyle TO 'PostgreSQL, PostgreSQL';
COPY Employees FROM 'C:\Users\merov\Desktop\UWA\SQL\sql-challenge\Resources\employees.csv' DELIMITER ',' CSV HEADER;

--01
select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
from employees
left join salaries
on salaries.emp_no = employees.emp_no;

--02
select first_name, last_name, hire_date from employees
where hire_date >= '1986/01/01' and hire_date < '1987/1/1';

--03
select dept_manager.dept_no, departments.dept_name, employees.emp_no, employees.last_name, employees.first_name
from departments
inner join dept_manager
on  departments.dept_no = dept_manager.dept_no
inner join employees
on dept_manager.emp_no = employees.emp_no;

--04
select dept_emp.dept_no, departments.dept_name, employees.emp_no, employees.last_name, employees.first_name
from employees
inner join dept_emp
on employees.emp_no = dept_emp.emp_no
inner join departments
on dept_emp.dept_no = departments.dept_no;

--05
select first_name, last_name, sex
from employees
where first_name = 'Hercules'
and last_name like 'B%';

--06
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
inner join dept_emp
on employees.emp_no = dept_emp.emp_no
inner join departments
on dept_emp.dept_no = departments.dept_no
where departments.dept_name = 'Sales';

--07
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
inner join dept_emp
on employees.emp_no = dept_emp.emp_no
inner join departments
on dept_emp.dept_no = departments.dept_no
where departments.dept_name = 'Sales'
or departments.dept_name = 'Development';

--08
select last_name, count(*)
from employees
group by last_name
order by count desc
