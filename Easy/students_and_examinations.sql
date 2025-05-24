-- LeetCode Problem: https://leetcode.com/problems/students-and-examinations/
-- PostgreSQL

/*
Επίλυση:
Παρουσιάζουμε όλους τους συνδυασμούς μαθητών και μαθημάτων, μαζί με τον αριθμό των εξετάσεων που έδωσε ο κάθε μαθητής για κάθε μάθημα.
Χρησιμοποιούμε CROSS JOIN για να πάρουμε όλους τους πιθανούς συνδυασμούς και LEFT JOIN με τον πίνακα εξετάσεων.
*/

SELECT 
    s.student_id,
    s.student_name,
    sub.subject_name,
    COUNT(e.subject_name) AS attended_exams  -- Μετράμε τις εξετάσεις (NULL γίνεται 0)
FROM students s
CROSS JOIN subjects sub  -- Όλοι οι συνδυασμοί μαθητών-μαθημάτων
LEFT JOIN examinations e 
    ON s.student_id = e.student_id 
    AND sub.subject_name = e.subject_name  -- Συνθήκη JOIN για εξετάσεις
GROUP BY s.student_id, s.student_name, sub.subject_name
ORDER BY s.student_id, sub.subject_name;