-- LeetCode Problem: https://leetcode.com/problems/employees-whose-manager-left-the-company/
-- PostgreSQL (Optimized)
-- Difficulty: Medium

/*
Επίλυση:
Βρίσκουμε τους υπαλλήλους των οποίων ο μάνατζερ έχει αποχωρήσει από την εταιρεία, έχουν μισθό < 30000 και δεν είναι μάνατζερς (manager_id IS NOT NULL).
Χρησιμοποιούμε NOT EXISTS για να ελέγξουμε αν ο μάνατζερ δεν υπάρχει πλέον στον πίνακα υπαλλήλων.
*/

SELECT employee_id
FROM Employees a
WHERE 
    salary < 30000
    AND manager_id IS NOT NULL
    AND NOT EXISTS (
        SELECT 1 
        FROM Employees b 
        WHERE b.employee_id = a.manager_id  -- Ελέγχουμε αν ο μάνατζερ εξακολουθεί να είναι υπάλληλος
    )
ORDER BY employee_id;