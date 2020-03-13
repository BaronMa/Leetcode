CREATE TABLE If Not Exists point (x INT NOT NULL, UNIQUE INDEX x_UNIQUE (x ASC))
Truncate table point
insert into point (x) values ('-1')
insert into point (x) values ('0')
insert into point (x) values ('2')
/* Table point holds the x coordinate of some points on x-axis in a plane, which are all integers. */

/* Note: Every point is unique, which means there is no duplicates in table point.*/

/* Write a query to find the shortest distance between two points in these points.*/

SELECT MIN(ABS(t1.x-t2.x)) AS shortest
FROM point t1
LEFT JOIN point t2
ON t1.x <> t2.x

/* To get the distances of each two points, we need to join this table with itself and use ABS() function since the distance 
is nonnegative. */

/* Runtime: 775 ms, faster than 68.85% of MS SQL Server online submissions */
