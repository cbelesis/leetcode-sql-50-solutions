-- LeetCode Problem: https://leetcode.com/problems/customers-who-bought-all-products/
-- PostgreSQL (Optimized)
-- Difficulty: Medium

/*
Επίλυση:
Βρίσκουμε τους πελάτες που έχουν αγοράσει όλα τα προϊόντα. 
Χρησιμοποιούμε GROUP BY και HAVING για να συγκρίνουμε τον αριθμό των μοναδικών προϊόντων ανά πελάτη με τον συνολικό αριθμό προϊόντων.
*/

SELECT customer_id
FROM customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (
    SELECT COUNT(*) 
    FROM product  -- Συνολικός αριθμός προϊόντων
);