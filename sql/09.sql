/*
 * Use a JOIN to display the total amount rung up by each staff member in January of 2020.
 * Use tables staff and payment.
 */

SELECT first_name, last_name, sum(amount)
FROM staff
LEFT JOIN payment
ON payment.staff_id = staff.staff_id
WHERE payment_date >= '2020-01-01T00:00.000' 
    AND payment_date < '2020-02-01T00:00.000'
GROUP BY staff.staff_id
ORDER BY first_name;
