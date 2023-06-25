Create database if not exists Leetcode;
use Leetcode;

CREATE TABLE IF NOT EXISTS Activity (
    player_id INT,
    device_id INT,
    event_date DATE,
    games_played INT
);
Truncate table Activity;
insert into Activity (player_id, device_id, event_date, games_played) values ('1', '2', '2016-03-01', '5');
insert into Activity (player_id, device_id, event_date, games_played) values ('1', '2', '2016-05-02', '6');
insert into Activity (player_id, device_id, event_date, games_played) values ('2', '3', '2017-06-25', '1');
insert into Activity (player_id, device_id, event_date, games_played) values ('3', '1', '2016-03-02', '0');
insert into Activity (player_id, device_id, event_date, games_played) values ('3', '4', '2018-07-03', '5');

-- Write an SQL query to report the first login date for each player.

SELECT 
    player_id, MIN(event_date) AS first_login
FROM
    Activity
GROUP BY player_id;