Create table If Not Exists Departments (id int, name varchar(30))
Create table If Not Exists Students (id int, name varchar(30), department_id int)
Truncate table Departments
insert into Departments (id, name) values ('1', 'Electrical Engineering')
insert into Departments (id, name) values ('7', 'Computer Engineering')
insert into Departments (id, name) values ('13', 'Bussiness Administration')
# id is the primary key of this table. The table has information about the id of each department of a university.

Truncate table Students
insert into Students (id, name, department_id) values ('23', 'Alice', '1')
insert into Students (id, name, department_id) values ('1', 'Bob', '7')
insert into Students (id, name, department_id) values ('5', 'Jennifer', '13')
insert into Students (id, name, department_id) values ('2', 'John', '14')
insert into Students (id, name, department_id) values ('4', 'Jasmine', '77')
insert into Students (id, name, department_id) values ('3', 'Steve', '74')
insert into Students (id, name, department_id) values ('6', 'Luis', '1')
insert into Students (id, name, department_id) values ('8', 'Jonathan', '7')
insert into Students (id, name, department_id) values ('7', 'Daiana', '33')
insert into Students (id, name, department_id) values ('11', 'Madelynn', '1')
# id is the primary key of this table. The table has information about the id of each student at a university and the id of the department he/she studies at.

# Write an SQL query to find the id and the name of all students who are enrolled in departments that no longer exists.

# Return the result table in any order.

SELECT t1.id, t1.name
FROM 
(  
    SELECT S.id, S.name, D.name as dep
    FROM Students S
    LEFT JOIN Departments D ON S.department_id = D.id) t1
WHERE t1.dep IS NULL

# At first, left join Department table to Student table by the department_id of Student and id of Department, so that there
# will be a column the name of Department occurs NULL. The we can deal with this query as a subquery to select the id and name
# when that column has NULL.

# Runtime: 466 ms, faster than 64.32% of MySQL online submissions
