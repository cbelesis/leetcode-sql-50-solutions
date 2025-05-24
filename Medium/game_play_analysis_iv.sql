-- LeetCode Problem: https://leetcode.com/problems/game-play-analysis-iv/
-- PostgreSQL

/*
Επίλυση:
Υπολογίζουμε το ποσοστό των παικτών που συνδέθηκαν τη μέρα μετά την πρώτη τους σύνδεση.
Χρησιμοποιούμε CTE για να βρούμε την πρώτη σύνδεση κάθε παίκτη και έπειτα ελέγχουμε αν υπάρχει σύνδεση την επόμενη μέρα.
*/

WITH first_logins AS (
    SELECT 
        player_id, 
        MIN(event_date) AS first_date  -- Η πρώτη σύνδεση κάθε παίκτη
    FROM activity
    GROUP BY player_id
)

SELECT 
    ROUND(
        COUNT(DISTINCT CASE WHEN a.event_date = fl.first_date + 1 THEN fl.player_id END)::DECIMAL  -- Αριθμός παικτών με σύνδεση την επόμενη μέρα
        / COUNT(DISTINCT fl.player_id),  -- Συνολικός αριθμός παικτών
        2
    ) AS fraction
FROM first_logins fl
LEFT JOIN activity a 
    ON fl.player_id = a.player_id 
    AND a.event_date = fl.first_date + 1;  -- Ελέγχουμε αν υπάρχει σύνδεση την επόμενη μέρα