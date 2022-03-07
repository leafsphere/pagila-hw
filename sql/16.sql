/*
 * Use a JOIN to order the films by most profitable,
 * where the profit is the total amount that customer have payer for the film.
 * Use tables payment, rental, inventory, and film. 
 */

SELECT title, SUM(amount) as profit
FROM film
JOIN inventory USING (film_id)
JOIN rental USING (inventory_id)
JOIN payment USING (rental_id)
GROUP BY title
ORDER BY profit DESC;

/* 
SELECT title, SUM(amount) as profit
FROM (
	SELECT title, inventory_id
	FROM film
	LEFT JOIN inventory
    ON film.film_id = inventory.film_id
) title_inventory_id
LEFT JOIN (
SELECT inventory_id, amount
FROM payment
LEFT JOIN rental ON rental.rental_id = payment.rental_id
) inventory_id_amount
ON title_inventory_id.inventory_id = inventory_id_amount.inventory_id
GROUP BY title
HAVING SUM(amount) IS NOT NULL
ORDER BY profit DESC;
*/
