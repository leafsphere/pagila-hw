/*
 * Use a JOIN to order the countries by most profitable,
 * where the profit is the total amount that all customers from that country have payed.
 * Use tables payment, rental, customer, address, city, and country.
 * Order by country alphabetically.
 */

SELECT country, sum(sum) as profit
FROM (
    SELECT rental.customer_id, sum(amount)
    FROM payment
    LEFT JOIN rental
    ON payment.rental_id = rental.rental_id
    GROUP BY rental.customer_id
) customer_amount
LEFT JOIN (
	SELECT country, customer_id
	FROM customer
	LEFT JOIN (
		SELECT country, address_id
		FROM address
		LEFT JOIN (
			SELECT country, city_id
			FROM city
			LEFT JOIN country
			ON city.country_id = country.country_id   -- country for each city
		) city_country
		ON address.city_id = city_country.city_id -- country for each address
	) address_country
	ON customer.address_id = address_country.address_id  -- country for each customer
) customer_country
ON customer_amount.customer_id = customer_country.customer_id
GROUP BY country
ORDER BY country;
