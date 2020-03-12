Create table If Not Exists Friendship (user1_id int, user2_id int)
Create table If Not Exists Likes (user_id int, page_id int)
Truncate table Friendship
insert into Friendship (user1_id, user2_id) values ('1', '2')
insert into Friendship (user1_id, user2_id) values ('1', '3')
insert into Friendship (user1_id, user2_id) values ('1', '4')
insert into Friendship (user1_id, user2_id) values ('2', '3')
insert into Friendship (user1_id, user2_id) values ('2', '4')
insert into Friendship (user1_id, user2_id) values ('2', '5')
insert into Friendship (user1_id, user2_id) values ('6', '1')
# (user1_id, user2_id) is the primary key for this table.
# Each row of this table indicates that there is a friendship relation between user1_id and user2_id.

Truncate table Likes
insert into Likes (user_id, page_id) values ('1', '88')
insert into Likes (user_id, page_id) values ('2', '23')
insert into Likes (user_id, page_id) values ('3', '24')
insert into Likes (user_id, page_id) values ('4', '56')
insert into Likes (user_id, page_id) values ('5', '11')
insert into Likes (user_id, page_id) values ('6', '33')
insert into Likes (user_id, page_id) values ('2', '77')
insert into Likes (user_id, page_id) values ('3', '77')
insert into Likes (user_id, page_id) values ('6', '88')
# (user_id, page_id) is the primary key for this table.
# Each row of this table indicates that user_id likes page_id.

# Write an SQL query to recommend pages to the user with user_id = 1 using the pages that your friends liked. It should not 
# recommend pages you already liked.

# Return result table in any order without duplicates.

SELECT DISTINCT L.page_id AS recommended_page
FROM Likes L
WHERE L.user_id IN (
    SElECT t1.user2_id AS user_id
    FROM Friendship t1
    WHERE t1.user1_id=1
    UNION
    SELECT t2.user1_id AS user_id
    FROM Friendship t2
    WHERE t2.user2_id=1
    ) 
AND L.page_id NOT IN (
    SELECT page_id
    FROM Likes
    WHERE user_id = 1)
    
# Use a subquery to select the friends of user_id 1 (there we need to use UNION to merge two tables). And then select distinct
# lage_id liked by these friends but exclude those pages liked by user_id 1.

# Runtime: 265 ms, faster than 80.34% of MySQL online submissions
