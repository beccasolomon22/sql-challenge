-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary 
FROM employees AS e
JOIN salaries AS s ON s.emp_no = e.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees 
WHERE hire_date LIKE '%1986';

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
-- last name and first name from employees...department name from departments... department number and employee number from dept_manager
CREATE VIEW man_dept AS
SELECT ma.emp_no, ma.dept_no, d.dept_name
FROM dept_manager AS ma
JOIN departments AS d 
ON d.dept_no = ma.dept_no;

SELECT * FROM man_dept;

SELECT ma.dept_no, ma.dept_name, ma.emp_no, e.last_name, e.first_name
FROM man_dept AS ma
JOIN employees AS e
ON ma.emp_no = e.emp_no

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
CREATE VIEW employee_dept AS
SELECT em.emp_no, em.dept_no, d.dept_name
FROM dept_emp AS em
JOIN departments AS d 
ON d.dept_no = em.dept_no;

SELECT * FROM employee_dept;

SELECT em.dept_no, e.emp_no, e.last_name, e.first_name, em.dept_name
FROM employees AS e
JOIN employee_dept AS em
ON e.emp_no = em.emp_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees 
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT emp_no, last_name, first_name
FROM employees
WHERE emp_no IN (
	SELECT emp_no
	FROM dept_emp
	WHERE dept_no IN (
		SELECT dept_no
		FROM departments
		WHERE dept_name = 'Sales'
	)
);

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
CREATE VIEW emp_dept AS
SELECT ed.emp_no, d.dept_name 
FROM dept_emp AS ed
JOIN departments AS d 
ON ed.dept_no=d.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

SELECT * FROM emp_dept;

SELECT e.emp_no, e.last_name, e.first_name, edt.dept_name
FROM employees AS e
JOIN emp_dept AS edt
ON e.emp_no = edt.emp_no;

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT last_name, COUNT(*) AS frequency_count
FROM employees
GROUP BY last_name
ORDER BY frequency_count DESC

