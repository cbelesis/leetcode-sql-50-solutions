-- LeetCode Problem: https://leetcode.com/problems/patients-with-a-condition/
-- PostgreSQL (Optimized using Array Functions)
-- Difficulty: Easy

/*
Επίλυση:
Βρίσκουμε ασθενείς που έχουν την κατάσταση 'DIAB1' ως ξεχωριστό κωδικό στις συνθήκες τους.
Χρησιμοποιούμε τη συνάρτηση STRING_TO_ARRAY για να διαχωρίσουμε τους κωδικούς και ελέγχουμε αν ο 'DIAB1' υπάρχει μεταξύ τους.
*/

SELECT 
    patient_id,
    patient_name,
    conditions
FROM Patients
WHERE 'DIAB1' = ANY(STRING_TO_ARRAY(conditions, ' '));  -- Έλεγχος αν ο 'DIAB1' είναι ένας από τους κωδικούς