-- LeetCode Problem: https://leetcode.com/problems/find-customer-referee/description/
-- PostgreSQL

/*
Επίλυση:
Επιλέγουμε τα ονόματα πελατών όπου:
1. Ο referee_id ΔΕΝ είναι 2, ή
2. Ο referee_id είναι NULL (απουσιάζει)
*/

SELECT name 
FROM customer 
WHERE referee_id <> 2 OR referee_id IS NULL;

-- Εναλλακτική λύση (πιο συμπαγής αλλά λιγότερο αυτονόητη)
-- SELECT name 
-- FROM customer 
-- WHERE COALESCE(referee_id, 0) <> 2;