/* a.	Cambia los nombres de las columnas (campos) que están en inglés por su traducción en español.
b.	¿Qué solicitudes de crédito tienen un plazo de devolución entre 12 y 24 meses?
c.	¿Qué solicitudes de crédito corresponden a hombres solteros?
d.	¿Qué solicitudes de crédito corresponden a personas que en algún momento han solicitado otros créditos y los han pagado?
e.	¿Qué solicitudes corresponden a personas que tienen 4 créditos o más en curso?
f.	¿Qué solicitudes de crédito corresponden a un crédito de negocio?
g.	¿Qué solicitudes de crédito corresponden a un crédito de reparaciones?
h.	¿Qué solicitudes de crédito corresponden a personas que viven en su vivienda de propiedad?
i.	¿Qué solicitudes de crédito corresponden a personas con más de 60 años de edad?
j.	¿Qué solicitudes de crédito corresponden a personas entre 35 y 50 años de edad?
k.	¿Qué solicitudes de crédito se han aprobado?
l.	¿Qué solicitudes de crédito se han rechazado?
*/

select distinct purpose as proposito
from loan_data;

select * from loan_data
WHERE duration BETWEEN 12 AND 24;

select * from loan_data
WHERE personal_status = 'male single';

SELECT credit_history FROM loan_data
WHERE credit_history IN ('existing paid', 'all paid');

SELECT existing_credits FROM loan_data
WHERE existing_credits > 3;

SELECT purpose FROM loan_data
WHERE purpose = 'business';

SELECT purpose FROM loan_data
WHERE purpose = 'repairs';

SELECT housing FROM loan_data
WHERE housing = 'own';

SELECT age FROM loan_data
WHERE age > 60;

SELECT age FROM loan_data
WHERE age BETWEEN 35 and 50;

SELECT class FROM loan_data
WHERE class = 'good';

SELECT class FROM loan_data
WHERE class = 'bad';