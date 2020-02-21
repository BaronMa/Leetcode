# Write an SQL query that reports for every date within at most 90 days from today, the number of users that logged in for 
# the first time on that date. Assume today is 2019-06-30.

Create table If Not Exists Traffic (user_id int, activity ENUM('login', 'logout', 'jobs', 'groups', 'homepage'), activity_date date)
Truncate table Traffic
insert into Traffic (user_id, activity, activity_date) values ('1', 'login', '2019-05-01')
insert into Traffic (user_id, activity, activity_date) values ('1', 'homepage', '2019-05-01')
insert into Traffic (user_id, activity, activity_date) values ('1', 'logout', '2019-05-01')
insert into Traffic (user_id, activity, activity_date) values ('2', 'login', '2019-06-21')
insert into Traffic (user_id, activity, activity_date) values ('2', 'logout', '2019-06-21')
insert into Traffic (user_id, activity, activity_date) values ('3', 'login', '2019-01-01')
insert into Traffic (user_id, activity, activity_date) values ('3', 'jobs', '2019-01-01')
insert into Traffic (user_id, activity, activity_date) values ('3', 'logout', '2019-01-01')
insert into Traffic (user_id, activity, activity_date) values ('4', 'login', '2019-06-21')
insert into Traffic (user_id, activity, activity_date) values ('4', 'groups', '2019-06-21')
insert into Traffic (user_id, activity, activity_date) values ('4', 'logout', '2019-06-21')
insert into Traffic (user_id, activity, activity_date) values ('5', 'login', '2019-03-01')
insert into Traffic (user_id, activity, activity_date) values ('5', 'logout', '2019-03-01')
insert into Traffic (user_id, activity, activity_date) values ('5', 'login', '2019-06-21')
insert into Traffic (user_id, activity, activity_date) values ('5', 'logout', '2019-06-21')

# There is no primary key for this table, it may have duplicate rows.
# The activity column is an ENUM type of ('login', 'logout', 'jobs', 'groups', 'homepage').

SELECT temp2.date AS login_date, COUNT(temp2.user_id) AS user_count
FROM
(
SELECT MIN(temp.activity_date) AS date, temp.user_id
FROM 
(
SELECT t.user_id, t.activity_date
FROM Traffic t
WHERE t.user_id NOT IN
(
SELECT DISTINCT user_id
FROM Traffic
WHERE activity_date < '20190401' AND activity='login'
GROUP BY user_id)
AND t.activity = 'login') temp
GROUP BY temp.user_id) temp2
GROUP BY temp2.date
ORDER BY temp2.date

# Use sub-subarray, at first subarray, we exclude the users that login before 20190401 and activity isn't 'login', then in the 
# second subarray, we select the different user_id with the ealiest login date, finally by grouping all the login date, we can 
# count the number of users at the same login date.

# Runtime: 541 ms, faster than 78.78% of MySQL online submissions.

