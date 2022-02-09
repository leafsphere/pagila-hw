/*
 * Use a JOIN to list the total paid by each customer.
 * List the customers alphabetically by last name.
 * Use tables payment and customer.
 */

SELECT customer.customer_id, first_name, last_name, SUM(amount) as sum
FROM customer
LEFT JOIN payment ON payment.customer_id = customer.customer_id
GROUP BY customer.customer_id
ORDER BY last_name;
