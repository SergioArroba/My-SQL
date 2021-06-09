-- ¿Qué consulta ejecutarías para obtener todos los clientes dentro de city_id = 312?
-- Su consulta debe devolver el nombre, apellido, correo electrónico y dirección del cliente.

SELECT city.city_id, city.city, customer.first_name, customer.last_name, customer.email, address.address
FROM address
JOIN customer ON customer.address_id = address.address_id
JOIN city ON city.city_id = address.city_id
WHERE city.city_id = 312

-- ¿Qué consulta harías para obtener todas las películas de comedia?
-- Su consulta debe devolver el título de la película, la descripción, 
-- el año de estreno, la calificación, las características especiales y el género (categoría)

SELECT film.film_id, film.title, film.description, film.release_year, film.rating, film.special_features, category.name
FROM category
JOIN film_category ON category.category_id = film_category.category_id
JOIN film ON film.film_id = film_category.film_id
WHERE  category.name = 'Comedy'

--  ¿Qué consulta harías para obtener todas las películas unidas por actor_id = 5?
--  Su consulta debe devolver la identificación del actor, el nombre del actor, 
--  el título de la película, la descripción y el año de lanzamiento.

SELECT actor.actor_id, CONCAT (actor.first_name," ", actor.last_name) AS actor_name, film.film_id, film.title, film.description, film.release_year
FROM actor
JOIN film_actor ON actor.actor_id = film_actor.actor_id
JOIN film ON film.film_id = film_actor.film_id
WHERE actor.actor_id = 5

-- ¿Qué consulta ejecutaría para obtener todos los clientes en store_id = 1
-- y dentro de estas ciudades (1, 42, 312 y 459)? Su consulta debe devolver
-- el nombre, apellido, correo electrónico y dirección del cliente.

SELECT store.store_id, city.city_id, customer.first_name, customer.last_name, customer.customer_email, customer, address.address
FROM customer
JOIN customer ON address.address_id = customer.address_id
JOIN store ON  = store.address_id
JOIN city ON city.address_id

-- ¿Qué consulta realizarias para obtener todas las películas con una "calificación = G" 
-- y "característica especial = detrás de escena", unidas por actor_id = 15? Su consulta
-- debe devolver el título de la película, la descripción, el año de lanzamiento, la calificación 
-- y la función especial. Sugerencia: puede usar la función "LIKE" para obtener la parte 'detrás de escena'.

SELECT film.title, film.description, film.release_year, film.rating, film.special_features
FROM film
JOIN film_actor ON film.film_id = film_actor.film_id
JOIN actor ON  actor.actor_id = film_actor.actor_id
ON film.film_id = actor.actor_id
WHERE actor.actor_id = 15 AND film.rating = "G" AND film.special_features LIKE '%Behind%'

-- Que consulta harias para obtener todos los actores que se unieron en el film_id =369?
-- Su consulta debe devolver film_id, title, actor_id y actor_name.

SELECT film.film_id, film.title, actor.actor_id, CONCAT(actor.first_name," ", actor.last_name) AS actor_name FROM film
JOIN film_actor ON film.film_id = film_actor.film_id
JOIN actor ON actor.actor_id = film_actor.actor_id
WHERE film.film_id =369

-- ¿Qué consulta harías para obtener todas las películas dramáticas con una tarifa de alquiler de 2.99?
-- Su consulta debe devolver el título de la película, la descripción, el año de estreno, la calificación,
-- las características especiales y el género (categoría).

SELECT film.film_id, film.title, film.description, film.release_year, film.rating, film.special_features, category.name, payment.amount
FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON category.category_id = film_category.category_id
JOIN rental  ON rental.inventory_id = rental.rental_id	
JOIN payment ON payment.rental_id = rental.rental_id
WHERE category.name = 'Drama' AND payment.amount = 2.99

-- What query would you run to get all the action films joined by SANDRA KILMER. Your query should return film
-- title, description, release year, rating, special features, genre and actor's first name and last name.

SELECT actor.actor_id, CONCAT(actor.first_name," ", actor.last_name) AS actor_name, film.film_id, film.title, film.description, film.release_year, film.rating, category.name AS genre
FROM film
JOIN film_actor ON film.film_id = film_actor.film_id
JOIN actor ON actor.actor_id = film_actor.actor_id
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON category.category_id = film_category.category_id
WHERE actor.first_name = 'SANDRA' and actor.last_name = 'KILMER' AND category.name = 'Action'