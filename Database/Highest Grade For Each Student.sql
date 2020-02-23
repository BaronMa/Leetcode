Create table If Not Exists Enrollments (student_id int, course_id int, grade int)
Truncate table Enrollments
insert into Enrollments (student_id, course_id, grade) values ('2', '2', '95')
insert into Enrollments (student_id, course_id, grade) values ('2', '3', '95')
insert into Enrollments (student_id, course_id, grade) values ('1', '1', '90')
insert into Enrollments (student_id, course_id, grade) values ('1', '2', '99')
insert into Enrollments (student_id, course_id, grade) values ('3', '1', '80')
insert into Enrollments (student_id, course_id, grade) values ('3', '2', '75')
insert into Enrollments (student_id, course_id, grade) values ('3', '3', '82')

# (student_id, course_id) is the primary key of this table.

# Write a SQL query to find the highest grade with its corresponding course for each student. In case of a tie, you should 
# find the course with the smallest course_id. The output must be sorted by increasing student_id.

# MySQL
SELECT t.student_id, MIN(t.course_id) AS course_id, t.grade
FROM Enrollments t
WHERE (t.student_id, t.grade) IN
(
SELECT student_id, MAX(grade) AS grade
FROM Enrollments
GROUP BY student_id
)
GROUP BY t.student_id
ORDER BY student_id

# Use subquery to match the pair of student_id and its corresponding highest grade, then select the course id, if there is a 
# tie of the same highest grade of different courses, return the minimal course_id.

# Runtime: 988 ms, faster than 20.17% of MS SQL Server online submissions

# MS SQL
select student_id, min(course_id) as course_id, grade
from
(select student_id, course_id, grade, rank() over(partition by student_id order by grade desc) as rank
from Enrollments) a
where rank = 1
group by student_id, grade
order by student_id

# Use window function to rank the grade in desc order partition by student_id, and select the samples whose grade rank no.1
# after grouping by student_id and corresponding grade.

# Runtime: 3635 ms, faster than 17.17% of MS SQL Server online submissions
