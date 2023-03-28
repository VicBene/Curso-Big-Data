/* Dataset world_health_org
a. Extraer países que cumplan con alguna de las siguientes condiciones: 
(i) sean países africanos con un índice de alfabetismo entre el 25% y 75% o 
(ii) países europeos con un ratio de población viviendo en áreas urbanas menor al 50%.
b.	¿Cuáles son los 5 países africanos con mayor PIB (GIPC) per cápita?
*/

select country from world_health_org
WHERE
	Continent = 'Africa' AND Adult_literacy_rate BETWEEN 25 AND 75
    OR
    continent = 'Europe' AND Population_in_urban_areas < 50;

select country from world_health_org
WHERE
	Continent = 'Africa'
order by Gross_income_per_capita DESC
limit 5;