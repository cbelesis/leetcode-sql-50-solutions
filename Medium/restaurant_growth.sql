-- LeetCode Problem: https://leetcode.com/problems/restaurant-growth/
-- PostgreSQL (Optimized)
-- Difficulty: Medium

/*
Επίλυση:
Υπολογίζουμε το κινούμενο άθροισμα και μέσο όρο των εσόδων για 7 συνεχόμενες ημέρες (τρέχουσα + 6 προηγούμενες).
Χρησιμοποιούμε window functions για να υπολογίσουμε τα αθροίσματα και μέσους όρους, και φιλτράρουμε τις ημέρες που έχουν πλήρη 7-ήμερη περίοδο.
*/

WITH DailyTotals AS (
    -- Υπολογισμός ημερήσιων συνολικών εσόδων
    SELECT 
        visited_on,
        SUM(amount) AS daily_amount
    FROM Customer
    GROUP BY visited_on
),
WindowSums AS (
    -- Υπολογισμός 7-ήμερων κινουμένων αθροισμάτων και μέσων όρων
    SELECT 
        visited_on,
        SUM(daily_amount) OVER (
            ORDER BY visited_on
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW  -- 7-ήμερη περίοδος (τρέχων + 6 προηγούμενες)
        ) AS amount,
        AVG(daily_amount) OVER (
            ORDER BY visited_on
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS average_amount
    FROM DailyTotals
)
SELECT 
    visited_on,
    amount,
    ROUND(average_amount::numeric, 2) AS average_amount  -- Στρογγυλοποίηση σε 2 δεκαδικά
FROM WindowSums
WHERE visited_on >= (
    SELECT MIN(visited_on) + INTERVAL '6 days'  -- Απόκρυψη πρώτων 6 ημερών (μη πλήρης περίοδος)
    FROM Customer
)
ORDER BY visited_on;