-- LeetCode Problem: https://leetcode.com/problems/last-person-to-fit-in-the-bus/
-- PostgreSQL (Optimized)
-- Difficulty: Medium

/*
Επίλυση:
Βρίσκουμε το όνομα του τελευταίου ατόμου που μπορεί να επιβιβαστεί στο λεωφορείο χωρίς να ξεπεράσει το όριο βάρους 1000.
Χρησιμοποιούμε window function για να υπολογίσουμε το συσσωρευμένο βάρος και φιλτράρουμε το μεγαλύτερο που δεν ξεπερνά το όριο.
*/

SELECT person_name
FROM (
    SELECT 
        person_name,
        SUM(weight) OVER (ORDER BY turn) AS total_weight  -- Συσσωρευμένο βάρος ανά σειρά επιβίβασης
    FROM Queue
) AS cumulative_weights
WHERE total_weight <= 1000  -- Φιλτράρουμε μόνο τα βάρη που δεν ξεπερνούν το όριο
ORDER BY total_weight DESC  -- Ταξινομούμε με φθίνουσα σειρά για να πάρουμε το μεγαλύτερο έγκυρο
LIMIT 1;  -- Επιλέγουμε τον τελευταίο επιβάτη που χωράει