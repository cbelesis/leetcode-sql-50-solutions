-- LeetCode Problem: https://leetcode.com/problems/user-activity-for-the-past-30-days-i/
-- PostgreSQL

/*
Επίλυση:
Βρίσκουμε τον αριθμό των μοναδικών ενεργών χρηστών ανά ημέρα για τις τελευταίες 30 ημέρες πριν από την 2019-07-27.
Χρησιμοποιούμε WHERE για να φιλτράρουμε τις ημερομηνίες και COUNT(DISTINCT) για να μετρήσουμε μοναδικούς χρήστες.
*/

SELECT 
    activity_date AS day,
    COUNT(DISTINCT user_id) AS active_users
FROM activity
WHERE 
    activity_date BETWEEN 
        TO_DATE('2019-07-27', 'YYYY-MM-DD') - INTERVAL '29 days'  -- 30 ημέρες πριν (συμπεριλαμβανομένης της 2019-07-27)
        AND TO_DATE('2019-07-27', 'YYYY-MM-DD') 
GROUP BY activity_date
ORDER BY day;