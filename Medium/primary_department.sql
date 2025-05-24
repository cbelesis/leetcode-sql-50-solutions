-- LeetCode Problem: https://leetcode.com/problems/primary-department-for-each-employee/
-- PostgreSQL (Optimized)
-- Difficulty: Medium

/*
Επίλυση:
Βρίσκουμε το κύριο τμήμα για κάθε υπάλληλο. Αν ο υπάλληλος ανήκει σε ένα μόνο τμήμα, αυτό είναι το κύριο. 
Αν ανήκει σε πολλά, επιλέγουμε αυτό με primary_flag = 'Y' χρησιμοποιώντας ROW_NUMBER().
*/

SELECT employee_id, department_id
FROM (
    SELECT 
        employee_id,
        department_id,
        primary_flag,
        COUNT(*) OVER (PARTITION BY employee_id) AS dept_count,
        ROW_NUMBER() OVER (PARTITION BY employee_id ORDER BY primary_flag DESC) AS rn
    FROM Employee
) t
WHERE (dept_count = 1) OR (dept_count > 1 AND primary_flag = 'Y' AND rn = 1);