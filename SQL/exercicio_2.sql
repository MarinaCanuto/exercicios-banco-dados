-- 1. Número de registros da consulta de filmes e categorias

SELECT COUNT(*) AS total_registros
FROM film f
INNER JOIN film_category fc ON f.film_id = fc.film_id
INNER JOIN category c ON fc.category_id = c.category_id;


-- 2. Número de atores encontrados na consulta de atores com quantidade de filmes

SELECT COUNT(*) AS total_registros
FROM (
    SELECT 
        a.actor_id
    FROM actor a
    INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
    GROUP BY a.actor_id
) AS consulta_atores;


-- 3. Número de atores encontrados na consulta de filmes com mais de 120 minutos

SELECT COUNT(*) AS total_registros
FROM (
    SELECT 
        a.actor_id
    FROM actor a
    INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
    INNER JOIN film f ON fa.film_id = f.film_id
    WHERE f.length > 120
    GROUP BY a.actor_id
) AS consulta_atores_filmes_longos;
