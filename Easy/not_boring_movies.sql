-- LeetCode Problem: https://leetcode.com/problems/not-boring-movies/
-- PostgreSQL

/*
Επίλυση:
Επιλέγουμε τις ταινίες που δεν είναι βαρετές (description ≠ 'boring') και έχουν μονό ID.
Ταξινομούμε τα αποτελέσματα με βάση την βαθμολογία (rating) σε φθίνουσα σειρά.
*/

SELECT 
    id,
    movie,
    description,
    rating
FROM cinema
WHERE 
    description <> 'boring'  -- Αποκλείουμε τις βαρετές ταινίες
    AND id % 2 = 1           -- Μονό ID (id mod 2 = 1)
ORDER BY rating DESC;        -- Ταξινόμηση από υψηλότερη προς χαμηλότερη βαθμολογία