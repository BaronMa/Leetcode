Create table If Not Exists Submissions (sub_id int, parent_id int)
Truncate table Submissions
insert into Submissions (sub_id, parent_id) values ('1', 'None')
insert into Submissions (sub_id, parent_id) values ('2', 'None')
insert into Submissions (sub_id, parent_id) values ('1', 'None')
insert into Submissions (sub_id, parent_id) values ('12', 'None')
insert into Submissions (sub_id, parent_id) values ('3', '1')
insert into Submissions (sub_id, parent_id) values ('5', '2')
insert into Submissions (sub_id, parent_id) values ('3', '1')
insert into Submissions (sub_id, parent_id) values ('4', '1')
insert into Submissions (sub_id, parent_id) values ('9', '1')
insert into Submissions (sub_id, parent_id) values ('10', '2')
insert into Submissions (sub_id, parent_id) values ('6', '7')

# There is no primary key for this table, it may have duplicate rows.
# Each row can be a post or comment on the post. parent_id is null for posts. parent_id for comments is sub_id for another post in the table.

# Write an SQL query to find number of comments per each post.

# Result table should contain post_id and its corresponding number_of_comments, and must be sorted by post_id in ascending order.

# Submissions may contain duplicate comments. You should count the number of unique comments per post.

# Submissions may contain duplicate posts. You should treat them as one post.

SELECT temp1.sub_id as post_id, COUNT(DISTINCT S.sub_id) AS number_of_comments
FROM
(SELECT DISTINCT sub_id
FROM Submissions
WHERE parent_id IS NULL) temp1
LEFT JOIN Submissions S
ON temp1.sub_id = S.parent_id
GROUP BY temp1.sub_id
ORDER BY post_id

# At first, select the id of posts, then use left join to join all the comments to each post and count the number of distinct
# comments for each post.

# Runtime: 1167 ms, faster than 71.16% of MySQL online submissions
