# Rising Temperature
# Given a Weather table, write a SQL query to find all dates' Ids with higher temperature compared to its previous 
# (yesterday's) dates.

# Example

# {"headers": {"Weather": ["Id", "RecordDate", "Temperature"]}, "rows": {"Weather": [[1, "2015-01-01", 10], 
# [2, "2015-01-02", 25], [3, "2015-01-03", 20], [4, "2015-01-04", 30]]}}

SELECT w1.Id  AS Id
FROM Weather AS w1
INNER JOIN Weather AS w2
ON DATEDIFF(w1.RecordDate, w2.RecordDate) = 1
WHERE w1.Temperature > w2.Temperature

# Runtime beats 35.87% of mySQL submissions.
