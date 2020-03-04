CREATE TABLE IF NOT EXISTS student (student_id INT,student_name VARCHAR(45), gender VARCHAR(6), dept_id INT)
CREATE TABLE IF NOT EXISTS department (dept_id INT, dept_name VARCHAR(255))
Truncate table student
insert into student (student_id, student_name, gender, dept_id) values ('1', 'Jack', 'M', '1')
insert into student (student_id, student_name, gender, dept_id) values ('2', 'Jane', 'F', '1')
insert into student (student_id, student_name, gender, dept_id) values ('3', 'Mark', 'M', '2')
Truncate table department
insert into department (dept_id, dept_name) values ('1', 'Engineering')
insert into department (dept_id, dept_name) values ('2', 'Science')
insert into department (dept_id, dept_name) values ('3', 'Law')

# A university uses 2 data tables, student and department, to store data about its students and the departments associated 
# with each major.

# Write a query to print the respective department name and number of students majoring in each department for all departments 
# in the department table (even ones with no current students).

# Sort your results by descending number of students; if two or more departments have the same number of students, then sort 
# those departments alphabetically by department name.

SELECT dd.dept_name, IFNULL(temp.number, 0) AS student_number
FROM
(
SELECT d.dept_name, COUNT(s.student_id) AS number
FROM student s
LEFT JOIN department d
USING (dept_id)
GROUP BY s.dept_id) temp
RIGHT JOIN department dd
ON temp.dept_name = dd.dept_name
ORDER BY student_number DESC, dd.dept_name

# At first, left join department to student, but in this case, if all the students are not in all the departments, the department
# without students won't be displayed. Then right join the department table to the former table, use ifnull in select to display
# those departments without students as 0.

# Runtime: 654 ms, faster than 61.21% of MySQL online submissions
