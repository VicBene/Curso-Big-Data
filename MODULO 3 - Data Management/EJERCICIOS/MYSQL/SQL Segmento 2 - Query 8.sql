/* Extraer media mensual de la cotización (open rate) y volumen de operación (volumen USD) 
del bitcoin desde el año 2016.
Tabla: bitcoin_daily_rates_f
*/

select
    extract(month FROM date) AS month,
    extract(year FROM date) AS year,
    avg(open),
    avg(Volume_USD)
from bitcoin_daily_rates_f
where extract(year FROM date) >= 2016
group by 1, 2 
order by 2, 1


