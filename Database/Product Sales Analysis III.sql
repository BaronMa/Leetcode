# SQL Schema
# Create table Sales (sale_id int, product_id int, year int, quantity int, price int)
# Create table Product (product_id int, product_name varchar(10))
# Truncate table Sales
# insert into Sales (sale_id, product_id, year, quantity, price) values ('1', '100', '2008', '10', '5000')
# insert into Sales (sale_id, product_id, year, quantity, price) values ('2', '100', '2009', '12', '5000')
# insert into Sales (sale_id, product_id, year, quantity, price) values ('7', '200', '2011', '15', '9000')

# sale_id is the primary key of this table.
# product_id is a foreign key to Product table.
# Note that the price is per unit.


# Truncate table Product
# insert into Product (product_id, product_name) values ('100', 'Nokia')
# insert into Product (product_id, product_name) values ('200', 'Apple')
# insert into Product (product_id, product_name) values ('300', 'Samsung')

# product_id is the primary key of this table.

# Write an SQL query that selects the product id, year, quantity, and price for the first year of every product sold.

SELECT S.product_id, year AS first_year, quantity, price
FROM Sales S

WHERE (S.product_id, S.year) IN (
SELECT product_id, MIN(year)
FROM Sales
GROUP BY product_id)

# runtime 1594ms, beats 59.48% mySQL submissions.
