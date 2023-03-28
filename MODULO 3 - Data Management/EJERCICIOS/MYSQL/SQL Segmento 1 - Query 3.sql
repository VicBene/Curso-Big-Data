/* 3)	Extraer campos film, director, year y actor de la tabla de James Bond; 
filtrar por películas publicadas hasta el año 2000, 
cuyo director sea Lewis Gilbert o Martin Campbell. 
Excluir aquellas películas protagonizadas por Roger Moore. */
select
	film,
    director,
    Year,
    actor
from jamesbond
where
	year <= 2000 AND
    Director IN ('Lewis Gilbert', 'Martin Campbell') AND
    Actor != 'Roger Moore';
