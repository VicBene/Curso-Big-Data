/* ¿Podemos asegurar que las películas de acción tienen de media mejor valoración 
que el resto de películas? 
Extraer total de películas y media de IMDB score para películas de acción vs. el 
resto (de forma conjunta).
Tabla: imdb_movies */

SELECT
CASE WHEN gender LIKE '%Action%' THEN 'Action Movies' ELSE 'Rest of Movies' END as gender,
COUNT(*) as total_movies,
ROUND(AVG(imdb_score),2) as AVG_imdb_score
FROM imdb_movies
GROUP BY 1
