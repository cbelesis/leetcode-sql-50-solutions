-- LeetCode Problem: https://leetcode.com/problems/movie-rating/
-- PostgreSQL (Optimized)
-- Difficulty: Medium

/*
Επίλυση:
Βρίσκουμε (α) τον χρήστη με τις περισσότερες αξιολογήσεις και (β) την ταινία με την υψηλότερη μέση αξιολόγηση τον Φεβρουάριο 2020.
Χρησιμοποιούμε UNION ALL για να συνδυάσουμε τα δύο αποτελέσματα σε μία λίστα.
*/

WITH user_ratings AS (
    SELECT 
        u.name,
        COUNT(*) AS rating_count
    FROM MovieRating mr
    JOIN Users u ON mr.user_id = u.user_id
    GROUP BY u.name
    ORDER BY rating_count DESC, u.name
    LIMIT 1
), feb_movie_ratings AS (
    SELECT 
        m.title,
        AVG(mr.rating) AS avg_rating
    FROM MovieRating mr
    JOIN Movies m ON mr.movie_id = m.movie_id
    WHERE mr.created_at BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY m.title
    ORDER BY avg_rating DESC, m.title
    LIMIT 1
)

SELECT name AS results FROM user_ratings
UNION ALL
SELECT title AS results FROM feb_movie_ratings;