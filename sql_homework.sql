#List the following details of each employee: employee number, lastname, firstname, gender and salary

select employees.emp_no, employees.last_name, employees.first_name,
employees.gender, salary.salary
from employees
join salaries as salary
on employees.emp_no = salary.emp_no;

---
#List all employees hired in 1986

select * from employees
where hire_date like '1986%'

---
#List the manager of each department with the following information: department number, department name, 
manager_employee_no, last_name, first_name, start and end date

select dept_manager.dept_no, department_name.dept_name, dept_manager.emp_no, 
employees.last_name, employees.first_name, dept_manager.from_date, dept_manager.to_date
from dept_manager
join departments as department_name
on dept_manager.dept_no = department_name.dept_no
join employees as employees
on dept_manager.emp_no = employees.emp_no;

---
#List the department of each employe with: employee_number, last_name, first_name, and department_name

select dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
from dept_emp
join employees 
on dept_emp.emp_no = employees.emp_no
join departments
on dept_emp.dept_no = departments.dept_no;

---
#List all employees whose first name is 'Herrcules' and last names begin with 'B'
select * from employees
where first_name = 'Hercules'
and last_name like 'B%';

---
#List all employees in the sales department including their employee number, lastname, 
first name and department name

select dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
from dept_emp
join employees
on dept_emp.emp_no = employees.emp_no
join departments
on dept_emp.dept_no = departments.dept_no
where dept_name = 'Sales'

---
#List all employees in the Sales and Development departments, including their employee number,
last name, first name and department name

select dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
from dept_emp
join employees
on dept_emp.emp_no = employees.emp_no
join departments
on dept_emp.dept_no = departments.dept_no
where dept_name = 'Sales'
or dept_name = 'Development'

---
#In descending order, list the frequency count of employee last names,
#(i.e., how many employees share the same last name)

select last_name,
count(last_name) as "frequency" 
from employees
group by last_name 
order by count(last_name) desc;
