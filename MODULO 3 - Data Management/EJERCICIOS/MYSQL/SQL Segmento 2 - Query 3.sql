/* Calcular el total de salario percibido por cada actor en todas las películas. 
Omitir películas sin data sobre salario.
Tabla: james_bond (`james_bond`)
*/

select actor, sum(bond_actor_salary) as salario_total
from jamesbond
where Bond_Actor_Salary != 'NA'
group by 1
order by 2 desc

