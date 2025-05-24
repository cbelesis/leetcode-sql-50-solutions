-- LeetCode Problem: https://leetcode.com/problems/fix-names-in-a-table/
-- PostgreSQL (Optimized)
-- Difficulty: Easy

/*
Επίλυση:
Διορθώνουμε τα ονόματα στον πίνακα Users ώστε να ξεκινάνε με κεφαλαίο γράμμα και να συνεχίζουν με πεζά.
Χρησιμοποιούμε συναρτήσεις συμβολοσειρών για να μετατρέψουμε τον πρώτο χαρακτήρα σε κεφαλαίο και τους υπόλοιπους σε πεζά.
*/

SELECT 
    user_id,
    CONCAT(
        UPPER(SUBSTRING(name FROM 1 FOR 1)),  -- Πρώτος χαρακτήρας (κεφαλαίος)
        LOWER(SUBSTRING(name FROM 2))         -- Υπόλοιποι χαρακτήρες (πεζοί)
    ) AS name
FROM Users
ORDER BY user_id;