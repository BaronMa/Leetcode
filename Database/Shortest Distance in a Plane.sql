CREATE TABLE If Not Exists point_2d (x INT NOT NULL, y INT NOT NULL)
Truncate table point_2d
insert into point_2d (x, y) values ('-1', '-1')
insert into point_2d (x, y) values ('0', '0')
insert into point_2d (x, y) values ('-1', '-2')

# Table point_2d holds the coordinates (x,y) of some unique points (more than two) in a plane.
# Write a query to find the shortest distance between these points rounded to 2 decimals.

SELECT MIN(ROUND(SQRT(POW(t1.x-t2.x,2) + POW(t1.y-t2.y,2)),2)) AS shortest
FROM point_2d t1
CROSS JOIN point_2d t2
ON !(t1.x = t2.x AND t1.y=t2.y)

# We need to calculate the euclidean distance. So in order to get the distances, we can join this table with itself, and then
# utilize the built-in function POW() and SQRT().

# Runtime: 254 ms, faster than 59.45% of MySQL online submissions
