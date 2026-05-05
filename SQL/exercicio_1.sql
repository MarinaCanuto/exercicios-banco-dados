-- 1. Lista de filmes e suas categorias

SELECT 
    f.title AS filme,
    c.name AS categoria
FROM film f
INNER JOIN film_category fc ON f.film_id = fc.film_id
INNER JOIN category c ON fc.category_id = c.category_id
ORDER BY f.title;


-- 2. Lista de atores com o número de filmes em que participaram

SELECT 
    a.first_name,
    a.last_name,
    COUNT(fa.film_id) AS quantidade_filmes
FROM actor a
INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id, a.first_name, a.last_name
ORDER BY quantidade_filmes DESC;


-- 3. Lista de atores que atuaram em filmes com mais de 120 minutos

SELECT 
    a.first_name,
    a.last_name,
    COUNT(f.film_id) AS quantidade_filmes
FROM actor a
INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
INNER JOIN film f ON fa.film_id = f.film_id
WHERE f.length > 120
GROUP BY a.actor_id, a.first_name, a.last_name
ORDER BY quantidade_filmes DESC;
