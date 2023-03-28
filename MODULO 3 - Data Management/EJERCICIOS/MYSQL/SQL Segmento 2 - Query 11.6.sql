/* Identificar y calcular el presupuesto de aquellas películas de James Bond que 
fueron dirigidas por John Glen y protagonizadas por Timothy Dalton.
Tabla: jamesbond */

select
	film,
    box_office
from jamesbond
where
	director = 'John Glen' AND
    actor = 'Timothy Dalton'
