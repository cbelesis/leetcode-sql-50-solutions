-- LeetCode Problem: https://leetcode.com/problems/product-price-at-a-given-date/
-- PostgreSQL (Optimized)
-- Difficulty: Medium

/*
Επίλυση:
Βρίσκουμε την τιμή κάθε προϊόντος στις 2019-08-16. Αν δεν υπάρχει αλλαγή τιμής πριν ή την ημερομηνία, η τιμή είναι 10.
Χρησιμοποιούμε υποερώτηση για να βρούμε την τελευταία τιμή πριν την ημερομηνία και COALESCE για την προεπιλεγμένη τιμή 10.
*/

SELECT DISTINCT 
    product_id,
    COALESCE(
        (SELECT new_price 
         FROM Products p2 
         WHERE p2.product_id = p1.product_id 
           AND p2.change_date <= '2019-08-16' 
         ORDER BY p2.change_date DESC 
         LIMIT 1), 
        10
    ) AS price
FROM Products p1
ORDER BY product_id;