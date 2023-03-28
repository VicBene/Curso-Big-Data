/* Agregar las siguientes métricas para todos los países africanos,
•	average gross income per capita
•	total population
•	number of countries
Tabla: world_health_org (`Basics.world_health_org`)
*/

SELECT
	AVG(gross_income_per_capita) AS Afica_AVG_GIPC,
    SUM(Population_in_thousands) AS Africa_TOTAL_Population,
    COUNT(country) AS Count_Countries
FROM world_health_org
WHERE Continent = 'Africa'
GROUP BY Continent;


    