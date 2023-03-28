/* Queremos saber cuáles son las 20 películas y género al que pertenecen,
1)	con mayor presupuesto
2)	con mayor beneficio
Tabla: imdb_movies */

select 
	movie_title,
    gender
from imdb_movies
order by budget desc, gross desc
limit 20
