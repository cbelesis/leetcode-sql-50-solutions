-- LeetCode Problem: https://leetcode.com/problems/queries-quality-and-percentage/
-- PostgreSQL

/*
Επίλυση:
Υπολογίζουμε την ποιότητα (quality) και το ποσοστό κακών ερωτημάτων (poor_query_percentage) για κάθε query_name.
Χρησιμοποιούμε conditional aggregation για να αποφύγουμε πολλαπλές υποερωτήσεις και joins.
*/

SELECT 
    query_name,
    ROUND(AVG(rating::DECIMAL / position), 2) AS quality,  -- Ποιοτικότητα = Μέσος όρος (rating / position)
    ROUND(
        COUNT(CASE WHEN rating < 3 THEN 1 END) * 100.0 / NULLIF(COUNT(*), 0),  -- Ποσοστό queries με rating < 3
        2
    ) AS poor_query_percentage
FROM queries
WHERE query_name IS NOT NULL  -- Αγνοούμε NULL query_names (αν υπάρχουν)
GROUP BY query_name
ORDER BY query_name;