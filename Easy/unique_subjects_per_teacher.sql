-- LeetCode Problem: https://leetcode.com/problems/number-of-unique-subjects-taught-by-each-teacher/
-- PostgreSQL

/*
Επίλυση:
Υπολογίζουμε τον αριθμό των μοναδικών μαθημάτων (subject_id) που διδάσκει κάθε καθηγητής.
Χρησιμοποιούμε COUNT(DISTINCT ...) για να μετρήσουμε μοναδικά subject_ids ανά καθηγητή.
*/

SELECT 
    teacher_id,
    COUNT(DISTINCT subject_id) AS cnt  -- Μετράμε τα μοναδικά μαθήματα ανά καθηγητή
FROM teacher
GROUP BY teacher_id  -- Ομαδοποίηση ανά καθηγητή
ORDER BY teacher_id DESC;  -- Ταξινόμηση με φθίνουσα σειρά ID