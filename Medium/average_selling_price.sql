-- LeetCode Problem: https://leetcode.com/problems/average-selling-price/
-- PostgreSQL

/*
Επίλυση:
Υπολογίζουμε τη μέση τιμή πώλησης ανά προϊόν, λαμβάνοντας υπόψη τις τιμές που ίσχυαν κατά τις ημερομηνίες πώλησης.
Χρησιμοποιούμε LEFT JOIN για να συμπεριλάβουμε όλα τα προϊόντα από τον πίνακα Prices, ακόμα και αν δεν πωλήθηκαν.
*/

SELECT
    p.product_id,
    COALESCE(
        ROUND(
            SUM(p.price * u.units)::DECIMAL / NULLIF(SUM(u.units), 0),  -- Αποφυγή διαίρεσης με 0
            2
        ),
        0  -- Προεπιλογή 0 αν δεν υπάρχουν πωλήσεις
    ) AS average_price
FROM prices p
LEFT JOIN unitssold u 
    ON p.product_id = u.product_id 
    AND u.purchase_date BETWEEN p.start_date AND p.end_date  -- Φίλτρο για τις ενεργές ημερομηνίες τιμής
GROUP BY p.product_id
ORDER BY p.product_id;