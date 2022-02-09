/*
 * Use a JOIN to list each film and the number of actors who are listed for that film.
 * Use tables film and film_actor.
 */

SELECT title, film.film_id, 
COUNT(actor_id) AS actor_count 
FROM film LEFT JOIN film_actor ON film.film_id = film_actor.film_id 
GROUP BY film.film_id 
HAVING COUNT(actor_id) >= 1 
ORDER BY actor_count, title;
