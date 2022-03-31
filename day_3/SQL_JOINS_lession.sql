SELECT *
FROM film_actor;

SELECT *
FROM actor;

SELECT *
FROM customer; 

SELECT *
FROM PAYMENT;

-- INNER Join on actor and film act0r tables
SELECT actor.actor_id, first_name, last_name, film_id 
FROM film_actor
INNER JOIN actor 
ON actor.actor_id = film_actor.actor_id;

-- GIVE US THE COUNT OF FILMS THAT EACH ACTOR IS IN
SELECT actor.actor_id, first_name, last_name, count(film_id)
FROM film_actor
INNER JOIN actor
ON actor.actor_id = film_actor.actor_id
GROUP BY actor.actor_id
ORDER BY count(film_id) DESC;

-- Left Join on actor and film actor tables 
SELECT actor.actor_id, first_name, last_name, film_id
FROM film_actor
LEFT JOIN actor 
ON actor.actor_id = film_actor.actor_id;
-- WHERE first_name IS NULL AND last_name IS NULL;


-- What Customers do we have in ANGOLA?
SELECT customer.first_name, customer.last_name, customer.email, country, city, address
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
FULL JOIN city
ON address.city_id = city.city_id
FULL JOIN country 
ON city.country_id = country.country_id
WHERE country =  'Angola';

-- Reanswer any questions where a join or multi-join would help
-- Explore the tables and ask a question of your own / answered with a join or multi-join

-- 5.(from day 1) what store employee (get the id) sold the most rentals 
SELECT first_name, last_name, COUNT(rental_id)
FROM staff
FULL JOIN rental 
ON staff.staff_id = rental.staff_id
GROUP BY staff.staff_id
ORDER BY COUNT(rental_id) ASC;


-- SubQueries 
-- Two queries split apart 

-- customer_ids that have greater total amounts than 175 in payment table 
SELECT customer_id 
FROM payment 
GROUP BY customer_id
HAVING SUM(amount) > 175
ORDER BY SUM(amount) DESC;

-- find customer info on customer table 
SELECT *
FROM customer;

-- SubQuery example 
SELECT store_id, first_name, last_name
FROM customer
WHERE customer_id IN (
	SELECT customer_id 
	FROM payment 
	GROUP BY customer_id
	HAVING SUM(amount) > 175
);


-- Find films with language = 'English'
SELECT *
FROM film
WHERE language_id IN (
	SELECT language_id
	FROM language
	WHERE name = 'English'
);

-- 9) (DAY1 HW) How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)
SELECT amount, COUNT(amount)
FROM payment
WHERE customer_id IN (
 	SELECT customer_id
	FROM customer 
	WHERE customer_id BETWEEN 380 and 430)
GROUP BY amount
HAVING COUNT(amount) > 250;

-- 7) (DAY1 HW) What film has the most actors in it?
SELECT title
FROM film
WHERE film_id IN(
	SELECT film_id
	FROM film_actor
	GROUP BY film_id
	ORDER BY COUNT(actor_id) DESC LIMIT 1
);

-- 3) What film does the store have the most of? (search inventory)
SELECT title, film.film_id, COUNT(inventory_id) 
FROM film
FULL JOIN inventory
ON film.film_id = inventory.film_id
GROUP BY film.film_id
ORDER BY COUNT(inventory_id) DESC;





