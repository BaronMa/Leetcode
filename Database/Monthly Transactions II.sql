create table if not exists Transactions (id int, country varchar(4), state enum('approved', 'declined'), amount int, trans_date date)
create table if not exists Chargebacks (trans_id int, trans_date date)
Truncate table Transactions
insert into Transactions (id, country, state, amount, trans_date) values ('101', 'US', 'approved', '1000', '2019-05-18')
insert into Transactions (id, country, state, amount, trans_date) values ('102', 'US', 'declined', '2000', '2019-05-19')
insert into Transactions (id, country, state, amount, trans_date) values ('103', 'US', 'approved', '3000', '2019-06-10')
insert into Transactions (id, country, state, amount, trans_date) values ('104', 'US', 'declined', '4000', '2019-06-13')
insert into Transactions (id, country, state, amount, trans_date) values ('105', 'US', 'approved', '5000', '2019-06-15')
# id is the primary key of this table.
# The table has information about incoming transactions.
# The state column is an enum of type ["approved", "declined"].

Truncate table Chargebacks
insert into Chargebacks (trans_id, trans_date) values ('102', '2019-05-29')
insert into Chargebacks (trans_id, trans_date) values ('101', '2019-06-30')
insert into Chargebacks (trans_id, trans_date) values ('105', '2019-09-18')
# Chargebacks contains basic information regarding incoming chargebacks from some transactions placed in Transactions table.
# trans_id is a foreign key to the id column of Transactions table.
# Each chargeback corresponds to a transaction made previously even if they were not approved.

# Write an SQL query to find for each month and country, the number of approved transactions and their total amount, the number 
# of chargebacks and their total amount.
# Note: In your query, given the month and country, ignore rows with all zeros.

SELECT DATE_FORMAT(trans_date, '%Y-%m') AS month,
       country,
       SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) AS approved_count,
       SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_amount,
       SUM(CASE WHEN state = 'cb' THEN 1 ELSE 0 END) AS chargeback_count,
       SUM(CASE WHEN state = 'cb' THEN amount ELSE 0 END) AS chargeback_amount
FROM
(
    SELECT id, country, 'cb' AS state, amount, c.trans_date
    FROM Transactions t
    RIGHT JOIN Chargebacks c
    ON t.id = c.trans_id
UNION ALL
    SELECT id, country, state, amount, trans_date 
    FROM Transactions
) tem
GROUP BY DATE_FORMAT(trans_date, '%Y-%m'), country
HAVING approved_count + approved_amount + chargeback_count + chargeback_amount != 0

# Build a new table by union all the two tables with same structure. Use case when with sum to choose necessary values.
# Runtime: 806 ms, faster than 34.40% of MySQL online submissions
