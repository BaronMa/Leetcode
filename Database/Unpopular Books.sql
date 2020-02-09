Create table If Not Exists Books (book_id int, name varchar(50), available_from date)
Create table If Not Exists Orders (order_id int, book_id int, quantity int, dispatch_date date)
Truncate table Books
insert into Books (book_id, name, available_from) values ('1', 'Kalila And Demna', '2010-01-01')
insert into Books (book_id, name, available_from) values ('2', '28 Letters', '2012-05-12')
insert into Books (book_id, name, available_from) values ('3', 'The Hobbit', '2019-06-10')
insert into Books (book_id, name, available_from) values ('4', '13 Reasons Why', '2019-06-01')
insert into Books (book_id, name, available_from) values ('5', 'The Hunger Games', '2008-09-21')
Truncate table Orders
insert into Orders (order_id, book_id, quantity, dispatch_date) values ('1', '1', '2', '2018-07-26')
insert into Orders (order_id, book_id, quantity, dispatch_date) values ('2', '1', '1', '2018-11-05')
insert into Orders (order_id, book_id, quantity, dispatch_date) values ('3', '3', '8', '2019-06-11')
insert into Orders (order_id, book_id, quantity, dispatch_date) values ('4', '4', '6', '2019-06-05')
insert into Orders (order_id, book_id, quantity, dispatch_date) values ('5', '4', '5', '2019-06-20')
insert into Orders (order_id, book_id, quantity, dispatch_date) values ('6', '5', '9', '2009-02-02')
insert into Orders (order_id, book_id, quantity, dispatch_date) values ('7', '5', '8', '2010-04-13')

# book_id is the primary key of the Books table.

# order_id is the primary key of this table. book_id is a foreign key to the Books table.

# Write an SQL query that reports the books that have sold less than 10 copies in the last year, 
# excluding books that have been available for less than 1 month from today. Assume today is 2019-06-23.

SELECT B.book_id, B.name
FROM Books B
WHERE B.book_id NOT IN(
SELECT t1.book_id
FROM Orders t1
LEFT JOIN Books t2
ON t1.book_id=t2.book_id
WHERE t1.dispatch_date BETWEEN 20180623 AND 20190623
GROUP BY t1.book_id
HAVING SUM(t1.quantity) >= 10)
AND B.book_id NOT IN (
SELECT t3.book_id
FROM Books t3
WHERE t3.available_from > 20190523)

# At first exclude the books which are sold more or equal than 10 copies last year, and then exclude the books which are available for less than 1 month from today.

# Runtime 1034 ms, faster than 76.05% of MySQL online submissions
