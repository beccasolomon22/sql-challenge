-- Drop tables if exists
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

-- Create Tables
CREATE TABLE departments (
	dept_no VARCHAR,
	dept_name VARCHAR
);

CREATE TABLE dept_emp (
	emp_no INT,
	dept_no VARCHAR
);

CREATE TABLE dept_manager (
	dept_no VARCHAR,
	emp_no INT
);

CREATE TABLE employees (
	emp_no INT,
	emp_title_id VARCHAR,
	birth_date VARCHAR,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR(3),
	hire_date VARCHAR
);

CREATE TABLE salaries (
	emp_no INT,
	salary INT
);

CREATE TABLE titles (
	title_id VARCHAR,
	title VARCHAR
);

-- View all from the tables
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;


