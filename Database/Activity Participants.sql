Create table If Not Exists Friends (id int, name varchar(30), activity varchar(30))
Create table If Not Exists Activities (id int, name varchar(30))
Truncate table Friends
insert into Friends (id, name, activity) values ('1', 'Jonathan D.', 'Eating')
insert into Friends (id, name, activity) values ('2', 'Jade W.', 'Singing')
insert into Friends (id, name, activity) values ('3', 'Victor J.', 'Singing')
insert into Friends (id, name, activity) values ('4', 'Elvis Q.', 'Eating')
insert into Friends (id, name, activity) values ('5', 'Daniel A.', 'Eating')
insert into Friends (id, name, activity) values ('6', 'Bob B.', 'Horse Riding')
/*
id is the id of the friend and primary key for this table.
name is the name of the friend.
activity is the name of the activity which the friend takes part in.
*/

Truncate table Activities
insert into Activities (id, name) values ('1', 'Eating')
insert into Activities (id, name) values ('2', 'Singing')
insert into Activities (id, name) values ('3', 'Horse Riding')
/*
id is the primary key for this table.
name is the name of the activity.
*/

/*
Write an SQL query to find the names of all the activities with neither maximum, nor minimum number of participants.
Return the result table in any order. Each activity in table Activities is performed by any person in the table Friends.
*/

/* Write your T-SQL query statement below */
WITH CTE AS 
(
    SELECT a.name, RANK() OVER (ORDER BY COUNT(f.name) ASC) as rank_activity
    FROM Friends f
    RIGHT JOIN Activities a ON f.activity = a.name
    GROUP BY a.name
)

SELECT t.name AS activity
FROM CTE t
WHERE t.rank_activity != 1
AND t.rank_activity != (SELECT MAX(rank_activity) FROM CTE);

*/
At first, build a temportary view to include the rank of the number of participants for each activity. In order to include all
the activities, for example, if there exist activities without participants, the activity wouldn't occur in table Friends.
Then select activity excluding the activities with the minimum and the maximum participants.

Runtime: 836 ms, faster than 56.90% of MS SQL Server online submissions
*/
