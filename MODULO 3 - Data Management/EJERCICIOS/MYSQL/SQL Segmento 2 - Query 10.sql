/* Calcular el total de sesiones según canal para octubre de 2019. 
Crear métricas específicas agregadas para cada dispositivo.
Tabla: google_analytics
*/

select
	channelGrouping,
    sum(case when deviceCategory = 'desktop' then sessions end) AS 'Sesiones Desktop',
    sum(case when deviceCategory = 'mobile' then sessions end) AS 'Sesiones mobile',
    sum(case when deviceCategory = 'tablet' then sessions end) AS 'Sesiones tablet',
	sum(sessions) AS 'Total sesiones'
from google_analytics
where
	extract(month from date) = 10 AND
    extract(year from date) = 2019
group by 1
order by 5 desc