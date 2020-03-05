Create table If Not Exists Employees (employee_id int, employee_name varchar(30), manager_id int)
Truncate table Employees
insert into Employees (employee_id, employee_name, manager_id) values ('1', 'Boss', '1')
insert into Employees (employee_id, employee_name, manager_id) values ('3', 'Alice', '3')
insert into Employees (employee_id, employee_name, manager_id) values ('2', 'Bob', '1')
insert into Employees (employee_id, employee_name, manager_id) values ('4', 'Daniel', '2')
insert into Employees (employee_id, employee_name, manager_id) values ('7', 'Luis', '4')
insert into Employees (employee_id, employee_name, manager_id) values ('8', 'John', '3')
insert into Employees (employee_id, employee_name, manager_id) values ('9', 'Angela', '8')
insert into Employees (employee_id, employee_name, manager_id) values ('77', 'Robert', '1')

# employee_id is the primary key for this table.
# Each row of this table indicates that the employee with ID employee_id and name employee_name reports his work to his/her 
# direct manager with manager_id
# The head of the company is the employee with employee_id = 1.

# Write an SQL query to find employee_id of all employees that directly or indirectly report their work to the head of the company.

# The indirect relation between managers will not exceed 3 managers as the company is small.

# Return result table in any order without duplicates.

SELECT employee_id
FROM Employees 
WHERE manager_id in (
    SELECT employee_id 
    FROM Employees
    WHERE manager_id IN (
        SELECT employee_id FROM Employees
        WHERE manager_id=1))
AND employee_id<>1

# Use two subqueries, the first subquery is to select the employees who report to the head directly (including the head himself);
# The second subquery is to select the employees who report to the managers who report to the head and these managers; The main 
# query is to select the employees who report to the employees above and the managers and the head.

# Runtime: 222 ms, faster than 68.98% of MySQL online submissions
