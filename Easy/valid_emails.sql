-- LeetCode Problem: https://leetcode.com/problems/find-users-with-valid-e-mails/
-- PostgreSQL (Optimized)
-- Difficulty: Easy

/*
Επίλυση:
Βρίσκουμε χρήστες με έγκυρα emails που ακολουθούν το μοτίβο:
- Ξεκινάει με γράμμα (a-zA-Z)
- Περιέχει γράμματα, αριθμούς, _, ., ή - πριν το @
- Το domain είναι ακριβώς @leetcode.com (case-sensitive)
Χρησιμοποιούμε regular expression για να ελέγξουμε τη μορφή του email.
*/

SELECT user_id, name, mail
FROM Users
WHERE mail ~ '^[A-Za-z][A-Za-z0-9_.-]*@leetcode\.com$';