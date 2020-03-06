Create table If Not Exists Events (business_id int, event_type varchar(10), occurences int)
Truncate table Events
insert into Events (business_id, event_type, occurences) values ('1', 'reviews', '7')
insert into Events (business_id, event_type, occurences) values ('3', 'reviews', '3')
insert into Events (business_id, event_type, occurences) values ('1', 'ads', '11')
insert into Events (business_id, event_type, occurences) values ('2', 'ads', '7')
insert into Events (business_id, event_type, occurences) values ('3', 'ads', '6')
insert into Events (business_id, event_type, occurences) values ('1', 'page views', '3')
insert into Events (business_id, event_type, occurences) values ('2', 'page views', '12')

# (business_id, event_type) is the primary key of this table.
# Each row in the table logs the info that an event of some type occured at some business for a number of times.

# Write an SQL query to find all active businesses.

# An active business is a business that has more than one event type with occurences greater than the average occurences of 
# that event type among all businesses.

SELECT t2.business_id
FROM 
(
    SELECT E.business_id, E.event_type
    FROM Events E
    LEFT JOIN (
        SELECT event_type, AVG(occurences) AS average_occ
        FROM Events
        GROUP BY event_type) t1 USING(event_type)
    WHERE E.occurences > t1.average_occ
    GROUP BY E.business_id, E.event_type) t2
GROUP BY t2.business_id
HAVING COUNT(t2.event_type) > 1

# Use subqueries. At first get the average occurences for each event type, then join the new table with table Events using 
# event_type; choose the samples whose occurences are greater than the average occrences of corresponding event type; finally
# use subquery and group by to select the businesses which have more than one event type with occurences greater than the 
# average.

# Runtime: 621 ms, faster than 97.57% of MySQL online submissions
