/* extraer las 10 películas con mayor IMDB score, 
filtrar por películas publicadas a partir de la década del 80, 
excluir aquellas producidas en los EEUU.
*/

select movie_title from imdb_movies
WHERE
	title_year >= 1980 AND
    country != 'USA'
order by imdb_score DESC
limit 10