Create table If Not Exists Users (user_id int, join_date date, favorite_brand varchar(10))
create table if not exists Orders (order_id int, order_date date, item_id int, buyer_id int, seller_id int)
create table if not exists Items (item_id int, item_brand varchar(10))
Truncate table Users
insert into Users (user_id, join_date, favorite_brand) values ('1', '2018-01-01', 'Lenovo')
insert into Users (user_id, join_date, favorite_brand) values ('2', '2018-02-09', 'Samsung')
insert into Users (user_id, join_date, favorite_brand) values ('3', '2018-01-19', 'LG')
insert into Users (user_id, join_date, favorite_brand) values ('4', '2018-05-21', 'HP')
# user_id is the primary key of this table.
# This table has the info of the users of an online shopping website where users can sell and buy items.

Truncate table Orders
insert into Orders (order_id, order_date, item_id, buyer_id, seller_id) values ('1', '2019-08-01', '4', '1', '2')
insert into Orders (order_id, order_date, item_id, buyer_id, seller_id) values ('2', '2018-08-02', '2', '1', '3')
insert into Orders (order_id, order_date, item_id, buyer_id, seller_id) values ('3', '2019-08-03', '3', '2', '3')
insert into Orders (order_id, order_date, item_id, buyer_id, seller_id) values ('4', '2018-08-04', '1', '4', '2')
insert into Orders (order_id, order_date, item_id, buyer_id, seller_id) values ('5', '2018-08-04', '1', '3', '4')
insert into Orders (order_id, order_date, item_id, buyer_id, seller_id) values ('6', '2019-08-05', '2', '2', '4')
# order_id is the primary key of this table.
# item_id is a foreign key to the Items table.
# buyer_id and seller_id are foreign keys to the Users table.

Truncate table Items
insert into Items (item_id, item_brand) values ('1', 'Samsung')
insert into Items (item_id, item_brand) values ('2', 'Lenovo')
insert into Items (item_id, item_brand) values ('3', 'LG')
insert into Items (item_id, item_brand) values ('4', 'HP')

# item_id is the primary key of this table.

# Write an SQL query to find for each user, the join date and the number of orders they made as a buyer in 2019.

SELECT U.user_id AS buyer_id, U.join_date, IFNULL(O.orders,0) AS orders_in_2019
FROM Users U
LEFT JOIN (
    SELECT buyer_id, order_id, COUNT(order_id) AS orders
    FROM Orders
    WHERE Order_date BETWEEN 20190101 AND 20191231
    GROUP BY buyer_id) O
ON U.user_id=O.buyer_id

# Use Subquery to select the buyer_id, the number of orders they made as a buyer in 2019, then join it to Users.

# Runtime: 1553 ms, faster than 43.73% of MySQL online submissions
