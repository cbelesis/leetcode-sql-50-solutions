-- LeetCode Problem: https://leetcode.com/problems/percentage-of-users-attended-a-contest/
-- PostgreSQL

/*
Επίλυση:
Υπολογίζουμε το ποσοστό των χρηστών που συμμετείχαν σε κάθε διαγωνισμό. Το ποσοστό είναι ο αριθμός των συμμετεχόντων διαιρεμένος με τον συνολικό αριθμό χρηστών, πολλαπλασιασμένος με 100.
*/

SELECT 
    contest_id,
    ROUND(
        COUNT(user_id) * 100.0 / (SELECT COUNT(user_id) FROM Users),  -- Ποσοστό = (συμμετέχοντες / συνολικοί χρήστες) * 100
        2
    ) AS percentage
FROM Register
GROUP BY contest_id
ORDER BY percentage DESC, contest_id;  -- Ταξινόμηση με ποσοστό (φθίνουσα) και contest_id (αύξουσα)