INSERT INTO students (first_name, last_name, birth_date, email, group_id) VALUES
('John', 'Doe', '2002-05-01', 'john.doe@example.com', 1),
('Jane', 'Smith', '2003-02-10', 'jane.smith@example.com', 2),
('John', 'Doe', '2002-05-01', 'john.doe2@example.com', 1),      
('Alice', 'Brown', '2004-07-12', 'alice.brown@example.com', 3),
('John', 'Doe', '2002-05-01', NULL, 1);                         

SELECT first_name, last_name, COUNT(*) AS count
FROM students
GROUP BY first_name, last_name
HAVING COUNT(*) > 1;

DELETE FROM students
WHERE student_id NOT IN (
    SELECT MIN(student_id)
    FROM students
    GROUP BY first_name, last_name
);
