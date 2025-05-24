-- LeetCode Problem: https://leetcode.com/problems/confirmation-rate/
-- PostgreSQL

/*
Επίλυση:
Υπολογίζουμε το confirmation rate για κάθε χρήστη ως τον λόγο των επιβεβαιωμένων ενεργειών προς το συνολικό αριθμό ενεργειών.
Χρησιμοποιούμε μία υποερώτηση με conditional aggregation για να αποφύγουμε πολλαπλά joins.
*/

SELECT 
    user_id,
    COALESCE(
        ROUND(
            confirmed_count::DECIMAL / NULLIF(total_count, 0),  -- Αποφυγή διαίρεσης με 0
            2
        ),
        0.00  -- Προεπιλογή 0 αν total_count = 0
    ) AS confirmation_rate
FROM (
    SELECT 
        s.user_id,
        COUNT(CASE WHEN c.action = 'confirmed' THEN 1 END) AS confirmed_count,  -- Μετράμε επιβεβαιωμένες ενέργειες
        COUNT(c.action) AS total_count  -- Μετράμε συνολικές ενέργειες
    FROM signups s
    LEFT JOIN confirmations c 
        ON s.user_id = c.user_id
    GROUP BY s.user_id
) AS subquery
ORDER BY user_id;