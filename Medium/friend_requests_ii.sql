-- LeetCode Problem: https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends/
-- PostgreSQL (Optimized)
-- Difficulty: Medium

/*
Επίλυση:
Βρίσκουμε όλους τους χρήστες με τον μέγιστο αριθμό φίλων, λαμβάνοντας υπόψη και τους φίλους που απέκτησαν ως requester και ως accepter.
Χρησιμοποιούμε CTE για να υπολογίσουμε τον συνολικό αριθμό φίλων κάθε χρήστη και έπειτα επιλέγουμε όσους έχουν τον μέγιστο αριθμό.
*/

WITH friend_counts AS (
    SELECT 
        id,
        SUM(count) AS num
    FROM (
        SELECT requester_id AS id, COUNT(*) AS count
        FROM RequestAccepted
        GROUP BY requester_id
        UNION ALL
        SELECT accepter_id AS id, COUNT(*) AS count
        FROM RequestAccepted
        GROUP BY accepter_id
    ) t
    GROUP BY id
)
SELECT 
    id,
    num
FROM friend_counts
WHERE num = (SELECT MAX(num) FROM friend_counts)  -- Επιλέγουμε μόνο τους με μέγιστο αριθμό φίλων
ORDER BY id;  -- Προαιρετική ταξινόμηση