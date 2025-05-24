-- LeetCode Problem: https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/
-- PostgreSQL

/*
Επίλυση:
Βρίσκουμε τους πελάτες που επισκέφθηκαν το κατάστημα αλλά δεν έκαναν συναλλαγές, 
και μετράμε πόσες τέτοιες επισκέψεις είχε κάθε πελάτης.
*/

SELECT 
    customer_id, 
    COUNT(visit_id) AS count_no_trans  -- Μετράμε τις επισκέψεις χωρίς συναλλαγή
FROM visits v  
WHERE NOT EXISTS (
    SELECT 1 
    FROM transactions t 
    WHERE v.visit_id = t.visit_id  -- Φιλτράρουμε επισκέψεις χωρίς αντίστοιχη συναλλαγή
)
GROUP BY customer_id
ORDER BY count_no_trans DESC;  -- Ταξινόμηση με βάση το πλήθος (φθίνουσα)