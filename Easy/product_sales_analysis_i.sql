-- LeetCode Problem: https://leetcode.com/problems/product-sales-analysis-i/
-- PostgreSQL

/*
Επίλυση:
Επιλέγουμε το όνομα του προϊόντος, έτος πώλησης και τιμή από τους πίνακες Sales και Product.
Χρησιμοποιούμε INNER JOIN για να συνδέσουμε τις πωλήσεις με τα προϊόντα βάσει του product_id.
*/

SELECT 
    p.product_name,   -- Όνομα προϊόντος από τον πίνακα Product
    s.year,           -- Έτος πώλησης από τον πίνακα Sales
    s.price           -- Τιμή πώλησης από τον πίνακα Sales
FROM sales s          -- Πίνακας Sales με alias s
INNER JOIN product p  -- Πίνακας Product με alias p
    ON s.product_id = p.product_id;  -- Συνθήκη JOIN