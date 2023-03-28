/* Los directores de películas de James Bond han trabajado en promedio en dos películas cada uno. 
¿Cómo obtendrías esta información?
Tabla: james_bond
*/

with my_subquery AS (
	select
		director,
		count(film) as Numero_peliculas
	from jamesbond
    group by director
)

select
	round(avg(numero_peliculas),2) AS DIR_AVG_MOVIES 
from my_subquery

