Create table If Not Exists Activity (player_id int, device_id int, event_date date, games_played int)
Truncate table Activity
insert into Activity (player_id, device_id, event_date, games_played) values ('1', '2', '2016-03-01', '5')
insert into Activity (player_id, device_id, event_date, games_played) values ('1', '2', '2016-03-02', '6')
insert into Activity (player_id, device_id, event_date, games_played) values ('2', '3', '2017-06-25', '1')
insert into Activity (player_id, device_id, event_date, games_played) values ('3', '1', '2016-03-02', '0')
insert into Activity (player_id, device_id, event_date, games_played) values ('3', '4', '2018-07-03', '5')

# (player_id, event_date) is the primary key of this table.
# This table shows the activity of players of some game.
# Each row is a record of a player who logged in and played a number of games (possibly 0) before logging out on some day 
# using some device.

# Write an SQL query that reports the fraction of players that logged in again on the day after the day they first logged in, 
# rounded to 2 decimal places. In other words, you need to count the number of players that logged in for at least two 
# consecutive days starting from their first login date, then divide that number by the total number of players.

SELECT ROUND(COUNT(t1.player_id) / 
			(SELECT COUNT(DISTINCT player_id) FROM activity), 2) AS fraction
FROM activity t1
JOIN (SELECT player_id, MIN(event_date) AS firstday 
           FROM activity 
           GROUP BY player_id) t2
ON t1.player_id = t2.player_id AND DATEDIFF(event_date, firstday) = 1 

# Use Join and DATEDIFF to solve this problem. Runtime: 669 ms, faster than 84.22% of MySQL online submissions.
