Create table If Not Exists Scores (player_name varchar(20), gender varchar(1), day date, score_points int)
Truncate table Scores
insert into Scores (player_name, gender, day, score_points) values ('Aron', 'F', '2020-01-01', '17')
insert into Scores (player_name, gender, day, score_points) values ('Alice', 'F', '2020-01-07', '23')
insert into Scores (player_name, gender, day, score_points) values ('Bajrang', 'M', '2020-01-07', '7')
insert into Scores (player_name, gender, day, score_points) values ('Khali', 'M', '2019-12-25', '11')
insert into Scores (player_name, gender, day, score_points) values ('Slaman', 'M', '2019-12-30', '13')
insert into Scores (player_name, gender, day, score_points) values ('Joe', 'M', '2019-12-31', '3')
insert into Scores (player_name, gender, day, score_points) values ('Jose', 'M', '2019-12-18', '2')
insert into Scores (player_name, gender, day, score_points) values ('Priya', 'F', '2019-12-31', '23')
insert into Scores (player_name, gender, day, score_points) values ('Priyanka', 'F', '2019-12-30', '17')

/*
(gender, day) is the primary key for this table.
A competition is held between females team and males team.
Each row of this table indicates that a player_name and with gender has scored score_point in someday.
Gender is 'F' if the player is in females team and 'M' if the player is in males team.

Write an SQL query to find the total score for each gender at each day.

Order the result table by gender and day */

SELECT gender, day, SUM(score_points) OVER (PARTITION BY gender ORDER BY day) AS total
FROM Scores
ORDER BY gender, day

/* Calculating Running Total with OVER Clause and PARTITION BY Clause */

/* Runtime 2054 ms, faster than 43.40% of MS SQL Server online submissions */
