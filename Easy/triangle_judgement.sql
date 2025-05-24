-- LeetCode Problem: https://leetcode.com/problems/triangle-judgement/
-- PostgreSQL
-- Difficulty: Easy

/*
Επίλυση:
Ελέγχουμε αν τρεις αριθμοί (x, y, z) μπορούν να σχηματίσουν τρίγωνο βάσει του κανόνα:
"Το άθροισμα οποιονδήποτε δύο πλευρών πρέπει να είναι μεγαλύτερο από την τρίτη πλευρά."
*/

SELECT 
    x,
    y,
    z,
    CASE 
        WHEN x + y > z AND y + z > x AND x + z > y THEN 'Yes'  -- Έλεγχος τριγώνου
        ELSE 'No'
    END AS triangle
FROM Triangle;