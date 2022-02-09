/*
 * Use a JOIN to count the number of English language films in each category.
 * Use table category, film_category, film, and language.
 */

SELECT name, count(*) AS sum
FROM film
LEFT JOIN (
	SELECT film_id, name
	FROM film_category
	LEFT JOIN category ON film_category.category_id = category.category_id
) film_id_category
ON film.film_id = film_id_category.film_id
WHERE language_id IN (
	SELECT film.language_id
	FROM language
	RIGHT JOIN film ON film.language_id = language.language_id
	WHERE name = 'English'
)
GROUP BY name
ORDER BY name;
