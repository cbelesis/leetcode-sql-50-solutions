-- LeetCode Problem: https://leetcode.com/problems/delete-duplicate-emails/
-- PostgreSQL (Optimized)
-- Difficulty: Easy

/*
Επίλυση:
Διαγράφουμε διπλότυπα emails, διατηρώντας μόνο το εγγραφή με το μικρότερο id για κάθε email.
Χρησιμοποιούμε υποερώτηση για να βρούμε τα ids που πρέπει να διαγραφούν (αυτά που έχουν μεγαλύτερο id από τουλάχιστον ένα άλλο id με το ίδιο email).
*/

DELETE FROM Person
WHERE id IN (
    SELECT a.id
    FROM Person a
    JOIN Person b ON a.email = b.email AND a.id > b.id  -- Επιλέγουμε τα ids με μεγαλύτερο id από τουλάχιστον ένα άλλο για το ίδιο email
);