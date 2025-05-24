-- LeetCode Problem: https://leetcode.com/problems/monthly-transactions-i/
-- PostgreSQL

/*
Επίλυση:
Δημιουργούμε ένα report που δείχνει συνολικές μετρικές συναλλαγών ανά μήνα και χώρα.
Χρησιμοποιούμε conditional aggregation για να αποφύγουμε πολλαπλά joins και υποερωτήσεις.
*/

SELECT 
    TO_CHAR(trans_date, 'YYYY-MM') AS month,  -- Μορφοποίηση ημερομηνίας σε 'YYYY-MM'
    country,
    COUNT(id) AS trans_count,                -- Συνολικός αριθμός συναλλαγών
    SUM(amount) AS trans_total_amount,       -- Συνολικό ποσό συναλλαγών
    COUNT(CASE WHEN state = 'approved' THEN id END) AS approved_count,  -- Αριθμός εγκεκριμένων συναλλαγών
    COALESCE(SUM(CASE WHEN state = 'approved' THEN amount END), 0) AS approved_total_amount  -- Ποσό εγκεκριμένων συναλλαγών
FROM transactions
GROUP BY month, country                      -- Ομαδοποίηση ανά μήνα και χώρα
ORDER BY month, country;                     -- Ταξινόμηση