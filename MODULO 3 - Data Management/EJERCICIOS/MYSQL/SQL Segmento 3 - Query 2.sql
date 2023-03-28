/* La tabla gobierno_paro reporta data mensual de paro para municipios de España en 2018. 
Calcular la media de paro de cada comunidad autónoma en 2018.
Tabla: gobierno_paro */

with subconsulta1 AS (
	select
		comunidad_autonoma,
        sum(total_paro_registrado) as total_paro
	from gobierno_paro
    group by 1
)

select
	comunidad_autonoma,
    avg(total_paro) as media_paro
from subconsulta1
group by 1

