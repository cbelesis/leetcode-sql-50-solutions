-- LeetCode Problem: https://leetcode.com/problems/classes-more-than-5-students/
-- PostgreSQL (Optimized)
-- Difficulty: Easy

/*
Επίλυση:
Βρίσκουμε τάξεις (classes) με τουλάχιστον 5 μοναδικούς μαθητές.
Χρησιμοποιούμε GROUP BY και HAVING για να απαλλαγούμε από την ανάγκη υποερωτήσεων.
*/

SELECT class
FROM courses
GROUP BY class
HAVING COUNT(DISTINCT student) >= 5;  -- Φιλτράρουμε τάξεις με 5+ μοναδικούς μαθητές