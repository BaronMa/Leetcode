Create table If Not Exists Candidate (id int, Name varchar(255))
Create table If Not Exists Vote (id int, CandidateId int)
Truncate table Candidate
insert into Candidate (id, Name) values ('1', 'A')
insert into Candidate (id, Name) values ('2', 'B')
insert into Candidate (id, Name) values ('3', 'C')
insert into Candidate (id, Name) values ('4', 'D')
insert into Candidate (id, Name) values ('5', 'E')
Truncate table Vote
insert into Vote (id, CandidateId) values ('1', '2')
insert into Vote (id, CandidateId) values ('2', '4')
insert into Vote (id, CandidateId) values ('3', '3')
insert into Vote (id, CandidateId) values ('4', '2')
insert into Vote (id, CandidateId) values ('5', '5')

# id is the auto-increment primary key,
# CandidateId is the id appeared in Candidate table.

# Write a sql to find the name of the winning candidate, the above example will return the winner B.

SELECT C.Name
FROM
(
    SELECT CandidateId, COUNT(CandidateId) AS number
    FROM Vote
    GROUP BY CandidateId) t1
LEFT JOIN Candidate C
ON t1.CandidateId=C.id
ORDER BY number DESC
LIMIT 1

# Use subquery to select the candidate id and the vote number of each candidate, then left join it with Candidate to get the 
# name of each candidate. Desplay the first sample by sort the new table by descending order of the vote number.

# Runtime: 745 ms, faster than 19.74% of MySQL online submissions
