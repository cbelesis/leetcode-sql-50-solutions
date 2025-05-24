-- LeetCode Problem: https://leetcode.com/problems/department-top-three-salaries/
-- PostgreSQL (Optimized with Explicit JOIN and ORDER BY)
-- Difficulty: Hard

/*
Επίλυση:
Βρίσκουμε τους 3 υψηλότερα αμειβόμενους υπαλλήλους ανά τμήμα, συμπεριλαμβάνοντας όσους έχουν ίδιους μισθούς.
Χρησιμοποιούμε DENSE_RANK() για να δώσουμε την ίδια κατάταξη σε ίδιους μισθούς και φιλτράρουμε τις πρώτες 3 κατηγορίες.
*/

WITH RankedEmployees AS (
    SELECT 
        id,
        name,
        departmentId,
        salary,
        DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) AS rank
    FROM Employee
)
SELECT 
    d.name AS Department,
    r.name AS Employee,
    r.salary
FROM RankedEmployees r
JOIN Department d ON r.departmentId = d.id  -- Σύνδεση με τον πίνακα τμημάτων
WHERE r.rank <= 3  -- Φιλτράρισμα για τους top 3 (με δυνατότητα ισοβαθμιών)
ORDER BY 
    Department ASC,  -- Ταξινόμηση ανά τμήμα
    salary DESC,      -- Σε φθίνουσα σειρά μισθού
    Employee ASC;     -- Σε αύξουσα σειρά ονόματος (για ομώνυμους)