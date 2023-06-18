Create database if not exists Leetcode;
use Leetcode;

CREATE TABLE IF NOT EXISTS cinema (
    id INT,
    movie VARCHAR(255),
    description VARCHAR(255),
    rating FLOAT(2 , 1 )
);
Truncate table cinema;
insert into cinema (id, movie, description, rating) values ('1', 'War', 'great 3D', '8.9');
insert into cinema (id, movie, description, rating) values ('2', 'Science', 'fiction', '8.5');
insert into cinema (id, movie, description, rating) values ('3', 'irish', 'boring', '6.2');
insert into cinema (id, movie, description, rating) values ('4', 'Ice song', 'Fantacy', '8.6');
insert into cinema (id, movie, description, rating) values ('5', 'House card', 'Interesting', '9.1');

/* Write an SQL query to report the movies with an odd-numbered ID and a description that is not "boring". */

SELECT 
    *
FROM
    cinema
WHERE
    MOD(id, 2) <> 0
        AND description <> 'boring'
ORDER BY rating DESC;
