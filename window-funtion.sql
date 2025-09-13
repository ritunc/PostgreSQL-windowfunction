-- Creating employee Employee Department Schema
  create table Department(
        dept_id serial primary key,
        dept_name varchar(50)
  );

  create table Employee(
        emp_id SERIAL PRIMARY KEY,
    emp_name VARCHAR(50),
    salary NUMERIC(10,2),
    dept_id INT REFERENCES Department(dept_id),
    join_date DATE

  );

  insert into Department (dept_name) values
('HR'), ('IT'), ('Finance'), ('Sales');


insert into Employee (emp_name, salary, dept_id, join_date) values
('Alice', 50000, 1, '2020-01-15'),
('Bob', 60000, 2, '2019-03-20'),
('Charlie', 55000, 2, '2021-06-11'),
('David', 45000, 3, '2018-11-01'),
('Eva', 70000, 2, '2020-12-01'),
('Frank', 40000, 1, '2019-07-23'),
('Grace', 75000, 4, '2021-02-14'),
('Helen', 72000, 4, '2018-05-30'),
('Ian', 68000, 3, '2020-08-19'),
('Jack', 52000, 1, '2021-09-25');

-- select * from employee e join department d on e.dept_id = d.dept_id;
Solve PostgreSQL questions with window function On Employee & Department Schema

Q1.Rank employees by salary using window function.

select emp_id, emp_name, salary, 
rank() over (order by salary desc) as salary_rank 
from employee;



Q2.Rank employees by salary within each department

select emp_name, dept_id, salary, 
rank() over (partition by dept_id order by salary desc) as dep_rank
from employee;

select e.emp_name, d.dept_name, d.dept_id, e.salary, 
rank() over (partition by d.dept_name order by e.salary desc) as dep_rank
from employee e join department d on e.dept_id = d.dept_id;



Q3. Find the top 2 highest-paid employees in each department

-- Wrong method
select emp_name, dept_id, salary, 
rank() over (partition by dept_id order by salary desc) as rnk
from employee where rnk <=2;

-- Using CTE
with ranked as (
    select emp_name, dept_id, salary,
           rank() over (partition by dept_id order by salary desc) as rnk
    from employee
)
SELECT DISTINCT ON (salary) emp_name, dept_id, salary, rnk
FROM ranked
where rnk <= 3;

-- Using Derived Table (Subquery in FROM)
SELECT *
FROM (
    SELECT emp_name, dept_id, salary,
           rank() OVER (PARTITION BY dept_id ORDER BY salary DESC) AS rnk
    FROM employee
) t
WHERE rnk <= 2;
