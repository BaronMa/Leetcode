Create table If Not Exists Queue (person_id int, person_name varchar(30), weight int, turn int)
Truncate table Queue
insert into Queue (person_id, person_name, weight, turn) values ('5', 'George Washington', '250', '1')
insert into Queue (person_id, person_name, weight, turn) values ('4', 'Thomas Jefferson', '175', '5')
insert into Queue (person_id, person_name, weight, turn) values ('3', 'John Adams', '350', '2')
insert into Queue (person_id, person_name, weight, turn) values ('6', 'Thomas Jefferson', '400', '3')
insert into Queue (person_id, person_name, weight, turn) values ('1', 'James Elephant', '500', '6')
insert into Queue (person_id, person_name, weight, turn) values ('2', 'Will Johnliams', '200', '4')

/* person_id is the primary key column for this table.
This table has the information about all people waiting for an elevator.
The person_id and turn columns will contain all numbers from 1 to n, where n is the number of rows in the table.

The maximum weight the elevator can hold is 1000.

Write an SQL query to find the person_name of the last person who will fit in the elevator without exceeding the weight limit. 
It is guaranteed that the person who is first in the queue can fit in the elevator. */

/* Write your T-SQL query statement below */
SELECT TOP 1 t1.person_name
FROM (
    SELECT person_name, weight, turn, SUM(weight) OVER (ORDER BY turn) AS sum_weight
    FROM Queue) t1
WHERE t1.sum_weight <= 1000
ORDER BY t1.sum_weight DESC

/* At first, calculate running total with OVER Clause to form a subquery, then select the person_name form this subquery where
sum_weight less than or equal to 1000, sort the samples according to sum_weight by DESC order and just display the first 
name.*/

/* Runtime: 1418 ms, faster than 95.71% of MS SQL Server online submissions */
