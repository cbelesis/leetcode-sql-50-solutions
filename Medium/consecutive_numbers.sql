-- LeetCode Problem: https://leetcode.com/problems/consecutive-numbers/
-- PostgreSQL (Optimized)
-- Difficulty: Medium

/*
Επίλυση:
Βρίσκουμε αριθμούς που εμφανίζονται συνεχόμενα τουλάχιστον 3 φορές στον πίνακα Logs.
Χρησιμοποιούμε window functions για να ομαδοποιήσουμε συνεχόμενες εγγραφές με τον ίδιο αριθμό.
*/

SELECT DISTINCT num AS ConsecutiveNums
FROM (
    SELECT 
        num,
        id - ROW_NUMBER() OVER (PARTITION BY num ORDER BY id) AS grp  -- Ομαδοποίηση συνεχόμενων εγγραφών
    FROM Logs
) t
GROUP BY num, grp
HAVING COUNT(*) >= 3;  -- Φιλτράρουμε ομάδες με 3+ συνεχόμενες εγγραφές