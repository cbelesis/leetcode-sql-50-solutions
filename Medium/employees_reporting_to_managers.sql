-- LeetCode Problem: https://leetcode.com/problems/the-number-of-employees-which-report-to-each-employee/
-- PostgreSQL (Optimized)
-- Difficulty: Medium

/*
Επίλυση:
Βρίσκουμε για κάθε μάνατζερ τον αριθμό των υπαλλήλων που τους αναφέρουν και τον μέσο όρο ηλικίας τους.
Χρησιμοποιούμε GROUP BY στον πίνακα Employees για να ομαδοποιήσουμε βάσει του reports_to (manager_id) και JOIN για να πάρουμε το όνομα του μάνατζερ.
*/

SELECT 
    mgr.employee_id,
    mgr.name,
    sub.reports_count,
    sub.average_age
FROM (
    SELECT 
        reports_to AS employee_id,
        COUNT(*) AS reports_count,
        ROUND(AVG(age)) AS average_age
    FROM employees
    WHERE reports_to IS NOT NULL  -- Αγνοούμε εγγραφές χωρίς μάνατζερ
    GROUP BY reports_to
) AS sub
JOIN employees mgr ON sub.employee_id = mgr.employee_id  -- Σύνδεση για όνομα μάνατζερ
ORDER BY mgr.employee_id;