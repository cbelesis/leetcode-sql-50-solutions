-- LeetCode Problem: https://leetcode.com/problems/big-countries/
-- PostgreSQL

/*
Επίλυση:
Επιλέγουμε τις χώρες που είναι "μεγάλες" βάσει:
1. Έκτασης >= 3,000,000 τ.χλμ. (area >= 3000000)
2. Πληθυσμού >= 25,000,000 (population >= 25000000)
*/

SELECT name, population, area 
FROM World
WHERE area >= 3000000 
   OR population >= 25000000;