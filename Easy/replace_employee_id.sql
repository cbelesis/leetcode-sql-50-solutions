-- LeetCode Problem: https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/
-- PostgreSQL

/*
Επίλυση:
Παρουσιάζουμε το όνομα του υπαλλήλου και το μοναδικό id (unique_id) από τον πίνακα EmployeeUNI.
Χρησιμοποιούμε LEFT JOIN για να συμπεριλάβουμε όλους τους υπαλλήλους, ακόμα και αν δεν έχουν unique_id.
*/

select 
    b.unique_id,  -- Επιλογή μοναδικού id (null αν δεν υπάρχει)
    a.name        -- Επιλογή ονόματος υπαλλήλου
from employees a  -- Κύριος πίνακας: employees (alias a)
left join employeeuni b  -- Δευτερεύων πίνακας: employeeuni (alias b)
    on a.id = b.id;      -- Συνθήκη JOIN: ταυτότητα υπαλλήλου