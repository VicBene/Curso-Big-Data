/*Mostrar el número de personajes que tienen el mismo color de ojos (eye_color) y el planeta de origen (homeworld). 
No mostrar color de ojos desconocidos (unknown) ni planetas sin datos/nombre (NA).
Tabla: star_wars_characters
*/

select
	eye_color,
    homeworld,
    count(name)
from star_wars_characters_2
where
	eye_color != 'unknow' AND
    homeworld != 'NA'
group by eye_color, homeworld 
having count(name) > 1 -- para no contar cuando solo hay 1 coincidencia
order by 3 desc