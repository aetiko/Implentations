CREATE TABLE IF NOT EXISTS Courses (
    student VARCHAR(255),
    class VARCHAR(255)
);
Truncate table Courses;
insert into Courses (student, class) values ('A', 'Math');
insert into Courses (student, class) values ('B', 'English');
insert into Courses (student, class) values ('C', 'Math');
insert into Courses (student, class) values ('D', 'Biology');
insert into Courses (student, class) values ('E', 'Math');
insert into Courses (student, class) values ('F', 'Computer');
insert into Courses (student, class) values ('G', 'Math');
insert into Courses (student, class) values ('H', 'Math');
insert into Courses (student, class) values ('I', 'Math');

/* Write an SQL query to report all the classes that have at least five students.

Return the result table in any order.

The query result format is in the following example.*/

SELECT 
    class
FROM
    Courses
GROUP BY class
HAVING COUNT(class) >= 5;