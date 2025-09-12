Solve PostgresSQL questions with window function on Employee Department schema

Q 1.Rank employees by salary using window function.

Explain: In  here RANK asign Rank number to each raw and the over(order by salary desc) part
 tell the postgreSQL, that short employee salary in descending order (highest->lowest)
 then assign rank number accordingly.
 In here inside the over () Parenthesis exicute first.
 
Q 2.Rank employees by salary within each department.
Explain: partion by dept_id or dept_name:it create a seperate window, for each department by dept_name or dept_id and name or id are shorted alphabetical order. Inside each department window, employees are ranked based on their salary and join employee table with department table with employee.dept_id corresponding to department.dept_id

Some change is good