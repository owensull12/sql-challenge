-- data analysis

-- 1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.first_name, e.last_name, e.sex, s.salary
FROM salaries s
JOIN employees e
ON s.emp_no = e.emp_no;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT e.first_name, e.last_name, e.hire_date
FROM employees e
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';


-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT t.title, m.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM employees e
JOIN dept_manager m ON e.emp_no = m.emp_no
JOIN departments d ON m.dept_no = d.dept_no
JOIN titles t ON e.emp_title = t.title_id;


-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT p.dept_no, p.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp p
JOIN employees e ON p.emp_no = e.emp_no
JOIN departments d on p.dept_no = d.dept_no;


-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT e.first_name, e.last_name, e.sex
FROM employees e
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';


-- 6. List each employee in the Sales department, including their employee number, last name, and first name.
SELECT e.emp_no, e.last_name, e.first_name
FROM employees e
WHERE emp_no IN(
	SELECT emp_no
	FROM dept_emp
	WHERE dept_no IN(
		SELECT dept_no
		FROM departments
		WHERE dept_name = 'Sales'
	)
);


-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp p ON p.emp_no = e.emp_no
JOIN departments d ON p.dept_no = d.dept_no
WHERE p.dept_no IN(
	SELECT dept_no
	FROM departments
	WHERE dept_name = 'Sales' OR dept_name = 'Development'
);


-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) AS "count"
FROM employees
GROUP BY last_name
ORDER BY "count" DESC;

-- add NOT NULL to table creation file (where?)
-- add value lengths to columns (like sex?)
SELECT * FROM salaries WHERE salary IS NULL;