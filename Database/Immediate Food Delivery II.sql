Create table If Not Exists Delivery (delivery_id int, customer_id int, order_date date, customer_pref_delivery_date date)
Truncate table Delivery
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('1', '1', '2019-08-01', '2019-08-02')
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('2', '2', '2019-08-02', '2019-08-02')
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('3', '1', '2019-08-11', '2019-08-12')
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('4', '3', '2019-08-24', '2019-08-24')
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('5', '3', '2019-08-21', '2019-08-22')
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('6', '2', '2019-08-11', '2019-08-13')
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('7', '4', '2019-08-09', '2019-08-09')

# delivery_id is the primary key of this table.
# The table holds information about food delivery to customers that make orders at some date and specify a preferred delivery 
# date (on the same order date or after it).

# If the preferred delivery date of the customer is the same as the order date then the order is called immediate otherwise 
# it's called scheduled.

# The first order of a customer is the order with the earliest order date that customer made. It is guaranteed that a customer 
# has exactly one first order.

# Write an SQL query to find the percentage of immediate orders in the first orders of all customers, rounded to 2 decimal 
# places.

SELECT ROUND(SUM(immediate)/COUNT(immediate)*100,2) AS immediate_percentage
FROM (
SELECT t1.customer_id, t1.first_order, 
       CASE WHEN t2.customer_pref_delivery_date IS NULL THEN 0
            ELSE 1
            END AS immediate
FROM (
    SELECT customer_id, MIN(order_date) AS first_order
    FROM Delivery
    GROUP BY customer_id) t1
LEFT JOIN Delivery t2
ON t1.customer_id = t2.customer_id AND t1.first_order = t2.customer_pref_delivery_date) t3

# At first, use subquery to find the first order date for each customer, then left join the original table Delivery to the
# subquery on customer_id and its customer_pref_delivery_date to the subquery's first_order. In this case, if an order isn't
# an immediate first order, the customer_pref_delivery_date column will be NULL, so that I built a new column naming immediate
# to show whether the order is first immediate or not.

# Runtime: 882 ms, faster than 16.18% of MySQL online submissions
