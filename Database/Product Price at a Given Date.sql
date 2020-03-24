Create table If Not Exists Products (product_id int, new_price int, change_date date)
Truncate table Products
insert into Products (product_id, new_price, change_date) values ('1', '20', '2019-08-14')
insert into Products (product_id, new_price, change_date) values ('2', '50', '2019-08-14')
insert into Products (product_id, new_price, change_date) values ('1', '30', '2019-08-15')
insert into Products (product_id, new_price, change_date) values ('1', '35', '2019-08-16')
insert into Products (product_id, new_price, change_date) values ('2', '65', '2019-08-17')
insert into Products (product_id, new_price, change_date) values ('3', '20', '2019-08-18')

# (product_id, change_date) is the primary key of this table.
# Each row of this table indicates that the price of some product was changed to a new price at some date.

# Write an SQL query to find the prices of all products on 2019-08-16. Assume the price of all products before any change is 10.

SELECT product_id, new_price AS price
FROM Products
WHERE (product_id,change_date) IN
    (SELECT product_id, MAX(change_date)
     FROM products
     WHERE change_date <= '2019-08-16'
     GROUP BY product_id)
     
UNION

SELECT product_id, 10 AS price
FROM products
WHERE product_id NOT IN (SELECT product_id FROM products WHERE change_date <= '2019-08-16')

# At first, select the product_id and the prices which are nearest to '2019-08-16', then select products which don't have price
# prior to '2019-08-16', finally union all of them to generate a table with full products.

# Runtime: 409 ms, faster than 73.20% of MySQL online submissions
