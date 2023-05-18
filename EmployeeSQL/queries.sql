
--List the employee number, last name, first name, sex, and salary of each employee 
SELECT e.employee_id, e.last_name, e.first_name, e.sex
FROM employee e
JOIN salaries s
ON e.employee_id = s.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986

select e.first_name, e.last_name, e.hire_date
FROM employee e
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

--List the manager of each department along with their department number, department name, employee number, last name, and first name
select * from dept_mgr
select * from departments 
select * from employee
select dm.dept_id, dm.emp_no, d.dept_name, e.last_name, e.first_name
From dept_mgr dm
JOIN employee e
On dm.emp_no = e.employee_id
JOIN departments d
ON dm.dept_id = d.dept_no
Order by d.dept_name;


--List the department number for each employee along with that employee’s employee number, last name, first name, and department name
select * from dept_emp
select de.dept_no, de.emp_no, d.dept_name, e.last_name, e.first_name
From dept_emp de
JOIN employee e
On de.emp_no = e.employee_id
JOIN departments d
ON de.dept_no = d.dept_no
Order by d.dept_name;



--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
select first_name, last_name, sex 
from employee
where first_name = 'Hercules' and last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name (2 points)
select * from dept_emp
select * from departments
select * from employee
select e.employee_id, e.last_name, e.first_name, d.dept_name
from employee e
Join dept_emp de
on de.emp_no = e.employee_id
join departments d 
on d.dept_no = de.dept_no
Where d.dept_name = 'Sales';



--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name (4 points)
select e.employee_id, e.last_name, e.first_name, d.dept_name
from employee e
Join dept_emp de
on de.emp_no = e.employee_id
join departments d 
on d.dept_no = de.dept_no
Where d.dept_name = 'Sales' or d.dept_name = 'Development';

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name) (4 points)

select last_name, COUNT(*) as same_last_name
from employee
group by last_name
order by same_last_name desc;