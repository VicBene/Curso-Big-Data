/* ¿Cuántos artistas hay incluídos en el dataset cuyo nombre incluye las palabras ‘god’, ‘death’ or ‘black’?
Tabla: rolling_top_albums
*/

select
	case
		when artist like '%god%' then 'God'
        when artist like '%death%' then 'Death'
        when artist like '%black%' then 'Black'
	end as 'artistas seleccionados',
    count(DISTINCT artist)
from rolling_top_albums
where
	artist like '%god%' OR
    artist like '%death%' OR
    artist like '%black%'
group by 1
order by 2 desc
    