-- LeetCode Problem: https://leetcode.com/problems/project-employees-i/
-- PostgreSQL

/*
Επίλυση:
Υπολογίζουμε τον μέσο όρο των ετών εμπειρίας των εργαζομένων ανά έργο.
Χρησιμοποιούμε INNER JOIN για να συνδέσουμε τους πίνακες Project και Employee βάσει του employee_id.
*/

SELECT 
    p.project_id,
    ROUND(AVG(e.experience_years)::NUMERIC, 2) AS average_years  -- Στρογγυλοποίηση σε 2 δεκαδικά
FROM project p
INNER JOIN employee e 
    ON p.employee_id = e.employee_id  -- Σύνδεση βάσει employee_id
GROUP BY p.project_id  -- Ομαδοποίηση ανά project_id
ORDER BY p.project_id;  -- Ταξινόμηση ανά project_id