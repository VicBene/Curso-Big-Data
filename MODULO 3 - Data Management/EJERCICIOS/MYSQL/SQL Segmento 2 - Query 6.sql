/* Calcular número total de álbumes según sub metal genre, 
filtrar por aquellos subgéneros con al menos 10 álbumes.
Tabla: rolling_top_albums
*/

select Sub_Metal_Genre, count(Album)
from rolling_top_albums
group by 1
having count(album) >= 10
order by 2 desc
