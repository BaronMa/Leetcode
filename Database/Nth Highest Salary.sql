/*
Write a SQL query to get the nth highest salary from the Employee table.
For example, given the above Employee table, the nth highest salary where n = 2 is 200. If there is no nth highest salary, 
then the query should return null.
*/

CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
    RETURN (
        /* Write your T-SQL query statement below. */
        SELECT MAX(t1.Salary)
        FROM
        (
            SELECT Salary, DENSE_RANK() OVER (ORDER BY Salary DESC) AS rank
            FROM Employee
        ) t1
        WHERE t1.rank = @N
    );
END

/*
In the problem, I learnt how to create sql function.
Here MAX() is used for return values or NULL if doesn't exist.

Runtime: 732 ms, faster than 81.75% of MS SQL Server online submissions 
*/
