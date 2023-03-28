/*Mostrar el conteo de las películas relacionadas con los géneros (Action, Crime, Comedy, Drama, Romance), 
indicando la película con mayor número de votos en cada caso (num_voted_users).
** Utilizar el orden de (Action, Crime, Comedy, Drama, Romance) al realizar la tabla.
Tabla: imdb_movies
*/


SELECT
	CASE
		WHEN gender LIKE '%Action%' THEN  'Action Movies'
		WHEN gender LIKE '%Crime%' THEN  'Crime Movies'
		WHEN gender LIKE '%Comedy%' THEN  'Comedy Movies'
		WHEN gender LIKE '%Drama%' THEN  'Drama Movies'
		WHEN gender LIKE '%Romance%' THEN  'Romance Movies'
	END AS gender_movies,
	COUNT(movie_title) AS Total_Peliculas,
	CASE
		WHEN num_voted_users = Max(num_voted_users) THEN movie_title
	END AS Pelicula,
	Max(num_voted_users) AS voted_of_movie
FROM imdb_movies
GROUP BY 1
HAVING gender_movies IS NOT null
ORDER BY 4  
