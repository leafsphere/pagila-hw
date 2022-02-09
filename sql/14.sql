/*
 * Use a JOIN to list all films in the "Family" category.
 * Use table category, film_category, and film.
 */

SELECT title
FROM film
WHERE film_id IN (
    SELECT film_id
    FROM film_category
    LEFT JOIN category ON film_category.category_id = category.category_id
    WHERE name = 'Family'
)
ORDER BY title;

