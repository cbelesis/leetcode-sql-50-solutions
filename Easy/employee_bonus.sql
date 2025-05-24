-- LeetCode Problem: https://leetcode.com/problems/employee-bonus/
-- PostgreSQL

/*
Επίλυση:
Επιλέγουμε τους υπαλλήλους που είτε δεν έλαβαν μπόνους (bonus IS NULL) είτε έλαβαν μπόνους < 1000.
Χρησιμοποιούμε LEFT JOIN για να συμπεριλάβουμε όλους τους υπαλλήλους, ακόμα και όσους δεν έχουν εγγραφή στον πίνακα Bonus.
*/

SELECT 
    a.name, 
    b.bonus
FROM employee a
LEFT JOIN bonus b 
    ON a.empid = b.empid
WHERE 
    b.bonus IS NULL   -- Περίπτωση 1: Ο υπάλληλος δεν έχει μπόνους
    OR b.bonus < 1000 -- Περίπτωση 2: Το μπόνους είναι < 1000