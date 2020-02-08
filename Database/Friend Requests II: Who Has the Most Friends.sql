# In social network like Facebook or Twitter, people send friend requests and accept others' requests as well.
# {"headers":{"request_accepted":["requester_id","accepter_id","accept_date"]},"rows":{"request_accepted":[[1,2,"2016/06/03"],
# [1,3,"2016/06/08"],[2,3,"2016/06/08"],[3,4,"2016/06/09"]]}}
# This table holds the data of friend acceptance, while requester_id and accepter_id both are the id of a person.

# Write a query to find the the people who has most friends and the most friends number under the following rules:

# It is guaranteed there is only 1 people having the most friends.
# The friend request could only been accepted once, which mean there is no multiple records with the same requester_id and accepter_id value.

# Write your MySQL query statement below
SELECT temp1.id1 AS id, CASE WHEN temp1.id1=temp2.id2 THEN temp1.num1+temp2.num2
                             WHEN temp1.id1 THEN temp1.num1
                             ELSE temp2.num2 END AS num
FROM 
(SELECT t1.requester_id AS id1, COUNT(t1.accepter_id) AS num1
 FROM request_accepted t1
 GROUP BY t1.requester_id) temp1,
 (SELECT t2.accepter_id AS id2, COUNT(t2.requester_id) AS num2
 FROM request_accepted t2
 GROUP BY t2.accepter_id) temp2
ORDER BY num DESC
LIMIT 1;

# Use cross join and case when condition to select the num we need.
# Runtime: 370 ms, faster than 54.74% of MySQL online submissions.
