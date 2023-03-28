/* ¿Cuál fue la semana con el valor mayor de cotización? Utilizar cotización high. 
Tabla: amazon_stocks
*/

select
	extract(week from date) as Semana,
    max(high) as valor_maximo
from amazon_stocks
group by 1
order by 2 desc