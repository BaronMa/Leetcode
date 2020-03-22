Create table If Not Exists Movies (movie_id int, title varchar(30))
Create table If Not Exists Users (user_id int, name varchar(30))
Create table If Not Exists Movie_Rating (movie_id int, user_id int, rating int, created_at date)
Truncate table Movies
insert into Movies (movie_id, title) values ('1', 'Avengers')
insert into Movies (movie_id, title) values ('2', 'Frozen 2')
insert into Movies (movie_id, title) values ('3', 'Joker')
# movie_id is the primary key for this table. title is the name of the movie.

Truncate table Users
insert into Users (user_id, name) values ('1', 'Daniel')
insert into Users (user_id, name) values ('2', 'Monica')
insert into Users (user_id, name) values ('3', 'Maria')
insert into Users (user_id, name) values ('4', 'James')
# user_id is the primary key for this table.

Truncate table Movie_Rating
insert into Movie_Rating (movie_id, user_id, rating, created_at) values ('1', '1', '3', '2020-01-12')
insert into Movie_Rating (movie_id, user_id, rating, created_at) values ('1', '2', '4', '2020-02-11')
insert into Movie_Rating (movie_id, user_id, rating, created_at) values ('1', '3', '2', '2020-02-12')
insert into Movie_Rating (movie_id, user_id, rating, created_at) values ('1', '4', '1', '2020-01-01')
insert into Movie_Rating (movie_id, user_id, rating, created_at) values ('2', '1', '5', '2020-02-17')
insert into Movie_Rating (movie_id, user_id, rating, created_at) values ('2', '2', '2', '2020-02-01')
insert into Movie_Rating (movie_id, user_id, rating, created_at) values ('2', '3', '2', '2020-03-01')
insert into Movie_Rating (movie_id, user_id, rating, created_at) values ('3', '1', '3', '2020-02-22')
insert into Movie_Rating (movie_id, user_id, rating, created_at) values ('3', '2', '4', '2020-02-25')
# (movie_id, user_id) is the primary key for this table.
# This table contains the rating of a movie by a user in their review.
# created_at is the user's review date. 

# Write the following SQL query:

# Find the name of the user who has rated the greatest number of the movies.
# In case of a tie, return lexicographically smaller user name.

# Find the movie name with the highest average rating in February 2020.
# In case of a tie, return lexicographically smaller movie name.

(
SELECT name AS results
FROM Movie_Rating
LEFT JOIN Users USING(user_id)
GROUP BY user_id
ORDER BY COUNT(user_id) DESC, name
LIMIT 1
)

UNION

(
SELECT title AS results
FROM Movie_Rating
LEFT JOIN Movies USING(movie_id)
WHERE created_at BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY movie_id
ORDER BY AVG(rating) DESC, title
LIMIT 1
)

# At first, in order to select the user name, we need to join the Moving_Rating table with the Users table and order by the number
# of user_id after group by the user_id by descending order. Then in order to select the title of movies, we need to join the 
# Movie_Rating table with the Movies table and filter the created_at date in February, next order the average rating for each
# movie by descending order. Finally we merge the two tables.

# Runtime: 500 ms, faster than 59.05% of MySQL online submissions
