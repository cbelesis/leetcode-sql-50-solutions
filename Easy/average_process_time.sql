-- LeetCode Problem: https://leetcode.com/problems/average-time-of-process-per-machine/
-- PostgreSQL

/*
Επίλυση:
Υπολογίζουμε τον μέσο χρόνο επεξεργασίας ανά μηχανή, στρογγυλοποιημένο σε 3 δεκαδικά.
Κάθε διαδικασία (process) έχει ένα 'start' και 'end' activity. Παίρνουμε τη διαφορά των timestamps.
*/

SELECT 
    machine_id,
    ROUND(AVG(processing_time)::numeric, 3) AS processing_time  -- Στρογγυλοποίηση σε 3 δεκαδικά
FROM (
    SELECT 
        a.machine_id,
        a.process_id,
        EXTRACT(EPOCH FROM (b.timestamp - a.timestamp)) AS processing_time  -- Μετατροπή διαφοράς χρόνου σε δευτερόλεπτα
    FROM activity a
    JOIN activity b 
        ON a.machine_id = b.machine_id 
        AND a.process_id = b.process_id 
        AND a.activity_type = 'start' 
        AND b.activity_type = 'end'
) AS subquery
GROUP BY machine_id
ORDER BY machine_id;