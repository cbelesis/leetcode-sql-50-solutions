-- LeetCode Problem: https://leetcode.com/problems/list-the-products-ordered-in-a-period/
-- PostgreSQL (Optimized)
-- Difficulty: Easy

/*
Επίλυση:
Βρίσκουμε τα ονόματα προϊόντων που είχαν τουλάχιστον 100 μονάδες παραγγελίες τον Φεβρουάριο του 2020.
Χρησιμοποιούμε JOIN για να συνδέσουμε τους πίνακες Products και Orders, φιλτράρουμε τις ημερομηνίες και αθροίζουμε τις μονάδες.
*/

SELECT 
    p.product_name,
    SUM(o.unit) AS unit
FROM Products p
JOIN Orders o ON p.product_id = o.product_id
WHERE o.order_date BETWEEN '2020-02-01' AND '2020-02-29'  -- Φιλτράρισμα για Φεβρουάριο 2020
GROUP BY p.product_name
HAVING SUM(o.unit) >= 100;  -- Φιλτράρισμα προϊόντων με τουλάχιστον 100 μονάδες