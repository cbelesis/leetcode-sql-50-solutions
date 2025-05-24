-- LeetCode Problem: https://leetcode.com/problems/group-sold-products-by-the-date/
-- PostgreSQL (Optimized)
-- Difficulty: Easy

/*
Επίλυση:
Ομαδοποιούμε τις πωλήσεις ανά ημερομηνία, μετρώντας τον αριθμό των μοναδικών προϊόντων και συγκεντρώνοντας τα ονόματά τους σε αλφαβητική σειρά.
Χρησιμοποιούμε DISTINCT για να αποφύγουμε διπλότυπα και STRING_AGG για τη συγκόλληση των ονομάτων.
*/

SELECT 
    sell_date,
    COUNT(DISTINCT product) AS num_sold,
    STRING_AGG(DISTINCT product, ',' ORDER BY product) AS products
FROM Activities
GROUP BY sell_date
ORDER BY sell_date;