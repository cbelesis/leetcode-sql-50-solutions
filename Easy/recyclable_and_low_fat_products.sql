-- LeetCode Problem: https://leetcode.com/problems/recyclable-and-low-fat-products/description/
/*
Επίλυση:
Επιλέγουμε τα product_id από τον πίνακα Products όπου τα προϊόντα είναι ταυτόχρονα:
1. Low fat (low_fats = 'Y')
2. Recyclable (recyclable = 'Y')
*/

-- PostgreSQL
SELECT product_id 
FROM products 
WHERE low_fats = 'Y' 
  AND recyclable = 'Y';