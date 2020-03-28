Create table If Not Exists Employee (Id int, Name varchar(255), Salary int, DepartmentId int)
Create table If Not Exists Department (Id int, Name varchar(255))
Truncate table Employee
insert into Employee (Id, Name, Salary, DepartmentId) values ('1', 'Joe', '85000', '1')
insert into Employee (Id, Name, Salary, DepartmentId) values ('2', 'Henry', '80000', '2')
insert into Employee (Id, Name, Salary, DepartmentId) values ('3', 'Sam', '60000', '2')
insert into Employee (Id, Name, Salary, DepartmentId) values ('4', 'Max', '90000', '1')
insert into Employee (Id, Name, Salary, DepartmentId) values ('5', 'Janet', '69000', '1')
insert into Employee (Id, Name, Salary, DepartmentId) values ('6', 'Randy', '85000', '1')
insert into Employee (Id, Name, Salary, DepartmentId) values ('7', 'Will', '70000', '1')
/*
The Employee table holds all employees. Every employee has an Id, and there is also a column for the department Id.
*/

Truncate table Department
insert into Department (Id, Name) values ('1', 'IT')
insert into Department (Id, Name) values ('2', 'Sales')
/*
The Department table holds all departments of the company.

Write a SQL query to find employees who earn the top three salaries in each of the department. For the above tables, your SQL 
query should return the following rows (order of rows does not matter).
*/

/* Write your T-SQL query statement below */
SELECT Department, Employee, Salary
FROM 
(
    SELECT t1.Name AS Employee, t1.Salary, t2.Name AS Department, 
           DENSE_RANK() OVER (PARTITION BY t2.Name ORDER BY t1.Salary DESC) AS rank
    FROM Employee t1
    JOIN Department t2 ON t1.DepartmentId = t2.Id
) temp1
WHERE rank <= 3;

/*
Since we need to select top three highest salary, DENSE_RANK() should be used to build rank partitioned by Department for each 
employee. Consider either the Employee table or Department table may be empty, JOIN should be used.

Runtime: 1141 ms, faster than 51.03% of MS SQL Server online submissions.
*/

