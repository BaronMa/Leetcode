Create table If Not Exists UserActivity (username varchar(30), activity varchar(30), startDate date, endDate date)
Truncate table UserActivity
insert into UserActivity (username, activity, startDate, endDate) values ('Alice', 'Travel', '2020-02-12', '2020-02-20')
insert into UserActivity (username, activity, startDate, endDate) values ('Alice', 'Dancing', '2020-02-21', '2020-02-23')
insert into UserActivity (username, activity, startDate, endDate) values ('Alice', 'Travel', '2020-02-24', '2020-02-28')
insert into UserActivity (username, activity, startDate, endDate) values ('Bob', 'Travel', '2020-02-11', '2020-02-18')
/*
This table does not contain primary key.
This table contain information about the activity performed of each user in a period of time.
A person with username performed a activity from startDate to endDate.
*/

/*
Write an SQL query to show the second most recent activity of each user.

If the user only has one activity, return that one. 

A user can't perform more than one activity at the same time. Return the result table in any order.
*/

SELECT username, activity, startDate, endDate
FROM 
(
    SELECT *, RANK() OVER (PARTITION BY username ORDER BY endDate DESC) AS rank, 
           COUNT(activity) OVER (PARTITION BY username) AS total
    FROM UserActivity
) t1
WHERE rank = 2 OR total = 1

/*
Use the subquery to rank the endDate partition by username, and get the total number of activities for each user. Then select 
the second most recent activity for each user if he/she has, or select the only activity fro the user.

Runtime: 950 ms, faster than 41.05% of MS SQL Server online submissions.
*/
