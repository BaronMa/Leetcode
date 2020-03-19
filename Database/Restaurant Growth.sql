Create table If Not Exists Customer (customer_id int, name varchar(20), visited_on date, amount int)
Truncate table Customer
insert into Customer (customer_id, name, visited_on, amount) values ('1', 'Jhon', '2019-01-01', '100')
insert into Customer (customer_id, name, visited_on, amount) values ('2', 'Daniel', '2019-01-02', '110')
insert into Customer (customer_id, name, visited_on, amount) values ('3', 'Jade', '2019-01-03', '120')
insert into Customer (customer_id, name, visited_on, amount) values ('4', 'Khaled', '2019-01-04', '130')
insert into Customer (customer_id, name, visited_on, amount) values ('5', 'Winston', '2019-01-05', '110')
insert into Customer (customer_id, name, visited_on, amount) values ('6', 'Elvis', '2019-01-06', '140')
insert into Customer (customer_id, name, visited_on, amount) values ('7', 'Anna', '2019-01-07', '150')
insert into Customer (customer_id, name, visited_on, amount) values ('8', 'Maria', '2019-01-08', '80')
insert into Customer (customer_id, name, visited_on, amount) values ('9', 'Jaze', '2019-01-09', '110')
insert into Customer (customer_id, name, visited_on, amount) values ('1', 'Jhon', '2019-01-10', '130')
insert into Customer (customer_id, name, visited_on, amount) values ('3', 'Jade', '2019-01-10', '150')

# (customer_id, visited_on) is the primary key for this table.
# This table contains data about customer transactions in a restaurant.
# visited_on is the date on which the customer with ID (customer_id) have visited the restaurant.
# amount is the total paid by a customer.

# You are the restaurant owner and you want to analyze a possible expansion (there will be at least one customer every day).
# Write an SQL query to compute moving average of how much customer paid in a 7 days window (current day + 6 days before) .
# The query result format is in the following example:
# Return result table ordered by visited_on.
# average_amount should be rounded to 2 decimal places, all dates are in the format ('YYYY-MM-DD').

SELECT t1.visited_on, SUM(t2.day_sum) AS amount, ROUND(AVG(t2.day_sum), 2) AS average_amount
FROM
  (SELECT visited_on, SUM(amount) AS day_sum FROM Customer GROUP BY visited_on ) t1,
  (SELECT visited_on, SUM(amount) AS day_sum FROM Customer GROUP BY visited_on ) t2
WHERE DATEDIFF(t1.visited_on, t2.visited_on) BETWEEN 0 AND 6
GROUP BY t1.visited_on
HAVING COUNT(t2.visited_on) = 7

# Runtime: 675 ms, faster than 23.84% of MySQL online submissions
