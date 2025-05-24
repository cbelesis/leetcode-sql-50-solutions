-- LeetCode Problem: https://leetcode.com/problems/find-followers-count/
-- PostgreSQL (Optimized)
-- Difficulty: Easy

/*
Επίλυση:
Υπολογίζουμε τον αριθμό των followers για κάθε χρήστη χρησιμοποιώντας απλή ομαδοποίηση και μέτρηση.
*/

SELECT 
    user_id,
    COUNT(follower_id) AS followers_count  -- Μετράμε τους followers ανά χρήστη
FROM followers
GROUP BY user_id  -- Ομαδοποίηση ανά user_id
ORDER BY user_id;  -- Ταξινόμηση ανά user_id (αύξουσα)