-- LeetCode Problem: https://leetcode.com/problems/managers-with-at-least-5-direct-reports/
-- PostgreSQL

/*
Επίλυση:
Βρίσκουμε τους μάνατζερς που έχουν τουλάχιστον 5 άμεσους υφισταμένους.
Χρησιμοποιούμε υποερώτημα (subquery) για να μετρήσουμε πόσες φορές εμφανίζεται κάθε managerId στον πίνακα.
*/

SELECT name 
FROM employee 
WHERE id IN (
    SELECT managerid 
    FROM employee 
    GROUP BY managerid 
    HAVING COUNT(*) >= 5  -- Φιλτράρουμε μόνο managerIds με 5+ υφισταμένους
);