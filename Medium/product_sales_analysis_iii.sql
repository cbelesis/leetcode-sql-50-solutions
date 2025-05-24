-- LeetCode Problem: https://leetcode.com/problems/product-sales-analysis-iii/
-- PostgreSQL (Optimized)
-- Difficulty: Medium

/*
Επίλυση:
Βρίσκουμε την πρώτη χρονιά πώλησης κάθε προϊόντος, μαζί με την ποσότητα και την τιμή της συγκεκριμένης χρονιάς.
Χρησιμοποιούμε υποερώτημα για να βρούμε την πρώτη χρονιά (MIN(year)) και JOIN για να πάρουμε τα υπόλοιπα δεδομένα.
*/

SELECT 
    s.product_id,
    s.year AS first_year,
    s.quantity,
    s.price
FROM sales s
JOIN (
    SELECT 
        product_id, 
        MIN(year) AS first_year  -- Βρίσκουμε την πρώτη χρονιά για κάθε προϊόν
    FROM sales
    GROUP BY product_id
) AS first_sales 
    ON s.product_id = first_sales.product_id 
    AND s.year = first_sales.first_year;  -- Συνδέουμε με βάση product_id και year