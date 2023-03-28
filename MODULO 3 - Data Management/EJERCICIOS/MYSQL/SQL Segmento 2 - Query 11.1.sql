/* ¿Cuántas películas duran menos de 60 minutos?; ¿Cuántas entre 60 y 100? Y ¿Cuántas más de 100? 
Tabla: imdb_movies */

select 
	count(case when duration < 60 then movie_title end) AS 'Menores de 60',
	count(case when duration between 60 and 100 then movie_title end) AS 'Menores de 60',
	count(case when duration > 100 then movie_title end) AS 'Menores de 60',
    count(movie_title)
from imdb_movies
WHERE duration !='NA'
