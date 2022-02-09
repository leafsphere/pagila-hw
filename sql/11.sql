/* 
 * Use a JOIN to list the number of copies of each film in the inventory system that begins with the letter h.
 * Use tables inventory and film.
 * Order by film title alphabetically.
 */

SELECT film.film_id, title, COUNT(film.film_id) as count
FROM inventory
LEFT JOIN film ON inventory.film_id = film.film_id
WHERE LOWER(LEFT(title, 1)) = 'h'
GROUP BY film.film_id
ORDER BY title DESC;
