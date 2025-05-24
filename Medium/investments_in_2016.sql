-- LeetCode Problem: https://leetcode.com/problems/investments-in-2016/
-- PostgreSQL (Optimized with Window Functions)
-- Difficulty: Medium

/*
Επίλυση:
Υπολογίζουμε το συνολικό ποσό tiv_2016 για ασφαλιστικά πολιτικά που πληρούν δύο συνθήκες:
1. Έχουν το ίδιο tiv_2015 με τουλάχιστον ένα άλλο πολιτικό.
2. Έχουν μοναδικό συνδυασμό (lat, lon) που δεν υπάρχει σε άλλο πολιτικό.
Χρησιμοποιούμε window functions για αποδοτικό υπολογισμό των συνθηκών.
*/

SELECT ROUND(SUM(tiv_2016)::NUMERIC, 2) AS tiv_2016
FROM (
    SELECT 
        tiv_2016,
        COUNT(*) OVER (PARTITION BY tiv_2015) AS tiv_count,  -- Αριθμός πολιτικών με ίδιο tiv_2015
        COUNT(*) OVER (PARTITION BY lat, lon) AS loc_count    -- Αριθμός πολιτικών με ίδιο (lat, lon)
    FROM insurance
) AS subquery
WHERE tiv_count >= 2  -- Τουλάχιστον 2 πολιτικά με ίδιο tiv_2015
  AND loc_count = 1;  -- Μοναδικός συνδυασμός (lat, lon)