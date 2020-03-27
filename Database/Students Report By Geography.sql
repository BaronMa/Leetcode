Create table If Not Exists student (name varchar(50), continent varchar(7))
Truncate table student
insert into student (name, continent) values ('Jane', 'America')
insert into student (name, continent) values ('Pascal', 'Europe')
insert into student (name, continent) values ('Xi', 'Asia')
insert into student (name, continent) values ('Jack', 'America')
/*
A U.S graduate school has students from Asia, Europe and America. The students' location information are stored in table 
student as below.

Pivot the continent column in this table so that each name is sorted alphabetically and displayed underneath its corresponding 
continent. The output headers should be America, Asia and Europe respectively. It is guaranteed that the student number from 
America is no less than either Asia or Europe.
*/

/* Write your T-SQL query statement below*/
SELECT MAX(America) as America, MAX(Asia) as Asia, MAX(Europe) as Europe
FROM (
SELECT Id,
       CASE when continent = 'America' THEN name ELSE NULL END as America,
       CASE when continent = 'Asia' THEN name ELSE NULL END as Asia,
       CASE when continent = 'Europe' THEN name ELSE NULL END as Europe
FROM 
(
    SELECT name, continent, row_number() OVER (PARTITION BY continent ORDER BY name) AS Id
    FROM student
) t1) t2
GROUP BY t2.Id;

/*
At first, build four columns, id, America, Asia, Europe with names and the rank of names. Then group by id, for each id, select
maximum values in America, Asia and Europe, which is used for avoid NULL values generated in last step.

Runtime: 869 ms, faster than 60.00% of MS SQL Server online submissions 
*/
