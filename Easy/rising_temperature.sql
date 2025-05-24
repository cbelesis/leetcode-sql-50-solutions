-- LeetCode Problem: https://leetcode.com/problems/rising-temperature/
-- PostgreSQL

/*
Επίλυση:
Βρίσκουμε τα IDs των ημερών όπου η θερμοκρασία είναι υψηλότερη από την προηγούμενη μέρα.
Χρησιμοποιούμε EXISTS για να ελέγξουμε αν υπάρχει εγγραφή της προηγούμενης μέρας με μικρότερη θερμοκρασία.
*/

SELECT id
FROM weather a
WHERE EXISTS (
    SELECT 1
    FROM weather b
    WHERE b.recorddate = a.recorddate - 1  -- Προηγούμενη μέρα
      AND a.temperature > b.temperature    -- Συγκρίνουμε θερμοκρασίες
);