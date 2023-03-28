/* Calcular número de personajes según planeta (homeworld). 
Evitar personajes sin información sobre planeta de origen.
Tabla: star_wars_characters (`star_wars_characters`)
*/

select homeworld, count(name) AS numero_personajes
from star_wars_characters_2
where homeworld != 'NA'
group by homeworld
order by 2 desc