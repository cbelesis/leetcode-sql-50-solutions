-- LeetCode Problem: https://leetcode.com/problems/article-views-i/
-- PostgreSQL

/*
Επίλυση:
Επιλέγουμε τους συγγραφείς (author_id) που έχουν δεί τις δικές τους αναρτήσεις (author_id = viewer_id).
Χρησιμοποιούμε DISTINCT για να αποφύγουμε διπλότυπα και ταξινομούμε τα αποτελέσματα.
*/

SELECT DISTINCT author_id AS id  -- Μετονομασία στήλης σε 'id' όπως ζητάει το πρόβλημα
FROM Views
WHERE author_id = viewer_id       -- Φίλτρο για εμφανίσεις όπου συγγραφέας = θεατής
ORDER BY id ASC;                  -- Ταξινόμηση αύξουσα