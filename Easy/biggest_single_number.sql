-- LeetCode Problem: https://leetcode.com/problems/biggest-single-number/
-- PostgreSQL (Optimized)
-- Difficulty: Easy

/*
Επίλυση:
Βρίσκουμε τον μεγαλύτερο αριθμό που εμφανίζεται **ακριβώς μία φορά** στον πίνακα MyNumbers.
Χρησιμοποιούμε GROUP BY και HAVING για να φιλτράρουμε μοναδικούς αριθμούς, και MAX() για να βρούμε τον μεγαλύτερο.
*/

SELECT MAX(num) AS num  -- Επιστρέφει NULL αν δεν υπάρχουν μοναδικοί αριθμοί
FROM (
    SELECT num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(num) = 1  -- Φιλτράρουμε αριθμούς που εμφανίζονται μόνο μία φορά
) AS single_numbers;