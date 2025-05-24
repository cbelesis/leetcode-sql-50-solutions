-- LeetCode Problem: https://leetcode.com/problems/second-highest-salary/
-- PostgreSQL (Optimized)
-- Difficulty: Medium

/*
Επίλυση:
Βρίσκουμε τη δεύτερη υψηλότερη μισθολογική κατηγορία χρησιμοποιώντας υποερώτημα για να βρούμε πρώτα την υψηλότερη και έπειτα την μεγαλύτερη τιμή που είναι μικρότερη από αυτήν.
*/

SELECT MAX(salary) AS SecondHighestSalary
FROM Employee
WHERE salary < (SELECT MAX(salary) FROM Employee);