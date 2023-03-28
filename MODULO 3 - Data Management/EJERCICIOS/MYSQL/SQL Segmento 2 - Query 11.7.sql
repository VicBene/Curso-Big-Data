/* ¿Cuál es el monto de los créditos otorgados y no otorgados según el Status personal?
Tabla: loan-data */

select
	personal_status,
	sum(case when class = 'good' then credit_amount end) AS Otorgados,
	sum(case when class = 'bad' then credit_amount end) AS No_Otorgados
from loan_data
group by 1

