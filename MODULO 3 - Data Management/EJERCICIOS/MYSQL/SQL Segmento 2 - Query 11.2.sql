/* ¿Cuántas películas de acción hay que duren menos de 60 minutos? Haz un listado de las mismas. Tabla: imdb_movies */

select 
	movie_title,
    gender,
    duration
from imdb_movies
where
	duration < 60 AND
    gender like '%action%'