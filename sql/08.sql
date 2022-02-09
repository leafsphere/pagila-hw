/*
 * Use a JOIN to display the first and last names, as well as the address, of each staff member.
 * Use the tables staff and address.
 * Order by last name.
 */

SELECT first_name, last_name, address as street_address 
FROM staff 
LEFT JOIN address ON staff.address_id = address.address_id
ORDER BY last_name;

