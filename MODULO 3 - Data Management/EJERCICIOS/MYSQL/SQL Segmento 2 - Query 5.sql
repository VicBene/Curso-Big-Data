/* Calcular la facturación (box office) según director. 
Filtrar por aquellos directores que hayan generado más de 1500 en el total de facturación (todas las películas).
Tabla: james_bond
*/

select director, sum(Box_Office)
from jamesbond
group by director 
having sum(Box_Office) > 1500
order by 2 desc