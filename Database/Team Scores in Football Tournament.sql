Create table If Not Exists Teams (team_id int, team_name varchar(30))
Create table If Not Exists Matches (match_id int, host_team int, guest_team int, host_goals int, guest_goals int)
Truncate table Teams
insert into Teams (team_id, team_name) values ('10', 'Leetcode FC')
insert into Teams (team_id, team_name) values ('20', 'NewYork FC')
insert into Teams (team_id, team_name) values ('30', 'Atlanta FC')
insert into Teams (team_id, team_name) values ('40', 'Chicago FC')
insert into Teams (team_id, team_name) values ('50', 'Toronto FC')
# team_id is the primary key of this table.
# Each row of this table represents a single football team.

Truncate table Matches
insert into Matches (match_id, host_team, guest_team, host_goals, guest_goals) values ('1', '10', '20', '30', '0')
insert into Matches (match_id, host_team, guest_team, host_goals, guest_goals) values ('2', '30', '10', '2', '2')
insert into Matches (match_id, host_team, guest_team, host_goals, guest_goals) values ('3', '10', '50', '5', '1')
insert into Matches (match_id, host_team, guest_team, host_goals, guest_goals) values ('4', '20', '30', '1', '0')
insert into Matches (match_id, host_team, guest_team, host_goals, guest_goals) values ('5', '50', '30', '1', '0')

# match_id is the primary key of this table.
# Each row is a record of a finished match between two different teams. 
# Teams host_team and guest_team are represented by their IDs in the teams table (team_id) and they scored host_goals and 
# guest_goals goals respectively.

# You would like to compute the scores of all teams after all matches. Points are awarded as follows:
# A team receives three points if they win a match (Score strictly more goals than the opponent team).
# A team receives one point if they draw a match (Same number of goals as the opponent team).
# A team receives no points if they lose a match (Score less goals than the opponent team).

# Write an SQL query that selects the team_id, team_name and num_points of each team in the tournament after all described 
# matches. Result table should be ordered by num_points (decreasing order). In case of a tie, order the records by team_id 
# (increasing order).

WITH cte AS
(
    SELECT match_id, host_team, guest_team,
           case when host_goals > guest_goals then 3
                when host_goals < guest_goals then 0
                when host_goals = guest_goals then 1 end AS host_goals_score,
           case when guest_goals > host_goals then 3
                when guest_goals < host_goals then 0
                when guest_goals = host_goals then 1 end AS guest_goals_score
    FROM Matches
)

SELECT t.team_id, t.team_name, COALESCE((SUM(t2.scores)), 0) AS num_points
FROM Teams t
LEFT JOIN
(SELECT host_team AS team, SUM(host_goals_score) AS scores
FROM cte
GROUP BY host_team
UNION ALL
SELECT guest_team AS team, SUM(guest_goals_score) as scores
from cte
GROUP BY guest_team) t2
ON t.team_id = t2.team
GROUP BY t.team_id, t.team_name
ORDER BY num_points DESC, t.team_id

# At first, built a with table to calculate the host and guest scores for each game using case when expression; then use union 
# all to merge two tables with team id and scores. Left join the merged table to the Team table and use coalesce function to 
# return score or 0.

# Runtime: 841 ms, faster than 69.92% of MS SQL Server online submissions 
