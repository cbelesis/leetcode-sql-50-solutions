-- LeetCode Problem: https://leetcode.com/problems/invalid-tweets/
-- PostgreSQL

/*
Επίλυση:
Επιλέγουμε τα tweet_id των tweets όπου το μήκος του περιεχομένου (content) υπερβαίνει τους 15 χαρακτήρες.
*/

SELECT tweet_id
FROM tweets
WHERE LENGTH(content) > 15;