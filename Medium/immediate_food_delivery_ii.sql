-- LeetCode Problem: https://leetcode.com/problems/immediate-food-delivery-ii/
-- PostgreSQL

/*
Επίλυση:
Υπολογίζουμε το ποσοστό των πρώτων παραγγελιών που ήταν άμεσες (order_date = customer_pref_delivery_date).
Χρησιμοποιούμε μια υποερώτηση για να βρούμε την πρώτη παραγγελία κάθε πελάτη και μετά αθροίζουμε τις άμεσες.
*/

WITH first_orders AS (
    SELECT 
        customer_id,
        MIN(order_date) AS first_order_date  -- Η πρώτη παραγγελία κάθε πελάτη
    FROM delivery
    GROUP BY customer_id
)

SELECT 
    ROUND(
        AVG(
            CASE 
                WHEN d.order_date = d.customer_pref_delivery_date THEN 1.0 
                ELSE 0.0 
            END
        ) * 100,  -- Υπολογισμός ποσοστού (άμεσες / συνολικές)
        2
    ) AS immediate_percentage
FROM first_orders fo
JOIN delivery d 
    ON fo.customer_id = d.customer_id 
    AND fo.first_order_date = d.order_date;  -- Φιλτράρουμε μόνο τις πρώτες παραγγελίες