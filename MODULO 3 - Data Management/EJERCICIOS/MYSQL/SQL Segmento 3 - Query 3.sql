/* Extraer consolas no discontinuadas y su fecha de lanzamiento (first retail availability). 
Agregar ventas globales de videojuegos  publicados desde el año 2000. 
Ordenar según ventas totales de videojuegos (descendiente).
Table 1: videogames_games
Table 2: videogames_consoles
*/


SELECT 
	t1.console_name, 
	t1.first_retail_availability, 
	sum(t2.na_sales)+sum(t2.eu_sales)+sum(t2.jp_sales)+(t2.other_sales) AS global_sales
FROM videogames_consoles t1
INNER JOIN videogames_games t2 ON (t1.platform_code = t2.platform_code)
WHERE t1.discontinued = '' AND t2.year >= 2000
GROUP BY t1.platform_code
ORDER BY global_sales DESC

	