INSERT INTO groups (group_id, group_name) VALUES
(1, 'Physics'),
(2, 'Mathematics'),
(3, 'Computer Science');

INSERT INTO students (student_id, full_name, age, group_id) VALUES
(1, 'Ali A', 20, 1),
(2, 'Bobir B', 22, 1),
(3, 'Charos C', 19, 2),
(4, 'Diana D', 21, 3),
(5, 'Eva E', 23, 2);

INSERT INTO subjects (subject_id, subject_name) VALUES
(1, 'Algebra'),
(2, 'Physics'),
(3, 'Programming');

INSERT INTO grades (grade_id, student_id, subject_id, grade) VALUES
(1, 1, 1, 9),
(2, 1, 2, 8),
(3, 2, 1, 7),
(4, 2, 2, 9),
(5, 3, 1, 8),
(6, 4, 3, 10),
(7, 5, 1, 6),
(8, 5, 3, 9);

SELECT COUNT(*) AS total_students
FROM students;

SELECT AVG(age) AS average_age
FROM students;

SELECT MIN(age) AS min_age, MAX(age) AS max_age
FROM students;

SELECT COUNT(*) AS total_grades
FROM grades;

SELECT g.group_name, COUNT(s.student_id) AS student_count
FROM groups g
LEFT JOIN students s ON g.group_id = s.group_id
GROUP BY g.group_name;

SELECT sub.subject_name, AVG(gr.grade) AS average_grade
FROM subjects sub
JOIN grades gr ON sub.subject_id = gr.subject_id
GROUP BY sub.subject_name;

SELECT sub.subject_name, COUNT(DISTINCT gr.student_id) AS student_count
FROM subjects sub
JOIN grades gr ON sub.subject_id = gr.subject_id
GROUP BY sub.subject_name;

SELECT g.group_name, COUNT(s.student_id) AS student_count
FROM groups g
JOIN students s ON g.group_id = s.group_id
GROUP BY g.group_name
HAVING COUNT(s.student_id) > 1;

SELECT sub.subject_name, AVG(gr.grade) AS average_grade
FROM subjects sub
JOIN grades gr ON sub.subject_id = gr.subject_id
GROUP BY sub.subject_name
HAVING AVG(gr.grade) > 8;

SELECT s.full_name, AVG(g.grade) AS avg_grade
FROM students s
JOIN grades g ON s.student_id = g.student_id
GROUP BY s.full_name
HAVING AVG(g.grade) > 8.5;
