Solve PostgresSQL questions with window function on Employee Department schema

Q 1.Rank employees by salary using window function.

Explain: In  here RANK asign Rank number to each raw and the over(order by salary desc) part
 tell the postgreSQL, that short employee salary in descending order (highest->lowest)
 then assign rank number accordingly.
 In here inside the over () Parenthesis exicute first.
 
Q 2.Rank employees by salary within each department.
Explain: partion by dept_id or dept_name:it create a seperate window, for each department by dept_name or dept_id and name or id are shorted alphabetical order. Inside each department window, employees are ranked based on their salary and join employee table with department table with employee.dept_id corresponding to department.dept_id

Q 3.Find the top 2 highest-paid employees in each department

Recently, I was working on a query to fetch the top 2 highest-paid employees from each department.
 At first, I wrote something like this ⬇️

SELECT emp_name, dept_id, salary,
 RANK() OVER (PARTITION BY dept_id ORDER BY salary DESC) AS rnk
FROM employee
WHERE rnk <= 2;
❌ But here’s the catch:
 You can’t use a window function alias in the WHERE clause directly.
So what’s the solution?
 👉 Use a CTE (WITH clause) or a Derived Table (Subquery in FROM).
💡 After exploring both, here’s what I found:
🔹 CTE (WITH)
 ✅ Improves readability
 ✅ Can be reused multiple times in the same query
 ✅ Easier to debug in complex queries
🔹 Derived Table (Subquery)
 ⚡ Inline, one-time use
 ⚡ Sometimes slightly better performance (depends on optimizer)
 ⚡ Can get messy if reused multiple times
📌 My takeaway: For clean, reusable, and maintainable queries → CTE wins most of the time!
💬 What about you? Do you prefer CTEs or Derived Tables when working with window functions?