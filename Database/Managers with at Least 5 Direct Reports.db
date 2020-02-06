# The Employee table holds all employees including their managers. Every employee has an Id, and there is also a column 
# for the manager Id.

{"headers": {"Employee": ["Id", "Name", "Department", "ManagerId"]}, "rows": {"Employee": [[101, "John", "A", null],
[102, "Dan", "A", 101], [103, "James", "A", 101], [104, "Amy", "A", 101], [105, "Anne", "A", 101], [106, "Ron", "B", 101], 
[107, "Tom", "A", 102], [108, "Tommy", "A", 102], [109, "Peter", "C", 102]]}}

SELECT t1.Name
FROM Employee t1
INNER JOIN
(
 SELECT t2.ManagerId
 FROM Employee t2
 GROUP BY t2.ManagerId
 HAVING COUNT(*)>=5
) temp
ON t1.Id=temp.ManagerId

# It is a very easy join practice, we can also use where in (subquery) to solve this problem.

# Runtime: 201 ms, faster than 99.68% of MySQL online submissions for Managers with at Least 5 Direct Reports.
