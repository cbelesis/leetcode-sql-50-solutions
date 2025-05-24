-- LeetCode Problem: https://leetcode.com/problems/count-salary-categories/
-- PostgreSQL (Optimized)
-- Difficulty: Medium

/*
Επίλυση:
Υπολογίζουμε τον αριθμό λογαριασμών σε κάθε κατηγορία μισθού (Low, Average, High), συμπεριλαμβανομένων κατηγοριών με μηδενικό πλήθος.
Χρησιμοποιούμε UNION ALL για να εξασφαλίσουμε ότι όλες οι κατηγορίες εμφανίζονται, ακόμα και με μηδενικό πλήθος.
*/

SELECT 
    category,
    COUNT(account_id) AS accounts_count
FROM (
    SELECT 
        account_id,
        CASE 
            WHEN income < 20000 THEN 'Low Salary'
            WHEN income BETWEEN 20000 AND 50000 THEN 'Average Salary'
            ELSE 'High Salary'
        END AS category
    FROM Accounts
    UNION ALL  -- Προσθέτουμε όλες τις κατηγορίες, ακόμα και αν δεν υπάρχουν λογαριασμοί
    SELECT NULL, 'Low Salary'
    UNION ALL
    SELECT NULL, 'Average Salary'
    UNION ALL
    SELECT NULL, 'High Salary'
) t
GROUP BY category  -- Ομαδοποίηση ανά κατηγορία
ORDER BY 
    CASE category 
        WHEN 'Low Salary' THEN 1 
        WHEN 'Average Salary' THEN 2 
        ELSE 3 
    END;  -- Ταξινόμηση με σειρά κατηγοριών