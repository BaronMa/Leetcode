Create table If Not Exists Actions (user_id int, post_id int, action_date date, action ENUM('view', 'like', 'reaction', 'comment', 'report', 'share'), extra varchar(10))
create table if not exists Removals (post_id int, remove_date date)
Truncate table Actions
insert into Actions (user_id, post_id, action_date, action, extra) values ('1', '1', '2019-07-01', 'view', 'None')
insert into Actions (user_id, post_id, action_date, action, extra) values ('1', '1', '2019-07-01', 'like', 'None')
insert into Actions (user_id, post_id, action_date, action, extra) values ('1', '1', '2019-07-01', 'share', 'None')
insert into Actions (user_id, post_id, action_date, action, extra) values ('2', '2', '2019-07-04', 'view', 'None')
insert into Actions (user_id, post_id, action_date, action, extra) values ('2', '2', '2019-07-04', 'report', 'spam')
insert into Actions (user_id, post_id, action_date, action, extra) values ('3', '4', '2019-07-04', 'view', 'None')
insert into Actions (user_id, post_id, action_date, action, extra) values ('3', '4', '2019-07-04', 'report', 'spam')
insert into Actions (user_id, post_id, action_date, action, extra) values ('4', '3', '2019-07-02', 'view', 'None')
insert into Actions (user_id, post_id, action_date, action, extra) values ('4', '3', '2019-07-02', 'report', 'spam')
insert into Actions (user_id, post_id, action_date, action, extra) values ('5', '2', '2019-07-03', 'view', 'None')
insert into Actions (user_id, post_id, action_date, action, extra) values ('5', '2', '2019-07-03', 'report', 'racism')
insert into Actions (user_id, post_id, action_date, action, extra) values ('5', '5', '2019-07-03', 'view', 'None')
insert into Actions (user_id, post_id, action_date, action, extra) values ('5', '5', '2019-07-03', 'report', 'racism')

# There is no primary key for this table, it may have duplicate rows.
# The action column is an ENUM type of ('view', 'like', 'reaction', 'comment', 'report', 'share').
# The extra column has optional information about the action such as a reason for report or a type of reaction. 

Truncate table Removals
insert into Removals (post_id, remove_date) values ('2', '2019-07-20')
insert into Removals (post_id, remove_date) values ('3', '2019-07-18')

# post_id is the primary key of this table.
# Each row in this table indicates that some post was removed as a result of being reported or as a result of an admin review.

# Write an SQL query to find the average for daily percentage of posts that got removed after being reported as spam, rounded 
# to 2 decimal places.

SELECT ROUND(AVG(Sep) * 100,2) AS average_daily_percent
FROM
(
SELECT SUM(t1.removal)/COUNT(t1.removal) AS Sep
FROM
(
SELECT DISTINCT post_id, action_date, 
       CASE WHEN remove_date IS NULL THEN 0
            ELSE 1
            END AS removal
FROM Actions
LEFT JOIN Removals
USING(post_id)
WHERE Actions.extra='spam') t1
GROUP BY t1.action_date) t2

# Use two subqueries to solve this question. At first, left join Removals table to Actions using post_id and use case when to
# set conditions that if a email which is a spam is reomved, the set 1, else 0; Then get the percentage of removal email of
# each day; finally, get the daily percentage by windows function avg.

# Runtime: 648 ms, faster than 82.45% of MySQL online submissions
