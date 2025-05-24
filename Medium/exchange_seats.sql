-- LeetCode Problem: https://leetcode.com/problems/exchange-seats/
-- PostgreSQL (Optimized)
-- Difficulty: Medium

/*
Επίλυση:
Ανταλλάσσουμε τα IDs των γειτονικών καθισμάτων. Αν ο συνολικός αριθμός IDs είναι περιττός, το τελευταίο ID παραμένει αμετάβλητο.
Χρησιμοποιούμε έναν βοηθητικό υπολογισμό για το μέγιστο ID και την ισοτιμία του (άρτιος/περιττός) μια φορά, ώστε να αποφύγουμε πολλαπλές υποερωτήσεις.
*/

WITH seat_info AS (
    SELECT 
        MAX(id) AS max_id,
        MAX(id) % 2 AS max_parity  -- 0 = άρτιος, 1 = περιττός
    FROM seat
)

SELECT 
    CASE 
        WHEN id % 2 = 0 THEN id - 1  -- Άρτια IDs: μειώνουμε κατά 1
        WHEN id = max_id AND max_parity = 1 THEN id  -- Περιττό max ID: δεν αλλάζει
        ELSE id + 1  -- Περιττά IDs (εκτός max): αυξάνουμε κατά 1
    END AS id,
    student
FROM seat, seat_info
ORDER BY id;  -- Ταξινόμηση με βάση το νέο ID