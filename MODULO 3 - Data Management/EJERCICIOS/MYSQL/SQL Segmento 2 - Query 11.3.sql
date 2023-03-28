/* ¿Cuál sería el día de menor cotización en una tendencia alcista en el año 2018?; ¿Y la media ese mismo día?
Tabla: bitcoin_daily_rates
*/

select
	date,
    min(high),
    SUM((high + low)/2) as media
from bitcoin_daily_rates
where
	extract(year from date) = 2018
group by 1
order by 2
limit 1
