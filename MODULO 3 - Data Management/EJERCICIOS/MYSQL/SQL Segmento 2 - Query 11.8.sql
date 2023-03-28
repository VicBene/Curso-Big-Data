/* Obtén un listado de las películas de acción con actor protagonista 
con más de 10000 likes en Facebook y cuyas películas hayan sido valoradas con al menos un 8 en imdb. 
Todo ello con fechas anteriores a 2012.
Tabla: imdb_movies */

select 
	movie_title
from imdb_movies
where
	gender like '%action%' AND
    actor_1_facebook_likes > 10000 AND
	imdb_score >= 8 AND
	title_year < 2012
